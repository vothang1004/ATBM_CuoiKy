package ego.wear.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.model.ImageModel;
import ego.wear.model.ProductModel;
import ego.wear.service.impl.ImageService;
import ego.wear.util.RequestSetAttributeUtil;
import ego.wear.util.SessionUtil;

/**
 * Servlet implementation class EnjoyController
 */
@WebServlet(urlPatterns = {"/enjoy"})
public class EnjoyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnjoyController() {
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
	List<ImageModel> listImage = ImageService.getInstance().findAllOneProduct();
	HashMap<Long, ProductModel> enjoy = (HashMap<Long, ProductModel>)  SessionUtil.getInstance().getValue(request, "enjoy");
	if(enjoy != null) {
		request.setAttribute("enjoy", enjoy);
		request.setAttribute("listImage", listImage);
	}
	request.getRequestDispatcher("views/web/enjoy.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
