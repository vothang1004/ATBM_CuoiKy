<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/templates/admin/css/subcategory.css' /> ">
<link rel="stylesheet"
	href="<c:url value='/templates/admin/css/pagination.css' /> ">

<div class="direct">
	<span><i class="direct-icon fas fa-home"></i>Trang chủ</span> &#160;
	&#62; &#160; Danh mục sản phẩm
</div>
<div class="action">
	<a title="Thêm danh mục sản phẩm" href="./insertsubcategory.html"
		class="action__add"> <i class="action-icon fas fa-plus"></i>
	</a> <a title="Xóa danh mục sản phẩm" href="" class="action__delete"> <i
		class="action-icon far fa-trash-alt"></i>
	</a>
</div>
<div class="subcategories">
	<div class="subcategories__header">
		<p class="subcategories__header-column subcategories__header-choose">Chọn</p>
		<div class="subcategories__header-column subcategories__header-name">Tên
			danh mục sản phẩm</div>
		<div class="subcategories__header-column subcategories__header-update">Chỉnh
			sửa</div>
	</div>
	<div class="subcategories__body-wrap">
		<div class="subcategories__body">
			<div class="subcategories__body-column subcategories__body-choose">
				<input class="check-delete" type="checkbox">
			</div>
			<div class="subcategories__body-column subcategories__body-name">Áo
				thun nam</div>
			<div class="subcategories__body-column subcategories__body-update">
				<a title="chỉnh sửa danh mục sản phẩm" href=""
					class="subcategories__body-icon far fa-edit"></a>
			</div>
		</div>
		<div class="subcategories__body">
			<div class="subcategories__body-column subcategories__body-choose">
				<input class="check-delete" type="checkbox">
			</div>
			<div class="subcategories__body-column subcategories__body-name">Áo
				thun nữ</div>
			<div class="subcategories__body-column subcategories__body-update">
				<a title="chỉnh sửa danh mục sản phẩm" href=""
					class="subcategories__body-icon far fa-edit"></a>
			</div>
		</div>
		<div class="subcategories__body">
			<div class="subcategories__body-column subcategories__body-choose">
				<input class="check-delete" type="checkbox">
			</div>
			<div class="subcategories__body-column subcategories__body-name">Quần
				jogger nữ</div>
			<div class="subcategories__body-column subcategories__body-update">
				<a title="chỉnh sửa danh mục sản phẩm" href=""
					class="subcategories__body-icon far fa-edit"></a>
			</div>
		</div>
		<div class="subcategories__body">
			<div class="subcategories__body-column subcategories__body-choose">
				<input class="check-delete" type="checkbox">
			</div>
			<div class="subcategories__body-column subcategories__body-name">Quần
				short nam</div>
			<div class="subcategories__body-column subcategories__body-update">
				<a title="chỉnh sửa danh mục sản phẩm" href=""
					class="subcategories__body-icon far fa-edit"></a>
			</div>
		</div>
	</div>
</div>
<div class="pagination">
	<ul class="pagination__list">
		<li class="pagination__list-item"><a href=""
			class="pagination__list-item__link active">1</a></li>
		<li class="pagination__list-item"><a href=""
			class="pagination__list-item__link">2</a></li>
		<li class="pagination__list-item"><a href=""
			class="pagination__list-item__link"><i
				class="fas fa-chevron-right"></i></a></li>
	</ul>
</div>

<script>
    const btnDelete = document.querySelector('.action__delete');
    const checkDeletes = document.querySelectorAll('.check-delete');

    checkDeletes.forEach(check => {
        check.onclick = e => {
            const checkEl = [...checkDeletes].find(item => {
                return item.matches('.check-delete:checked');
            })
            if(checkEl) {
                btnDelete.style = `opacity: 1; pointer-events: all`;
            }else {
                btnDelete.style = `opacity: 0.5; pointer-events: none`;
            }
        }
    })
</script>