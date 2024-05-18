package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

public class userDAOTest {

	private static UserDAO userDAO;
	
	
	@BeforeClass
	public static void setUpClass() throws Exception
	{
		
		userDAO = new UserDAO();
	}
	
	
	@AfterClass
	public static void tearDownClass() {
		userDAO.close();
	}
	@Test
	public void testCreateUsers() {
		Users user1 = new Users();
		user1.setEmail("NguyenVanSi@gmail.com");
		user1.setFullName("Nguyen Van Si");
		user1.setPassword("123456789");
		
		user1 = userDAO.create(user1);
	
		assertTrue(user1.getUserId() > 0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUserFieldNotSet()
	{
		Users user1 = new Users();
		user1 = userDAO.create(user1);
	}
	
	@Test
	public void testUpdateUsers()
	{
		Users user = new Users();
		user.setUserId(1);
		user.setEmail("hoangtrong151102@gmail.com");
		user.setFullName("Hoang Cong Trong");
		user.setPassword("mysecret");
		
		
		user = userDAO.update(user);
		
		String expected = "mysecret";
		String actual = user.getPassword();
		assertEquals(expected, actual);
	}
	
	
	@Test
	public void testGetUserFound()
	{
		Integer userId = 1;
		Users user = userDAO.get(userId);
		if(user != null)
		{
			System.out.println(user.getEmail());
		}
		assertNotNull(user);
	}
	
	@Test
	public void testUsersNotFound()
	{
		Integer userId = 99;
		Users user = userDAO.get(userId);
		assertNull(user);
	}
	 
	@Test
	public void testDeleteUsers()
	{
		Integer userId = 17;
		userDAO.delete(userId);
		
		Users user = userDAO.get(userId);
		assertNull(user);
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void testDeleteNonExist()
	{
		Integer id = 17;
		userDAO.delete(id);
	}
	
	@Test
	public void testListAll()
	{
		List<Users> listUsers	 = userDAO.listAll();	
		for(Users user : listUsers)
		{
			System.out.println(user.getEmail());
		}
		assertTrue(listUsers.size() > 0);
		
	}
	
	
	@Test
	public void testCount()
	{
		long totalUsers = userDAO.count();
		System.out.println(totalUsers);
		assertTrue(totalUsers > 0);
	}
	
	
	@Test
	public void testFindEmail()
	{
		String email = "hoangcongtrong054@gmail.com";
		Users users = userDAO.findByEmail(email);
		
		assertNotNull(users);
	}
	
	@Test
	public void testCheckLoginSuccess() {
		String email="levannam@gmail.com";
		String password="123456vht@";
		
		boolean loginResult = userDAO.checkLogin(email, password);
		
		assertTrue(loginResult);
	}
	
	@Test
	public void testCheckLoginFail()
	{
		String email="levannam999@gmail.com";
		String password="123456vht@";
		
		boolean loginResult = userDAO.checkLogin(email, password);
		
		assertFalse(loginResult);
	}
	
	@Test
	public void testPage()
	{
		List<Users> listUsers = userDAO.findAllPagedUser(2);
		for(Users user : listUsers)
		{
			System.out.println(user.getFullName());
		}
		assertTrue(listUsers.size() > 0);
	}


}
