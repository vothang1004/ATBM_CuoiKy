package ego.wear.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.model.CategoryModel;
import ego.wear.pagination.IPageble;
import ego.wear.pagination.NumberPage;
import ego.wear.pagination.PageRequest;
import ego.wear.service.impl.CategoryService;
import ego.wear.sort.Sorter;

/**
 * Servlet implementation class AdminCategoryController
 */
@WebServlet(urlPatterns = {"/admin-category"})
public class AdminCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int itemPerPage = 4;
		
		int numberPage = new NumberPage(itemPerPage, CategoryService.getInstance().findAll().size()).getNumberPage();
		IPageble pageble = new PageRequest(currentPage, itemPerPage, new Sorter("asc", "id"), null);
		List<CategoryModel> listCategory = CategoryService.getInstance().findAllPagination(pageble);
		
		request.setAttribute("numberPage", numberPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("listCategory", listCategory);
		request.getRequestDispatcher("views/admin/category.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
