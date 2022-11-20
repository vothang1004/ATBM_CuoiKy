package ego.wear.model;

import java.io.Serializable;
import java.sql.Timestamp;

import ego.wear.util.FormatPriceUtil;

public class ItemModel extends AbstractModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private int price;
	private int quantity;
	private long productId;
	private long orderId;
	private String size;
	private String priceFormat;
	public ItemModel(long id, String createdBy, Timestamp createdDate, String modifiedBy, Timestamp modifiedDate,
			String name, int price, int quantity, long productId, long orderId, String size) {
		super(id, createdBy, createdDate, modifiedBy, modifiedDate);
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.productId = productId;
		this.orderId = orderId;
		this.size = size;
	}
	public ItemModel() {
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPriceFormat() {
		return FormatPriceUtil.formatPrice(price);
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public long getProductId() {
		return productId;
	}
	public void setProductId(long productId) {
		this.productId = productId;
	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
}
