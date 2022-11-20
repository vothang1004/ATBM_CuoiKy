
const selectProvince = document.getElementById('province');
const selectDistrict = document.getElementById('district');
const selectWard = document.getElementById('ward');

// handle order
const infoForm = document.getElementById('info-form');
const btnOrder = document.getElementById('btn-order');

btnOrder.onclick = () => {
    infoForm.submit()
}

function checkFilled() {
    if (selectProvince.value && selectDistrict.value && selectWard.value) {
        btnOrder.style = {}
    }
}

// insert dữ liệ vào select province
let htmlOptionProvinces;
fetch(`/ATBM_CuoiKy/templates/web/data/provinces.json`)
    .then(function (resp) {
        const data = resp.json();
        return data;
    })
    .then(function (data) {
        htmlOptionProvinces = data.map(function (item) {
            return `<option class="province-option" value="${`${item.name}-${item.code}`}">${item.name}</option>`;
        });
        selectProvince.insertAdjacentHTML('beforeend', htmlOptionProvinces.join(''));
    })

    .catch(function (err) {
        console.log(err);
    })

// insert dữ liệu vào select quận huyện
let htmlOptionDistricts;
selectProvince.onchange = e => {
    checkFilled()
    selectWard.innerHTML = `<option class='ward-option' value="">Xã, phường</option>`;
    fetch(`/ATBM_CuoiKy/templates/web/data/districts.json`)
        .then(resp => resp.json())
        .then(data => {
            htmlOptionDistricts = data.map(item => {
                if (item.province_code == e.target.value.split('-')[1]) {
                    return `<option class='district-option' value="${`${item.name}-${item.code}`}">${item.name}</option>`
                }
            })
            selectDistrict.innerHTML = `<option class='district-option' value="">Quận, huyện</option>${htmlOptionDistricts.join()}`;
        })
        .catch(err => console.log(err))
}

// insert dữ liệu vào select ward
let htmlOptionWards;
selectDistrict.onchange = e => {
    checkFilled()
    fetch(`/ATBM_CuoiKy/templates/web/data/wards.json`)
        .then(resp => resp.json())
        .then(data => {
            htmlOptionWards = data.map(item => {
                if (item.district_code == selectDistrict.value.split('-')[1]) {
                    return `<option class='ward-option' value="${item.name}">${item.name}</option>`;
                }
            })
            selectWard.innerHTML = htmlOptionWards.join('');
        })
}
selectWard.onchange = () => checkFilled()