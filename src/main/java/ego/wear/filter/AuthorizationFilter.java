package ego.wear.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ego.wear.model.UserModel;
import ego.wear.util.SessionUtil;

public class AuthorizationFilter implements Filter {
	private ServletContext context;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		String url = request.getRequestURI();
		if(url.startsWith("/admin")) {
			UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "user");
			if(user != null) {
				if(user.getRoleId() == 1) {
					chain.doFilter(servletRequest, servletResponse);
				}else if(user.getRoleId() == 2) {
					response.sendRedirect("/home");
				}
			}else {
				response.sendRedirect(request.getContextPath() + "/login");
			}
		}else {
			chain.doFilter(servletRequest, servletResponse);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
