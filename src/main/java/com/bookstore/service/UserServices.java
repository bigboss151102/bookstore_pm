package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Users;

public class UserServices {
	

	private UserDAO userDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	
	public UserServices(HttpServletRequest request, HttpServletResponse response)
	{
		this.request = request;
		this.response = response;
	
		userDAO = new UserDAO();
	}
	
	public void listUser() throws ServletException, IOException
	{
		listUser(null);
	}
	
	public void listUser(String message) throws ServletException, IOException {
		
		
		String indexPage = request.getParameter("page");
		if(indexPage == null)
		{
			indexPage = "1";
		}
		
		int index = Integer.parseInt(indexPage);

		if(message != null)
		{
			request.setAttribute("message",message);
		}
		
		long count = userDAO.count();
		long endPage =  (count/4);
		if(count % 4 != 0)
		{
			endPage ++;
		}
		
		List<Users> listUsers = userDAO.findAllPagedUser(index);

		request.setAttribute("listUsers",listUsers);
		
		request.setAttribute("endPage", endPage);
		request.setAttribute("index", index);
		String listPage = "user_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}
	
	public void createUser() throws ServletException, IOException
	{
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		Users exisUser = userDAO.findByEmail(email);
		
		if(exisUser != null)
		{
			String message = "Email: " + email + " already exists";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		}else {
				Users newUser = new Users(email, fullname, password);
				userDAO.create(newUser);
				listUser("New User created successfully");
		}
	}

	public void editUser() throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("id"));
		Users user = userDAO.get(userId);
		
		String editPage = "user_form.jsp";
		request.setAttribute("user", user);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		
		Users userById = userDAO.get(userId);
		Users userByEmail = userDAO.findByEmail(email);
		
		if(userByEmail != null && userById.getUserId() != userByEmail.getUserId())
		{
			String message = "This email " + email + " is already exist !";
			request.setAttribute("message",message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
			
		}else
		{
			Users user = new Users(userId, email, fullname, password);
			userDAO.update(user);
			String message = "User updated successfully";
			listUser(message);
		}
		
	}

	public void deleteUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		userDAO.delete(userId);
		
		String message = "Delete successfully !";
		listUser(message);
		
	}

	public void login() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		boolean loginResult = userDAO.checkLogin(email, password);
		
		if(loginResult)
		{
			request.getSession().setAttribute("useremail", email);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/");
			dispatcher.forward(request, response);
		}else {
			String message = "Login Failed. Please try again !";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
