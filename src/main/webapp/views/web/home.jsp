<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>

<link rel="stylesheet" href="<c:url value='/templates/web/css/sale.css' />">
<link rel="stylesheet" href="<c:url value='/templates/web/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/templates/web/css/product.css' />">

<div class="toast-wrap"></div>

<!-- phan cua son -->

<div class="grid wide">
	<!-- slider -->
	<div class="slideshow-container">

		<div class="mySlides fade">
			<img src="<c:url value='/templates/web/image/slider_1.webp' />" style="width: 100%">
		</div>
		<div class="mySlides fade">
			<img src="<c:url value='/templates/web/image/slider_2-2-2-2.png' />" style="width: 100%">
		</div>
		<div class="mySlides fade">
			<img src="<c:url value='/templates/web/image/slider_4-4.png' />" style="width: 100%">
		</div>


		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>

	</div>
	<div class="dot-box" style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>
	</div>
	<!-- services -->
	<div class="grid wide">
		<div class="services">
			<div class="services__container">
				<div class="list__services">
					<div class="list__services--icon">
						<i class="fas fa-truck"></i>
					</div>
					<div class="list__services--content">
						<div class="services__content">
							<h2 class="services__content--title">Miễn phí giao hàng</h2>
							<p class="services__content--content">Miễn phí ship với đơn
								hàng > 498K</p>
						</div>
					</div>
				</div>
				<div class="list__services">
					<div class="list__services--icon">
						<i class="fas fa-money-check-alt"></i>
					</div>
					<div class="list__services--content">
						<div class="services__content">
							<h2 class="services__content--title">Thanh toán COD</h2>
							<p class="services__content--content">Thanh toán khi nhận
								hàng (COD)</p>
						</div>
					</div>
				</div>
				<div class="list__services">
					<div class="list__services--icon">
						<i class="far fa-gem"></i>
					</div>
					<div class="list__services--content">
						<div class="services__content">
							<h2 class="services__content--title">Khách hàng VIP</h2>
							<p class="services__content--content">Ưu đãi dành cho khách
								hàng VIP</p>
						</div>
					</div>
				</div>
				<div class="list__services">
					<div class="list__services--icon">
						<i class="fas fa-headset"></i>
					</div>
					<div class="list__services--content">
						<div class="services__content">
							<h2 class="services__content--title">Hỗ trợ bảo hành</h2>
							<p class="services__content--content">Đổi, sửa đồ tại tất cả
								store</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- sản phẩm mới -->
	<div class="new-product">
		<div class="grid wide">
			<a href="${pageContext.request.contextPath}/allproduct?type=new" class="new-product__title">mẫu mới về</a>
			<div class="row">
				<c:forEach items="${listTop4NewProduct}" var="p">
				<div class="col l-3 m-6 c-6 min-6">
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
									<input hidden name='id' type='text' value='${p.id}' />
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
										<button title="Thêm vào yêu thích" onclick="handleLike.bind(this)()" data-id='${p.id}' class="btn-action prouct__action-like">
											<i class="far fa-heart"></i>
										</button>
										<button title="Thêm vào giỏ hàng" onclick="handleCart.bind(this)()" data-id='${p.id}' class="btn-action product__action-cart">
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
		</div>
	</div>
	<!-- banner -->
	<div class="banner">
		<div class="grid wide">
			<div class="banner__container">
				<div class="banner__container-column">
					<div class="banner__container-column-left">
						<img class="banner banner1" src="./assets/image/banner1.webp"
							alt="">
					</div>
				</div>
				<div class="banner__container-column ">
					<div class="banner__container-column-right">
						<div class="banner__container-row-over">
							<div class="banner__container-row banner__container-row-right">
								<div class="banner__container-row-column">
									<img class="banner banner2" src="./assets/image/banner2.webp"
										alt="">
								</div>
								<div class="banner__container-row-column">
									<img class="banner banner3" src="./assets/image/banner3.webp"
										alt="">
								</div>
							</div>
						</div>
						<div class="banner__container-row-under">
							<img class="banner banner4" src="./assets/image/banner4.webp"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!----------------- phan cua tan ------------------>

<!-- sale dong gia -->

