package ego.wear.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class SubCategoryModel extends AbstractModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String code;
	private long categoryId;
	public SubCategoryModel(long id, String createdBy, Timestamp createdDate, String modifiedBy, Timestamp modifiedDate,
			String name, String code, long categoryId) {
		super(id, createdBy, createdDate, modifiedBy, modifiedDate);
		this.name = name;
		this.code = code;
		this.categoryId = categoryId;
	}
	public SubCategoryModel() {
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}
	
}
