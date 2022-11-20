package ego.wear.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ego.wear.model.CategoryModel;
import ego.wear.model.SubCategoryModel;
import ego.wear.service.impl.CategoryService;
import ego.wear.service.impl.ProductService;
import ego.wear.service.impl.SubCategoryService;

public class RequestSetAttributeUtil {
	public static void setCategory(HttpServletRequest request) {
		List<CategoryModel> listCategory = CategoryService.getInstance().findAll();
		List<SubCategoryModel> listSubCategory = SubCategoryService.getInstance().findAll();
		List<String> listBrand = ProductService.getInstance().findDistinctBrand();
		List<String> listMaterial = ProductService.getInstance().findDistinctMaterial();
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("listSubCategory", listSubCategory);
		request.setAttribute("listBrand", listBrand);
		request.setAttribute("listMaterial", listMaterial);
	}
}
