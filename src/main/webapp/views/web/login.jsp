<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/templates/web/css/login.css' />">

<div class="grid wide">
	<div class="login__direct">
		<span>Trang chủ</span> / <span>Đăng nhập tài khoản</span>
	</div>
	<div class="login__content">
		<div class="login-board">
			<div class="row">
				<div class="col l-8 m-12 c-12 min-12">
					<form action="${pageContext.request.contextPath}/login" class="login-board__form" method="post">
						<c:if test="${message ne null }">
						<p class='message-error'>${message}</p>
						</c:if>
						<h2 class="login-board__form-title">Đăng nhập tài khoản</h2>
						<div class="form-group">
							<input autocomplete="off" name='username' placeholder=" " id="username" type="text" class="login-board__form-input">
							<span class="login-board__form-input__placeholder">Tên đăng nhập</span>
							<i class="form-message"></i>
						</div>
						<div class="form-group">
							<input name='password' placeholder=" " id="password" type="password" class="login-board__form-input">
							<i class="login-board__icon-view far fa-eye-slash"></i>
							<span class="login-board__form-input__placeholder">Mật khẩu</span>
							<i class="form-message"></i>
						</div>
						<input type="submit" class="login-board__form-btn"
							value="ĐĂNG NHẬP">
					</form>
					<div class="login-board__socials">
						<div class="login-board__socials-wrap">
							<span class="login-board__socials-title">Hoặc đăng nhập
								bằng</span>
							<div class="login-board__socials-item">
								<a href="#" class="login-board__socials-option"> <i
									class="login-board__social-icon fab fa-facebook-f"></i> <span
									class="login-board__socials-text">Facebook</span>
								</a> <a href="#" class="login-board__socials-option"> <i
									class="login-board__social-icon fab fa-google-plus-g"></i> <span
									class="login-board__socials-text">Google</span>
								</a>
							</div>
							<p class="login-board__forget">
								Quên mật khẩu bấm <a href="controlerForget">vào đây</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col l-4 m-12 c-12 min-12">
					<div class="login-board__desc">
						<h2 class="login-board__desc-title">Quyền lợi với thành viên</h2>
						<span>Vận chuyển siêu tốc</span> <span>Sản phẩm đa dạng</span> <span>Đổi
							trả dễ dàng</span> <span>Tích điểm đổi quà</span> <span>Được giảm
							giá cho lần mua tiếp theo lên đến 10%</span> 
							<a href="${pageContext.request.contextPath}/signup" class="login-board__desc-btn">Đăng ký</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="<c:url value='/templates/web/js/login.js' />"></script>
<script src="<c:url value='/templates/web/js/validator.js' />"></script>
<script>
	Validator({
		form : '.login-board__form',
		formGroupSelector : '.form-group',
		errorSelector : '.form-message',
		rules : [ Validator.isRequired('#username', 'Vui lòng nhập trường này'),
				Validator.isRequired('#password', 'Vui lòng nhập trường này'),
				Validator.minlength('#password', 6) ]
	})
</script>