<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<link rel="stylesheet" href="<c:url value='/templates/web/css/product.css' />">
<link rel="stylesheet" href="<c:url value='/templates/web/css/productdetail.css' />">

<div class="toast-wrap"> </div>
<div class="grid wide">
	<div class="container-detail__direct">
		<a href="${pageContext.request.contextPath}/">Trang chủ</a> <span>/</span>
		<a style="cursor: pointer" onclick="history.back()">Sản phẩm</a> <span>/</span> <span>${product.name}</span>
	</div>
	<div class="detailproduct">
		<div class="row">
			<div class="col l-7 m-12 c-12 min-12">
				<div class="detailproduct-left">
					<div class="detailproduct-left__slide-wrap">
						<div class="detailproduct-left__slide-choose">
							<c:forEach items="${listImage}" var="image" varStatus="loopCount">
							<img data-distance='${loopCount.count - 1}'
								class="detailproduct-left__slide-choose__img <c:if test="${loopCount.count eq 1}">active</c:if>"
								src="${image.link}"
								alt="">
							</c:forEach>
						</div>
						<div class="detailproduct-left__slide">
							<c:forEach items="${listImage}" var="image">
							<div class="detailproduct-left__slide-img">
								<img class="detailproduct-left__slide-img"
									src="${image.link}"
									alt="">
							</div>
							</c:forEach>			
						</div>
					</div>

					<div class="detailproduct-left___help">
						<div class="detailproduct-left__help-btn">
							<button data-id='paragraph1' class="btn__help btn__help--active">Thông
								tin sản phẩm</button>
							<button data-id='paragraph2' class="btn__help">Hướng dẫn
								mua hàng</button>
						</div>
						<p data-id='paragraph1' class="detailproduct-left___help-content">
							Chính thức cho ra mắt dòng sản phẩm ${product.name} mới với thiêt kế vô
							cùng trẻ trung, khỏe khoắn cùng nhiều ưu điểm hấp dẫn. Thiết kế
							tinh tế với phần cổ và tay áo được phối viền màu, kết hợp với
							phần khoá đồng được nhấn nhá thêm ở phần cổ tạo hiệu ứng cho
							chiếc áo thêm phần nổi bật. Áo được làm từ chất liệu ${product.material}
							co giãn 04 chiều mang lại cảm giác thoải mái và dễ chịu tối đa
							cho người mặc. Dòng sản phẩm này tới 06 phiên bản màu sắc; từ đơn
							giản, nhẹ nhàng đến nổi bật, cá tính; phù hợp với hầu hết nhu cầu
							sử dụng từ công sở, đội nhóm, đi chơi,… <br> <br> - Màu
							sắc: Trắng <br> - Chất liệu: ${product.material} <br> - Thành
							phần: 95% ${product.material} + 5% spandex (${product.material} cao cấp co giãn 4 chiều) <br>
							- Xuất xứ: Made in Viet Nam <br>
						</p>
						<p data-id='paragraph2' class="detailproduct-left___help-content">
							Bước 1: Tìm sản phẩm cần mua Bạn có thể truy cập website để tìm
							và chọn sản phẩm muốn mua bằng nhiều cách: <br> + Sử dụng ô
							tìm kiếm phía trên, gõ tên sản phẩm muốn mua (có thể tìm đích
							danh 1 sản phẩm, tìm theo hãng...). Website sẽ cung cấp cho bạn
							những gợi ý chính xác để lựa chọn: <br> Bước 2: Đặt mua sản
							phẩm Sau khi chọn được sản phẩm ưng ý muốn mua, bạn tiến hành đặt
							hàng bằng cách <br> + Chọn vào nút MUA NGAY nếu bạn muốn
							thanh toán luôn toàn bộ giá tiền sản phẩm <br> + Điền đầy đủ
							các thông tin mua hàng theo các bước trên website, sau đó chọn
							hình thức nhận hàng là giao hàng tận nơi hay đến siêu thị lấy
							hàng, chọn hình thức thanh toán là trả khi nhận hàng hay thanh
							toán online (bằng thẻ ATM, VISA hay MasterCard) và hoàn tất đặt
							hàng. <br> +Lưu ý: <br> 1. Chúng tôi chỉ chấp nhận
							những đơn đặt hàng khi cung cấp đủ thông tin chính xác về địa
							chỉ, số điện thoại. Sau khi bạn đặt hàng, chúng tôi sẽ liên lạc
							lại để kiểm tra thông tin và thỏa thuận thêm những điều có liên
							quan. <br> 2. Một số trường hợp nhạy cảm: giá trị đơn hàng
							quá lớn & thời gian giao hàng vào buổi tối địa chỉ giao hàng
							trong ngõ hoặc có thể dẫn đến nguy hiểm. Chúng tôi sẽ chủ động
							liên lạc với quý khách để thống nhất lại thời gian giao hàng cụ
							thể. <br>

						</p>
					</div>
				</div>
			</div>
			<div class="col l-5 m-12 c-12 min-12">
				<div class="detailproduct-right">
					<div class="detailproduct-right__name-wrap">
						<h3 class="detailproduct-right__name">${product.name}</h3>
						<i data-id='${product.id}' class="detailproduct-right__like far fa-heart"></i>
					</div>
					<div class="detailproduct-right__brand-wrap">
						<span>Thương hiệu:</span> <span class="detailproduct-right__brand">${product.branch}</span>
					</div>
					<div class="detailproduct-right__price-wrap">
						<span class="detailproduct-right__price-sell">${product.priceSaleFormat}</span>
						<c:if test="${product.salePercent ne 0}">
						<span class="detailproduct-right__price-sale-wrap">
						Giá gốc: <span class="detailproduct-right__price-sale">${product.priceFormat}</span>
						</span>
						</c:if>
					</div>
					<form action="pay" method="post" class="detailproduct-right__form">
						<p class="detailproduct-right__form-size-wrap">
							kích thước: <span class="detailproduct-right__form-size">S</span>
						</p>
						<div class="detailproduct-right__size-wrap">
							<input checked class='input-size' id="S" hidden type="radio" value='S' name='size${product.id}'>
							<label for="S" class="detailproduct-right__size-label">S</label>
							<input class='input-size' id="M" hidden type="radio" value='M' name='size${product.id}'>
							<label for="M" class="detailproduct-right__size-label">M</label>
							<input class='input-size' id="L" hidden type="radio" value='L' name='size${product.id}'>
							<label for="L" class="detailproduct-right__size-label">L</label>
						</div>
						<div class="detailproduct-right__number-wrap">
							<button type="button" class="btn-number">
								<i class="fas fa-minus"></i>
							</button>
							<input value="1" name='number' id="input-number" type="text" hidden>
							<p class="input-number">1</p>
							<button type="button" class="btn-number">
								<i class="fas fa-plus"></i>
							</button>
						</div>
						<div class="detailproduct-right__btn-action-wrap">
							<button data-id='${product.id}' type="button" class="btn btn-cart">THÊM VÀO GIỎ</button>
							<button type="submit" class="btn btn-buy">MUA NGAY</button>
							<input type='text' name='id' hidden value='${product.id}' />
						</div>
					</form>
					<p class="detailproduct-right__hint-size">
						<i class="far fa-question-circle"></i> Gợi ý tìm size theo ngoại
						hình
					</p>
					<div class="detailproduct-right__voucher">
						<span class="detailproduct-right__voucher-gift"> ƯU ĐÃI -
							GIẢM GIÁ </span>
						<div class="detailproduct-right__voucher-item">
							<div class="detailproduct-right__voucher-item__icon-wrap">
								<i class="fas fa-money-bill"></i>
							</div>
							<p class="detailproduct-right__voucher-item__content">
								Nhập mã <span>EG20K</span> để được giảm 20k cho đơn từ 200k
							</p>
							<div class="detailproduct-right__voucher-item__btn-wrap">
								<button class="btn-savecode">Lưu mã</button>
							</div>
						</div>
						<div class="detailproduct-right__voucher-item">
							<div class="detailproduct-right__voucher-item__icon-wrap">
								<i class="fas fa-shipping-fast"></i>
							</div>
							<p class="detailproduct-right__voucher-item__content">
								Nhập mã <span>EG15</span> để được miễn phí ship
							</p>
							<div class="detailproduct-right__voucher-item__btn-wrap">
								<button class="btn-savecode">Lưu mã</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="detailproduct-viewed">
		<h3 class="detailproduct-viewed__title">ĐÃ XEM GẦN ĐÂY</h3>
		<div class="detailproduct-viewed__list">
			<div class="row">
				<div class="col l-3 m-4 c-4 min-6">
					<div class="product product--sale">
						<div class="product-sale">
							<div style='--rotate: 2' class="product-sale__item"></div>
							<div style='--rotate: 1' class="product-sale__item"></div>
							<div style='--rotate: 0' class="product-sale__item">
								<span>Giảm</span> <span>10%</span>
							</div>
						</div>
						<div class="view-more">
							<a href="./newproduct.html" class="view-more__link">Xem thêm
								<i class="fas fa-arrow-right"></i>
							</a>
						</div>
						<a href="" class="product__img"
							style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/polo-cam-2.jpg?v=1628955290000)'>
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
							<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

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
				<div class="col l-3 m-4 c-4 min-6">
					<div class="product product--sale">
						<div class="product-sale">
							<div style='-rotate: 2' class="product-sale__item"></div>
							<div style='-rotate: 1' class="product-sale__item"></div>
							<div style='-rotate: 0' class="product-sale__item">
								<span>Giảm</span> <span>10%</span>
							</div>
						</div>
						<div class="view-more">
							<a href="./newproduct.html" class="view-more__link">Xem thêm
								<i class="fas fa-arrow-right"></i>
							</a>
						</div>
						<a href="" class="product__img"
							style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/polo-cam-2.jpg?v=1628955290000)'>
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
							<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

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
				<div class="col l-3 m-4 c-4 min-6">
					<div class="product product--sale">
						<div class="product-sale">
							<div style='-rotate: 2' class="product-sale__item"></div>
							<div style='-rotate: 1' class="product-sale__item"></div>
							<div style='-rotate: 0' class="product-sale__item">
								<span>Giảm</span> <span>10%</span>
							</div>
						</div>
						<div class="view-more">
							<a href="./newproduct.html" class="view-more__link">Xem thêm
								<i class="fas fa-arrow-right"></i>
							</a>
						</div>
						<a href="" class="product__img"
							style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/polo-cam-2.jpg?v=1628955290000)'>
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
							<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

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
				<div class="col l-3 m-4 c-4 min-6">
					<div class="product product--sale">
						<div class="product-sale">
							<div style='--rotate: 2' class="product-sale__item"></div>
							<div style='--rotate: 1' class="product-sale__item"></div>
							<div style='--rotate: 0' class="product-sale__item">
								<span>Giảm</span> <span>10%</span>
							</div>
						</div>
						<div class="view-more">
							<a href="./newproduct.html" class="view-more__link">Xem thêm
								<i class="fas fa-arrow-right"></i>
							</a>
						</div>
						<a href="" class="product__img"
							style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/polo-cam-2.jpg?v=1628955290000)'>
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
							<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

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
	<div class="detailproduct-same">
		<h3 class="detailproduct-same__title">SẢN PHẨM TƯƠNG TỰ</h3>
		<div class="row">
			<div class="col l-3 m-4 c-4 min-6">
				<div class="product product--sale">
					<div class="product-sale">
						<div style='-rotate: 2' class="product-sale__item"></div>
						<div style='-rotate: 1' class="product-sale__item"></div>
						<div style='-rotate: 0' class="product-sale__item">
							<span>Giảm</span> <span>10%</span>
						</div>
					</div>
					<div class="view-more">
						<a href="./newproduct.html" class="view-more__link">Xem thêm <i
							class="fas fa-arrow-right"></i></a>
					</div>
					<a href="" class="product__img"
						style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/polo-cam-2.jpg?v=1628955290000)'>
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
						<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

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
			<div class="col l-3 m-4 c-4 min-6">
				<div class="product product--sale">
					<div class="product-sale">
						<div style='-rotate: 2' class="product-sale__item"></div>
						<div style='-rotate: 1' class="product-sale__item"></div>
						<div style='-rotate: 0' class="product-sale__item">
							<span>Giảm</span> <span>10%</span>
						</div>
					</div>
					<div class="view-more">
						<a href="./newproduct.html" class="view-more__link">Xem thêm <i
							class="fas fa-arrow-right"></i></a>
					</div>
					<a href="" class="product__img"
						style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/polo-cam-2.jpg?v=1628955290000)'>
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
						<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

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
			<div class="col l-3 m-4 c-4 min-6">
				<div class="product product--sale">
					<div class="product-sale">
						<div style='-rotate: 2' class="product-sale__item"></div>
						<div style='-rotate: 1' class="product-sale__item"></div>
						<div style='-rotate: 0' class="product-sale__item">
							<span>Giảm</span> <span>10%</span>
						</div>
					</div>
					<div class="view-more">
						<a href="./newproduct.html" class="view-more__link">Xem thêm <i
							class="fas fa-arrow-right"></i></a>
					</div>
					<a href="" class="product__img"
						style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/polo-cam-2.jpg?v=1628955290000)'>
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
						<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

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
			<div class="col l-3 m-4 c-4 min-6">
				<div class="product product--sale">
					<div class="product-sale">
						<div style='-rotate: 2' class="product-sale__item"></div>
						<div style='-rotate: 1' class="product-sale__item"></div>
						<div style='-rotate: 0' class="product-sale__item">
							<span>Giảm</span> <span>10%</span>
						</div>
					</div>
					<div class="view-more">
						<a href="./newproduct.html" class="view-more__link">Xem thêm <i
							class="fas fa-arrow-right"></i></a>
					</div>
					<a href="" class="product__img"
						style='background-image: url(https://bizweb.dktcdn.net/thumb/large/100/434/926/products/polo-cam-2.jpg?v=1628955290000)'>
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
						<p data-id='sp' class="product__name">Áo polo phối khóa cổ</p>

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

<script src="<c:url value='/templates/web/js/productdetail.js' />"></script>
<script src="<c:url value='/templates/web/js/addtocart.js' />"></script>
<script src="<c:url value='/templates/web/js/buy.js' />"></script>
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