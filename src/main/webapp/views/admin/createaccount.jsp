<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/templates/admin/css/createaccount.css' />">

<div class="direct">
	<span><i class="direct-icon fas fa-home"></i>Trang chủ</span> &#160;
	&#62; &#160; Tạo tài khoản
</div>
<div class="createaccount__board">
	<h1 class="createaccount__board-title">TẠO TÀI KHOẢN</h1>
	<form action="" class="createaccount__board-form">
		<div class="form-group">
			<label class="createaccount__board-form__label">Tên đăng nhập</label>
			<input type="text" class="createaccount__board-form__input"
				placeholder="Tên đăng nhập">
		</div>
		<div class="form-group">
			<label class="createaccount__board-form__label">Email</label> <input
				type="email" class="createaccount__board-form__input"
				placeholder="Email">
		</div>
		<div class="form-group">
			<label class="createaccount__board-form__label">Số điện thoại</label>
			<input type="email" class="createaccount__board-form__input"
				placeholder="Số điện thoại">
		</div>
		<div class="form-group">
			<label class="createaccount__board-form__label">Mật khẩu</label> <input
				type="email" class="createaccount__board-form__input"
				placeholder="Mật khẩu">
		</div>
		<div class="createaccount__btn-wrap">
			<button class="createaccount__btn">Tạo</button>
		</div>
	</form>
</div>


