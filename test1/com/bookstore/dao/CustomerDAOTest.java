package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customer;

public class CustomerDAOTest {
	private static CustomerDAO customerDAO;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDAO = new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDAO.close();
	}

	@Test
	public void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEmail("customertest054@gmail.com");
		customer.setFirstname("Hoang");
		customer.setLastname("Trong");
		customer.setCity("Hue");
		customer.setState("Hue");
		customer.setCountry("Viet Nam");
		customer.setAddressLine1("62 Ngo Si Lien");
		customer.setAddressLine2("Hoa Khanh Bac, Quan Lien Chieu");
		customer.setPassword("secret");
		customer.setPhone("0932441896");
		customer.setZipcode("1122334455");
		
		Customer savedCustomer =  customerDAO.create(customer);
		assertTrue(savedCustomer.getCustomerId() > 0);
	}
	
	@Test
	public void testGet()
	{
		Integer customerId = 12;
		Customer customer = customerDAO.get(customerId);
		assertNotNull(customer);
	}
	
	@Test
	public void testUpdateCustomer()
	{
		Customer customer = customerDAO.get(12);
		String firstName = "Cong Hoang";
		customer.setFirstname(firstName);
		customer.setPassword("123456789");
		Customer updatedCustomer = customerDAO.update(customer);
		assertTrue(updatedCustomer.getFirstname().equals(firstName));
	}
	
	
	@Test
	public void testDeleteCustomer()
	{
		Integer customerId = 12;
		customerDAO.delete(customerId);
		Customer customer = customerDAO.get(customerId);
		
		assertNull(customer);
	}
	
	
	@Test
	public void testListAll()
	{
		List<Customer> lisCustomers = customerDAO.listAll();
		for(Customer customer : lisCustomers)
		{
			System.out.println(customer.getFirstname());
		}
		assertFalse(lisCustomers.isEmpty());
	}
	@Test
	public void testCount() {
		long totalCustomers = customerDAO.count();
		assertEquals(7, totalCustomers);
	}
	@Test
	public void testFindByEmail() {
		String email = "hoangcongtrong054@gmail.com";
		Customer customer = customerDAO.findByEmail(email);
		assertNotNull(customer);
	}
	@Test
	public void testCheckLoginSuccess()
	{
		String email = "hoangcongtrong054@gmail.com";
		String password = "secret";
		
		Customer customer = customerDAO.checkLogin(email, password);
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckLoginFail()
	{
		String email = "hoangcongtrong054@gmail.com";
		String password = "secrett";
		
		Customer customer = customerDAO.checkLogin(email, password);
		assertNull(customer);
	}
}
