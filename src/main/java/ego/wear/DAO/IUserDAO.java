package ego.wear.DAO;

import java.util.List;

import ego.wear.model.UserModel;

public interface IUserDAO extends IGenericDAO<UserModel>{
	List<UserModel> findAll();
	UserModel findById(long id);
	void update(UserModel userModel);
	long insert(UserModel userModel);
	UserModel checkUser(String username, String password);
}
