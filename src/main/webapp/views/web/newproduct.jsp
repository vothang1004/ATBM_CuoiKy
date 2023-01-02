<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>


<link rel="stylesheet" href="<c:url value='/templates/web/css/newproduct.css' />">
<link rel="stylesheet" href="<c:url value='/templates/web/css/sidebar.css' />">
<link rel="stylesheet" href="<c:url value='/templates/web/css/product.css' />">
<link rel="stylesheet" href="<c:url value='/templates/web/css/sortproduct.css' />">
<link rel="stylesheet" href="<c:url value='/templates/web/css/pagination.css' />">


<div class="toast-wrap">
</div>

<div class="grid wide">
                <div class="container-newproduct__direct">
                    <a href="./index.html">Trang chủ</a> <span>/</span> <span>Sản phẩm mới</span>
                </div>
                <div class="row">
                    <div class="col-3">
                        <div class="sidebar">
                            <div class="sidebar__category">
                                <h2 class="sidebar__category-title">Danh mục</h2>
                                <ul class="sidebar__category-list">
                                    <li class="sidebar__category-item">
                                        <a href="" class="sidebar__category-link">Sản phẩm</a>
                                        <i class="sidebar__category-icon fas fa-sort-down"></i>                                       
                                    </li>
                                    <ul class="sidebar__category-sublist">
                                    <c:forEach items="${listCategory}" var="cate">
                                        <li class="sidebar__category-sublist-item">
                                            <a href="" class="sidebar__category-sublist-link">${cate.name}</a>
                                            <i class="sidebar__category-icon2 fas fa-sort-down"></i>                                       
                                        </li>
                                        <ul class="sidebar__category-sublist__sublist">
                                        	<c:forEach items="${listSubCategory}" var="subcate">
                                        	<c:if test="${subcate.categoryId eq cate.id}">
                                            <li class="sidebar__category-sublist__sublist-item">
                                                <a href="" class="sidebar__category-sublist__sublist-link">${subcate.name}</a>
                                            </li>
                                            </c:if>
                                            </c:forEach>
                                        </ul>
                                    </c:forEach>
                                    </ul>
                                    <li class="sidebar__category-item">
                                        <a href="" class="sidebar__category-link">Tin tức</a>
                                        <i class="sidebar__category-icon fas fa-sort-down"></i>
                                    </li>
                                    <!--tin tuc-->
                                    <ul class="sidebar__category-sublist">
                                        <li class="sidebar__category-sublist-item">
                                            <a href="" class="sidebar__category-sublist-link">Tin xu hướng</a>                                       
                                        </li>
                                        <li class="sidebar__category-sublist-item">
                                            <a href="" class="sidebar__category-sublist-link">Tin mẹo vặt</a>                                       
                                        </li>
                                        <li class="sidebar__category-sublist-item">
                                            <a href="" class="sidebar__category-sublist-link">Tin khuyến mãi</a>                                       
                                        </li>
                                        <li class="sidebar__category-sublist-item">
                                            <a href="" class="sidebar__category-sublist-link">Thẻ quà tặng</a>                                       
                                        </li>
                                    </ul>


                                    <li class="sidebar__category-item">
                                        <a href="" class="sidebar__category-link">Câu hỏi</a>
                                    </li>
                                    <li class="sidebar__category-item">
                                        <a href="" class="sidebar__category-link">Liên hệ</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="sidebar__filter">
                                <div class="sidebar__filter-title">
                                    <h3>Lọc thông minh</h3>
                                    <p>Tối ưu thời gian tìm kiếm sản phẩm</p>
                                </div>
                                 <div class="sidebar__filter-brand">
                                    <h3 class="sidebar__filter-brand__title">Thương hiệu</h3>
                                    <c:forEach items="${listBrand}" var="brand">
                                    <div class="sidebar__filter__choose">
                                        <input class="sidebar__filter-input" hidden value='${brand}' type="checkbox"
                                            id="${brand}" name="brand">
                                        <label class="sidebar__filter-toggle js-brand" for="${brand}"></label>
                                        <span class="sidebar__filter-toggle-label">${brand}</span>
                                    </div>
                                    </c:forEach>                               
                                </div>
                                <div class="sidebar__filter-price">
                                    <h3 class="sidebar__filter-price__title">Khoảng giá</h3>
                                    <div class="sidebar__filter__choose">
                                        <input class="sidebar__filter-input" checked hidden value='default' type="radio"
                                            id="price1" name="price">
                                        <label class="sidebar__filter-toggle js-price" for="price1"></label>
                                        <span class="sidebar__filter-toggle-label">Tất cả</span>
                                    </div>
                                    <div class="sidebar__filter__choose">
                                        <input class="sidebar__filter-input" hidden value='0-99000' type="radio"
                                            id="price2" name="price">
                                        <label class="sidebar__filter-toggle js-price" for="price2"></label>
                                        <span class="sidebar__filter-toggle-label">Dưới 100.000đ</span>
                                    </div>
                                    <div class="sidebar__filter__choose">
                                        <input class="sidebar__filter-input" hidden value='100000-199000' type="radio"
                                            id="price3" name="price">
                                        <label class="sidebar__filter-toggle js-price" for="price3"></label>
                                        <span class="sidebar__filter-toggle-label">100.000đ - &#60;&#160;200.000đ</span>
                                    </div>
                                    <div class="sidebar__filter__choose">
                                        <input class="sidebar__filter-input" hidden value='200000-299000' type="radio"
                                            id="price4" name="price">
                                        <label class="sidebar__filter-toggle js-price" for="price4"></label>
                                        <span class="sidebar__filter-toggle-label">200.000đ - &#60;&#160;300.000đ</span>
                                    </div>
                                    <div class="sidebar__filter__choose">
                                        <input class="sidebar__filter-input" hidden value='300000-399000' type="radio"
                                            id="price5" name="price">
                                        <label class="sidebar__filter-toggle js-price" for="price5"></label>
                                        <span class="sidebar__filter-toggle-label">300.000đ - &#60;&#160;400.000đ</span>
                                    </div>
                                    <div class="sidebar__filter__choose">
                                        <input class="sidebar__filter-input" hidden value='400000' type="radio"
                                            id="price6" name="price">
                                        <label class="sidebar__filter-toggle js-price" for="price6"></label>
                                        <span class="sidebar__filter-toggle-label">Từ &#160;400.000đ</span>
                                    </div>
                                </div>
                                 <div class="sidebar__filter-material">
                                    <h3 class="sidebar__filter-material__title">Chất liệu</h3>
                                    <c:forEach items="${listMaterial}" var="material">
                                    <div class="sidebar__filter__choose">
                                        <input class="sidebar__filter-input" hidden value='${material}' type="checkbox"
                                            id="${material}" name="material">
                                        <label class="sidebar__filter-toggle js-material" for="${material}"></label>
                                        <span class="sidebar__filter-toggle-label">${material}</span>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-9">
                        <div class="sort-product">
                            <ul class="sort-product__list">
                                <div class="sort-product__list-move"></div>
                                <li data-sort='default' class="sort-product__item active">Mặc định <div class="underline"></div></li>
                                <li data-sort='a-z' class="sort-product__item">Từ A-Z</li>
                                <li data-sort='z-a' class="sort-product__item">Từ Z-A</li>
                                <li data-sort='price-up' class="sort-product__item">Giá tăng dần</li>
                                <li data-sort='price-down' class="sort-product__item">Giá giảm dần</li>
                                <li data-sort='new' class="sort-product__item">Mới nhất</li>
                            </ul>
                        </div>
                        <div class="row list-product-js">             
                        <c:forEach items="${listProduct}" var="p">
                            <div class="col l-3 m-6 c-4 min-6">
                                <div class="product <c:if test="${p.salePercent ne 0}">product--sale</c:if>">
						<div class="product-sale">
							<div style='--rotate: 2' class="product-sale__item"></div>
							<div style='--rotate: 1' class="product-sale__item"></div>
							<div style='--rotate: 0' class="product-sale__item">
								<span>Giảm</span> <span>${p.salePercent}%</span>
							</div>
						</div>
						<div class="view-more">
							<a href="${pageContext.request.contextPath}/allproduct?type=new" class="view-more__link">Xem thêm
								<i class="fas fa-arrow-right"></i>
							</a>
						</div>
						<c:forEach items="${listImage}" var="image">
						<c:if test="${image.productId eq p.id}">
						<c:choose>
						<c:when test="${image.isLinkOnline eq true}">
						<a href="${pageContext.request.contextPath}/productdetail?id=${p.id}" class="product__img"
							style='background-image: url(${image.link})'>
						</c:when>
						<c:otherwise>
						<a href="${pageContext.request.contextPath}/productdetail?id=${p.id}" class="product__img"
							style='background-image: url(upload/${image.link})'>
						</c:otherwise>
						</c:choose>		
						</c:if>
						</c:forEach>
							<form data-id='${p.id}' action="pay" method="post" class="hide-on-taplet product__size">
								<div class="product__size-wrap">
									<input checked class="product__size-option" hidden type="radio" value='S' name="size${p.id}" id="s${p.id}">
									<label for="s${p.id}" class="product__size-label">S</label>
									<input class="product__size-option" hidden type="radio" value='M' name="size${p.id}" id="m${p.id}">
									<label for="m${p.id}" class="product__size-label">M</label>
									<input class="product__size-option" hidden type="radio" value='L' name="size${p.id}" id="l${p.id}">
									<label for="l${p.id}" class="product__size-label">L</label>
									<input type='text' hidden value='${p.id}' name='id' />
								</div>
							</form>
						</a>					
						<div class="product__info">
							<p class="product__brand">${p.branch}</p>
							<p data-id='${p.id}' class="product__name">${p.name}</p>

							<div class="product__action">
								<div class="product__action-wrap">
									<div class="product__price">
										<c:choose>
										<c:when test="${p.salePercent ne 0}">
										<span class="product__price-sell">${p.priceSaleFormat} đ</span>
										</c:when>
										<c:otherwise>
										<span class="product__price-sell">${p.priceFormat} đ</span>
										</c:otherwise>
										</c:choose>
										
										<c:choose>
										<c:when test="${p.salePercent ne 0}">
										<span class="product__price-sale">${p.priceFormat} đ</span>
										</c:when>
										<c:otherwise>
										<span class="product__price-sale"></span>
										</c:otherwise>
										</c:choose>
									</div>
									<div class="product__action-option">
										<button onclick="handleLike.bind(this)()" data-id='${p.id}' class="btn-action prouct__action-like">
											<i class="far fa-heart"></i>
										</button>
										<button onclick="handleCart.bind(this)()" data-id='${p.id}' class="btn-action product__action-cart">
											<i class="fas fa-shopping-basket"></i>
										</button>
										<button onclick='handleBuy.bind(this)()' data-id='${p.id}' class="btn-action product__action-buy">
											<i class="fas fa-shopping-basket"></i> Mua ngay
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
                  </div>
                 </c:forEach>
                        </div>
                        <ul class="pagination">                       	
                        	
                        </ul>
                    </div>
                </div>
            </div>
            
