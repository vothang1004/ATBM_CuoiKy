package ego.wear.service;

import java.util.List;

import ego.wear.model.ItemModel;

public interface IItemService {
	List<ItemModel> findAll();
	List<ItemModel> findByIdOrder(long idOrder);
	ItemModel findById(long id);
	ItemModel insert(ItemModel itemModel);
	ItemModel update(ItemModel itemModel);
}
