<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/templates/admin/css/orderdetail.css' /> ">
<title>Chi tiết đơn hàng</title>

<div class="direct">
	<span><i class="direct-icon fas fa-home"></i>Trang chủ</span> &#160;
	&#62; &#160;Chi tiết đơn hàng
</div>
<div class="orderdetail">
	<h1 class="orderdetail__title">Chi Tiết Đơn Hàng</h1>
	<div class="orderdetail__board">
		<p class="orderdetail__board-id">
			Mã đơn hàng: <span>34</span>
		</p>
		<p class="orderdetail__board-user">
			Khách hàng: <span>ThuyNguyen (Mã khách hàng: 98)</span>
		</p>
		<div class="orderdetail__board-products">
			<span class="orderdetail__board-products-title">Sản phẩm:</span>
			<div class="porderdetail__board-products-list">
				<div class="porderdetail__board-product">
					<span class="porderdetail__board-product-name">Áo polo phối
						khóa cổ</span> <span class="porderdetail__board-product-quantity">(x2)</span>
					<span class="porderdetail__board-product-price">730.000đ</span>
				</div>
				<div class="porderdetail__board-product">
					<span class="porderdetail__board-product-name">Áo thun nam
						cổ tròn</span> <span class="porderdetail__board-product-quantity">(x1)</span>
					<span class="porderdetail__board-product-price">100.000đ</span>
				</div>
			</div>
		</div>
		<div class="orderdetail__board-status">
			Trạng thái: <span>pending</span>
		</div>
		<div class="orderdetail__board-total">
			Tổng tiền: <span>1.560.000đ</span>
		</div>
	</div>
</div>