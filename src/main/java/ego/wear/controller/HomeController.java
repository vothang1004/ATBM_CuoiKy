package ego.wear.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.model.ImageModel;
import ego.wear.model.ProductModel;
import ego.wear.pagination.PageRequest;
import ego.wear.service.impl.ImageService;
import ego.wear.service.impl.ProductService;
import ego.wear.sort.Sorter;
import ego.wear.util.RequestSetAttributeUtil;
import ego.wear.util.SessionUtil;

/**
 * Servlet implementation class HomeController
 */
@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestSetAttributeUtil.setCategory(request);
		
		List<ProductModel> listTop4NewProduct = ProductService.getInstance().findAll(new PageRequest(1, 4, new Sorter("desc", "id"), null));
		List<ImageModel> listImage = ImageService.getInstance().findAllOneProduct();
		
		if(request.getParameter("action") != null) {
			String action = request.getParameter("action");
			if(action.equals("logout")) {
				SessionUtil.getInstance().removeValue(request, "user");
				SessionUtil.getInstance().removeValue(request, "cart");
				SessionUtil.getInstance().removeValue(request, "enjoy");
			}
		}
		
		request.setAttribute("listTop4NewProduct", listTop4NewProduct);
		request.setAttribute("listImage", listImage);
		request.getRequestDispatcher("views/web/home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
