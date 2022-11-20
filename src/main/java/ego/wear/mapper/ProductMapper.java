package ego.wear.mapper;

import java.sql.ResultSet;
import java.sql.Timestamp;

import ego.wear.model.ProductModel;

public class ProductMapper implements IRowMapper<ProductModel> {

	@Override
	public ProductModel rowMapper(ResultSet res) {
		try {
			long id = res.getLong("id");
			String name = res.getString("name");
			int price = res.getInt("price");
			String branch = res.getString("branch");
			String material = res.getString("material");
			int salePercent = res.getInt("sale_percent");
			int quantity = res.getInt("quantity");
			long subCategoryId = res.getLong("sub_category_id");
			String createdBy = res.getString("created_by");
			Timestamp createdDate = res.getTimestamp("created_date");
			String modifiedBy = res.getString("modified_by");
			Timestamp modifiedDate = res.getTimestamp("modified_date");
			return new ProductModel(id, createdBy, createdDate, modifiedBy, modifiedDate, name, price, branch, material, salePercent, quantity, subCategoryId);	
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