<div class="grid wide">
	<div class="small-container">
		<h2 class="title">
			SALE ĐỒNG GIÁ
			<p id="demo"></p>
		</h2>
		<div class="row">
			<div class="col l-3 m-6 c-6 min-6">
				<div class="product product--sale">
					<div class="product-sale">
						<div style='--rotate: 2' class="product-sale__item"></div>
						<div style='--rotate: 1' class="product-sale__item"></div>
						<div style='--rotate: 0' class="product-sale__item">
							<span>Giảm</span> <span>10%</span>
						</div>
					</div>
					<div class="view-more">
						<a href="./newproduct.html" class="view-more__link">Xem thêm <i
							class="fas fa-arrow-right"></i></a>
					</div>
					<a href="./productdetail.html" class="product__img"
						style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/polo-cam-2.jpg?v=1628955290000)'>
						<form data-id='1' action="" method="get"
							class="hide-on-taplet product__size">
							<div class="product__color">
								<input class="product__color-option" hidden type="radio"
									name="color" id="yellow"> <label for="yellow"
									class="product__color-label"> <img
									src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
									alt="" class="product__color-img">
								</label> <input class="product__color-option" hidden type="radio"
									name="color" id="red"> <label for="red"
									class="product__color-label"> <img
									src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
									alt="" class="product__color-img">
								</label>
							</div>
							<div class="product__size-wrap">
								<input class="product__size-option" hidden type="radio"
									name="size" id="s"> <label for="s"
									class="product__size-label">S</label> <input
									class="product__size-option" hidden type="radio" name="size"
									id="m"> <label for="m" class="product__size-label">M</label>
								<input class="product__size-option" hidden type="radio"
									name="size" id="l"> <label for="l"
									class="product__size-label">L</label>
							</div>
						</form>
					</a>
					<div class="product__info">
						<p class="product__brand">ego wear</p>
						<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

						<div class="product__action">
							<div class="product__action-wrap">
								<div class="product__price">
									<span class="product__price-sell">399000 đ</span> <span
										class="product__price-sale">460000 đ</span>
								</div>
								<div class="product__action-option">
									<button data-id='sp' class="btn-action prouct__action-like">
										<i class="far fa-heart"></i>
									</button>
									<button data-id='sp' class="btn-action product__action-cart">
										<i class="fas fa-shopping-basket"></i>
									</button>
									<button data-id='1' class="btn-action product__action-buy">
										<i class="fas fa-shopping-basket"></i> Mua ngay
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col l-3 m-6 c-6 min-6">
				<div class="product product--sale">
					<div class="product-sale">
						<div style='--rotate: 2' class="product-sale__item"></div>
						<div style='--rotate: 1' class="product-sale__item"></div>
						<div style='--rotate: 0' class="product-sale__item">
							<span>Giảm</span> <span>10%</span>
						</div>
					</div>
					<div class="view-more">
						<a href="./newproduct.html" class="view-more__link">Xem thêm <i
							class="fas fa-arrow-right"></i></a>
					</div>
					<a href="./productdetail.html" class="product__img"
						style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/phong-vang-2.jpg?v=1628955779000)'>
						<form data-id='1' action="" method="get"
							class="hide-on-taplet product__size">
							<div class="product__color">
								<input class="product__color-option" hidden type="radio"
									name="color" id="yellow"> <label for="yellow"
									class="product__color-label"> <img
									src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
									alt="" class="product__color-img">
								</label> <input class="product__color-option" hidden type="radio"
									name="color" id="red"> <label for="red"
									class="product__color-label"> <img
									src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
									alt="" class="product__color-img">
								</label>
							</div>
							<div class="product__size-wrap">
								<input class="product__size-option" hidden type="radio"
									name="size" id="s"> <label for="s"
									class="product__size-label">S</label> <input
									class="product__size-option" hidden type="radio" name="size"
									id="m"> <label for="m" class="product__size-label">M</label>
								<input class="product__size-option" hidden type="radio"
									name="size" id="l"> <label for="l"
									class="product__size-label">L</label>
							</div>
						</form>
					</a>
					<div class="product__info">
						<p class="product__brand">ego wear</p>
						<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

						<div class="product__action">
							<div class="product__action-wrap">
								<div class="product__price">
									<span class="product__price-sell">399000 đ</span> <span
										class="product__price-sale">460000 đ</span>
								</div>
								<div class="product__action-option">
									<button data-id='sp' class="btn-action prouct__action-like">
										<i class="far fa-heart"></i>
									</button>
									<button data-id='sp' class="btn-action product__action-cart">
										<i class="fas fa-shopping-basket"></i>
									</button>
									<button data-id='1' class="btn-action product__action-buy">
										<i class="fas fa-shopping-basket"></i> Mua ngay
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col l-3 m-6 c-6 min-6">
				<div class="product product--sale">
					<div class="product-sale">
						<div style='--rotate: 2' class="product-sale__item"></div>
						<div style='--rotate: 1' class="product-sale__item"></div>
						<div style='--rotate: 0' class="product-sale__item">
							<span>Giảm</span> <span>10%</span>
						</div>
					</div>
					<div class="view-more">
						<a href="./newproduct.html" class="view-more__link">Xem thêm <i
							class="fas fa-arrow-right"></i></a>
					</div>
					<a href="./productdetail.html" class="product__img"
						style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pt04116tr-9.jpg?v=1629001480000)'>
						<form data-id='1' action="" method="get"
							class="hide-on-taplet product__size">
							<div class="product__color">
								<input class="product__color-option" hidden type="radio"
									name="color" id="yellow"> <label for="yellow"
									class="product__color-label"> <img
									src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
									alt="" class="product__color-img">
								</label> <input class="product__color-option" hidden type="radio"
									name="color" id="red"> <label for="red"
									class="product__color-label"> <img
									src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
									alt="" class="product__color-img">
								</label>
							</div>
							<div class="product__size-wrap">
								<input class="product__size-option" hidden type="radio"
									name="size" id="s"> <label for="s"
									class="product__size-label">S</label> <input
									class="product__size-option" hidden type="radio" name="size"
									id="m"> <label for="m" class="product__size-label">M</label>
								<input class="product__size-option" hidden type="radio"
									name="size" id="l"> <label for="l"
									class="product__size-label">L</label>
							</div>
						</form>
					</a>
					<div class="product__info">
						<p class="product__brand">ego wear</p>
						<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

						<div class="product__action">
							<div class="product__action-wrap">
								<div class="product__price">
									<span class="product__price-sell">399000 đ</span> <span
										class="product__price-sale">460000 đ</span>
								</div>
								<div class="product__action-option">
									<button data-id='sp' class="btn-action prouct__action-like">
										<i class="far fa-heart"></i>
									</button>
									<button data-id='sp' class="btn-action product__action-cart">
										<i class="fas fa-shopping-basket"></i>
									</button>
									<button data-id='1' class="btn-action product__action-buy">
										<i class="fas fa-shopping-basket"></i> Mua ngay
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col l-3 m-6 c-6 min-6">
				<div class="product product--sale">
					<div class="product-sale">
						<div style='--rotate: 2' class="product-sale__item"></div>
						<div style='--rotate: 1' class="product-sale__item"></div>
						<div style='--rotate: 0' class="product-sale__item">
							<span>Giảm</span> <span>10%</span>
						</div>
					</div>
					<div class="view-more">
						<a href="./newproduct.html" class="view-more__link">Xem thêm <i
							class="fas fa-arrow-right"></i></a>
					</div>
					<a href="./productdetail.html" class="product__img"
						style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/lc03105ke-6.jpg?v=1628997037000)'>
						<form data-id='1' action="" method="get"
							class="hide-on-taplet product__size">
							<div class="product__color">
								<input class="product__color-option" hidden type="radio"
									name="color" id="yellow"> <label for="yellow"
									class="product__color-label"> <img
									src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
									alt="" class="product__color-img">
								</label> <input class="product__color-option" hidden type="radio"
									name="color" id="red"> <label for="red"
									class="product__color-label"> <img
									src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
									alt="" class="product__color-img">
								</label>
							</div>
							<div class="product__size-wrap">
								<input class="product__size-option" hidden type="radio"
									name="size" id="s"> <label for="s"
									class="product__size-label">S</label> <input
									class="product__size-option" hidden type="radio" name="size"
									id="m"> <label for="m" class="product__size-label">M</label>
								<input class="product__size-option" hidden type="radio"
									name="size" id="l"> <label for="l"
									class="product__size-label">L</label>
							</div>
						</form>
					</a>
					<div class="product__info">
						<p class="product__brand">ego wear</p>
						<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

						<div class="product__action">
							<div class="product__action-wrap">
								<div class="product__price">
									<span class="product__price-sell">399000 đ</span> <span
										class="product__price-sale">460000 đ</span>
								</div>
								<div class="product__action-option">
									<button data-id='sp' class="btn-action prouct__action-like">
										<i class="far fa-heart"></i>
									</button>
									<button data-id='sp' class="btn-action product__action-cart">
										<i class="fas fa-shopping-basket"></i>
									</button>
									<button data-id='1' class="btn-action product__action-buy">
										<i class="fas fa-shopping-basket"></i> Mua ngay
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="grid wide hide-on-mobile">
	<div class="row-outer">
		<div class="container-row">
			<div class="animated-heading">
				<h1>
					<span id="words">Tuần lễ sẵn SALE mùa dịch, giảm giá kịch
						sàn toàn bộ sản phẩm</span>
				</h1>
			</div>
		</div>
	</div>
