package ego.wear.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class AddressModel extends AbstractModel implements Serializable{
	private static final long serialVersionUID = 1L;
	private String province;
	private String district;
	private String village;
	private String detail;
	private long idUser;
	public AddressModel(long id, String createdBy, Timestamp createdDate, String modifiedBy, Timestamp modifiedDate,
			String province, String district, String village, String detail, long idUser) {
		super(id, createdBy, createdDate, modifiedBy, modifiedDate);
		this.province = province;
		this.district = district;
		this.village = village;
		this.detail = detail;
		this.idUser = idUser;
	}
	@Override
	public String toString() {
		return "province " + province + ", district " + district + ", village " + village + ", detail " + detail;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getVillage() {
		return village;
	}
	public void setVillage(String village) {
		this.village = village;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public long getIdUser() {
		return idUser;
	}
	public void setIdUser(long idUser) {
		this.idUser = idUser;
	}
	
}
