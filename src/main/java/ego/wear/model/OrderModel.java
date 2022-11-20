package ego.wear.model;

import java.io.Serializable;
import java.sql.Timestamp;

import ego.wear.util.FormatPriceUtil;

public class OrderModel extends AbstractModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int totalPrice;
	private String status;
	private Timestamp orderDate;
	private Timestamp recieveDate;
	private String detail;
	private long userId;
	private String totalPriceFormat;
	public OrderModel(long id, String createdBy, Timestamp createdDate, String modifiedBy, Timestamp modifiedDate,
			int totalPrice, String status, Timestamp orderDate, Timestamp recieveDate, String detail, long userId) {
		super(id, createdBy, createdDate, modifiedBy, modifiedDate);
		this.totalPrice = totalPrice;
		this.status = status;
		this.orderDate = orderDate;
		this.recieveDate = recieveDate;
		this.detail = detail;
		this.userId = userId;
	}
	public OrderModel() {
		
	}
	public String getTotalPriceFormat() {
		return FormatPriceUtil.formatPrice(totalPrice);
	}
	public int getTotalPrice() {
		return this.totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public Timestamp getRecieveDate() {
		return recieveDate;
	}
	public void setRecieveDate(Timestamp recieveDate) {
		this.recieveDate = recieveDate;
	}
	
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	
}
