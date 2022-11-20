function Validator(options) {
    function getParent(element, selector) {
        while(element.parentElement) {
            if(element.parentElement.matches(selector)){
                return element.parentElement;
            }else {
                element = element.parentElement;
            }
        }
    }
    let selectorRules = {};
    // hàm thực hiện validate
    function validate(inputElement, rule) {
        let errorMessage ;
        let errorElement = getParent(inputElement, options.formGroupSelector).querySelector(options.errorSelector);

        // lấy ra các rule của selector
        let rules = selectorRules[rule.selector];
        //lặp qua các rule và kiểm tra
        for(let i = 0; i < rules.length; i++) {
            switch(inputElement.type) {
                case 'radio':
                case 'checkbox':
                    errorMessage = rules[i](formElement.querySelector(rule.selector + ':checked'));
                    break;
                default: 
                errorMessage = rules[i](inputElement.value);
            }
            if(errorMessage){
                break;
            }
        }

        if(errorMessage) {
            errorElement.innerText = errorMessage;
            getParent(inputElement, options.formGroupSelector).classList.add('invalid');           
        }else {
            errorElement.innerText = '';
            getParent(inputElement, options.formGroupSelector).classList.remove('invalid');           

        }
        return !errorMessage;
    }
    let formElement = document.querySelector(options.form);
    if(formElement) {
        //khi submit form
        formElement.onsubmit = function(e) {
            e.preventDefault();

            let isFormValid = true;

            // thực hiện lặp qua từng rule và validate
            options.rules.forEach(function(rule) {
                let inputElement = formElement.querySelector(rule.selector);
                let isValid = validate(inputElement, rule);
                if(!isValid) {
                    isFormValid = false;
                }
            })
          
            if(isFormValid) {
                //submit với js
                if(typeof options.onSubmit === 'function') {
                    let enableInputs = formElement.querySelectorAll('[name]');
                    let formValues = [...enableInputs].reduce(function(values, input) {
                        switch(input.type) {
                            case 'radio':
                                values[input.name] = formElement.querySelector(`input[name='${input.name}']`).value;                            
                                break;
                            case 'checkbox':
                                if(!input.matches(':checked')) {
                                    values[input.name] ='';
                                    return values;
                                };
                                if(!Array.isArray(values[input.name])) {
                                    values[input.name] = [];
                                }
                                values[input.name].push(input.value);
                                break;
                            case 'file':
                                values[input.name] = input.files;
                            default:
                                values[input.name] = input.value;
                        }
                        return values;
                    }, {})
                    options.onSubmit(formValues)
                }else {// submit voi hành vi mặc định
                    formElement.submit();
                }
            }
            
        }

        //lặp qua mỗi rule và xử lý
        options.rules.forEach(rule => {
            //lưu lại các rule cho mỗi input
            if(Array.isArray(selectorRules[rule.selector])) {
                selectorRules[rule.selector].push(rule.test);
            }else {
                selectorRules[rule.selector] = [rule.test];
            }
            let inputElements = formElement.querySelectorAll(rule.selector);
            [...inputElements].forEach(inputElement => {
                if(inputElement) {    
                    // xử lý khi blur ra khỏi input          
                    inputElement.onblur = function() {
                       validate(inputElement, rule);
                    }
                    //xử lý khi nhập input
                    inputElement.oninput = function() {
                        let errorElement = getParent(inputElement, options.formGroupSelector).querySelector(options.errorSelector);
                        getParent(inputElement, options.formGroupSelector).classList.remove('invalid');
                        errorElement.innerText = ''
                    }
                }
            })
           
        })
    }
}
//Định nghĩa các rules
// Nguyên tắc của các rule
//khi không có lỗi trả về undifined
//khi có lỗi trả về message lỗi
Validator.isRequired = function(selector, message) {
    return {
        selector: selector,
        test: function(value) {
            return value.trim() ? undefined : message || 'Vui lòng nhập trường này';
        }
    }
}
Validator.isEmail = function(selector, message) {
    return {
        selector: selector,
        test: function(value) {
            const regx = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return regx.test(value) ? undefined : message || 'Email Không hợp lệ '
        }
    }
}
Validator.minlength = function(selector, min, message) {
    return {
        selector: selector,
        test: function(value) {
            return value.length >= Number.parseInt(min) ? undefined : message || `Mật khẩu phải chứa ít nhất ${min} ký tự`;
        }
    }
}
Validator.isPhoneNumber = function(selector, message) {
    return {
        selector: selector,
        test: function(value) {
            const regx = /((09|03|07|08|05)+([0-9]{8})\b)/g;
            return regx.test(value) ? undefined : message || 'Số điện thoại không hợp lệ';
        }
    }
}
Validator.isConfirmed = function(selector, getConfirmValue, message) {
    return {
        selector: selector,
        test: function(value) {
            return value === getConfirmValue() ? undefined : message || 'Mật khẩu xác nhận không trùng khớp';
        }
    }
}
/********************************* hướng dẫn sử dụng************************************/ 
/*
Validator({
    form: '.modal-sigup__form',
    formGroupSelector: '.form-group',
    errorSelector: '.form-message',
    rules: [
        Validator.isRequired('#username_sigup', 'không được bỏ trống trường nay'),
        Validator.isRequired('#password_sigup'),
        Validator.minlength('#password_sigup', 6), 
        Validator.isRequired('#confirmpassword_sigup'),
        Validator.isConfirmed('#confirmpassword_sigup', function() {
            return document.querySelector('#password_sigup').value;
        }),
        Validator.isRequired('#sdt_sigup'),
        Validator.isPhoneNumber('#sdt_sigup')  
        ====> các rule có thể thêm tham số cuối là message lỗi theo ý muốn, nêu không có sẽ hiễn thị lỗi mặc định     
    ]
    onSubmit: function(data) { nếu không có thì form sẽ submit theo hành vi mặc định
        call api
    }
})
*/