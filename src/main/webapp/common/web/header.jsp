<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/common/taglibs.jsp" %>
        <header class="header">
            <div class="grid wide">
                <div class="row header-up">
                    <div class="col l-3 m-2 c-0 min-0">
                        <a href="${pageContext.request.contextPath}/home" class="header-up__logo hide-on-mobile">
                        <img src="//bizweb.dktcdn.net/100/434/926/themes/832778/assets/logo.png?1631675028757"
                            alt="logo">
                        </a>
                    </div>
                    <div class="col l-6 m-5 c-8 min-8">
                        <div class="header-up__search">
                            <div class="menu-mobile show-on-mobile">
                                <label for="check-menu"><i class="menu-mobile__icon fas fa-list-ul"></i></label>
                                <input id="check-menu" type="checkbox" hidden>
                                <label for="check-menu" class="menu-mobile__modal"></label>
                                <ul class="menu-mobile__board">
                                    <li class="menu-mobile__item">
                                        <i class="menu-mobile__item-iconuser fas fa-user"></i>
                                        <a href="${pageContext.request.contextPath}/login"
                                            class="menu-mobile__item-nameuser">Đăng nhập</a>
                                        <div class="menu-mobile__item-close">
                                            <label for="check-menu">
                                                <i class="fas fa-times"></i>
                                            </label>
                                        </div>
                                    </li>
                                    <li class="menu-mobile__item">
                                        <i class="fas fa-home"></i>
                                        <a href="./index.html">Trang chủ</a>
                                    </li>
                                    <li class="menu-mobile__item">
                                        <i class="fas fa-tshirt"></i>
                                        <a href="./newproduct.html">Sản phẩm</a>
                                    </li>
                                    <li class="menu-mobile__item">
                                        <i class="fas fa-question-circle"></i>
                                        <a href="./question.html">Câu hỏi</a>
                                    </li>
                                    <li class="menu-mobile__item">
                                        <i class="fas fa-newspaper"></i>
                                        <a href="./news.html">Tin tức</a>
                                    </li>
                                    <li class="menu-mobile__item">
                                        <i class="fas fa-file-signature"></i>
                                        <a href="${pageContext.request.contextPath}/views/web/contact.jsp">Liên hệ</a>
                                    </li>
                                    <!-- <li class="menu-mobile__item">
                                        <i class="fas fa-sign-out-alt"></i>
                                        <a href="#">Đăng xuất</a>
                                    </li> -->
                                </ul>
                            </div>
                            <div class=" header-up__search-input">
                                <form action="${pageContext.request.contextPath}/allproduct" method="get">
                                    <input type="text" name="search" placeholder="Tìm kiếm sản phẩm...">
                                    <input hidden type="text" name="type" value="search">
                                    <button type="submit"><i class="fas fa-search"></i></button>
                                </form>
                            </div>
                            <div class="header-up__search-tuvan hide-on-taplet">
                                <div class="wrap-icon">
                                    <i class="header-up__search-tuvan-icon fas fa-mobile-alt"></i>
                                </div>
                                <div class="header-up__search-tuvan-sdt">
                                    <p>Tư vấn hỗ trợ</p>
                                    <p>1900 6750</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col l-3 m-5 c-4 min-4">
                        <div class="header-up__options">
                            <div class="header-up__options-login hide-on-mobile">
                                <i class="fas fa-user"></i>
                                <c:choose>
                                    <c:when test="${sessionScope.user eq null}">
                                        <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a>${sessionScope.user.username}</a>
                                        <ul class="header-up__options-login__list">
                                            <li class="header-up__options-login__item">
                                                <a class="header-up__options-login__link" href="">Tài khoản của tôi</a>
                                            </li>
                                            <li class="header-up__options-login__item">
                                                <a href='${pageContext.request.contextPath}/home?action=logout'
                                                    class="header-up__options-login__link" href="">Đăng xuất</a>
                                            </li>
                                        </ul>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="header-up__options-enjoy">
                                <i class="fas fa-heart"></i>
                                <a href="${pageContext.request.contextPath}/enjoy">Yêu thích</a>
                                <c:choose>
                                    <c:when test="${sessionScope.enjoy ne null}">
                                        <span class="js-label-enjoy"><b>${sessionScope.enjoy.size()}</b></span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="js-label-enjoy"><b>0</b></span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="header-up__options-cart">
                                <i class="fas fa-shopping-cart"></i>
                                <a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a>
                                <span class="js-label-cart">
                                    <c:choose>
                                        <c:when test="${sessionScope.cart ne null}">
                                            <b>${cart.size()}</b>
                                        </c:when>
                                        <c:otherwise>
                                            <b>0</b>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="hide-on-mobile header-down">
                <div class="grid wide">
                    <div class="row">
                        <div class="col header-down__wrap-link">
                            <a href="<c:url value='/' />" class="header-down__link">Trang chủ</a>
                        </div>
                        <div class="col header-down__wrap-link">
                            <a class="header-down__link">Sản phẩm</a>
                            <i class="header-down__icon fas fa-caret-down"></i>
                            <ul class="header-down__list-product">
                                <c:forEach items="${listCategory}" var="cate">
                                    <li class="header-down__product">
                                        ${cate.name } <i class="header-down__product-icon fas fa-caret-right"></i>
                                        <ul class="header-down__product-list">
                                            <c:forEach items="${listSubCategory}" var="subCate">
                                                <c:if test="${subCate.categoryId eq cate.id}">
                                                    <li class="header-down__product-item"><a
                                                            href="${pageContext.request.contextPath}/allproduct?type=category&id=${subCate.id}">${subCate.name}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="col header-down__wrap-link">
                            <a href="" class="header-down__link">Tin tức</a>
                            <i class="header-down__icon fas fa-caret-down"></i>
                            <ul class="header-down__list-product header-down__list-news">
                                <li class="header-down__product header-down__news"><a class="header-down__news-link"
                                        href="./news.html">Tin xu hướng</a></li>
                                <li class="header-down__product header-down__news"><a class="header-down__news-link"
                                        href="./news.html">Tin mẹo vặt</a></li>
                                <li class="header-down__product header-down__news"><a class="header-down__news-link"
                                        href="./news.html">Tin khuyến mãi</a></li>
                                <li class="header-down__product header-down__news"><a class="header-down__news-link"
                                        href="./news.html">Thẻ quà tặng</a></li>
                            </ul>
                        </div>
                        <div class="col header-down__wrap-link">
                            <a href="${pageContext.request.contextPath}/views/web/question.jsp"
                                class="header-down__link">Câu hỏi</a>
                        </div>
                        <div class="col header-down__wrap-link">
                            <a href="${pageContext.request.contextPath}/views/web/contact.jsp"
                                class="header-down__link">Liên hệ</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>