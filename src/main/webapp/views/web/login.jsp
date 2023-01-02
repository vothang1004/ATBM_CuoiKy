<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/common/taglibs.jsp" %>

		<link rel="stylesheet" href="<c:url value='/templates/web/css/login.css' />">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.0/FileSaver.min.js"
			integrity="sha512-csNcFYJniKjJxRWRV1R7fvnXrycHP6qDR21mgz1ZP55xY5d+aHLfo9/FcGDQLfn2IfngbAHd8LdfsagcCqgTcQ=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"
			integrity="sha512-E8QSvWZ0eCLGk4km3hxSsNmGWbLtSCSUcewDQPQWZF6pEU8GlT8a5fF32wOl1i8ftdMhssTrF/OhyGWwonTcXA=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.tutorialjinni.com/big-integer/1.6.50/BigInteger.min.js"></script>


		<div class="grid wide">
			<div class="login__direct">
				<span>Trang chủ</span> / <span>Đăng nhập tài khoản</span>
			</div>
			<div class="login__content">
				<div class="login-board">
					<div class="row">
						<div class="col l-8 m-12 c-12 min-12">
							<form action="${pageContext.request.contextPath}/login" class="login-board__form"
								method="post">
								<c:if test="${message ne null }">
									<p class='message-error'>${message}</p>
								</c:if>
								<c:if test="${private_key ne null }">
									<!-- Button trigger modal -->
									<button hidden id="btn-show-modal-private-key" type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#modal-privatekey">Launch static
										backdrop modal</button>
									<!-- Modal -->
									<div class="modal fade" id="modal-privatekey" data-bs-backdrop="static"
										data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title fs-1" id="staticBackdropLabel">Tạo cặp khóa
														thành công</h1>
												</div>
												<div class="modal-body">
													<p style="font-size: 14px;">Đây là khóa công khai và khóa bí mật của
														bạn
														dùng trong các giao dịch như: đăng nhập, đặt hàng, thanh
														toán</p>
													<p style="font-size: 14px;">
														<b>Lưu ý: </b><i>Chúng tôi sẽ không lưu lại khóa bí mật của
															bạn, bạn hãy tải khóa bí mật của mình và giữ nó cho riêng
															mình.</i>
													</p>
													<p
														style="font-size: 14px; line-break: anywhere; user-select: none;">
														<b>Khóa công khai:</b>
														<span id="public-key-text">${public_key}</span>
													</p>
													<p
														style="font-size: 14px; line-break: anywhere; user-select: none;">
														<b>Khóa bí mật</b>
														<span id="private-key-text">${private_key}</span>
													</p>
												</div>
												<div class="modal-footer">
													<button id="btn-close-modal-private-key" hidden type="button"
														class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
													<button id="btn-save-private-key" type="button"
														class="btn btn-primary">Tải về</button>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<h2 class="login-board__form-title">Đăng nhập tài khoản</h2>
								<div class="form-group">
									<input autocomplete="off" name='username' placeholder=" " id="username" type="text"
										class="login-board__form-input">
									<span class="login-board__form-input__placeholder">Tên
										đăng nhập</span> <i class="form-message"></i>
								</div>
								<div class="form-group">
									<input name='password' placeholder=" " id="password" type="password"
										class="login-board__form-input"> <i
										class="login-board__icon-view far fa-eye-slash"></i> <span
										class="login-board__form-input__placeholder">Mật khẩu</span> <i
										class="form-message"></i>
								</div>
								<div class="form-group">
									<input name="password-encrypt" class="login-board__form-input" placeholder=" "
										id="password-encrypt" type="text" value="">
									<span class="login-board__form-input__placeholder">Mật khẩu đã mã hóa</span>
									<i class="form-message"></i>
								</div>

								<input type="submit" class="login-board__form-btn" value="ĐĂNG NHẬP">
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
									giá cho lần mua tiếp theo lên đến 10%</span> <a
									href="${pageContext.request.contextPath}/signup" class="login-board__desc-btn">Đăng
									ký</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script src="<c:url value='/templates/web/js/login.js' />"></script>
		<script src="<c:url value='/templates/web/js/validator.js' />"></script>
		<script>
			const btnShowModalPrivateKey = document.getElementById('btn-show-modal-private-key');
			setTimeout(() => {
				if (btnShowModalPrivateKey) {
					btnShowModalPrivateKey.click();
				}
			}, 1000);
			const btnCloseModalPrivateKey = document.getElementById('btn-close-modal-private-key')

			// save private key
			const btnSavePrivateKey = document.getElementById('btn-save-private-key');
			if (btnSavePrivateKey) {
				btnSavePrivateKey.onclick = async (e) => {
					const now = await Date.now();
					const date = await new Date(now)
					const day = await date.getDate();
					const month = await date.getMonth() + 1;
					const year = await date.getFullYear();
					const privateKeyText = document.getElementById('private-key-text')?.innerText;
					const publicKeyText = document.getElementById('public-key-text')?.innerText;

					const privateKeyFileName = day + '-' + month + '-' + year + '_private-key.txt';
					const publicKeyFileName = day + '-' + month + '-' + year + '_public-key.txt';
					var blob = new Blob([privateKeyText],
						{ type: "text/plain;charset=utf-8" });
					await saveAs(blob, privateKeyFileName);
					var blob = new Blob([publicKeyText],
						{ type: "text/plain;charset=utf-8" });
					await saveAs(blob, publicKeyFileName);
					btnCloseModalPrivateKey?.click();
				}
			}

		</script>
		<script>
			Validator({
				form: '.login-board__form',
				formGroupSelector: '.form-group',
				errorSelector: '.form-message',
				rules: [
					Validator.isRequired('#username', 'Vui lòng nhập trường này'),
					Validator.isRequired('#password', 'Vui lòng nhập trường này'),
					Validator.minlength('#password', 6),
					Validator.isRequired('#password-encrypt', 'Vui lòng nhập password mã hóa')
				]
			})
		</script>