<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/common/taglibs.jsp" %>


		<div class="row">
			<div class="col-6">
				<iframe style="width: 100%; height: 400px;" src="${pageContext.request.contextPath}/upload/${fileName}"
					frameborder="0"></iframe>
			</div>
			<div class="col-6">
				<form action="${pageContext.request.contextPath}/order" method="post">
					<div class="mb-3">
						<label for="signature" class="form-label fs-3">Chữ ký</label>
						<textarea name="signature" class="form-control" id="signature" rows="3"></textarea>
					</div>
					<input hidden type="text" name=invoiceName value="${fileName}">
					<div class="mb-3">
						<button class="btn btn-primary" type="submit">Xác thực</button>
					</div>
				</form>
				<div class="mb-3">
					<b class="fs-2">Hướng dẫn</b>
					<p class="fs-3">Quý khách vui lòng tải hóa đơn (bên trái) về và sử dụng tool chúng tôi đã cung cấp
						để tạo chữ ký
					</p>
					<p class="fs-3">Sau khi đã có chữ ký: quý khách hãy điền chữ ký vào ô 'Chữ ký' phía trên, sau đó ấn
						nút xác thực
					</p>
				</div>
			</div>
		</div>