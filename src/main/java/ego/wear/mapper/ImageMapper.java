package ego.wear.mapper;

import java.sql.ResultSet;
import java.sql.Timestamp;

import ego.wear.model.ImageModel;

public class ImageMapper implements IRowMapper<ImageModel> {

	@Override
	public ImageModel rowMapper(ResultSet res) {
		try {
			long id = res.getLong("id");
			String link = res.getString("link");
			long productId = res.getLong("product_id");
			String createdBy = res.getString("created_by");
			Timestamp createdDate = res.getTimestamp("created_date");
			String modifiedBy = res.getString("modified_by");
			Timestamp modifiedDate = res.getTimestamp("modified_date");
			return new ImageModel(id, createdBy, createdDate, modifiedBy, modifiedDate, link, productId);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
