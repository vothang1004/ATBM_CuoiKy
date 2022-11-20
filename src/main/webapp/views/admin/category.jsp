<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/templates/admin/css/category.css' />">
<link rel="stylesheet"
	href="<c:url value='/templates/admin/css/pagination.css' />">
<title><dec:title>Admin - Category</dec:title></title>

<div class="direct">
	<span><i class="direct-icon fas fa-home"></i>Trang chủ</span> &#160;
	&#62; &#160; Danh mục loại
</div>
<div class="action">
	<a title="Thêm mục loại" href="${pageContext.request.contextPath}/admin-insertcategory"
		class="action__add"> <i class="action-icon fas fa-plus"></i>
	</a>
</div>
<div class="categories">
	<div class="categories__header">
		<p class="categories__header-column categories__header-choose">STT</p>
		<div class="categories__header-column categories__header-name">Tên
			mục loại</div>
		<div class="categories__header-column categories__header-update">Hành động</div>
	</div>
	<input hidden value="delete" name="type" />
	<div class="categories__body-wrap">
	<c:forEach items="${listCategory}" var="cate" varStatus="loop">
		<div class="categories__body">
			<div class="categories__body-column categories__body-choose">
				${loop.count}
			</div>
			<div class="categories__body-column categories__body-name">${cate.name}</div>
			<div style="column-gap: 5px" class="categories__body-column categories__body-update">
				<a title="chỉnh sửa mục loại" href="${pageContext.request.contextPath}/admin-editcategory?id=${cate.id}"
					class="categories__body-icon far fa-edit"></a>
				<a data-name="${cate.name}" onclick="window.confirm('Bạn có chắc muốn xóa ${cate.name}')" title="Xóa mục loại" href="${pageContext.request.contextPath}/admin-deletecategory?type=delete&id=${cate.id}"
				class="btn-delete categories__body-icon far fa-trash-alt">
				</a>
			</div>
		</div>
	</c:forEach>
	</div>
</div>
<div class="pagination">
	<ul class="pagination__list">
		<%-- <li class="pagination__list-item"><a href=""
			class="pagination__list-item__link active">1</a></li>
		<li class="pagination__list-item"><a href=""
			class="pagination__list-item__link">2</a></li>
		<li class="pagination__list-item"><a href=""
			class="pagination__list-item__link"><i	
				class="fas fa-chevron-right"></i></a></li> --%>
	</ul>
</div>
<script src='<c:url value="/templates/admin/js/pagination.js"></c:url>'></script>
<script type="text/javascript">
	pagination('.pagination__list', {
		currentPage: ${currentPage},
		numberPage: ${numberPage}
	}, '/ATBM_CuoiKy/admin-category')
</script>
<script>
    const btnDeletes = document.querySelectorAll('.btn-delete');
	[...btnDeletes].forEach(item => item.onclick = (e) => {
		const check = confirm('Bạn có chắc muốn xóa ' + e.target.dataset.name)
		if(!check) {
			e.preventDefault()
			return
		}
	})
</script>