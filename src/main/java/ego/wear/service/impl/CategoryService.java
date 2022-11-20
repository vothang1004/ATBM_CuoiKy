package ego.wear.service.impl;

import java.sql.Timestamp;
import java.util.List;

import ego.wear.DAO.impl.CategoryDAO;
import ego.wear.model.CategoryModel;
import ego.wear.pagination.IPageble;
import ego.wear.service.ICategoryService;

public class CategoryService implements ICategoryService {
	public static CategoryService categoryService;
	public static CategoryService getInstance() {
		if(categoryService == null) {
			categoryService = new CategoryService();
		}
		return categoryService;
	}

	@Override
	public List<CategoryModel> findAll() {
		return CategoryDAO.getInstance().findAll();
	}
	@Override
	public List<CategoryModel> findAllPagination(IPageble pageble) {
		return CategoryDAO.getInstance().findAllPagination(pageble);
	}
	@Override
	public CategoryModel findById(long id) {
		return CategoryDAO.getInstance().findById(id);
	}

	@Override
	public CategoryModel insert(CategoryModel categoryModel) {
		long id = CategoryDAO.getInstance().insert(categoryModel);
		CategoryModel cate = findById(id);
		return cate;
	}

	@Override
	public CategoryModel update(CategoryModel categoryModel) {
		CategoryDAO.getInstance().update(categoryModel);
		return findById(categoryModel.getId());
	}
	@Override
	public int delete(long id) {
		return CategoryDAO.getInstance().delete(id);
	}
	public static void main(String[] args) {
		CategoryModel oldCate = CategoryService.getInstance().findById(7);
		if(oldCate != null) {
			oldCate.setName("Quần nam");
			oldCate.setModifiedDate(new Timestamp(System.currentTimeMillis()));
			CategoryModel newCate = CategoryService.getInstance().update(oldCate);
			System.out.println(newCate.getName());
		}else {
			System.out.println("cate null");
		}
	}

}
