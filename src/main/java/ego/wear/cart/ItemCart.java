package ego.wear.cart;

import ego.wear.util.FormatPriceUtil;

public class ItemCart {
	private long id;
	private String name;
	private int quantity;
	private int price;
	private String size;
	private String priceFormat;
	private int totalPrice;
	private String totalPriceFormat;
	
	public ItemCart(long id, String name, int quantity, int price, String size) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.size = size;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPriceFormat() {
		return FormatPriceUtil.formatPrice(getPrice());
	}
	public int getTotalPrice() {
		return this.price * this.quantity;
	}
	public String getTotalPriceFormat() {
		return FormatPriceUtil.formatPrice(getTotalPrice());
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
}
