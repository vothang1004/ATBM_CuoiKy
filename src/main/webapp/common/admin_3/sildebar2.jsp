<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>

<div class="sidebar__chooses">
    <div class="sidebar__chooses-item">
        <i class="sidebar__chooses-item__icon far fa-chart-bar"></i>
    </div>
    <div class="sidebar__chooses-item">
        <i class="sidebar__chooses-item__icon fas fa-pen"></i>
    </div>
    <div class="sidebar__chooses-item">
        <i class="sidebar__chooses-item__icon fas fa-mask"></i>
    </div>
    <div class="sidebar__chooses-item">
        <i class="sidebar__chooses-item__icon fas fa-cogs"></i>
    </div>
</div>
<ul class="sidebar">
    <li class="sidebar__item"><i
            class="sidebar__item-icon fas fa-tachometer-alt"></i> <a
            href="${pageContext.request.contextPath}/home" class="sidebar__item-link">Thống kê</a></li>
    <label for='check-sidebar-list' class="sidebar__item"> <i
            class="sidebar__item-icon fas fa-list"></i> <a
            class="sidebar__item-link">Danh mục</a>
    </label>
    <input hidden id='check-sidebar-list' type="checkbox">
    <ul class="sidebar__list">
        <li class="sidebar__list-item"><a href="${pageContext.request.contextPath}/admin-category"
                                          class="sidebar__list-item__link">Danh mục loại</a></li>
        <li class="sidebar__list-item"><a href="${pageContext.request.contextPath}/admin-subcategory"
                                          class="sidebar__list-item__link">Danh mục sản phẩm</a></li>
    </ul>
    <li class="sidebar__item"><i
            class="sidebar__item-icon fas fa-tshirt"></i> <a
            href="${pageContext.request.contextPath}/admin-allproduct" class="sidebar__item-link">Sản phẩm</a></li>
    <li class="sidebar__item"><i
            class="sidebar__item-icon fas fa-receipt"></i> <a
            href="${pageContext.request.contextPath}/admin-order" class="sidebar__item-link">Quản lý đơn
        hàng</a></li>
</ul>