</div>

<!-- top product -->

<div class="grid wide">
	<div class="top-product">
		<video autoplay loop class="hide-on-mobile top-product__video"
			src="<c:url value ='/templates/web/video/lookbook.mp4' />"></video>
		<div class="top-product__list">
			<h2 class="top-product__title">top bán chạy</h2>
			<div class="top-product__list-wrap">
				<i class="hide-on-taplet top-product__list-icon fas fa-angle-right"></i>
				<div class="row">
					<div class="col l-4 m-4 c-6 min-6">
						<div class="product product-top">
							<div class="view-more">
								<a href="" class="view-more__link">Xem thêm <i
									class="fas fa-arrow-right"></i></a>
							</div>
							<a href="" class="product__img"
								style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/ld041002ca-5.jpg?v=1628996726000)'>
								<form data-id='1' action="" method="get" class="product__size">
									<div class="product__color">
										<input class="product__color-option" hidden type="radio"
											name="color" id="yellow"> <label for="yellow"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label> <input class="product__color-option" hidden type="radio"
											name="color" id="red"> <label for="red"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label>
									</div>
									<div class="product__size-wrap">
										<input class="product__size-option" hidden type="radio"
											name="size" id="s"> <label for="s"
											class="product__size-label">S</label> <input
											class="product__size-option" hidden type="radio" name="size"
											id="m"> <label for="m" class="product__size-label">M</label>
										<input class="product__size-option" hidden type="radio"
											name="size" id="l"> <label for="l"
											class="product__size-label">L</label>
									</div>
								</form>
							</a>
							<div class="product__info">
								<p class="product__brand">ego wear</p>
								<p class="product__name">Áo polo phối khóa cổ</p>

								<div class="product__action">
									<div class="product__action-wrap">
										<div class="product__price">
											<span class="product__price-sell">399000 đ</span> <span
												class="product__price-sale">460000 đ</span>
										</div>
										<div class="product__action-option">
											<button class="btn-action prouct__action-like">
												<i class="far fa-heart"></i>
											</button>
											<button class="btn-action product__action-cart">
												<i class="fas fa-shopping-basket"></i>
											</button>
											<button data-id='1' class="btn-action product__action-buy">
												<i class="fas fa-shopping-basket"></i> Mua ngay
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col l-4 m-4 c-6 min-6">
						<div class="product product-top">
							<div class="view-more">
								<a href="" class="view-more__link">Xem thêm <i
									class="fas fa-arrow-right"></i></a>
							</div>
							<a href="" class="product__img"
								style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/ls041148tr-5.jpg?v=1628997261000)'>
								<form data-id='1' action="" method="get" class="product__size">
									<div class="product__color">
										<input class="product__color-option" hidden type="radio"
											name="color" id="yellow"> <label for="yellow"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label> <input class="product__color-option" hidden type="radio"
											name="color" id="red"> <label for="red"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label>
									</div>
									<div class="product__size-wrap">
										<input class="product__size-option" hidden type="radio"
											name="size" id="s"> <label for="s"
											class="product__size-label">S</label> <input
											class="product__size-option" hidden type="radio" name="size"
											id="m"> <label for="m" class="product__size-label">M</label>
										<input class="product__size-option" hidden type="radio"
											name="size" id="l"> <label for="l"
											class="product__size-label">L</label>
									</div>
								</form>
							</a>
							<div class="product__info">
								<p class="product__brand">ego wear</p>
								<p class="product__name">Áo polo phối khóa cổ</p>

								<div class="product__action">
									<div class="product__action-wrap">
										<div class="product__price">
											<span class="product__price-sell">399000 đ</span> <span
												class="product__price-sale">460000 đ</span>
										</div>
										<div class="product__action-option">
											<button class="btn-action prouct__action-like">
												<i class="far fa-heart"></i>
											</button>
											<button class="btn-action product__action-cart">
												<i class="fas fa-shopping-basket"></i>
											</button>
											<button data-id='1' class="btn-action product__action-buy">
												<i class="fas fa-shopping-basket"></i> Mua ngay
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col l-4 m-4 c-6 min-6">
						<div class="product product-top">
							<div class="view-more">
								<a href="" class="view-more__link">Xem thêm <i
									class="fas fa-arrow-right"></i></a>
							</div>
							<a href="" class="product__img"
								style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pt04116tr-9.jpg?v=1629001480000)'>
								<form data-id='1' action="" method="get" class="product__size">
									<div class="product__color">
										<input class="product__color-option" hidden type="radio"
											name="color" id="yellow"> <label for="yellow"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label> <input class="product__color-option" hidden type="radio"
											name="color" id="red"> <label for="red"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label>
									</div>
									<div class="product__size-wrap">
										<input class="product__size-option" hidden type="radio"
											name="size" id="s"> <label for="s"
											class="product__size-label">S</label> <input
											class="product__size-option" hidden type="radio" name="size"
											id="m"> <label for="m" class="product__size-label">M</label>
										<input class="product__size-option" hidden type="radio"
											name="size" id="l"> <label for="l"
											class="product__size-label">L</label>
									</div>
								</form>
							</a>
							<div class="product__info">
								<p class="product__brand">ego wear</p>
								<p class="product__name">Áo polo phối khóa cổ</p>

								<div class="product__action">
									<div class="product__action-wrap">
										<div class="product__price">
											<span class="product__price-sell">399000 đ</span> <span
												class="product__price-sale">460000 đ</span>
										</div>
										<div class="product__action-option">
											<button class="btn-action prouct__action-like">
												<i class="far fa-heart"></i>
											</button>
											<button class="btn-action product__action-cart">
												<i class="fas fa-shopping-basket"></i>
											</button>
											<button data-id='1' class="btn-action product__action-buy">
												<i class="fas fa-shopping-basket"></i> Mua ngay
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col l-4 m-4 c-6 min-6">
						<div class="product product-top">
							<div class="view-more">
								<a href="" class="view-more__link">Xem thêm <i
									class="fas fa-arrow-right"></i></a>
							</div>
							<a href="" class="product__img"
								style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/lc03106de-02.jpg?v=1629001304000)'>
								<form data-id='1' action="" method="get" class="product__size">
									<div class="product__color">
										<input class="product__color-option" hidden type="radio"
											name="color" id="yellow"> <label for="yellow"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label> <input class="product__color-option" hidden type="radio"
											name="color" id="red"> <label for="red"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label>
									</div>
									<div class="product__size-wrap">
										<input class="product__size-option" hidden type="radio"
											name="size" id="s"> <label for="s"
											class="product__size-label">S</label> <input
											class="product__size-option" hidden type="radio" name="size"
											id="m"> <label for="m" class="product__size-label">M</label>
										<input class="product__size-option" hidden type="radio"
											name="size" id="l"> <label for="l"
											class="product__size-label">L</label>
									</div>
								</form>
							</a>
							<div class="product__info">
								<p class="product__brand">ego wear</p>
								<p class="product__name">Áo polo phối khóa cổ</p>

								<div class="product__action">
									<div class="product__action-wrap">
										<div class="product__price">
											<span class="product__price-sell">399000 đ</span> <span
												class="product__price-sale">460000 đ</span>
										</div>
										<div class="product__action-option">
											<button class="btn-action prouct__action-like">
												<i class="far fa-heart"></i>
											</button>
											<button class="btn-action product__action-cart">
												<i class="fas fa-shopping-basket"></i>
											</button>
											<button data-id='1' class="btn-action product__action-buy">
												<i class="fas fa-shopping-basket"></i> Mua ngay
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col l-4 m-4 c-6 min-6">
						<div class="product product-top">
							<div class="view-more">
								<a href="" class="view-more__link">Xem thêm <i
									class="fas fa-arrow-right"></i></a>
							</div>
							<a href="" class="product__img"
								style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pt04119do-7.jpg?v=1629001012000)'>
								<form data-id='1' action="" method="get" class="product__size">
									<div class="product__color">
										<input class="product__color-option" hidden type="radio"
											name="color" id="yellow"> <label for="yellow"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label> <input class="product__color-option" hidden type="radio"
											name="color" id="red"> <label for="red"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label>
									</div>
									<div class="product__size-wrap">
										<input class="product__size-option" hidden type="radio"
											name="size" id="s"> <label for="s"
											class="product__size-label">S</label> <input
											class="product__size-option" hidden type="radio" name="size"
											id="m"> <label for="m" class="product__size-label">M</label>
										<input class="product__size-option" hidden type="radio"
											name="size" id="l"> <label for="l"
											class="product__size-label">L</label>
									</div>
								</form>
							</a>
							<div class="product__info">
								<p class="product__brand">ego wear</p>
								<p class="product__name">Áo polo phối khóa cổ</p>

								<div class="product__action">
									<div class="product__action-wrap">
										<div class="product__price">
											<span class="product__price-sell">399000 đ</span> <span
												class="product__price-sale">460000 đ</span>
										</div>
										<div class="product__action-option">
											<button class="btn-action prouct__action-like">
												<i class="far fa-heart"></i>
											</button>
											<button class="btn-action product__action-cart">
												<i class="fas fa-shopping-basket"></i>
											</button>
											<button data-id='1' class="btn-action product__action-buy">
												<i class="fas fa-shopping-basket"></i> Mua ngay
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col l-4 m-4 c-6 min-6">
						<div class="product product-top">
							<div class="view-more">
								<a href="" class="view-more__link">Xem thêm <i
									class="fas fa-arrow-right"></i></a>
							</div>
							<a href="" class="product__img"
								style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/polo-xanh-1-496d6fd4-eb96-465a-ab78-feec09b609d2.jpg?v=1628997467000)'>
								<form data-id='1' action="" method="get" class="product__size">
									<div class="product__color">
										<input class="product__color-option" hidden type="radio"
											name="color" id="yellow"> <label for="yellow"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label> <input class="product__color-option" hidden type="radio"
											name="color" id="red"> <label for="red"
											class="product__color-label"> <img
											src="https://bizweb.dktcdn.net/thumb/large/100/434/926/products/pc-ao-dam-2019-large-1605601954-6629.jpg?v=1629002946000"
											alt="" class="product__color-img">
										</label>
									</div>
									<div class="product__size-wrap">
										<input class="product__size-option" hidden type="radio"
											name="size" id="s"> <label for="s"
											class="product__size-label">S</label> <input
											class="product__size-option" hidden type="radio" name="size"
											id="m"> <label for="m" class="product__size-label">M</label>
										<input class="product__size-option" hidden type="radio"
											name="size" id="l"> <label for="l"
											class="product__size-label">L</label>
									</div>
								</form>
							</a>
							<div class="product__info">
								<p class="product__brand">ego wear</p>
								<p class="product__name">Áo polo phối khóa cổ</p>

								<div class="product__action">
									<div class="product__action-wrap">
										<div class="product__price">
											<span class="product__price-sell">399000 đ</span> <span
												class="product__price-sale">460000 đ</span>
										</div>
										<div class="product__action-option">
											<button class="btn-action prouct__action-like">
												<i class="far fa-heart"></i>
											</button>
											<button class="btn-action product__action-cart">
												<i class="fas fa-shopping-basket"></i>
											</button>
											<button data-id='1' class="btn-action product__action-buy">
												<i class="fas fa-shopping-basket"></i> Mua ngay
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- key top -->

