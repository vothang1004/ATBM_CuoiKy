package ego.wear.service;

import java.util.List;

import ego.wear.model.ImageModel;

public interface IImageService {
	List<ImageModel> findAll();
	List<ImageModel> findByProductId(long productId);
	List<ImageModel> findAllOneProduct();
	ImageModel findById(long id);
	ImageModel insert(ImageModel imageModel);
	ImageModel update(ImageModel imageModel);
}
