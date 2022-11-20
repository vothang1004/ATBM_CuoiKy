<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/templates/admin/css/manageorder.css' />">
<link rel="stylesheet"
	href="<c:url value='/templates/admin/css/pagination.css' />">

<div class="direct">
	<span><i class="direct-icon fas fa-home"></i>Trang chủ</span> &#160;
	&#62; &#160; Quản lý đơn hàng
</div>
<div class="order">
	<h1 class="order__title">Quản Lý Đơn Hàng</h1>
	<div class="order__table">
		<div class="order__table-head">
			<div class="order__table-row">
				<div class="order__table-column column-id">Mã đơn hàng</div>
				<div class="order__table-column column-date">Ngày giao hàng</div>
				<div class="order__table-column column-total">Tổng tiền</div>
				<div class="order__table-column column-status">Trạng thái</div>
			</div>
		</div>
		<div class="order__table-body">
			<div class="order__table-row">
				<div class="order__table-column column-id">
					<a title='Chi tiết đơn hàng' href="./orderdetail.html"
						class="column-id__link">1</a>
				</div>
				<div class="order__table-column column-date">23-12-2021</div>
				<div class="order__table-column column-total">389.000đ</div>
				<div class="order__table-column column-status">shipping</div>
			</div>
			<div class="order__table-row">
				<div class="order__table-column column-id">
					<a title='Chi tiết đơn hàng' href="./orderdetail.html"
						class="column-id__link">2</a>
				</div>
				<div class="order__table-column column-date">23-12-2021</div>
				<div class="order__table-column column-total">389.000đ</div>
				<div class="order__table-column column-status">comfirmed</div>
			</div>
			<div class="order__table-row">
				<div class="order__table-column column-id">
					<a title='Chi tiết đơn hàng' href="./orderdetail.html"
						class="column-id__link">3</a>
				</div>
				<div class="order__table-column column-date">23-12-2021</div>
				<div class="order__table-column column-total">389.000đ</div>
				<div class="order__table-column column-status">pending</div>
			</div>
			<div class="order__table-row">
				<div class="order__table-column column-id">
					<a title='Chi tiết đơn hàng' href="./orderdetail.html"
						class="column-id__link">4</a>
				</div>
				<div class="order__table-column column-date">23-12-2021</div>
				<div class="order__table-column column-total">389.000đ</div>
				<div class="order__table-column column-status">shipped</div>
			</div>
		</div>
	</div>
</div>
<div class="pagination">
	<ul class="pagination__list">
		<li class="pagination__list-item"><a href=""
			class="pagination__list-item__link active">1</a></li>
		<li class="pagination__list-item"><a href=""
			class="pagination__list-item__link">2</a></li>
		<li class="pagination__list-item"><a href=""
			class="pagination__list-item__link"><i
				class="fas fa-chevron-right"></i></a></li>
	</ul>
</div>