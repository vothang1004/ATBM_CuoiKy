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

import ego.wear.cart.ItemCart;
import ego.wear.model.AddressModel;
import ego.wear.model.ImageModel;
import ego.wear.model.ProductModel;
import ego.wear.model.UserModel;
import ego.wear.service.impl.AddressService;
import ego.wear.service.impl.ImageService;
import ego.wear.service.impl.ProductService;
import ego.wear.util.FormatPriceUtil;
import ego.wear.util.RequestSetAttributeUtil;
import ego.wear.util.SessionUtil;

/**
 * Servlet implementation class PayController
 */
@WebServlet(urlPatterns = { "/pay" })
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PayController() {
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

		Map<Long, ItemCart> cart = (HashMap<Long, ItemCart>) SessionUtil.getInstance().getValue(request, "cart");
		int total = 0;
		for (Map.Entry<Long, ItemCart> entry : cart.entrySet()) {
			total += entry.getValue().getPrice() * entry.getValue().getQuantity();
		}
		List<ImageModel> listImage = ImageService.getInstance().findAllOneProduct();
		// get address
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "user");
		if (user == null) {
			response.sendRedirect(request.getServletContext().getContextPath() + "/login");
		}
		List<AddressModel> listAddress = AddressService.getInstance().findByIdUser(user.getId());

		RequestSetAttributeUtil.setCategory(request);
		if (listAddress != null) {
			request.setAttribute("addresses", listAddress);
		}
		request.setAttribute("listImage", listImage);
		request.setAttribute("user", user);
		request.setAttribute("total", FormatPriceUtil.formatPrice(total));
		request.getRequestDispatcher("views/web/pay.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HsttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "user");
		if (user == null) {
			response.sendRedirect(request.getServletContext().getContextPath() + "/login");
		} else {
			ItemCart item = null;
			long id = Long.parseLong(request.getParameter("id"));
			String size = request.getParameter("size" + id);
			int quantity = 1;
			ProductModel product = ProductService.getInstance().findById(id);
			if (request.getParameter("number") != null) {
				quantity = Integer.parseInt(request.getParameter("number"));
				if (product.getQuantity() < quantity) {
					quantity = product.getQuantity();
				}
			}
			Map<Long, ItemCart> cart = (HashMap<Long, ItemCart>) SessionUtil.getInstance().getValue(request, "cart");
			if (cart != null) {
				if (cart.containsKey(id)) {
					item = cart.get(id);
					if (product.getQuantity() - item.getQuantity() >= quantity) {
						item.setQuantity(item.getQuantity() + quantity);
					}

				} else {
					item = new ItemCart(product.getId(), product.getName(), quantity, product.getPriceSale(), size);
					cart.put(id, item);
				}
			} else {
				cart = new HashMap<Long, ItemCart>();
				item = new ItemCart(product.getId(), product.getName(), quantity, product.getPriceSale(), size);
				cart.put(id, item);
			}
			SessionUtil.getInstance().putValue(request, "cart", cart);
			int total = 0;
			for (Map.Entry<Long, ItemCart> entry : cart.entrySet()) {
				total += entry.getValue().getPrice() * entry.getValue().getQuantity();
			}
			List<ImageModel> listImage = ImageService.getInstance().findAllOneProduct();
			List<AddressModel> listAddress = AddressService.getInstance().findByIdUser(user.getId());

			RequestSetAttributeUtil.setCategory(request);
			if (listAddress != null) {
				request.setAttribute("addresses", listAddress);
			}

			RequestSetAttributeUtil.setCategory(request);
			request.setAttribute("listImage", listImage);
			request.setAttribute("total", FormatPriceUtil.formatPrice(total));
			request.getRequestDispatcher("views/web/pay.jsp").forward(request, response);
		}

	}

}
