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
import ego.wear.model.ImageModel;
import ego.wear.service.impl.ImageService;
import ego.wear.util.FormatPriceUtil;
import ego.wear.util.RequestSetAttributeUtil;
import ego.wear.util.SessionUtil;

/**
 * Servlet implementation class CartController
 */
@WebServlet(urlPatterns = {"/cart"})
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		List<ImageModel> listImage = ImageService.getInstance().findAllOneProduct();
		Map<Long, ItemCart> cart = (HashMap<Long, ItemCart>) SessionUtil.getInstance().getValue(request, "cart");
		int total = 0;
		if(cart != null) {
			for (Map.Entry<Long, ItemCart> entry : cart.entrySet()) {
				total += entry.getValue().getPrice() * entry.getValue().getQuantity();
			}
		}
		RequestSetAttributeUtil.setCategory(request);
		request.setAttribute("listImage", listImage);
		request.setAttribute("total", FormatPriceUtil.formatPrice(total));
		request.getRequestDispatcher("views/web/cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
