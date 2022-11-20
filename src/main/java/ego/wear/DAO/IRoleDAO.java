package ego.wear.DAO;

import java.util.List;

import ego.wear.model.RoleModel;

public interface IRoleDAO {
	List<RoleModel> findAll();
	RoleModel findById(long id);
	void update(RoleModel roleModel);
	long insert(RoleModel roleModel);
}
