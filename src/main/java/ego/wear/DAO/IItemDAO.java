package ego.wear.DAO;

import java.util.List;

import ego.wear.model.ItemModel;

public interface IItemDAO {
	List<ItemModel> findAll();
	ItemModel findById(long id);
	List<ItemModel> findByIdOrder(long idOrder);
	void update(ItemModel itemModel);
	long insert(ItemModel itemModel);
}
