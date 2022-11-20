package ego.wear.service;

import java.util.List;

import ego.wear.model.OrderModel;

public interface IOrderService {
	List<OrderModel> findAll();
	List<OrderModel> findByIdUser(long idUser);
	OrderModel findById(long id);
	OrderModel insert(OrderModel orderModel);
	OrderModel update(OrderModel orderModel);
}
