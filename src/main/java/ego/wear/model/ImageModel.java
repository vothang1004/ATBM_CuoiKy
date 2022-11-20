package ego.wear.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ImageModel extends AbstractModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String link;
	private long productId;
	private boolean isLinkOnline;
	public ImageModel(long id, String createdBy, Timestamp createdDate, String modifiedBy, Timestamp modifiedDate,
			String link, long productId) {
		super(id, createdBy, createdDate, modifiedBy, modifiedDate);
		this.link = link;
		this.productId = productId;
	}
	public ImageModel() {
		
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public long getProductId() {
		return productId;
	}
	public void setProductId(long productId) {
		this.productId = productId;
	}
	public boolean getIsLinkOnline() {
		if(this.link.startsWith("http")) {
			return true;
		}else {
			return false;
		}
	}
}
