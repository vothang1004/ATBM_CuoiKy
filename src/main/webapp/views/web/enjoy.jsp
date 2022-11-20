<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/templates/web/css/enjoy.css' />">
<link rel="stylesheet"
	href="<c:url value='/templates/web/css/sidebar.css' />">
<link rel="stylesheet"
	href="<c:url value='/templates/web/css/product.css' />">
<link rel="stylesheet"
	href="<c:url value='/templates/web/css/newproduct.css' />">

<div class="toast-wrap"></div>
<div class="grid wide">
	<div class="container-newproduct__direct">
                    <a href="${pageContext.request.contextPath}/home">Trang chủ</a> <span>/</span> <span>yêu thích</span>
                </div>
	<div class="row">
		<div class="col l-3 m-4 c-0 min-0">
			<div class="sidebar">
				<div class="sidebar__category">
					<h2 class="sidebar__category-title">Danh mục</h2>
					<ul class="sidebar__category-list">
						<li class="sidebar__category-item"><a href=""
							class="sidebar__category-link">Sản phẩm</a> <i
							class="sidebar__category-icon fas fa-sort-down"></i></li>
						<ul class="sidebar__category-sublist">
							<li class="sidebar__category-sublist-item"><a href=""
								class="sidebar__category-sublist-link">Áo nam</a> <i
								class="sidebar__category-icon2 fas fa-sort-down"></i></li>
							<ul class="sidebar__category-sublist__sublist">
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Sơ
										mi nam</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Áo
										thun nam</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Polo
										nam</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Áo
										khoác nam</a></li>
							</ul>
							<li class="sidebar__category-sublist-item"><a href=""
								class="sidebar__category-sublist-link">Áo nữ</a> <i
								class="sidebar__category-icon2 fas fa-sort-down"></i></li>
							<ul class="sidebar__category-sublist__sublist">
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Sơ
										mi nữ</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Áo
										thun nữ</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Polo
										nữ</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Áo
										khoác nữ</a></li>
							</ul>
							<li class="sidebar__category-sublist-item"><a href=""
								class="sidebar__category-sublist-link">Quần nam</a> <i
								class="sidebar__category-icon2 fas fa-sort-down"></i></li>
							<ul class="sidebar__category-sublist__sublist">
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Quần
										jean nam</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Quần
										kaki nam</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Quần
										jogger nam</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Quần
										short nam</a></li>
							</ul>
							<li class="sidebar__category-sublist-item"><a href=""
								class="sidebar__category-sublist-link">Quần nữ</a> <i
								class="sidebar__category-icon2 fas fa-sort-down"></i></li>
							<ul class="sidebar__category-sublist__sublist">
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Quần
										jean nữ</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Quần
										kaki nữ</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Quần
										xuông nữ</a></li>
								<li class="sidebar__category-sublist__sublist-item"><a
									href="" class="sidebar__category-sublist__sublist-link">Quần
										short nữ</a></li>
							</ul>
						</ul>
						<li class="sidebar__category-item"><a href=""
							class="sidebar__category-link">Tin tức</a> <i
							class="sidebar__category-icon fas fa-sort-down"></i></li>
						<!--tin tuc-->
						<ul class="sidebar__category-sublist">
							<li class="sidebar__category-sublist-item"><a href=""
								class="sidebar__category-sublist-link">Tin xu hướng</a></li>
							<li class="sidebar__category-sublist-item"><a href=""
								class="sidebar__category-sublist-link">Tin mẹo vặt</a></li>
							<li class="sidebar__category-sublist-item"><a href=""
								class="sidebar__category-sublist-link">Tin khuyến mãi</a></li>
							<li class="sidebar__category-sublist-item"><a href=""
								class="sidebar__category-sublist-link">Thẻ quà tặng</a></li>
						</ul>


						<li class="sidebar__category-item"><a href=""
							class="sidebar__category-link">Câu hỏi</a></li>
						<li class="sidebar__category-item"><a href=""
							class="sidebar__category-link">Liên hệ</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col l-9 m-8 c-12 min-12">
			<h2 class="title">YÊU THÍCH</h2>
			<div class="row">
				<c:if test="${sessionScope.enjoy ne null}">
				<c:forEach items="${sessionScope.enjoy}" var="item">
                            <div data-id='${item.value.id}' class="col l-3 m-6 c-4 min-6 js-product-enjoy">
                                <div class="product <c:if test="${item.value.salePercent ne 0}">product--sale</c:if>">
						<div class="product-sale">
							<div style='--rotate: 2' class="product-sale__item"></div>
							<div style='--rotate: 1' class="product-sale__item"></div>
							<div style='--rotate: 0' class="product-sale__item">
								<span>Giảm</span> <span>${item.value.salePercent}%</span>
							</div>
						</div>
						<div class="view-more">
							<a href="${pageContext.request.contextPath}/allproduct?type=new" class="view-more__link">Xem thêm
								<i class="fas fa-arrow-right"></i>
							</a>
						</div>
						<c:forEach items="${listImage}" var="image">
						<c:if test="${image.productId eq item.value.id}">
						<c:choose>
						<c:when test="${image.isLinkOnline eq true}">
						<a href="${pageContext.request.contextPath}/productdetail?id=${item.value.id}" class="product__img"
							style='background-image: url(${image.link})'>
						</c:when>
						<c:otherwise>
						<a href="${pageContext.request.contextPath}/productdetail?id=${item.value.id}" class="product__img"
							style='background-image: url(upload/${image.link})'>
						</c:otherwise>
						</c:choose>		
						</c:if>
						</c:forEach>
							<form data-id='${item.value.id}' action="pay" method="post" class="hide-on-taplet product__size">
								<div class="product__size-wrap">
									<input checked class="product__size-option" hidden type="radio" value='S' name="size${item.value.id}" id="s${item.value.id}">
									<label for="s${item.value.id}" class="product__size-label">S</label>
									<input class="product__size-option" hidden type="radio" value='M' name="size${item.value.id}" id="m${item.value.id}">
									<label for="m${item.value.id}" class="product__size-label">M</label>
									<input class="product__size-option" hidden type="radio" value='L' name="size${item.value.id}" id="l${item.value.id}">
									<label for="l${item.value.id}" class="product__size-label">L</label>
									<input type='text' hidden value='${item.value.id}' name='id' />
								</div>
							</form>
						</a>					
						<div class="product__info">
							<p class="product__brand">${item.value.branch}</p>
							<p data-id='${item.value.id}' class="product__name">${item.value.name}</p>

							<div class="product__action">
								<div class="product__action-wrap">
									<div class="product__price">
										<c:choose>
										<c:when test="${item.value.salePercent ne 0}">
										<span class="product__price-sell">${item.value.priceSaleFormat} đ</span>
										</c:when>
										<c:otherwise>
										<span class="product__price-sell">${item.value.priceFormat} đ</span>
										</c:otherwise>
										</c:choose>
										
										<c:choose>
										<c:when test="${item.value.salePercent ne 0}">
										<span class="product__price-sale">${item.value.priceFormat} đ</span>
										</c:when>
										<c:otherwise>
										<span class="product__price-sale"></span>
										</c:otherwise>
										</c:choose>
									</div>
									<div class="product__action-option">
										<button title="Xóa khỏi yêu thích" onclick="handleLike.bind(this)()" data-id='${item.value.id}' data-type='enjoy' class="btn-action prouct__action-like">
											<i class="far fa-heart"></i>
										</button>
										<button onclick="handleCart.bind(this)()" data-id='${item.value.id}' class="btn-action product__action-cart">
											<i class="fas fa-shopping-basket"></i>
										</button>
										<button onclick='handleBuy.bind(this)()' data-id='${item.value.id}' class="btn-action product__action-buy">
											<i class="fas fa-shopping-basket"></i> Mua ngay
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
                  </div>
                 </c:forEach>
                 </c:if>
			</div>
		</div>
	</div>
</div>

<script src="<c:url value='/templates/web/js/sidebar.js' />"></script>
<script src="<c:url value='/templates/web/js/buy.js' />"></script>
<script src="<c:url value='/templates/web/js/addtocart.js' />"></script>
<script src="<c:url value='/templates/web/js/addtoenjoy.js' />"></script>
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
