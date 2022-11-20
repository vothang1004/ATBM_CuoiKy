

function handleCart() {
	const _this = this;
	const id = this.dataset.id;
	const formEl = [...document.querySelectorAll('.product__size')].find(item => item.dataset.id === id);
	const sizeEl = formEl.querySelector('input[type="radio"]:checked');
	fetch(`/ATBM_CuoiKy/api-cart?action=add&id=${id}&size=${sizeEl.value}`)
		.then(resp => {
			return resp.text();
		})
		.then(data => {
			if (data == 0) {
				window.location.href = '/ATBM_CuoiKy/login';
				return;
			} else if (data == -1) {
				alert('Số lượng sản phẩm trong kho đạt giới hạn');
				return;
			} else {
				document.querySelector('.js-label-cart').innerHTML = data;
				const labelNames = document.querySelectorAll('.product__name');
				const p = [...labelNames].find(labelName => labelName.dataset.id === _this.dataset.id);
				const toastEl = document.createElement('div');
				toastEl.classList.add('toast');
				const html = `
    <div class="toast__icon">
        <i class="fas fa-check-circle"></i>
    </div>
    <p class="toast__message">
        Bạn đã thêm sản phẩm ${p.innerText} vào giỏ hàng
    </p>
`;
				toastEl.innerHTML = html;
				const toastBounding = document.querySelector('.toast-wrap');
				toastBounding.insertAdjacentElement('afterbegin', toastEl);
				timeout = setTimeout(() => {
					toastBounding.removeChild(toastEl);
				}, 3000);
			}
		})
		.catch(err => console.log(err))
}


// delete item
function handleDelete() {
	const _this = this;
	const id = this.dataset.id;
	fetch(`/ATBM_CuoiKy/api-cart?action=delete&id=${id}`)
		.then(resp => resp.text())
		.then(data => {
			const arrData = data.split('-');
			const number = Number(data);
			console.log(number);
			if (arrData.length > 1) {
				[...document.querySelectorAll('.cart-product__table-body')].find(item => item.dataset.id === id).remove();
				document.querySelector('.js-label-cart').innerHTML = `<b>${arrData[0]}</b>`;
				document.querySelector('.js-total-pay').innerText = arrData[1];
			} else if (arrData == 0) {
				document.querySelector('.cart-product__has').remove();
				document.querySelector('.cart-product__pay').remove();
				const html = `
			<div class="cart-product__none">
			<i class="cart-product__none-icon fas fa-shopping-bag"></i>
			<p class="cart-product__none-text">Không có sản phẩm nào trong
				giỏ hàng của bạn</p>
				</div>
			`;
				document.querySelector('.cart-product').innerHTML = html;
				document.querySelector('.js-label-cart').innerHTML = `<b>${number}</b>`
			}

		})
		.catch(err => console.log(err))
}

// add quantity item
function handlePlus() {
	const _this = this;
	const id = this.dataset.id;
	fetch(`/ATBM_CuoiKy/api-cart?action=plus&id=${id}`)
		.then(resp => resp.text())
		.then(data => {
			const arrData = data.split('-');
			if (arrData.length > 1) {
				[...document.querySelectorAll('.number')].find(item => item.dataset.id === id).innerText = arrData[0];
				//cart-product__table-details-product__total
				[...document.querySelectorAll('.cart-product__table-details-product__total')].find(item => item.dataset.id === id).innerText = arrData[1] + 'đ';
				document.querySelector('.js-total-pay').innerText = arrData[2];
			} else {
				alert('Số lượng sản phẩm trong kho đạt giới hạn');
			}
		})
		.catch(err => console.log(err))
}
// minus quantity item 
function handleMinus() {
	const _this = this;
	const id = this.dataset.id;
	fetch(`/ATBM_CuoiKy/api-cart?action=minus&id=${id}`)
		.then(resp => resp.text())
		.then(data => {
			const arrData = data.split('-');
			if (arrData.length > 1) {
				[...document.querySelectorAll('.number')].find(item => item.dataset.id === id).innerText = arrData[0];
				//cart-product__table-details-product__total
				[...document.querySelectorAll('.cart-product__table-details-product__total')].find(item => item.dataset.id === id).innerText = arrData[1] + 'đ';
				document.querySelector('.js-total-pay').innerText = arrData[2];
			} else {
				alert('Số lượng sản phẩm đang tối thiểu');
			}
		})
		.catch(err => console.log(err))
}
