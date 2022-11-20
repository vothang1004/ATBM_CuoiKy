package ego.wear.pagination;

import ego.wear.condition.Condition;
import ego.wear.sort.Sorter;

public class PageRequest implements IPageble {
	private Integer page;
	private Integer itemPerPage;
	private Sorter sorter;
	private Condition[] condition;
	public PageRequest(Integer page, Integer itemPerPage, Sorter sorter, Condition[] condition) {
		this.page = page;
		this.itemPerPage = itemPerPage;
		this.sorter = sorter;
		this.condition = condition;
	}

	@Override
	public Integer getOffset() {
		if(this.page != null) {
			return (this.page -1) * this.itemPerPage;
		}
		return null;
	}

	@Override
	public Integer getLitmit() {
		return this.itemPerPage;
	}

	public void setPage(int page) {
		this.page = page;
	}
	public Integer getPage() {
		return this.page;
	}

	public int getItemPerPage() {
		return itemPerPage;
	}

	public void setItemPerPage(int itemPerPage) {
		this.itemPerPage = itemPerPage;
	}


	public Sorter getSorter() {
		return this.sorter;
	}


	public void setSorter(Sorter sorter) {
		this.sorter = sorter;
	}


	public Condition[] getCondition() {
		return condition;
	}


	public void setCondition(Condition[] condition) {
		this.condition = condition;
	}

}
