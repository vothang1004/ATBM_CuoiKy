<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet" href="<c:url value='/templates/web/css/cart.css' />">

<div class="grid wide">
	<div class="cart-direct">
		<span>Trang chủ</span> / <span>Giỏ hàng</span>
	</div>
	<h2 class="cart-title">GIỎ HÀNG CỦA BẠN</h2>
	<div class="cart-product">
	<c:choose>
	<c:when test="${sessionScope.cart ne null}">
	<div class="cart-product__has">
			<div class="cart-product__table-head">
				<div class="cart-product__table-head__info">Thông tin sản phẩm</div>
				<div class="cart-product__table-head__details">
					<span>Đơn giá</span> <span>Số lượng</span> <span>Thành tiền</span>
				</div>
			</div>
			<c:forEach items="${sessionScope.cart}" var="item">		
			<div data-id="${item.value.id}" class="cart-product__table-body">
				<div class="cart-product__table-info-product">
					<c:forEach items="${listImage}" var="image">
					<c:if test="${image.productId eq item.value.id}">
					<div class="cart-product__table-info-product__img">
					<c:choose>
					<c:when test="${image.isLinkOnline eq true}">
					<img src="${image.link}" alt="image product">	
					</c:when>
					<c:otherwise>
					<img src="upload/${image.link}" alt="image product">	
					</c:otherwise>
					</c:choose>				
					</div>
					</c:if>
					</c:forEach>
					<div class="cart-product__table-info-product__info">
						<span>${item.value.name}</span> <span>kích thước:${item.value.size}</span>
						<span onclick="handleDelete.bind(this)()" class="btn-remove-enjoyproduct" data-id="${item.value.id}">xóa</span>
					</div>
				</div>
				<div class="cart-product__table-details-product">
					<span data-id="${item.value.id}" class="cart-product__table-details-product__price">${item.value.priceFormat}đ</span>
					<div class="cart-product__table-details-product__quantity">
						<span onclick="handleMinus.bind(this)()" data-id="${item.value.id}" class="minus">-</span>
						<span data-id="${item.value.id}" class="number">${item.value.quantity}</span>
						<span onclick="handlePlus.bind(this)()" data-id="${item.value.id}" class="plus">+</span>
					</div>
					<span data-id="${item.value.id}" class="cart-product__table-details-product__total">${item.value.totalPriceFormat}đ</span>
				</div>
			</div>
			</c:forEach>
		</div>
	</c:when>
	<c:otherwise>
	<div class="cart-product__none">
			<i class="cart-product__none-icon fas fa-shopping-bag"></i>
			<p class="cart-product__none-text">Không có sản phẩm nào trong
				giỏ hàng của bạn</p>
	</div>
	</c:otherwise>
	</c:choose>
	<c:if test="${sessionScope.cart ne null}">
	<div class="cart-product__pay">
		<span class="cart-product__pay-total">Tổng tiền:
		<span class="js-total-pay">${total}</span>đ
		</span>
		<a href="${pageContext.request.contextPath}/pay" class="cart-product__pay-btn-pay">Thanh toán</a>
		</div>
	</c:if>
	</div>
</div>
<script src="${pageContext.request.contextPath}/templates/web/js/addtocart.js"></script>