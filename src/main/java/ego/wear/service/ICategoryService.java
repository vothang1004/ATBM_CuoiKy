package ego.wear.service;

import java.util.List;

import ego.wear.model.CategoryModel;
import ego.wear.pagination.IPageble;

public interface ICategoryService {
	List<CategoryModel> findAll();
	List<CategoryModel> findAllPagination(IPageble pageble);
	CategoryModel findById(long id);
	CategoryModel insert(CategoryModel categoryModel);
	CategoryModel update(CategoryModel categoryModel);
	int delete(long id);
}
