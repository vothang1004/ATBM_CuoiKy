package ego.wear.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import ego.wear.condition.Condition;
import ego.wear.model.ProductModel;
import ego.wear.pagination.PageRequest;
import ego.wear.service.impl.ProductService;
import ego.wear.sort.Sorter;

public class SortAndFilterUtil {
	private String type;
	private String search;
	private String sort;
	private int currentPage;
	private int itemPerPage;
	private String filterBrand;
	private String filterMaterial;
	private String filterPrice;
	private Long categoryId;
	
	public SortAndFilterUtil(String type, String search, String sort, int currentPage, int itemPerPage, String filterBrand, String filterMaterial, String filterPrice, Long categoryId) {
		super();
		this.type = type;
		this.search = search;
		this.sort = sort;
		this.currentPage = currentPage;
		this.itemPerPage = itemPerPage;
		this.filterBrand = filterBrand;
		this.filterMaterial = filterMaterial;
		this.filterPrice = filterPrice;
		this.categoryId = categoryId;
	}

public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	public String getSearch() {
		return this.search;
	}
	public void setSearch(String search) {
		this.search = search;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getItemPerPage() {
		return itemPerPage;
	}

	public void setItemPerPage(int itemPerPage) {
		this.itemPerPage = itemPerPage;
	}

	public String getFilterBrand() {
		return filterBrand;
	}

	public void setFilterBrand(String filterBrand) {
		this.filterBrand = filterBrand;
	}

	public String getFilterMaterial() {
		return filterMaterial;
	}

	public void setFilterMaterial(String filterMaterial) {
		this.filterMaterial = filterMaterial;
	}

	public String getFilterPrice() {
		return filterPrice;
	}

	public void setFilterPrice(String filterPrice) {
		this.filterPrice = filterPrice;
	}
	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	
	// phuong thuc chung
	public List<ProductModel> getListResult() {
		List<ProductModel> listProduct = new ArrayList<ProductModel>();
		Condition[] arrCondition;
// check type start
		switch (getType()) {
		// new start
		case "new":
			arrCondition = new Condition[1];
			arrCondition[0] = new Condition("quantity", 0, ">");
			listProduct = ProductService.getInstance().findAll(new PageRequest(getCurrentPage(), 
					getItemPerPage(), new Sorter("desc", "id"), arrCondition));						
			break;
		// new end
		// category start
		case "category":
			arrCondition = new Condition[2];
			arrCondition[0] = new Condition("sub_category_id", getCategoryId(), "=");
			arrCondition[1] = new Condition("quantity", 0, ">");
			listProduct = ProductService.getInstance().findAll(new PageRequest(getCurrentPage(), 
					getItemPerPage(), new Sorter("desc", "id"), arrCondition));
			break;
		// category end
		// search start
		case "search":
			List<Condition> listCondition = new ArrayList<>();
			// tìm tên có chứa cụm từ
			listCondition.add(new Condition("name", "'%" + getSearch() + "%'", "like"));
			listCondition.add(new Condition("name", "'%" + getSearch() + "'", "like"));
			listCondition.add(new Condition("name", "'" + getSearch() + "%'", "like"));
			
			// convert from list to array
			arrCondition = new Condition[listCondition.size()];
			listCondition.toArray(arrCondition);
			listProduct = ProductService.getInstance().findByName(new PageRequest(getCurrentPage(), 
					getItemPerPage(), null, arrCondition));
			break;
		// search end
		default:
			break;
		}
// check type end

// check filter brand start
		if(!getFilterBrand().equals("default")) {
			String[] arrBrand = getFilterBrand().split("-");
			List<ProductModel> listFilter = new ArrayList<ProductModel>();
			for(String s: arrBrand) {
				for(int i = 0; i < listProduct.size(); i++) {
					if(listProduct.get(i).getBranch().equals(s)) {
						listFilter.add(listProduct.get(i));
					}
				}
			}
			listProduct = listFilter;
		}
// check filter brand end	
		
// check filter material start
		if(!getFilterMaterial().equals("default")) {
			String[] arrMaterial = getFilterMaterial().split("-");
			List<ProductModel> listFilter = new ArrayList<ProductModel>();
			for(String s: arrMaterial) {
				for(int i = 0; i < listProduct.size(); i++) {
					if(listProduct.get(i).getMaterial().equals(s)) {
						listFilter.add(listProduct.get(i));
					}
				}
			}
			listProduct = listFilter;
		}
// check filter material end
		
// check filter price start
		if(!getFilterPrice().equals("default")) {
			String[] arrPrice = getFilterPrice().split("-");
			List<ProductModel> listFilter = new ArrayList<ProductModel>();
			if(arrPrice.length == 2) {
				int price1 = Integer.parseInt(arrPrice[0]);
				int price2 = Integer.parseInt(arrPrice[1]);
				for(int i = 0; i < listProduct.size(); i++) {
					if(listProduct.get(i).getPriceSale() >= price1 && listProduct.get(i).getPriceSale() <= price2) {
						listFilter.add(listProduct.get(i));
					}
				}
			}else if(arrPrice.length == 1) {
				int price = Integer.parseInt(arrPrice[0]);
				for(int i = 0; i < listProduct.size(); i++) {
					if(listProduct.get(i).getPriceSale() >= price) {
						listFilter.add(listProduct.get(i));
					}
				}
			}
			listProduct = listFilter;
		}
		
// check filter price end

// check sort start
		switch (getSort()) {
		case "a-z":
			Collections.sort(listProduct, new Comparator<ProductModel>() {
				@Override
				public int compare(ProductModel o1, ProductModel o2) {
					return o1.getName().compareToIgnoreCase(o2.getName());
				}
			});
			break;
		case "z-a":
			Collections.sort(listProduct, new Comparator<ProductModel>() {
				@Override
				public int compare(ProductModel o1, ProductModel o2) {
					return o2.getName().compareToIgnoreCase(o1.getName());
				}
			});
			break;
		case "price-up":
			Collections.sort(listProduct, new Comparator<ProductModel>() {
				@Override
				public int compare(ProductModel o1, ProductModel o2) {
					if(o1.getPriceSale() > o2.getPriceSale()) {
						return 1;
					}else if(o1.getPriceSale() < o2.getPriceSale()) {
						return -1;
					}else {
						return 0;
					}
				}
			});
			break;
		case "price-down":
			Collections.sort(listProduct, new Comparator<ProductModel>() {
				@Override
				public int compare(ProductModel o1, ProductModel o2) {
					if(o1.getPriceSale() > o2.getPriceSale()) {
						return -1;
					}else if(o1.getPriceSale() < o2.getPriceSale()) {
						return 1;
					}else {
						return 0;
					}
				}
			});
			break;
		default:
			
			break;
		}
// check sort end

		return listProduct;
	}

}
