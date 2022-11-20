package ego.wear.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.model.ImageModel;
import ego.wear.model.ProductModel;
import ego.wear.service.impl.ImageService;
import ego.wear.util.SortAndFilterUtil;

/**
 * Servlet implementation class AllProductAjaxController
 */
@WebServlet(urlPatterns = { "/api-allproduct" })
public class AllProductAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AllProductAjaxController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		int itemPerPage = 12;
		long categoryId = 0;
		if (request.getParameter("id") != null) {
			categoryId = Long.parseLong(request.getParameter("id"));
		}
		String type = request.getParameter("type");
		int currentPage = Integer.parseInt(request.getParameter("page"));
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		String filterBrand = request.getParameter("brand");
		String filterMaterial = request.getParameter("material");
		String filterPrice = request.getParameter("price");
		if (sort == null) {
			sort = "default";
		}
		if (filterBrand == null) {
			filterBrand = "default";
		}
		if (filterMaterial == null) {
			filterMaterial = "default";
		}
		if (filterPrice == null) {
			filterPrice = "default";
		}
		List<ProductModel> listProduct = new SortAndFilterUtil(type, search, sort, currentPage, itemPerPage,
				filterBrand, filterMaterial, filterPrice, categoryId).getListResult();
		List<ImageModel> listImage = ImageService.getInstance().findAllOneProduct();

		PrintWriter writer = response.getWriter();
		if (listProduct.size() > 0) {
			for (ProductModel p : listProduct) {
				// product start
				writer.println("<div class='col l-3 m-6 c-4 min-6'>");
				if (p.getSalePercent() != 0) {
					writer.println("<div class='product product--sale'>");
				} else {
					writer.println("<div class='product'>");
				}
				// banner sale start
				writer.println(" <div class='product-sale'>" +
						" <div style='--rotate: 2' class='product-sale__item'></div>" +
						" <div style='--rotate: 1' class='product-sale__item'></div>" +
						" <div style='--rotate: 0' class='product-sale__item'>" +
						" <span>Giảm</span> <span>" + p.getSalePercent() + "%</span>" +
						"  </div>" +
						"  </div>");
				// banner sale end

				// product image start
				for (ImageModel img : listImage) {
					if (img.getProductId() == p.getId()) {
						if (img.getIsLinkOnline()) {
							writer.println(
									"<a href='/ATBM_CuoiKy/productdetail?id=" + p.getId() + "' class='product__img'" +
											"style='background-image: url(" + img.getLink() + ")'>");
						} else {
							writer.println(
									"<a href='/ATBM_CuoiKy/productdetail?id=" + p.getId() + "' class='product__img'" +
											"style='background-image: url(upload/" + img.getLink() + ")'>");
						}

					}
				}
				writer.println("<form data-id='" + p.getId()
						+ "' action='pay' method='post' class='hide-on-taplet product__size'>");
				writer.println("<div class='product__size-wrap'>" +
						"<input checked class='product__size-option' hidden type='radio' value='S' name='size"
						+ p.getId() + "'" +
						" id='s" + p.getId() + "'>" +
						"<label for='s" + p.getId() + "' class='product__size-label'>S</label>" +
						" <input class='product__size-option' hidden type='radio' value='M' name='size" + p.getId()
						+ "'" +
						" id='m" + p.getId() + "'>" +
						" <label for='m" + p.getId() + "' class='product__size-label'>M</label>" +
						" <input class='product__size-option' hidden type='radio' value='L' name='size" + p.getId()
						+ "'" +
						"  id='l" + p.getId() + "'>" +
						"  <label for='l" + p.getId() + "' class='product__size-label'>L</label>" +
						"<input type='text' hidden value='" + p.getId() + "' name='id' />" +
						" </div>");
				writer.println("</form>");
				writer.println("</a>");
				// product image end

				// product info start
				writer.println("<div class='product__info'>");
				writer.println("<p class='product__brand'>" + p.getBranch() + "</p>");
				writer.println("<p data-id='" + p.getId() + "' class='product__name'>" + p.getName() + "</p>");

				writer.println("<div class='product__action'>");
				writer.println("<div class='product__action-wrap'>");
				writer.println("<div class='product__price'>");
				if (p.getSalePercent() != 0) {
					writer.println("<span class='product__price-sell'>" + p.getPriceSaleFormat() + " đ</span>");
				} else {
					writer.println("<span class='product__price-sell'>" + p.getPriceFormat() + " đ</span>");
				}
				if (p.getSalePercent() != 0) {
					writer.println("<span class='product__price-sale'>" + p.getPriceFormat() + " đ</span>");
				} else {
					writer.println("<span class='product__price-sale'></span>");
				}

				writer.println("</div>");
				writer.println("<div class='product__action-option'>" +
						"<button onclick='handleLike.bind(this)()' data-id='" + p.getId()
						+ "' class='btn-action prouct__action-like'>" +
						" <i class='far fa-heart'></i>\r\n" +
						" </button>" +
						" <button onclick='handleCart.bind(this)()' data-id='" + p.getId()
						+ "' class='btn-action product__action-cart'>" +
						"  <i class='fas fa-shopping-basket'></i>" +
						" </button>" +
						" <button onclick='handleBuy.bind(this)()' data-id='" + p.getId()
						+ "' class='btn-action product__action-buy'>" +
						"  <i class='fas fa-shopping-basket'></i> Mua ngay" +
						" </button>" +
						"  </div>");
				writer.println("</div>");
				writer.println("</div>");
				writer.println("</div>");
				writer.println("</div>");
				// product info end

				// product end
				writer.println("</div></div>");
			}
		} else {
			writer.println("<p class='text-info'>KHÔNG CÓ SẢN PHẨM TRÙNG KHỚP</p>"
					+ "<p class='text-info--sub'>(<i>Gợi ý: Giảm bớt tiêu chí lọc<i/>)</p>");
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
