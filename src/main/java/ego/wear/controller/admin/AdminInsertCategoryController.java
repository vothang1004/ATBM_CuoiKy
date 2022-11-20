package ego.wear.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.model.CategoryModel;
import ego.wear.service.impl.CategoryService;
import ego.wear.util.GenerateCode;

/**
 * Servlet implementation class AdminInsertCategoryController
 */
@WebServlet(urlPatterns = {"/admin-editcategory", "/admin-insertcategory", "/admin-deletecategory"})
public class AdminInsertCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		if(request.getParameter("type") != null && request.getParameter("type").equals("delete")) {
			long id = Long.parseLong(request.getParameter("id"));
			int result = CategoryService.getInstance().delete(id);
			if(result > 0) {
				response.sendRedirect(request.getServletContext().getContextPath() + "/admin-category");
			}
			return;
		}
		long id = 0;
		if(request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
			CategoryModel categoryModel = CategoryService.getInstance().findById(id);
			
			request.setAttribute("categoryModel", categoryModel);
			request.getRequestDispatcher("views/admin/insertcategory.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("views/admin/insertcategory.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		CategoryModel cateModel = null;
		if(type.equals("add")) {
		CategoryModel cate = new CategoryModel(0, "", null, name, null, name, GenerateCode.generateCode(name));
		cateModel = CategoryService.getInstance().insert(cate);
		}else if(type.equals("update")) {
			long id = Long.parseLong(request.getParameter("id"));
			CategoryModel cate = CategoryService.getInstance().findById(id);
			cate.setName(name);
			cateModel = CategoryService.getInstance().update(cate);
		}else if(type.equals("delete")) {
			String ids = request.getParameter("deleteId");
			
		}
		
		if(cateModel != null) {
			response.sendRedirect(request.getServletContext().getContextPath() + "/admin-category");
		}
		
	}
	
}
