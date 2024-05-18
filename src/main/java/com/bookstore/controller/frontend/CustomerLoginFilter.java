package com.bookstore.controller.frontend;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@WebFilter("/*")
public class CustomerLoginFilter extends HttpFilter implements Filter {
    
	private static final String[] loginquiredUrls = {"/view_profile", "/edit_profile", 
			"/update_profile", "/write_review", "/checkout","/place_order", "/view_orders","/show_order_details","/view_cart"};

    public CustomerLoginFilter() {
        super();
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false);
		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
		
		String  requestURL = httpRequest.getRequestURL().toString();
		
		if(path.startsWith("/admin/"))
		{
			chain.doFilter(request, response);
			return;
		}
		boolean loggedIn = session != null &&  session.getAttribute("loggedCustomer") != null;
		
		if(!loggedIn && isLoginRequired(requestURL))
		{
			String queryString = httpRequest.getQueryString(); // Một phần URL được gửi từ trình duyệt của người dùng khi gửi yêu cầu HTTP GET
			String redirectURL = requestURL; 
			if(queryString != null)
			{
				redirectURL = redirectURL.concat("?").concat(queryString);	// ghép redirectURL, dấu "?" với queryString thành một chuỗi mới
			}
			session.setAttribute("redirectURL", redirectURL);
			String loginPage = "frontend/login.jsp";
			RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginPage);
			dispatcher.forward(request, response);
		}else {
			chain.doFilter(request, response);
		}
	}
	
	private boolean isLoginRequired(String requestURL)
	{
		for(String loginRequiredURL : loginquiredUrls)
		{
			if(requestURL.contains(loginRequiredURL))
			{
				return true;
			}
		}
		return false;
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