<div class="key-top hide-on-mobile">
	<div class="grid wide">
		<h2 class="key-top__title">từ khóa hot</h2>
		<div class="key-top__list">
			<div class="key-top__item">
				<a class="key-top__item-link" href="">Chân váy</a>
			</div>
			<div class="key-top__item">
				<a class="key-top__item-link" href="">Áo sơ mi</a>
			</div>
			<div class="key-top__item">
				<a class="key-top__item-link" href="">Áo đôi</a>
			</div>
			<div class="key-top__item">
				<a class="key-top__item-link" href="">Đầm cao cấp</a>
			</div>
			<div class="key-top__item">
				<a class="key-top__item-link" href="">Áo vest</a>
			</div>
			<div class="key-top__item">
				<a class="key-top__item-link" href="">Váy body</a>
			</div>
			<div class="key-top__item">
				<a class="key-top__item-link" href="">Phụ kiện mới</a>
			</div>
			<div class="key-top__item">
				<a class="key-top__item-link" href="">Áo ba lỗ</a>
			</div>
			<div class="key-top__item">
				<a class="key-top__item-link" href="">Áo khoác da</a>
			</div>
			<div class="key-top__item">
				<a class="key-top__item-link" href="">Áo chống nắng</a>
			</div>
		</div>
	</div>
