package ego.wear.mapper;

import java.sql.ResultSet;
import java.sql.Timestamp;

import ego.wear.model.OrderModel;

public class OrderMapper implements IRowMapper<OrderModel> {

	@Override
	public OrderModel rowMapper(ResultSet res) {
		try {
			long id = res.getLong("id");
			int totalPrice = res.getInt("total_price");
			String status = res.getString("status");
			Timestamp orderDate = res.getTimestamp("order_date");
			Timestamp recieveDate = res.getTimestamp("recieve_date");
			long userId = res.getLong("user_id");
			String note = res.getString("detail");
			String createdBy = res.getString("created_by");
			Timestamp createdDate = res.getTimestamp("created_date");
			String modifiedBy = res.getString("modified_by");
			Timestamp modifiedDate = res.getTimestamp("modified_date");
			return new OrderModel(id, createdBy, createdDate, modifiedBy, modifiedDate, totalPrice, status, orderDate, recieveDate, note, userId);	
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
