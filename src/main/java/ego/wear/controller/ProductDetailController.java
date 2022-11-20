package ego.wear.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.model.ProductModel;
import ego.wear.service.impl.ImageService;
import ego.wear.service.impl.ProductService;
import ego.wear.util.RequestSetAttributeUtil;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet(urlPatterns = {"/productdetail"})
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		RequestSetAttributeUtil.setCategory(request);
		
		long id = Integer.parseInt(request.getParameter("id"));
		ProductModel product = ProductService.getInstance().findById(id);
		if(product != null) {
			request.setAttribute("product", product);
			request.setAttribute("listImage", ImageService.getInstance().findByProductId(id));
		}	
		request.getRequestDispatcher("views/web/productdetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
