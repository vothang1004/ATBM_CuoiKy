package ego.wear.mapper;

import java.sql.ResultSet;
import java.sql.Timestamp;

import ego.wear.model.SubCategoryModel;

public class SubCategoryMapper implements IRowMapper<SubCategoryModel>{

	@Override
	public SubCategoryModel rowMapper(ResultSet res) {
		try {
			long id = res.getLong("id");
			String name = res.getString("name");
			String code = res.getString("code");
			long categoryId = res.getLong("category_id");
			String createdBy = res.getString("created_by");
			Timestamp createdDate = res.getTimestamp("created_date");
			String modifiedBy = res.getString("modified_by");
			Timestamp modifiedDate = res.getTimestamp("modified_date");
			return new SubCategoryModel(id, createdBy, createdDate, modifiedBy, modifiedDate, name, code, categoryId);			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
