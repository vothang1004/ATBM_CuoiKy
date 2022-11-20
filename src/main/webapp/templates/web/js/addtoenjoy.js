

function handleLike() {
	const _this = this;
	const id = this.dataset.id;
	const type = this.dataset.type;
	fetch(`/ATBM_CuoiKy/api-enjoy?id=${id}`)
		.then(resp => resp.text())
		.then(data => {
			const arrData = data.split('$');
			if(arrData.length > 1) {
				document.querySelector('.js-label-enjoy').innerHTML = arrData[1];
				if(type) {
					[...document.querySelectorAll('.js-product-enjoy')].find(item => item.dataset.id === id).remove();
				}
			}else {
				if (data == 0) {
					window.location.href = '/ATBM_CuoiKy/login';
				}else {
					document.querySelector('.js-label-enjoy').innerHTML = data;
					const labelNames = document.querySelectorAll('.product__name');
					const p = [...labelNames].find(labelName => labelName.dataset.id === id);
					const toastEl = document.createElement('div');
					toastEl.classList.add('toast');
					const html = `
		    <div class="toast__icon">
		        <i class="fas fa-check-circle"></i>
		    </div>
		    <p class="toast__message">
		        Bạn đã thêm sản phẩm ${p.innerText} vào yêu thích
		    </p>
		`;
					toastEl.innerHTML = html;
					const toastBounding = document.querySelector('.toast-wrap');
					toastBounding.insertAdjacentElement('afterbegin', toastEl);
					timeout = setTimeout(() => {
						toastBounding.removeChild(toastEl);
					}, 3000);
				}
			}
			
		})
		.catch(err => console.log(err))

}
