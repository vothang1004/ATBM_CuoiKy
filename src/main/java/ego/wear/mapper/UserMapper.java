package ego.wear.mapper;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.Timestamp;

import ego.wear.model.UserModel;

public class UserMapper implements IRowMapper<UserModel> {

	@Override
	public UserModel rowMapper(ResultSet res) {
		try {
			long id = res.getLong("id");
			String username = res.getString("username");
			String password = res.getString("user_password");
			String phoneNumber = res.getString("phone_number");
			String email = res.getString("email");
			long roleId = res.getLong("role_id");
			int status = res.getInt("status");
			String publicKey = res.getString("public_key");
			String createdBy = res.getString("created_by");
			Timestamp createdDate = res.getTimestamp("created_date");
			String modifiedBy = res.getString("modified_by");
			Timestamp modifiedDate = res.getTimestamp("modified_date");
			return new UserModel(id, createdBy, createdDate, modifiedBy, modifiedDate, username, password, phoneNumber, email, status, roleId, publicKey)	;	
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
