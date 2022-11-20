package ego.wear.mapper;

import java.sql.ResultSet;
import java.sql.Timestamp;

import ego.wear.model.RoleModel;

public class RoleMapper implements IRowMapper<RoleModel> {

	@Override
	public RoleModel rowMapper(ResultSet res) {
		try {
			long id = res.getLong("id");
			String name = res.getString("name");
			String code = res.getString("code");
			String createdBy = res.getString("created_by");
			Timestamp createdDate = res.getTimestamp("created_date");
			String modifiedBy = res.getString("modified_by");
			Timestamp modifiedDate = res.getTimestamp("modified_date");
			return new RoleModel(id, createdBy, createdDate, modifiedBy, modifiedDate, name, code);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
