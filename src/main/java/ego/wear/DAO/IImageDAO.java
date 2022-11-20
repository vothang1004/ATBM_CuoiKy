package ego.wear.DAO;

import java.util.List;

import ego.wear.model.ImageModel;
import ego.wear.model.SubCategoryModel;

public interface IImageDAO extends IGenericDAO<ImageModel>{
	List<ImageModel> findAll();
	List<ImageModel> findByProductId(long productId);
	ImageModel findById(long id);
	void update(ImageModel imageModel);
	long insert(ImageModel imageModel);
}
