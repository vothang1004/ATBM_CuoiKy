// sự kiện click vào sort item
const sortList = document.querySelector('.sort-product__list');
const sortItems = document.querySelectorAll('.sort-product__item');
const sortMove = document.querySelector('.sort-product__list-move');
const underline = document.querySelector('.underline');
function handleSort(pageConfig, sort, { brand, price, material }) {
    const page = pageConfig.currentPage;
    const type = pageConfig.type;
    let categoryId;
    let search;
    if (pageConfig.categoryId) {
        categoryId = pageConfig.categoryId;
    }
    if (pageConfig.search) {
        search = pageConfig.search;
    }
    pageConfig.sort = sort;
    localStorage.setItem('pageConfig', JSON.stringify(pageConfig));


    fetch(`/ATBM_CuoiKy/api-allproduct?type=${type}${categoryId ? `&id=${categoryId}` : ''}${search ? `&search=${search}` : ''}&page=${page}&sort=${sort}&brand=${brand.join('-')}&material=${material.join('-')}&price=${price}`)
        .then(resp => {
            return resp.text();
        })
        .then(data => {
            document.querySelector('.list-product-js').innerHTML = data;
        })
        .catch(err => console.log(err));
}

[...sortItems].forEach(sortItem => {
    sortItem.onclick = e => {
        [...sortItems].forEach(item => item.classList.remove('active'));
        e.target.classList.add('active');
        const elementBoundingFirst = sortItems[0].getBoundingClientRect();
        const elementBounding = e.target.getBoundingClientRect();
        const distance1 = elementBoundingFirst.left;
        const distance2 = elementBounding.left;
        underline.style = 'display: none';
        sortMove.style = `width: ${elementBounding.width}px;
                            transform: translate(${distance2 - distance1}px, 1px);`
        // xử lí sắp xếp
        handleSort(JSON.parse(localStorage.getItem('pageConfig')), e.target.dataset.sort, JSON.parse(localStorage.getItem('filter')));
    }
})
