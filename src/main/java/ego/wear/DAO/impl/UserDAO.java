package ego.wear.DAO.impl;

import java.sql.Timestamp;
import java.util.List;

import ego.wear.DAO.IUserDAO;
import ego.wear.mapper.UserMapper;
import ego.wear.model.UserModel;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO{
	public static UserDAO userDao = null;
	public static UserDAO getInstance() {
		if(userDao == null) {
			userDao = new UserDAO();
		}
		return userDao;
	}
	@Override
	public List<UserModel> findAll() {
		String sql = "SELECT * FROM users";
		return query(sql, new UserMapper());
	}

	@Override
	public UserModel findById(long id) {
		String sql = "SELECT * FROM users where id = ?";
		List<UserModel> list = query(sql, new UserMapper(), id);
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void update(UserModel userModel) {
		String sql = "UPDATE users SET username = ?,  password = ?, phone_number = ?, "
				+ "email = ?, status = ?, role_id = ?, public_key = ?, modified_by = ?, modified_date = ? WHERE id = ?";
		update(sql, userModel.getUsername(), userModel.getPassword(), userModel.getPhoneNumber(),
				userModel.getEmail(), userModel.getStatus(), userModel.getRoleId(), userModel.getPublicKey(),
				userModel.getModifiedBy(), userModel.getModifiedDate(), userModel.getId());
	}

	@Override
	public long insert(UserModel userModel) {
		String sql = "INSERT INTO users(username, user_password, phone_number, email, status, role_id, public_key, created_by, created_date)"
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		long id = insert(sql, userModel.getUsername(), userModel.getPassword(), userModel.getPhoneNumber(),
				userModel.getEmail(), userModel.getStatus(), userModel.getRoleId(), userModel.getPublicKey(), userModel.getCreatedBy(), userModel.getCreatedDate());
		return id;
	}
	// check user
	@Override
	public UserModel checkUser(String username, String password) {
		String sql = "SELECT * FROM users WHERE username = ? AND user_password = ?";
		List<UserModel> list = query(sql, new UserMapper(), username, password);
		if(list.size() > 0) {
			return list.get(0);
		}else {
			return null;
		}
	}
	public static void main(String[] args) {
		
	}
	
}
