package ego.wear.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.model.ItemModel;
import ego.wear.model.OrderModel;
import ego.wear.model.UserModel;
import ego.wear.service.impl.ImageService;
import ego.wear.service.impl.ItemService;
import ego.wear.service.impl.OrderService;
import ego.wear.util.RequestSetAttributeUtil;
import ego.wear.util.SessionUtil;

/**
 * Servlet implementation class MyOrderController
 */
@WebServlet(urlPatterns = {"/myorder"})
public class MyOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "user");
		if(user == null) response.sendRedirect("/login");
		
		List<OrderModel> list = OrderService.getInstance().findByIdUser(user.getId());
		if(list != null) {
			Map<Long, List<ItemModel>> listItem = new HashMap<>();
			for(OrderModel orderModel: list) {
				List<ItemModel> items = ItemService.getInstance().findByIdOrder(orderModel.getId());
				listItem.put(orderModel.getId(), items);
			}
			request.setAttribute("images", ImageService.getInstance().findAllOneProduct());
			request.setAttribute("items", listItem);
			request.setAttribute("orders", list);
			RequestSetAttributeUtil.setCategory(request);
		}
		request.getRequestDispatcher("/views/web/myorder.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
