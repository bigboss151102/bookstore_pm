package com.bookstore.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Customer;

import net.bytebuddy.asm.Advice.Local;

public class CustomerService {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CustomerDAO customerDAO;
	public CustomerService(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.customerDAO = new CustomerDAO();
	}
	
	public void listCustomers(String message) throws ServletException, IOException {
		
		String indexPage = request.getParameter("page");
		if(indexPage == null)
		{
			indexPage = "1";
		}
		
		int index = Integer.parseInt(indexPage);
		
		if(message != null)
		{
			request.setAttribute("message", message);
		}
		
		long count = customerDAO.count();
		long endPage = count/4;
		if(count % 4 != 0)
		{
			endPage++;
		}
		
		List<Customer> listCustomers = customerDAO.findAllPagedCustomer(index);
		request.setAttribute("listCustomers", listCustomers);
		request.setAttribute("endPage", endPage);
		request.setAttribute("index", index);
		String listPage = "customer_list.jsp";
		RequestDispatcher resRequestDispatcher = request.getRequestDispatcher(listPage);
		resRequestDispatcher.forward(request, response);
	}
	
	public void listCustomers() throws ServletException, IOException {
		listCustomers(null);
	}
	
	private void createAndUpdateAndRegisterForm(Customer customer)
	{
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String addressLine1 = request.getParameter("address1");
		String addressLine2 = request.getParameter("address2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");
		
		if(email != null && !email.equals("")) {
			customer.setEmail(email);
		}
		
		customer.setFirstname(firstName);
		customer.setLastname(lastName);
		
		if(password != null && !password.equals("")) {
			customer.setPassword(password);
		}
		customer.setPhone(phone);
		customer.setAddressLine1(addressLine1);
		customer.setAddressLine2(addressLine2);
		customer.setCity(city);
		customer.setState(state);
		customer.setZipcode(zipcode);
		customer.setCountry(country);
	}
	
	public void createCustomer() throws ServletException, IOException
	{
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);
		if(existCustomer != null)
		{
			String message = "Could not create new customer: the email " 
					+ email + " is already registered by another customer";
			listCustomers(message);
		}else {
			Customer newCustomer = new Customer();
			createAndUpdateAndRegisterForm(newCustomer);
			customerDAO.create(newCustomer);
			
			String message = "New customer has been created successfully";
			listCustomers(message);
		}
	}
	
	public void registerCustomer() throws ServletException, IOException
	{
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);
		String message = null;
		if(existCustomer != null)
		{
			message = "The email " 
					+ email + " is existed.Please try again with another email !";
			
		}else {
			
			Customer newCustomer = new Customer();
			createAndUpdateAndRegisterForm(newCustomer);
			customerDAO.create(newCustomer);
			message = "Registered is successfully ! " + "<a href='login'>Click here</a> to Login";

		}
		
		String messagePage = "frontend/message.jsp";
		RequestDispatcher resRequestDispatcher = request.getRequestDispatcher(messagePage);
		request.setAttribute("message", message);
		resRequestDispatcher.forward(request, response);
	}
	
	
	public void editCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		
		request.setAttribute("customer", customer);
		
		CommonUtility.generateCountryList(request);
		
		String editPage = "customer_form.jsp";
		RequestDispatcher resRequestDispatcher = request.getRequestDispatcher(editPage);
		resRequestDispatcher.forward(request, response);
		
	}

	public void updateCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");
		Customer existcustomer = customerDAO.findByEmail(email);
		String message = null;
		if(existcustomer != null && existcustomer.getCustomerId() != customerId)
		{
			 message = "Could not update the customer ID " + customerId
					+ " because existing customer having the same email.";
			 listCustomers(message);
		}else {

			
			Customer customerById = customerDAO.get(customerId);
			createAndUpdateAndRegisterForm(customerById);
			
			customerDAO.update(customerById);
			message = "The customer has been Updated successfully";
			listCustomers(message);
		}
		
		
	}

	public void deleteCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		
		if (customer != null) {
			ReviewDAO reviewDAO = new ReviewDAO();
			long reviewCount = reviewDAO.countByCustomer(customerId);
			if(reviewCount > 0)
			{
				String message = "Could not delete customer with ID " + customerId
						+ " because you have posted reviews for books.";
				listCustomers(message);
			}else {
				OrderDAO orderDAO = new OrderDAO();
				long orderCount = orderDAO.countByCustomer(customerId);
				if(orderCount > 0) {
					String message = "Could not delete customer with ID " + customerId 
							+ " because you have placed orders.";
					listCustomers(message);
				}else {
					customerDAO.delete(customerId);
					String message = "The customer has been deleted successfuly !";
					listCustomers(message);
				}
			}
		}else {
			String message = "Could not find customer with ID " + customerId;
			listCustomers(message);
		}

	}

	public void showLogin() throws ServletException, IOException {
		String loginPage = "frontend/login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(loginPage);
		dispatcher.forward(request, response);
		
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Customer customer = customerDAO.checkLogin(email, password);
		
		if(customer == null)
		{
			String message = "Login Fail.Please check your email and password";
			request.setAttribute("message", message);
			showLogin();
		}else {
			
			HttpSession session = request.getSession();
			session.setAttribute("loggedCustomer", customer);
			Object objRedirectURL = session.getAttribute("redirectURL");
			if(objRedirectURL != null)
			{
				String redirectURL = (String)objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			}else
			{
				//showCustomerProfile();
				response.sendRedirect(request.getContextPath() + "/");
			}

		}
	}
	
	public void showHomePage() throws ServletException, IOException
	{
		String homepage = "frontend/index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);
	}
	
	public void showCustomerProfile() throws ServletException, IOException
	{
		String profilePage = "frontend/customer_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(profilePage);
		dispatcher.forward(request, response);
	}

	public void showCustomerProfileForm() throws ServletException, IOException {
		CommonUtility.generateCountryList(request);
		String editPage = "frontend/edit_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
		dispatcher.forward(request, response);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer"); 
		createAndUpdateAndRegisterForm(customer);
		customerDAO.update(customer);
		showCustomerProfile();
		
	}

	public void newCustomer() throws ServletException, IOException {
		CommonUtility.generateCountryList(request);
		
		String customerForm = "customer_form.jsp";
		request.getRequestDispatcher(customerForm).forward(request, response);
	}

	
	public void showCustomerRegisterForm() throws ServletException, IOException
	{
		CommonUtility.generateCountryList(request);
		String registerForm = "frontend/register_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(registerForm);
		dispatcher.forward(request, response);
	}
}
