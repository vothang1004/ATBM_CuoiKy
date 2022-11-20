<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet" href="<c:url value='/templates/admin/css/myaccount.css' />">
<title>Tài khoản của tôi</title>


<div class="direct">
	<span><i class="direct-icon fas fa-home"></i>Trang chủ</span> &#160;
	&#62; &#160; Tài khoản của tôi
</div>
<div class="myaccount__board">
	<div class="myaccount__board-title">
		<h2>Thông Tin Của Tôi</h2>
		<p>Quản lý tài khoản của bạn</p>
		<form action="" class="myaccount__board-form">
			<div class="form-group">
				<lable class="myaccout__form-label">Tên tài khoản</lable>
				<input type="text" class="myaccount__form-input">
			</div>
			<div class="form-group">
				<lable class="myaccout__form-label">Email</lable>
				<input type="email" class="myaccount__form-input">
			</div>
			<div class="form-group">
				<lable class="myaccout__form-label">Số điện thoại</lable>
				<input type="text" class="myaccount__form-input">
			</div>
			<span class="myaccount__change-password">Đổi mật khẩu</span>
			<div class="form-group hidden">
				<lable class="myaccout__form-label">Mật khẩu mới</lable>
				<input type="password" class="myaccount__form-input">
			</div>
			<div class="myaccount__form-btn-wrap">
				<button class="myaccount__form-btn">Lưu</button>
			</div>
		</form>
	</div>
</div>

<script>
    const formHidden = document.querySelector('.hidden');
    const btnHidden = document.querySelector('.myaccount__change-password');
    let isOppen = false;
    btnHidden.onclick = e => {
        if(!isOppen) {
            formHidden.style = `display: block`;
            isOppen = !isOppen;
        }else {
            formHidden.style = `display: none`;
            isOppen = !isOppen;
        }
    }
</script>