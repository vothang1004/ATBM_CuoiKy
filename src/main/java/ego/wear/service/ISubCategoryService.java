package ego.wear.service;

import java.util.List;

import ego.wear.model.SubCategoryModel;

public interface ISubCategoryService {
	List<SubCategoryModel> findAll();
	SubCategoryModel findById(long id);
	SubCategoryModel insert(SubCategoryModel subCategoryModel);
	SubCategoryModel update(SubCategoryModel subCategoryModel);
}
