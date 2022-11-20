<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/common/taglibs.jsp" %>

		<link rel="stylesheet" href="<c:url value='/templates/web/css/main.css' /> ">
		<link rel="stylesheet" href="<c:url value='/templates/web/css/product.css' /> ">
		<link rel="stylesheet" href="<c:url value='/templates/web/css/mainproduct.css' /> ">
		<link rel="stylesheet" href="<c:url value='/templates/web/css/pay.css' /> ">

		<div class="grid wide">
			<div class="row">
				<div class="col l-8 m-12 c-12">
					<div class="shop-name">
						<a href="index.html" class="shop-name--link link">Ego Wear</a>
					</div>
					<div class="row">
						<div class="col l-6 m-12 c-12">
							<div class="pay-infor__title">
								<h1 class="pay-infor__title--title">Thông tin nhận hàng</h1>
								<div class="pay-infor__title--login">
									<a class="link link-login" href="#">
									</a>
								</div>
							</div>
							<form id="info-form" method="post" action="${pageContext.request.contextPath}/order"
								class="pay-details">
								<div class="box-details">
									<input readonly value="${user.email}" type="text" placeholder="Email">
								</div>
								<div class="box-details">
									<input readonly type="text" value="${user.username}" placeholder="Họ và tên">
								</div>
								<div class="box-details">
									<input readonly type="text" value="${user.phoneNumber}" placeholder="Số điện thoại">
								</div>
								<div class="box-details">
									<input name="detail" type="text" placeholder="Địa chỉ cụ thể">
								</div>
								<div class="box-details">
									<select name="province" id="province">
										<option class="province-option" value="">Tỉnh thành</option>
									</select>
								</div>
								<div class="box-details">
									<select name="district" id="district">
										<option class='district-option' value="">Quận, huyện</option>
									</select>
								</div>
								<div class="box-details">
									<select name="village" id="ward">
										<option class='ward-option' value="">Xã, phường</option>
									</select>
								</div>
								<div class="box-details">
									<textarea name="note" id="" cols="30" rows="5" placeholder="Ghi chú"></textarea>
								</div>
							</form>
						</div>
						<div class="col l-6 m-12 c-12">
							<div class="pay-transport__title">
								<h1 class="pay-infor__title--title">Địa chỉ nhận hàng</h1>
							</div>
							<c:forEach items="${addresses}" var="address">
								<div class="pay-transport__infor">${address.province}, ${address.district},
									${address.village}, ${address.detail}</div>
							</c:forEach>
							<div class="pay-transport__title">
								<h1 class="pay-infor__title--title">Thanh toán</h1>
							</div>
							<div class="pay-transport__pay">
								<div class="agree-pay">
									<input checked type="radio"> <label>Thanh toán khi giao
										hàng (COD)</label>
								</div>
								<div class="icon-pay">
									<i class="far fa-money-bill-alt"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col l-4 m-12 c-12 product-pay">
					<div class="product-pay__title">
						<h1 class="product-pay__title--title">Đơn hàng (${cart.size()})</h1>
					</div>
					<div class="product-pay__title--product">
						<c:forEach items="${cart}" var="item">
							<div class="row order-product">
								<div class="col l-9 order-product-product">
									<c:forEach items="${listImage}" var="iamge">
										<c:if test="${image.productId eq item.value.id}">
											<c:choose>
												<c:when test="${image.isLinkOnline eq true}">
													<div class="order-product__image">
														<img src="${image.link}" alt="">
													</div>
												</c:when>
												<c:otherwise>
													<div class="order-product__image">
														<img src="upload/${image.link}" alt="">
													</div>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
									<div class="order-product__infor">
										<div class="order-product__infor--name">${item.value.name}</div>
										<div class="order-product__infor--size-color">
											<span>Kích thước:${item.value.size}(x${item.value.quantity})</span>
										</div>
									</div>
								</div>
								<div class="col l-3 order-product__price">
									${item.value.totalPriceFormat}<sup><del>đ</del></sup>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="product-pay__title--discount-code">
						<input type="text" placeholder="Nhập mã giảm giá">
						<button class="button">Áp dụng</button>
					</div>
					<div class="product-pay__title--pay">
						<div class="row-flex">
							<div class="order-product__infor--name">Tạm tính</div>
							<div class="order-product__price">
								${total}<sup><del>đ</del></sup>
							</div>
						</div>
						<div class="row-flex">
							<div class="order-product__infor--name">Phí vận chuyển</div>
							<div class="order-product__price"></div>
						</div>
					</div>
					<div class="product-pay__title--order">
						<div class="row-flex">
							<div class="order-product__infor--name total-text">Tổng tiền</div>
							<div class="order-product__price total-price">
								${total}<sup><del>đ</del></sup>
							</div>
						</div>
						<div class="row-flex row-end">
							<button style="opacity: 0.6; pointer-events: none" id="btn-order"
								class="button button-end">Đặt hàng</button>
							<!-- <a href='${pageContext.request.contextPath}/order' class="button button-end">Đặt hàng</a> -->
							<div class="link-comeback">
								<a class="link-login" href="#"> <span> <i class="fas fa-angle-left"></i>
									</span> <a class="link-cart" href="${pageContext.request.contextPath}/cart">Quay về
										giỏ hàng</a>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="<c:url value='/templates/web/js/pay.js' />"></script>