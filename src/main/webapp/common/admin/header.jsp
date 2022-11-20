<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='/common/taglibs.jsp' %>
<header class="header">
	<div class="grid wide">
		<div class="header-wrap">
			<div class="header__logo">
				<i class="header__logo-icon fas fa-leaf"></i> <span
					class="header__logo-text">Quản trị</span>
			</div>
			<div class="header__welcome">
				<div class="header__welcome-item">
					<i class="header__welcome-icon far fa-list-alt"></i>
				</div>
				<div class="header__welcome-item">
					<i class="header__welcome-icon fas fa-bell"></i>
				</div>
				<div class="header__welcome-item">
					<i class="header__welcome-icon fas fa-envelope"></i>
				</div>
				<div class="header__welcome-item">
					xin chào vothang
					<ul class="header__welcome-item__board">
						<li class="header__welcome-item__board-row"><a
							href="${pageContext.request.contextPath}/views/admin/myaccount.jsp" class="header__welcome-item__board-link">
								<i class="header__welcome-item__board-icon fas fa-users-cog"></i>
								Cài đặt tài khoản
						</a></li>
						<li class="header__welcome-item__board-row"><a
							href="${pageContext.request.contextPath}/views/admin/createaccount.jsp"
							class="header__welcome-item__board-link"> <i
								class="header__welcome-item__board-icon fas fa-user-plus"></i>
								Tạo tài khoản
						</a></li>
						<li class="header__welcome-item__board-row"><a href=""
							class="header__welcome-item__board-link"> <i
								class="header__welcome-item__board-icon fas fa-sign-out-alt"></i>
								Đăng xuất
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>