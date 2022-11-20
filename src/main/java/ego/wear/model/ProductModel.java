package ego.wear.model;

import java.io.Serializable;
import java.sql.Timestamp;

import ego.wear.util.FormatPriceUtil;

public class ProductModel extends AbstractModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private int price;
	private String priceFormat;
	private int priceSale;
	private String priceSaleFormat;
	private String branch;
	private String material;
	private int salePercent;
	private int quantity;
	private long subCategoryId;
	public ProductModel(long id, String createdBy, Timestamp createdDate, String modifiedBy, Timestamp modifiedDate,
			String name, int price, String branch, String material, int salePercent, int quantity, long subCategoryId) {
		super(id, createdBy, createdDate, modifiedBy, modifiedDate);
		this.name = name;
		this.price = price;
		this.branch = branch;
		this.material = material;
		this.salePercent = salePercent;
		this.quantity = quantity;
		this.subCategoryId = subCategoryId;
	}
	@Override
	public String toString() {
		return "ProductModel [name=" + name + ", price=" + price + ", branch=" + branch + ", material=" + material
				+ ", salePercent=" + salePercent + ", quantity=" + quantity + ", subCategoryId=" + subCategoryId + "]";
	}
	public ProductModel() {
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	// format price
	public String getPriceFormat() {
		return FormatPriceUtil.formatPrice(this.getPrice());
	}
	public String getPriceSaleFormat() {
		return FormatPriceUtil.formatPrice(this.getPriceSale());
	}
	
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public int getSalePercent() {
		return salePercent;
	}
	public void setSalePercent(int salePercent) {
		this.salePercent = salePercent;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public long getSubCategoryId() {
		return subCategoryId;
	}
	public void setSubCategoryId(long subCategoryId) {
		this.subCategoryId = subCategoryId;
	}
	public void setPriceSale(int priceSale) {
		this.priceSale = priceSale;
	}
	public int getPriceSale() {
		if(this.salePercent != 0) {
			return this.price - (this.price * this.salePercent / 100);
		}
		return this.price;
	}
	
}
