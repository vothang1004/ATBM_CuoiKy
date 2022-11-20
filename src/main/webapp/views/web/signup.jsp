<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/templates/web/css/signup.css' />">


<div class="grid wide">
	<div class="signup__direct">
		<span>Trang chủ</span> / <span>Đăng ký tài khoản</span>
	</div>
	<div class="signup__content">
		<div class="signup-board">
			<div class="row">
				<div class="col l-8 m-12 c-12 min-12">
					<form action="${pageContext.request.contextPath}/signup" method="post" class="signup-board__form">
						<c:if test="${message ne null}">
						<p class="message-error">${message}</p>
						</c:if>					
						<h2 class="signup-board__form-title">Đăng ký tài khoản</h2>
						<div class="form-group">
							<input autocomplete="off" placeholder=" " id="fullname" type="text" name='username'
								class="signup-board__form-input"> <span
								class="signup-board__form-input__placeholder">Tên đăng nhập</span> <i
								class="form-message"></i>
						</div>
						<div class="form-group">							
							<input														
							autocomplete="off" placeholder=" " id="email" type="email" name='email' class="signup-board__form-input">
								<span class="signup-board__form-input__placeholder">Email</span>
								<i class="form-message"></i>
						</div>
						<div class="form-group">
							<input						
							autocomplete="off" name='phonenumber' placeholder=" " id="phone_number" type="phone" class="signup-board__form-input">
							<span
								class="signup-board__form-input__placeholder">Số điện thoại</span>
								<i class="form-message"></i>
						</div>
						<div class="form-group">
							<input						
							autocomplete="off" name='password' placeholder=" " id="password" type="password" class="signup-board__form-input">
								<i class="signup-board__icon-view far fa-eye-slash"></i> <span
								class="signup-board__form-input__placeholder">Mật khẩu</span> <i
								class="form-message"></i>
						</div>
						<div class="form-group">
							<input					
							placeholder=" " id="password_confirm" type="password"
								class="signup-board__form-input">
								<i class="signup-board__icon-view far fa-eye-slash"></i>
								<span class="signup-board__form-input__placeholder">Nhập lại mật khẩu</span>
								<i class="form-message"></i>
						</div>
						<input hidden name='role' value='2' type='text' />
						<input type="submit" class="signup-board__form-btn" value="Đăng ký">
					</form>
					<div class="signup-board__socials">
						<div class="signup-board__socials-wrap">
							<span class="signup-board__socials-title">Hoặc đăng nhập
								bằng</span>
							<div class="signup-board__socials-item">
								<a href="#" class="signup-board__socials-option"> <i
									class="signup-board__social-icon fab fa-facebook-f"></i> <span
									class="signup-board__socials-text">Facebook</span>
								</a> <a href="#" class="signup-board__socials-option"> <i
									class="signup-board__social-icon fab fa-google-plus-g"></i> <span
									class="signup-board__socials-text">Google</span>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col l-4 m-12 c-12 min-12">
					<div class="signup-board__desc">
						<h2 class="signup-board__desc-title">Quyền lợi với thành viên</h2>
						<span>Vận chuyển siêu tốc</span> <span>sản phẩm đa dạng</span> <span>Đổi
							trả dễ dàng</span> <span>Tích điểm đổi quà</span> <span>Được giảm
							giá cho lần mua tiếp theo lên đến 10%</span>
							<a href="<c:url value='/views/web/login.jsp' />" class="signup-board__desc-btn">Đăng nhập</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="<c:url value='/templates/web/js/signup.js' />"></script>
<script src="<c:url value='/templates/web/js/validator.js' />"></script>
<script>
	Validator({
		form : '.signup-board__form',
		formGroupSelector : '.form-group',
		errorSelector : '.form-message',
		rules : [
				Validator.isRequired('#fullname', 'Vui lòng nhập trường này'),
				Validator.isRequired('#email', 'Vui lòng nhập trường này'),
				Validator.isEmail('#email', 'Email không hợp lệ'),
				Validator.isRequired('#phone_number',
						'Vui lòng nhập trường này'),
				Validator.isPhoneNumber('#phone_number',
						'Số điện thoại không hợp lệ'),
				Validator.isRequired('#password', 'Vui lòng nhập trường này'),
				Validator.minlength('#password', 6),
				Validator.isRequired('#password_confirm',
						'Vui lòng nhập trường này'),
				Validator.isConfirmed('#password_confirm', function() {
					return document.querySelector('#password').value;
				}) ]
	})
</script>