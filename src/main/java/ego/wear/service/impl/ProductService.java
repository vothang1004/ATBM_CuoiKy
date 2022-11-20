package ego.wear.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ego.wear.DAO.impl.ProductDAO;
import ego.wear.model.ProductModel;
import ego.wear.pagination.IPageble;
import ego.wear.pagination.PageRequest;
import ego.wear.service.IProductService;

public class ProductService implements IProductService {
	public static ProductService productService;
	public static ProductService getInstance() {
		if(productService == null) {
			productService = new ProductService();
		}
		return productService;
	}
	@Override
	public List<ProductModel> findAll(IPageble pageble) {
		return ProductDAO.getInstance().findAll(pageble);
	}
	@Override
	public List<ProductModel> findByName(IPageble pageble) {
		return ProductDAO.getInstance().findByName(pageble);
	}
	@Override
	public ProductModel findById(long id) {
		return ProductDAO.getInstance().findById(id);
	}

	@Override
	public ProductModel insert(ProductModel productModel) {
		long id = ProductDAO.getInstance().insert(productModel);
		return findById(id);
	}

	@Override
	public ProductModel update(ProductModel productModel) {
		ProductDAO.getInstance().update(productModel);
		return findById(productModel.getId());
	}
	// find distinct brand
	public List<String> findDistinctBrand() {
		List<ProductModel> allProduct = findAll(null);
		Map<String, String> map = new HashMap<String, String>();
		for(ProductModel p: allProduct) {
			map.put(p.getBranch(), p.getBranch());
		}
		return new ArrayList<String>(map.keySet());
	}
	// find distinct material
	public List<String> findDistinctMaterial() {
		List<ProductModel> allProduct = findAll(null);
		Map<String, String> map = new HashMap<String, String>();
		for(ProductModel p: allProduct) {
			map.put(p.getMaterial(), p.getMaterial());
		}
		return new ArrayList<String>(map.keySet());
	}
	public static void main(String[] args) {
		for (String brand : ProductService.getInstance().findDistinctBrand()) {
			System.out.println(brand);
		}
	}
}
