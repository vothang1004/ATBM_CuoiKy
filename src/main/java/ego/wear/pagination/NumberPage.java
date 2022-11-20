package ego.wear.pagination;

public class NumberPage {
	private int itemPerPage;
	private int totalItem;
	public NumberPage(int itemPerPage, int totalItem) {
		super();
		this.itemPerPage = itemPerPage;
		this.totalItem = totalItem;
	}
	public int getNumberPage() {
		int result = this.totalItem / this.itemPerPage;
		if(this.totalItem % this.itemPerPage != 0) {
			result++;
		}
		return result;
	}
	public int getItemPerPage() {
		return itemPerPage;
	}
	public void setItemPerPage(int itemPerPage) {
		this.itemPerPage = itemPerPage;
	}
	public int getTotalItem() {
		return totalItem;
	}
	public void setTotalItem(int totalItem) {
		this.totalItem = totalItem;
	}
	
}
