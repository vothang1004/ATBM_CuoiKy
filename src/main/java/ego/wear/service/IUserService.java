package ego.wear.service;

import java.util.List;

import ego.wear.model.UserModel;

public interface IUserService {
	List<UserModel> findAll();
	UserModel findById(long id);
	UserModel insert(UserModel userModel);
	UserModel update(UserModel userModel);
	UserModel checkUser(String username, String password);
	boolean isUniqueUsername(String username);
}