</div>

<!-- news -->

<div class="news">
	<div class="grid wide">
		<h2 class="news__title">tin tức mới nhất</h2>
		<div class="row">
			<div class="col l-6 m-12 c-12 min-12">
				<div class="news-left">
					<img
						src="https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZmFzaGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
						alt="" class="news-left__img">
					<div class="news-left__belong">
						<span class="news-left__date">15/08/2021</span> <span
							class="news-left__author">- bởi: Ego Creative</span>
					</div>
					<a href="" class="news-left__title">Mẫu tây Andrea chuộng phong
						cách thời trang cá tính</a>
					<p class="news-left__desc">Andrea Aybar là người mẫu gốc Tây Ba
						Nha. Nhưng từ khi còn rất nhỏ, cô đã cùng gia đình chuyển tới Việt
						Nam sinh sống và làm việc. Vì thế, Việt Nam được coi như là quê
						hương thứ 2</p>
				</div>
			</div>
			<div class="col l-6 m-12 c-12 min-12">
				<div class="news-right">
					<div class="news-right__item">
						<div class="row">
							<div class="col l-4 m-4 c-4 min-4">
								<img
									src="https://bizweb.dktcdn.net/100/434/926/articles/image001a.jpg?v=1629005966930"
									alt="" class="news-right__item-img">
							</div>
							<div class="col l-8 m-8 c-8 min-8">
								<div class="news-right__item-main">
									<div class="news-right__item-belong">
										<span class="news-right__item__date">15/08/2021</span> <span
											class="news-right__item__author">- bởi: Ego Creative</span>
									</div>
									<a href="" class="news-right__item__title">8 mẹo giúp bạn
										chọn quần jean trong mơ mà không cần đến shop</a>
									<p class="news-right__item__desc">Để biết được quần jean có
										vừa với mình hay không theo kích cỡ, bạn không cần phải đứng
										xếp hàng trong</p>
								</div>
							</div>
						</div>
					</div>
					<div class="news-right__item">
						<div class="row">
							<div class="col l-4 m-4 c-4 min-4">
								<img
									src="https://bizweb.dktcdn.net/100/434/926/articles/image001a.jpg?v=1629005966930"
									alt="" class="news-right__item-img">
							</div>
							<div class="col l-8 m-8 c-8 min-8">
								<div class="news-right__item-main">
									<div class="news-right__item-belong">
										<span class="news-right__item__date">15/08/2021</span> <span
											class="news-right__item__author">- bởi: Ego Creative</span>
									</div>
									<a href="" class="news-right__item__title">8 mẹo giúp bạn
										chọn quần jean trong mơ mà không cần đến shop</a>
									<p class="news-right__item__desc">Để biết được quần jean có
										vừa với mình hay không theo kích cỡ, bạn không cần phải đứng
										xếp hàng trong</p>
								</div>
							</div>
						</div>
					</div>
					<div class="news-right__item">
						<div class="row">
							<div class="col l-4 m-4 c-4 min-4">
								<img
									src="https://bizweb.dktcdn.net/100/434/926/articles/image001a.jpg?v=1629005966930"
									alt="" class="news-right__item-img">
							</div>
							<div class="col l-8 m-8 c-8 min-8">
								<div class="news-right__item-main">
									<div class="news-right__item-belong">
										<span class="news-right__item__date">15/08/2021</span> <span
											class="news-right__item__author">- bởi: Ego Creative</span>
									</div>
									<a href="" class="news-right__item__title">8 mẹo giúp bạn
										chọn quần jean trong mơ mà không cần đến shop</a>
									<p class="news-right__item__desc">Để biết được quần jean có
										vừa với mình hay không theo kích cỡ, bạn không cần phải đứng
										xếp hàng trong</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="<c:url value='/templates/web/js/buy.js' />"></script>
