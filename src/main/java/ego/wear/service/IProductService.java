package ego.wear.service;

import java.util.List;

import ego.wear.model.ProductModel;
import ego.wear.pagination.IPageble;

public interface IProductService {
	List<ProductModel> findAll(IPageble pageble);
	List<ProductModel> findByName(IPageble pageble);
	ProductModel findById(long id);
	ProductModel insert(ProductModel productModel);
	ProductModel update(ProductModel productModel);
}
