package ego.wear.DAO.impl;

import java.util.List;

import ego.wear.DAO.IImageDAO;
import ego.wear.mapper.ImageMapper;
import ego.wear.model.ImageModel;

public class ImageDAO extends AbstractDAO<ImageModel> implements IImageDAO{
	public static ImageDAO imageDao = null;
	public static ImageDAO getInstance() {
		if(imageDao == null) {
			imageDao = new ImageDAO();
		}
		return imageDao;
	}
	@Override
	public List<ImageModel> findAll() {
		String sql = "SELECT * FROM image";
		return query(sql, new ImageMapper());
	}
	@Override
	public List<ImageModel> findByProductId(long productId) {
		String sql = "SELECT * FROM image WHERE product_id = ?";
		return query(sql, new ImageMapper(), productId);
	}
	@Override
	public ImageModel findById(long id) {
		String sql = "SELECT * FROM image where id = ?";
		return query(sql, new ImageMapper(), id).get(0);
	}

	@Override
	public void update(ImageModel imageModel) {
		String sql = "UPDATE image SET link = ?,  product_id = ?, modified_by = ?, modified_date = ? WHERE id = ?";
		update(sql, imageModel.getLink(), imageModel.getProductId(), imageModel.getModifiedBy(), imageModel.getModifiedDate(), imageModel.getId());
	}

	@Override
	public long insert(ImageModel imageModel) {
		String sql = "INSERT INTO image(link, product_id, created_by, created_date)"
				+ "VALUES(?, ?, ?, ?)";
		long id = insert(sql, imageModel.getLink(), imageModel.getProductId(), imageModel.getCreatedBy(), imageModel.getCreatedDate());
		return id;
	}
	public static void main(String[] args) {
		for(ImageModel img: ImageDAO.getInstance().findByProductId(30)) {
			System.out.println(img.getLink());
		}
	}
}
