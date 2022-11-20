package ego.wear.DAO;

import java.util.List;

import ego.wear.model.SubCategoryModel;

public interface ISubCategoryDAO extends IGenericDAO<SubCategoryModel>{
	List<SubCategoryModel> findAll();
	SubCategoryModel findById(long id);
	void update(SubCategoryModel subCategoryModel);
	long insert(SubCategoryModel subCategoryModel);
}
