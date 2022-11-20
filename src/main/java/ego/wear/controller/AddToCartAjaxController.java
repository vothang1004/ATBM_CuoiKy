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

import ego.wear.cart.ItemCart;
import ego.wear.model.ProductModel;
import ego.wear.model.UserModel;
import ego.wear.service.impl.ProductService;
import ego.wear.util.FormatPriceUtil;
import ego.wear.util.SessionUtil;

/**
 * Servlet implementation class AddToCartAjaxController
 */
@WebServlet(urlPatterns = { "/api-cart" })
public class AddToCartAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCartAjaxController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		PrintWriter writer = response.getWriter();
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "user");
		long id = Long.parseLong(request.getParameter("id"));
		String action = request.getParameter("action");
		String size = "";
		if (request.getParameter("size") != null) {
			size = request.getParameter("size");
		}
		if (user == null) {
			writer.println("0");
		} else {
			Map<Long, ItemCart> cart = (HashMap<Long, ItemCart>) SessionUtil.getInstance().getValue(request, "cart");
			ProductModel product = ProductService.getInstance().findById(id);
			ItemCart item = null;
			if (cart != null) {
				switch (action) {
					case "delete":
						cart.remove(id);
						if (cart.isEmpty()) {
							SessionUtil.getInstance().removeValue(request, "cart");
							writer.println("" + cart.size());
							break;
						} else {
							int total = 0;
							for (Map.Entry<Long, ItemCart> entry : cart.entrySet()) {
								total += entry.getValue().getPrice() * entry.getValue().getQuantity();
							}
							writer.println(cart.size() + "-" + FormatPriceUtil.formatPrice(total));
							SessionUtil.getInstance().putValue(request, "cart", cart);
							break;
						}
					case "plus":
						item = cart.get(id);
						if (product.getQuantity() - item.getQuantity() >= 1) {
							item.setQuantity(item.getQuantity() + 1);
							int total = 0;
							for (Map.Entry<Long, ItemCart> entry : cart.entrySet()) {
								total += entry.getValue().getPrice() * entry.getValue().getQuantity();
							}
							writer.println(item.getQuantity() + "-" + item.getTotalPriceFormat() + "-"
									+ FormatPriceUtil.formatPrice(total));
						} else {
							writer.println("0");
						}
						SessionUtil.getInstance().putValue(request, "cart", cart);
						break;
					case "minus":
						item = cart.get(id);
						if (item.getQuantity() > 1) {
							item.setQuantity(item.getQuantity() - 1);
							int total = 0;
							for (Map.Entry<Long, ItemCart> entry : cart.entrySet()) {
								total += entry.getValue().getPrice() * entry.getValue().getQuantity();
							}
							writer.println(item.getQuantity() + "-" + item.getTotalPriceFormat() + "-"
									+ FormatPriceUtil.formatPrice(total));
						} else {
							writer.println("0");
						}
						SessionUtil.getInstance().putValue(request, "cart", cart);
						break;
					default:
						if (cart.containsKey(product.getId())) {
							item = cart.get(product.getId());
							if (product.getQuantity() - item.getQuantity() >= 1) {
								item.setQuantity(item.getQuantity() + 1);
								writer.println("<b>" + cart.size() + "</b>");
							} else {
								writer.println("-1");
							}
						} else {
							item = new ItemCart(product.getId(), product.getName(), 1, product.getPrice(), size);
							cart.put(product.getId(), item);
							writer.println("<b>" + cart.size() + "</b>");
						}
						SessionUtil.getInstance().putValue(request, "cart", cart);
						break;
				}
			} else {
				cart = new HashMap<Long, ItemCart>();
				item = new ItemCart(product.getId(), product.getName(), 1, product.getPriceSale(), size);
				cart.put(item.getId(), item);
				writer.println("<b>" + cart.size() + "</b>");
				SessionUtil.getInstance().putValue(request, "cart", cart);
			}

		}
		writer.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
