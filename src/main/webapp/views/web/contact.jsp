<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/templates/web/css/contact.css' />">

<div class="grid wide">
	<div class="direct">
		<span>Trang chủ</span>/<span>Liên hệ</span>
	</div>
	<h2 class="content-contact__title">LIÊN HỆ</h2>
	<div class="content-contact__main">
		<div class="content-contact__main-info">
			<div class="row">
				<div class="col l-4 m-12 c-12 min-12">
					<div class="address">
						<div class="left">
							<i class="fas fa-map-marker-alt"></i>
						</div>
						<div class="right">
							<span>Địa chỉ:</span>
							<p>221, Chùa Bốc, Đống Đa, Hà Nội</p>
						</div>
					</div>
				</div>
				<div class="col l-4 m-12 c-12 min-12">
					<div class="email">
						<div class="left">
							<i class="fas fa-question-circle"></i>
						</div>
						<div class="right">
							<span>Gửi thắc mắc:</span>
							<p>support@sapo.vn</p>
						</div>
					</div>
				</div>
				<div class="col l-4 m-12 c-12 min-12">
					<div class="phone">
						<div class="left">
							<i class="fas fa-phone-square-alt"></i>
						</div>
						<div class="right">
							<span>Điện thoại:</span>
							<p>1900 6750</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="content-contact__main-action">
			<div class="row">
				<div class="col l-4 m-12 c-12 min-12 wrap-map">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.214309261552!2d106.79154049128651!3d10.87129812332021!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1634340438266!5m2!1svi!2s"
						width="100%" height="450px" style="border: 0;" allowfullscreen=""
						loading="lazy"></iframe>
				</div>
				<div class="col l-8 m-12 c-12 min-12">
					<form action="" method="post" class="content-contact__form">
						<div class="row">
							<div class="col l-6 m-12 c-12 min-12">
								<div class="form-group">
									<label for="">Họ và tên</label> <input type="text">
								</div>
							</div>
							<div class="col l-6 m-12 c-12 min-12">
								<div class="form-group">
									<label for="Email">Email</label> <input type="text">
								</div>
							</div>
							<div class="col l-12 m-12 c-12 min-12">
								<div class="form-group">
									<label for="Nội dung">Nội dung</label>
									<textarea name="" id="" rows="16"></textarea>
								</div>
							</div>
						</div>
						<div class="wrap-btn-contact">
							<input class="btn-contact" type="submit" value="Gửi liên hệ">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>