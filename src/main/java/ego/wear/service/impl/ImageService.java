package ego.wear.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ego.wear.DAO.impl.ImageDAO;
import ego.wear.model.ImageModel;
import ego.wear.service.IImageService;

public class ImageService implements IImageService {
	public static ImageService imageService;
	public static ImageService getInstance() {
		if(imageService == null) {
			imageService = new ImageService();
		}
		return imageService;
	}
	@Override
	public List<ImageModel> findAll() {
		return ImageDAO.getInstance().findAll();
	}
	@Override
	public List<ImageModel> findByProductId(long productId) {
		return ImageDAO.getInstance().findByProductId(productId);
	}
	@Override
	public List<ImageModel> findAllOneProduct() {
		Map<Long, ImageModel> listImage = new HashMap<Long, ImageModel>();
		for(ImageModel img: findAll()) {
			listImage.put(img.getProductId(), img);
		}
		return new ArrayList<ImageModel>(listImage.values());
	}
	@Override
	public ImageModel findById(long id) {
		return ImageDAO.getInstance().findById(id);
	}

	@Override
	public ImageModel insert(ImageModel imageModel) {
		long id = ImageDAO.getInstance().insert(imageModel);
		return findById(id);
	}

	@Override
	public ImageModel update(ImageModel imageModel) {
		ImageDAO.getInstance().update(imageModel);
		return findById(imageModel.getId());
	}
	public static void main(String[] args) {
		for(ImageModel img: ImageService.getInstance().findAllOneProduct()) {
			System.out.println(img.getLink());
		}
	}
	
}