<script src="<c:url value='/templates/web/js/addtocart.js' />"></script>
<script src="<c:url value='/templates/web/js/addtoenjoy.js' />"></script>
<script src="<c:url value='/templates/web/js/slider.js' />"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	(function() {
		var words = [
				"Tuần lễ sẵn SALE mùa dịch, giảm giá kịch sàn toàn bộ sản phẩm",
				"HOT: Sale 50% cho toàn bộ đơn hàng có giá trị từ 2 triệu, miễn phí ship toàn quốc",
				"Thông báo: Tình hình dịch Covid-19 Ego Wear chỉ nhận đặt hàng online không tới cửa hàng từ ngày 8/7" ], i = 0;
		setInterval(function() {
			$('#words').fadeOut(function() {
				$(this).html(words[(i = (i + 1) % words.length)]).fadeIn();
			});
		}, 2000)
	})();
</script>

<script>
	// Set the date we're counting down to
	var countDownDate = new Date("Dec 10, 2021 20:37:25").getTime();

	// Update the count down every 1 second
	var x = setInterval(function() {

		// Get today's date and time
		var now = new Date().getTime();

		// Find the distance between now and the count down date
		var distance = countDownDate - now;

		// Time calculations for days, hours, minutes and seconds
		var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
				/ (1000 * 60 * 60));
		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((distance % (1000 * 60)) / 1000);

		// Output the result in an element with id="demo"
		document.getElementById("demo").innerHTML = days + "d " + hours + "h "
				+ minutes + "m " + seconds + "s ";

		// If the count down is over, write some text 
		if (distance < 0) {
			clearInterval(x);
			document.getElementById("demo").innerHTML = "EXPIRED";
		}
	}, 1000);
