package ego.wear.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.model.UserModel;
import ego.wear.service.impl.UserService;
import ego.wear.util.MD5Util;
import ego.wear.util.SendMailUtil;

/**
 * Servlet implementation class SignupController
 */
@WebServlet(urlPatterns = {"/signup"})
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		 
		String message = (String) request.getAttribute("message");
		UserModel user = (UserModel) request.getAttribute("user");
		if(message != null) {
			request.setAttribute("message", message);
		}
		request.getRequestDispatcher("views/web/signup.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phonenumber");
		String password = request.getParameter("password");
		int roleId = Integer.parseInt(request.getParameter("role"));
		
		if(UserService.getInstance().isUniqueUsername(username)) {
			UserModel user = UserService.getInstance().insert(new UserModel(0, null, new Timestamp(System.currentTimeMillis()),
					null, null, username, MD5Util.getInstance().getMD5(password), phoneNumber, email, 1, roleId));
			if(user != null) {
//				SendMailUtil.getInstance().sendRegisterSuccess(user.getEmail());
				response.sendRedirect(request.getServletContext().getContextPath() + "/login");
			}else {
				request.setAttribute("message", "Đăng ký không thành công");
				doGet(request, response);
			}
		}else {
			request.setAttribute("message", "Tên đăng nhập đã tồn tại");
			doGet(request, response);
		}
		
	}

}
