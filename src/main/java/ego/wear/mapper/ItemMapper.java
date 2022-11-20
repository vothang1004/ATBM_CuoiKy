package ego.wear.mapper;

import java.sql.ResultSet;
import java.sql.Timestamp;

import ego.wear.model.ItemModel;

public class ItemMapper implements IRowMapper<ItemModel> {

	@Override
	public ItemModel rowMapper(ResultSet res) {
		try {
			long id = res.getLong("id");
			String name = res.getString("name");
			int price = res.getInt("price_sell");
			int quantity = res.getInt("quantity");
			long productId = res.getLong("product_id");
			long orderId = res.getLong("order_id");
			String size = res.getString("size");
			String createdBy = res.getString("created_by");
			Timestamp createdDate = res.getTimestamp("created_date");
			String modifiedBy = res.getString("modified_by");
			Timestamp modifiedDate = res.getTimestamp("modified_date");
			return new ItemModel(id, createdBy, createdDate, modifiedBy, modifiedDate, name, price, quantity, productId, orderId, size);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
