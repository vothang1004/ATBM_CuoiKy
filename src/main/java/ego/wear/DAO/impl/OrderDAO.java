package ego.wear.DAO.impl;

import java.sql.Timestamp;
import java.util.List;

import ego.wear.DAO.IOrderDAO;
import ego.wear.mapper.OrderMapper;
import ego.wear.model.OrderModel;
import ego.wear.service.impl.OrderService;

public class OrderDAO extends AbstractDAO<OrderModel> implements IOrderDAO{
	public static OrderDAO orderDao = null;
	public static OrderDAO getInstance() {
		if(orderDao == null) {
			orderDao = new OrderDAO();
		}
		return orderDao;
	}
	@Override
	public List<OrderModel> findAll() {
		String sql = "SELECT * FROM orders";
		return query(sql, new OrderMapper());
	}
	@Override
	public List<OrderModel> findByIdUser(long idUser) {
		String sql = "SELECT * FROM orders where user_id = ?";
		List<OrderModel> list = query(sql, new OrderMapper(), idUser);
		if(list != null) return list;
		return null;
	}
	@Override
	public OrderModel findById(long id) {
		String sql = "SELECT * FROM orders where id = ?";
		return query(sql, new OrderMapper(), id).get(0);
	}

	@Override
	public void update(OrderModel orderModel) {
		String sql = "UPDATE orders SET total_price = ?,  status = ?, order_date = ?, recieve_date = ?, user_id = ?, modified_by = ?, modified_date = ? WHERE id = ?";
		update(sql, orderModel.getTotalPrice(), orderModel.getStatus(), orderModel.getOrderDate(), orderModel.getRecieveDate(),
				orderModel.getUserId(), orderModel.getModifiedBy(), orderModel.getModifiedDate(), orderModel.getId());
	}

	@Override
	public long insert(OrderModel orderModel) {
		String sql = "INSERT INTO orders(total_price, status, order_date, recieve_date, detail, user_id, created_by, created_date)"
				+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		long id = insert(sql, orderModel.getTotalPrice(), orderModel.getStatus(), orderModel.getOrderDate(),
				orderModel.getRecieveDate(), orderModel.getDetail(), orderModel.getUserId(), orderModel.getCreatedBy(), orderModel.getCreatedDate());
		return id;
	}
	public static void main(String[] args) {
		List<OrderModel> orderByIdUsers = OrderDAO.getInstance().findByIdUser(1);
		for (OrderModel orderModel : orderByIdUsers) {
			System.out.println(orderModel.getTotalPrice());
		}
	}
}