<script src="<c:url value='/templates/web/js/pagination.js' />"></script>
<script src="<c:url value='/templates/web/js/sidebar.js' />"></script>
<script src="<c:url value='/templates/web/js/buy.js' />"></script>
<script src="<c:url value='/templates/web/js/addtoenjoy.js' />"></script>
<script src="${pageContext.request.contextPath}/templates/web/js/addtocart.js"></script>
<script src="<c:url value='/templates/web/js/sortproduct.js' />"></script>


<script>
	pagination('.pagination', {
		currentPage: 1,
		numberPage: ${numberPage}
	})
	localStorage.setItem('pageConfig', JSON.stringify({
		currentPage: 1,
		type: 'new',
		sort: 'default'
	}))
	localStorage.setItem('filter', JSON.stringify({
		brand: ['default'],
		price: 'default',
		material: ['default']
	}))
</script>
<script>
const pageItems = $$('.pagination__link');
[...pageItems].find(item => item.classList.contains('active')).style = `pointer-events: none`;

function handlePageLink() {
	let timeout, brand, price, material;
	const _this = this;
	const thisPage = this.dataset.page;
	pagination('.pagination', {
		currentPage: Number(thisPage),
		numberPage: ${numberPage}
	})
	const pageItems = $$('.pagination__link');
	[...pageItems].find(item => item.classList.contains('active')).style = `pointer-events: none`;
	// get item from localStorage
	const pageConfig = JSON.parse(localStorage.getItem('pageConfig'));
	const filter = JSON.parse(localStorage.getItem('filter'));
	if(filter.brand.length > 0) {
		brand = filter.brand.join('-');
	}
	if(filter.price) {
		price = filter.price;
	}
	if(filter.material.length > 0) {
		material = filter.material.join('-');
	}
	
	pageConfig.currentPage = thisPage;
	
	clearTimeout(timeout);
	window.scrollTo(0, 0);
	const loaderWrap = document.createElement("div");
	loaderWrap.classList.add("loader-wrap");
	loaderWrap.innerHTML = `<span class="loader"></span>`;
	const wrapProduct = $('.list-product-js');
	wrapProduct.innerHTML = '';
	wrapProduct.insertAdjacentElement('afterbegin', loaderWrap);
	fetch('/ATBM_CuoiKy/api-allproduct?type=new&page=' + thisPage + '&sort='+JSON.parse(localStorage.getItem('pageConfig')).sort
			+ '&brand='+brand+'&material='+material+'&price='+price)
	.then(resp => {
		return resp.text();
	})
	.then(data => {
		timeout = setTimeout(() => {
			localStorage.setItem('pageConfig', JSON.stringify(pageConfig));
			wrapProduct.innerHTML = data;
			loaderWrap.style = `display: none`;			
		}, 2000);			
	})
	.catch(err => console.log(err))
}
</script>
<script>
window.addEventListener( "pageshow", function ( event ) {
	  var historyTraversal = event.persisted || 
	                         ( typeof window.performance != "undefined" && 
	                              window.performance.navigation.type === 2 );
	  if ( historyTraversal ) {
	    // Handle page restore.
	    window.location.reload();
	  }
	});
</script>