</script>

<script>
        const topProductList = document.querySelector('.top-product__list-wrap');
        const topProductIcon = document.querySelector('.top-product__list-icon');
        const app = {
            scrollEl: null,
            posX: 0,
            width: 0,
            currentX: 0,
            isEnd: false,
            changeIcon() {
                if(this.isEnd) {
                    topProductIcon.style = `right: -10%`;
                    topProductIcon.classList.replace('fa-angle-right', 'fa-angle-left');
                }
                else {
                    topProductIcon.style = `right: 0`;
                    topProductIcon.classList.replace('fa-angle-left', 'fa-angle-right');
                }
            },
            handleEvent() {
                const _this = this;
                function handleMove(e) {
                    e.preventDefault();
                    _this.currentX = e.clientX;
                    _this.width = _this.currentX - _this.posX;
                    _this.scrollEl.scrollBy(-_this.width, 0);
                    if(_this.scrollEl.scrollLeft == _this.scrollEl.scrollWidth - _this.scrollEl.offsetWidth) {
                        _this.isEnd = true;
                        _this.changeIcon();
                    }else {
                        _this.isEnd = false;
                        _this.changeIcon();
                    }
                }
                topProductList.onmousedown = e => {
                    e.stopPropagation();
                    _this.scrollEl = e.target.closest('.top-product__list-wrap');
                    if(_this.scrollEl) {
                        _this.posX = e.clientX;                      
                        _this.scrollEl.addEventListener('mousemove', handleMove);
                    }
                }
                topProductList.onmouseup = e => {
                    e.stopPropagation();
                    if(_this.scrollEl) {
                        _this.scrollEl.removeEventListener('mousemove', handleMove);
                    }
                }
                topProductIcon.onclick = e => {
                    if(!_this.isEnd) {
                        _this.isEnd = true;
                        topProductList.scrollLeft = topProductList.scrollWidth - topProductList.offsetWidth;
                        _this.changeIcon();
                    }else {
                        _this.isEnd = false;
                        topProductList.scrollLeft = 0;
                        _this.changeIcon();
                    }
                }
            },
            start() {
                this.handleEvent();
            }
        }
        app.start();
    </script>