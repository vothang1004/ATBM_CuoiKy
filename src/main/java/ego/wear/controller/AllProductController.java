package ego.wear.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.condition.Condition;
import ego.wear.model.ImageModel;
import ego.wear.model.ProductModel;
import ego.wear.pagination.NumberPage;
import ego.wear.pagination.PageRequest;
import ego.wear.service.impl.ImageService;
import ego.wear.service.impl.ProductService;
import ego.wear.sort.Sorter;
import ego.wear.util.RequestSetAttributeUtil;

/**
 * Servlet implementation class AllProductController
 */
@WebServlet(urlPatterns = {"/allproduct"})
public class AllProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("type");
		long categoryId = 0;
		if(request.getParameter("id") != null) {
			categoryId = Long.parseLong(request.getParameter("id"));
		}	
		int itemPerPage = 12;
		int currentPage = 1;
		int numberPage = 0;
		List<ProductModel> listProduct;
		RequestSetAttributeUtil.setCategory(request);
		List<ImageModel> listImage = ImageService.getInstance().findAllOneProduct();
		Condition[] arrCondition;
		
		switch (type) {
		case "new":
			arrCondition = new Condition[1];
			arrCondition[0] = new Condition("quantity", 0, ">");
			listProduct = ProductService.getInstance().findAll(new PageRequest(currentPage, itemPerPage, new Sorter("desc", "id"), arrCondition));
			numberPage = new NumberPage(itemPerPage, ProductService.getInstance().findAll(null).size()).getNumberPage();
			request.setAttribute("listImage", listImage);
			request.setAttribute("numberPage", numberPage);
			request.setAttribute("listProduct", listProduct);
			request.getRequestDispatcher("views/web/newproduct.jsp").forward(request, response);
			break;
		case "category":
			arrCondition = new Condition[2];
			arrCondition[0] = new Condition("sub_category_id", categoryId, "=");
			arrCondition[1] = new Condition("quantity", 0, ">");
			listProduct = ProductService.getInstance().findAll(new PageRequest(currentPage, itemPerPage,
					new Sorter("desc", "id"), arrCondition));
			numberPage = new NumberPage(itemPerPage, ProductService.getInstance().findAll(new PageRequest(null, null, new Sorter("desc", "id"), arrCondition)).size()).getNumberPage();
			request.setAttribute("categoryId", categoryId);
			request.setAttribute("listImage", listImage);
			request.setAttribute("numberPage", numberPage);
			request.setAttribute("listProduct", listProduct);
			request.getRequestDispatcher("views/web/allproduct.jsp").forward(request, response);
			break;
		case "search":
			String search = request.getParameter("search");
			List<Condition> listCondition = new ArrayList<>();
			// tìm tên có chứa cụm từ
			listCondition.add(new Condition("name", "'%" + search + "%'", "like"));
			listCondition.add(new Condition("name", "'%" + search + "'", "like"));
			listCondition.add(new Condition("name", "'" + search + "%'", "like"));
			
			// convert from list to array
			arrCondition = new Condition[listCondition.size()];
			listCondition.toArray(arrCondition);
			numberPage = new NumberPage(itemPerPage, ProductService.getInstance().findByName(new PageRequest(null, null, null, arrCondition)).size()).getNumberPage();
			listProduct = ProductService.getInstance().findByName(new PageRequest(currentPage, itemPerPage,
					null, arrCondition));
			request.setAttribute("search", search);
			request.setAttribute("listImage", listImage);
			request.setAttribute("numberPage", numberPage);
			request.setAttribute("listProduct", listProduct);
			request.getRequestDispatcher("views/web/searchedproducts.jsp").forward(request, response);
			break;
		default:
			break;
		}	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
