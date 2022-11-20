package ego.wear.DAO;

import java.util.List;

import ego.wear.model.ProductModel;
import ego.wear.pagination.IPageble;

public interface IProductDAO extends IGenericDAO<ProductModel>{
	List<ProductModel> findAll(IPageble pageble);
	List<ProductModel> findByName(IPageble pageble);
	ProductModel findById(long id);
	void update(ProductModel productModel);
	long insert(ProductModel productModel);
}
