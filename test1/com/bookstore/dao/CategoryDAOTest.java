package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Category;
import com.bookstore.entity.Users;

public class CategoryDAOTest{

	private static CategoryDAO categoryDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
		categoryDAO = new CategoryDAO();
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		categoryDAO.close();
	}
	
	@Test
	public void testCreateCategory() {
		Category newCat = new Category("Sport");
		Category category = categoryDAO.create(newCat);
		
		assertTrue(category != null && category.getCategoryId() > 0);
		
	}

	@Test
	public void testUpdateCategory() {
		Category cat = new Category("Health Trong");
		cat.setCategoryId(6);
		Category category = categoryDAO.update(cat);
		assertEquals(cat.getName(), category.getName());
	}

	@Test
	public void testGet() {
		Integer catId = 2;
		Category cat = categoryDAO.get(catId);
		assertNotNull(cat);
	}

	@Test
	public void testDeleteCategory() {
		Integer catId = 19;
		categoryDAO.delete(catId);
		
		Category cat = categoryDAO.get(catId);
		
		assertNull(cat);
	}

	@Test
	public void testListAll() {
		List<Category> listCategorys = categoryDAO.listAll();
		for(Category category : listCategorys)
		{
			System.out.println(category.getName());
		}
		assertTrue(listCategorys.size() > 0);
	}

	@Test
	public void testCount() {
		long totalCategories = categoryDAO.count();
		assertTrue(totalCategories > 0); 
	}
	
	@Test
	public void testFindName() {
		String name = "Java";
		Category category = categoryDAO.findByName(name);
		
		assertNotNull(category);
	}
	
	
	@Test
	public void testFindNameNotFound() {
		String name = "Java2";
		Category category = categoryDAO.findByName(name);
		
		assertNull(category);
	}
	
	@Test
	public void testPage()
	{
		List<Category> listCategories = categoryDAO.findAllPagedCategory(1);
		for(Category category : listCategories)
		{
			System.out.println(category.getName());
		}
		assertTrue(listCategories.size() > 0);
	}

}
