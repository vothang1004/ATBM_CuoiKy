<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet" href="<c:url value='/templates/web/css/myorder.css' />">
<c:if test="${orders eq null }">
	<div class="grid wide">
		<p style="text-align: center">Bạn chưa có đơn hàng nào</p>
	</div>
</c:if>
<c:if test="${orders ne null}">
<div class="grid wide">
    <div class="order-list">
    <c:forEach items="${orders}" var="order">
        <div class="order-item">
            <h3 class="order-title">CHI TIẾT CÁC SẢN PHẨM</h3>
            <div class="order-products">
            <c:forEach items="${items}" var="entry">
            <c:if test="${entry.key eq order.id}">
            <c:forEach items="${entry.value}" var="item">
                <div class="order-product-item">
                    <div class="product-img">
                    	<c:forEach items="${images}" var="image">
                    	<c:if test="${image.productId eq item.productId}">
                    	<img src="${image.link}" />
                    	</c:if>                    		
                    	</c:forEach>
                    </div>
                    <div class="product-info">
                        <p class="product-name"><span>Tên sản phẩm:</span> ${item.name}</p>
                        <p class="product-price"><span>Giá sản phẩm:</span> ${item.priceFormat}đ</p>
                        <p class="product-quantity"><span>Số lượng sản phẩm:</span> ${item.quantity}</p>
                    </div>
                </div>
            </c:forEach>
            </c:if>
         	</c:forEach>
            </div>
            <h3 class="order-title">THÔNG TIN ĐƠN HÀNG</h3>
            <div class="order-info">
                <p class="order-price"><span>Giá đơn hàng:</span> ${order.totalPriceFormat}đ</p>
                <p class="order-date"><span>Ngày đặt hàng:</span>
                <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy" />
                </p>
                <p class="order-recieve-date"><span>Ngày nhận hàng:</span>
                <fmt:formatDate value="${order.recieveDate}" pattern="dd/MM/yyyy" />
                </p>
                <p class="order-status"><span>Trạng thái:</span> ${order.status}</p>
                <p class="order-detail"><span>Ghi chú:</span> ${order.detail}</p>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
</c:if>