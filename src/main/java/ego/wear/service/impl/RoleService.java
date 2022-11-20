package ego.wear.service.impl;

import java.sql.Timestamp;
import java.util.List;

import ego.wear.DAO.impl.RoleDAO;
import ego.wear.DAO.impl.SubCategoryDAO;
import ego.wear.model.RoleModel;
import ego.wear.service.IRoleService;
import ego.wear.util.GenerateCode;

public class RoleService implements IRoleService {
	public static RoleService roleService;
	public static RoleService getInstance() {
		if(roleService == null) {
			roleService = new RoleService();
		}
		return roleService;
	}
	@Override
	public List<RoleModel> findAll() {
		return RoleDAO.getInstance().findAll();
	}

	@Override
	public RoleModel findById(long id) {
		return RoleDAO.getInstance().findById(id);
	}

	@Override
	public RoleModel insert(RoleModel roleModel) {
		long id = RoleDAO.getInstance().insert(roleModel);
		return findById(id);
	}

	@Override
	public RoleModel update(RoleModel roleModel) {
		RoleDAO.getInstance().update(roleModel);
		return findById(roleModel.getId());
	}
	public static void main(String[] args) {
		RoleModel role = new RoleModel();
		role.setName("user");
		role.setCode(GenerateCode.generateCode(role.getName()));
		role.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		
		role = RoleService.getInstance().insert(role);
		System.out.println(role.getName());
	}
}
