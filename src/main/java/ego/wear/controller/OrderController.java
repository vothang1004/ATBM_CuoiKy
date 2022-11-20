package ego.wear.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

import ego.wear.cart.ItemCart;
import ego.wear.mapper.UserMapper;
import ego.wear.model.AddressModel;
import ego.wear.model.ItemModel;
import ego.wear.model.OrderModel;
import ego.wear.model.UserModel;
import ego.wear.service.impl.AddressService;
import ego.wear.service.impl.ItemService;
import ego.wear.service.impl.OrderService;
import ego.wear.util.SessionUtil;

/**
 * Servlet implementation class OrderController
 */
@WebServlet(urlPatterns = { "/order" })
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "user");
		Map<Long, ItemCart> cart = (HashMap<Long, ItemCart>) SessionUtil.getInstance().getValue(request, "cart");
		ItemModel item = null;
		if (cart != null) {
			// get parameters
			String province = request.getParameter("province").split("-")[0];
			String district = request.getParameter("district").split("-")[0];
			String village = request.getParameter("village");
			String detail = request.getParameter("detail");
			String note = request.getParameter("note");
			int totalPrice = 0;
			for (Map.Entry<Long, ItemCart> entry : cart.entrySet()) {
				totalPrice += entry.getValue().getTotalPrice();
			}
			// get three days after
			Date dt = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(dt);
			c.add(Calendar.DATE, 3);
			dt = c.getTime();
			OrderModel orderModel = new OrderModel(0, user.getUsername(), new Timestamp(System.currentTimeMillis()),
					"", null, totalPrice, "pending", new Timestamp(new Date().getTime()),
					new Timestamp(dt.getTime()), note, user.getId());
			// insert order into database
			OrderModel order = OrderService.getInstance().insert(orderModel);
			if (order != null) {
				// loop cart and insert item
				for (Map.Entry<Long, ItemCart> entry : cart.entrySet()) {
					item = new ItemModel(0, user.getUsername(), new Timestamp(System.currentTimeMillis()),
							"", null, entry.getValue().getName(), entry.getValue().getPrice(),
							entry.getValue().getQuantity(), entry.getKey(), order.getId(), entry.getValue().getSize());
					ItemService.getInstance().insert(item);
				}
				// remove cart
				SessionUtil.getInstance().removeValue(request, "cart");
				// insert address
				AddressModel addressModel = new AddressModel(0, user.getUsername(),
						new Timestamp(System.currentTimeMillis()),
						"", null, province, district, village, detail, user.getId());
				AddressService.getInstance().insert(addressModel);

				response.sendRedirect(request.getServletContext().getContextPath() + "/myorder");
			}
		}
	}

}
