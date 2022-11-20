package ego.wear.DAO.impl;

import java.sql.Timestamp;
import java.util.List;

import ego.wear.DAO.IItemDAO;
import ego.wear.mapper.CategoryMapper;
import ego.wear.mapper.ItemMapper;
import ego.wear.model.ItemModel;
import ego.wear.model.ProductModel;
import ego.wear.service.impl.ProductService;

public class ItemDAO extends AbstractDAO<ItemModel> implements IItemDAO{
	public static ItemDAO itemDao = null;
	public static ItemDAO getInstance() {
		if(itemDao == null) {
			itemDao = new ItemDAO();
		}
		return itemDao;
	}
	@Override
	public List<ItemModel> findAll() {
		String sql = "SELECT * FROM item";
		return query(sql, new ItemMapper());
	}
	@Override
	public List<ItemModel> findByIdOrder(long idOrder) {
		String sql = "SELECT * FROM item where order_id = ?";
		List<ItemModel> list = query(sql, new ItemMapper(), idOrder);
		if(list != null) return list;
		return null;
	}

	@Override
	public ItemModel findById(long id) {
		String sql = "SELECT * FROM item where id = ?";
		return query(sql, new ItemMapper(), id).get(0);
	}
	
	@Override
	public void update(ItemModel itemModel) {
		String sql = "UPDATE item SET name = ?,  price = ?, quantity = ?, product_id = ?, order_id = ?, modified_by = ?, modified_date = ? WHERE id = ?";
		update(sql, itemModel.getName(), itemModel.getPrice(), itemModel.getQuantity(), itemModel.getProductId(),
				itemModel.getOrderId(), itemModel.getModifiedBy(), itemModel.getModifiedDate(), itemModel.getId());
	}

	@Override
	public long insert(ItemModel itemModel) {
		String sql = "INSERT INTO item(name, price_sell, quantity, product_id, order_id, size, created_by, created_date)"
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		long id = insert(sql, itemModel.getName(), itemModel.getPrice(), itemModel.getQuantity(), itemModel.getProductId(),
				itemModel.getOrderId(), itemModel.getSize(), itemModel.getCreatedBy(), itemModel.getCreatedDate());
		return id;
	}
	public static void main(String[] args) {
		ItemModel itemModel = new ItemModel(0, null, null, null, null, "abc", 800000, 2, 49, 9, "S");
		long id = ItemDAO.getInstance().insert(itemModel);
		System.out.println(id);
	}
}
