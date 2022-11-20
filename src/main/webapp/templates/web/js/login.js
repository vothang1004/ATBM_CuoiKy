const eye = document.querySelector('.login-board__icon-view');
const password = document.getElementById('password');


eye.onclick = function(e) {
    e.target.classList.toggle('fa-eye-slash');
    e.target.classList.toggle('fa-eye');
    if(password.type == 'password') {
        password.setAttribute('type', 'text');
    }else {
        password.setAttribute('type', 'password');
    }
}
