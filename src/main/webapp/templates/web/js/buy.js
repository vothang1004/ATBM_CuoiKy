

function handleBuy() {
	const _this = this;
	const id = this.dataset.id;
	const formEl = [...document.querySelectorAll('.product__size')].find(item => item.dataset.id === id);
	formEl ? formEl.submit() : undefined;
}