package ego.wear.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.model.UserModel;
import ego.wear.service.impl.UserService;
import ego.wear.signature.RSA;
import ego.wear.util.MD5Util;
import ego.wear.util.SessionUtil;

/**
 * Servlet implementation class LoginController
 */
@WebServlet(urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
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
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "user");
		if (user != null) {
			response.sendRedirect("home");
		} else {
			String message = (String) request.getAttribute("message");
			if (message != null) {
				request.setAttribute("message", message);
			}
			request.getRequestDispatcher("views/web/login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String passwordEnCrypt = request.getParameter("password-encrypt");

		UserModel user = UserService.getInstance().checkUser(username, MD5Util.getInstance().getMD5(password));
		if (user != null) {
			try {
				RSA rsa = new RSA();
				String passwordDecrypt = "";
				try {
					passwordDecrypt = rsa.decryptByPublicKey(passwordEnCrypt, rsa.getAsPublicKey(user.getPublicKey()));
				} catch (Exception e) {
					request.setAttribute("message", "Chu???i m?? h??a kh??ng ????ng ?????nh d???ng");
					doGet(request, response);
					return;
				}
				if (passwordDecrypt.equals(password)) {
					SessionUtil.getInstance().putValue(request, "user", user);
					if (user.getRoleId() == 1) {
						response.sendRedirect(request.getServletContext().getContextPath() + "/admin-home");
					} else if (user.getRoleId() == 2) {
						response.sendRedirect(request.getServletContext().getContextPath() + "/home");
					}
				} else {
					request.setAttribute("message", "Kh??a b?? m???t kh??ng tr??ng kh???p");
					doGet(request, response);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			request.setAttribute("message", "T??n ????ng nh???p ho???c m???t kh???u kh??ng ????ng");
			doGet(request, response);
		}
	}

}
