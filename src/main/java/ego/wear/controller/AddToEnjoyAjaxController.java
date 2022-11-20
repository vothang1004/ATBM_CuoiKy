package ego.wear.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.model.ProductModel;
import ego.wear.model.UserModel;
import ego.wear.service.impl.ProductService;
import ego.wear.util.SessionUtil;

/**
 * Servlet implementation class AddToEnjoyAjaxController
 */
@WebServlet(urlPatterns = {"/api-enjoy"})
public class AddToEnjoyAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToEnjoyAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		
		long id = Long.parseLong(request.getParameter("id"));
		ProductModel product = ProductService.getInstance().findById(id);
		Map<Long, ProductModel> enjoy = (HashMap<Long, ProductModel>) SessionUtil.getInstance().getValue(request, "enjoy");
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "user");
		if(user == null) {
			writer.println("0");
		}else {
			if(enjoy != null) {
				if(enjoy.containsKey(id)) {
					enjoy.remove(id);
					if(enjoy.size() == 0) {
						SessionUtil.getInstance().removeValue(request, "enjoy");
						writer.println("-1"+"$"+"<b>"+enjoy.size()+"</b>");
						return;
					}else {
						writer.println("-1"+"$"+"<b>"+enjoy.size()+"</b>");
					}
				}else {
					enjoy.put(id, product);
					writer.println("<b>"+enjoy.size()+"</b>");
				}
			}else {
				enjoy = new HashMap<Long, ProductModel>();
				enjoy.put(id, product);
				writer.println("<b>"+enjoy.size()+"</b>");
			}
			SessionUtil.getInstance().putValue(request, "enjoy", enjoy);
		}
		writer.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
