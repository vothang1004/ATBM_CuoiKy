package ego.wear.DAO;

import java.util.List;

import ego.wear.model.CategoryModel;
import ego.wear.pagination.IPageble;

public interface ICategoryDAO extends IGenericDAO<CategoryModel>{
	List<CategoryModel> findAll();
	List<CategoryModel> findAllPagination(IPageble pageble);
	CategoryModel findById(long id);
	int update(CategoryModel categoryModel);
	long insert(CategoryModel categoryModel);
	int delete(long id);
}
