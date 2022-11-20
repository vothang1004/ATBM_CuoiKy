package ego.wear.mapper;

import java.sql.ResultSet;
import java.sql.Timestamp;

import ego.wear.model.AddressModel;

public class AddressMapper implements IRowMapper<AddressModel>{

	@Override
	public AddressModel rowMapper(ResultSet res) {
		try {
			String province = res.getString("province");
			String district = res.getString("district");
			String village = res.getString("village");
			String detail = res.getString("detail");
			long idUser = res.getLong("id_user");
			String createdBy = res.getString("created_by");
			Timestamp createdDate = res.getTimestamp("created_date");
			String modifiedBy = res.getString("modified_by");
			Timestamp modifiedDate = res.getTimestamp("modified_date");
			return new AddressModel(idUser, createdBy, createdDate, modifiedBy, modifiedDate, province, district, village, detail, idUser);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
