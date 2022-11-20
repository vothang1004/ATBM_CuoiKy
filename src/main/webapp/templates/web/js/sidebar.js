let isRotate = false;

const icons = document.querySelectorAll('.sidebar__category-icon');
[...icons].forEach(icon => {
    icon.onclick = e => {
        if (e.target.style.transform != `rotateZ(180deg)`) {
            e.target.style = `transform: rotateZ(180deg);
                            transform-origin: 50% 75%;`
            e.target.parentNode.nextElementSibling.style = `display: block`;
        } else {
            e.target.style = `transform: rotateZ(0);
                            transform-origin: 50% 75%;`
            e.target.parentNode.nextElementSibling.style = `display: none`;
        }
    }
})
// sublist sublist
const icon2s = document.querySelectorAll('.sidebar__category-icon2');
[...icon2s].forEach(icon => {
    icon.onclick = e => {
        if (e.target.style.transform != `rotateZ(180deg)`) {
            e.target.style = `transform: rotateZ(180deg);
                            transform-origin: 50% 75%;`
            e.target.parentNode.nextElementSibling.style = `display: block`;
        } else {
            e.target.style = `transform: rotateZ(0);
                            transform-origin: 50% 75%;`
            e.target.parentNode.nextElementSibling.style = `display: none`;
        }
    }
})
// toggle brand
const brandBtns = document.querySelectorAll('.js-brand');
let timeout;
brandBtns.forEach(brandBtn => {
    brandBtn.onclick = e => {
        clearTimeout(timeout);
        let filter = JSON.parse(localStorage.getItem('filter')) || {
            brand: [],
            price: '',
            material: []
        };
        filter.brand = [];
        timeout = setTimeout(() => {
            const inputBrands = document.querySelectorAll('input[name="brand"]:checked');
            if (inputBrands.length > 0) {
                inputBrands.forEach(inputBrand => {
                    filter.brand.push(inputBrand.value);
                });
                localStorage.setItem('filter', JSON.stringify(filter));
            } else {
                filter.brand = ['default'];
                localStorage.setItem('filter', JSON.stringify(filter));
            }
            const pageConfig = JSON.parse(localStorage.getItem('pageConfig'));
            const filterStorage = JSON.parse(localStorage.getItem('filter'))
            fetch(`/ATBM_CuoiKy/api-allproduct?type=${pageConfig.type}${pageConfig.categoryId ? `&id=${pageConfig.categoryId}` : ''}${pageConfig.search ? `&search=${pageConfig.search}` : ''}&page=${pageConfig.currentPage}&sort=${pageConfig.sort}&brand=${filterStorage.brand.join('-')}&material=${filterStorage.material.join('-')}&price=${filterStorage.price}`)
                .then(resp => resp.text())
                .then(data => {
                    document.querySelector('.list-product-js').innerHTML = data;
                })
                .catch(err => console.log(err))
        }, 0);
    }
})
// toggle material
const materialBtns = document.querySelectorAll('.js-material');
materialBtns.forEach(materialBtn => {
    materialBtn.onclick = e => {
        clearTimeout(timeout);
        let filter = JSON.parse(localStorage.getItem('filter')) || {
            brand: [],
            price: 'defalut',
            material: []
        };
        filter.material = [];
        timeout = setTimeout(() => {
            const inputMaterials = document.querySelectorAll('input[name="material"]:checked');
            if (inputMaterials.length > 0) {
                inputMaterials.forEach(inputMaterial => {
                    filter.material.push(inputMaterial.value);
                });
                localStorage.setItem('filter', JSON.stringify(filter));
            } else {
                filter.material = ['default'];
                localStorage.setItem('filter', JSON.stringify(filter));
            }
            const pageConfig = JSON.parse(localStorage.getItem('pageConfig'));
            const filterStorage = JSON.parse(localStorage.getItem('filter'))
            fetch(`/ATBM_CuoiKy/api-allproduct?type=${pageConfig.type}${pageConfig.categoryId ? `&id=${pageConfig.categoryId}` : ''}${pageConfig.search ? `&search=${pageConfig.search}` : ''}&page=${pageConfig.currentPage}&sort=${pageConfig.sort}&brand=${filterStorage.brand.join('-')}&material=${filterStorage.material.join('-')}&price=${filterStorage.price}`)
                .then(resp => resp.text())
                .then(data => {
                    document.querySelector('.list-product-js').innerHTML = data;
                })
                .catch(err => console.log(err))
        }, 0);
    }
})
// toggle price
const priceBtns = document.querySelectorAll('.js-price');
priceBtns.forEach(priceBtn => {
    priceBtn.onclick = e => {
        clearTimeout(timeout);
        let filter = JSON.parse(localStorage.getItem('filter')) || {
            brand: [],
            price: '',
            material: []
        };
        timeout = setTimeout(() => {
            const inputPrice = document.querySelector('input[name="price"]:checked');
            filter.price = inputPrice.value;
            localStorage.setItem('filter', JSON.stringify(filter));
            const pageConfig = JSON.parse(localStorage.getItem('pageConfig'));
            const filterStorage = JSON.parse(localStorage.getItem('filter'));
            fetch(`/ATBM_CuoiKy/api-allproduct?type=${pageConfig.type}${pageConfig.categoryId ? `&id=${pageConfig.categoryId}` : ''}${pageConfig.search ? `&search=${pageConfig.search}` : ''}&page=${pageConfig.currentPage}&sort=${pageConfig.sort}&brand=${filterStorage.brand.join('-')}&material=${filterStorage.material.join('-')}&price=${filterStorage.price}`)
                .then(resp => resp.text())
                .then(data => {
                    document.querySelector('.list-product-js').innerHTML = data;
                })
                .catch(err => console.log(err))
        }, 0);
    }
})