package ego.wear.service;

import java.util.List;

import ego.wear.model.RoleModel;

public interface IRoleService {
	List<RoleModel> findAll();
	RoleModel findById(long id);
	RoleModel insert(RoleModel roleModel);
	RoleModel update(RoleModel roleModel);
}
