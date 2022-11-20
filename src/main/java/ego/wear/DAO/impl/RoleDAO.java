package ego.wear.DAO.impl;

import java.sql.Timestamp;
import java.util.List;

import ego.wear.DAO.IRoleDAO;
import ego.wear.mapper.RoleMapper;
import ego.wear.model.RoleModel;
import ego.wear.util.GenerateCode;

public class RoleDAO extends AbstractDAO<RoleModel> implements IRoleDAO {
	public static RoleDAO roleDao = null;
	public static RoleDAO getInstance() {
		if(roleDao == null) {
			roleDao = new RoleDAO();
		}
		return roleDao;
	}
	@Override
	public List<RoleModel> findAll() {
		String sql = "SELECT * FROM role";
		return query(sql, new RoleMapper());
	}

	@Override
	public RoleModel findById(long id) {
		String sql = "SELECT * FROM role WHERE id = ?";
		return query(sql, new RoleMapper(), id).get(0);
	}

	@Override
	public void update(RoleModel roleModel) {
		String sql = "UPDATE role SET name = ?,  code = ?, modified_by = ?, modified_date = ? WHERE id = ?";
		update(sql, roleModel.getName(), roleModel.getCode(), roleModel.getModifiedBy(), roleModel.getModifiedDate(), roleModel.getId());
	}

	@Override
	public long insert(RoleModel roleModel) {
		String sql = "INSERT INTO role(name, code, created_by, created_date)"
				+ "VALUES(?, ?, ?, ?)";
		long id = insert(sql, roleModel.getName(), roleModel.getCode(), roleModel.getCreatedBy(), roleModel.getCreatedDate());
		return id;
	}
	public static void main(String[] args) {
		RoleModel oldRole = RoleDAO.getInstance().findById(1);
		oldRole.setName("Quản trị");
		oldRole.setCode(GenerateCode.generateCode(oldRole.getName()));
		oldRole.setModifiedBy("admin2");
		oldRole.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		
		RoleDAO.getInstance().update(oldRole);
	}
}
