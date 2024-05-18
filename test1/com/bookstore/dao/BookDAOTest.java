package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.entity.Users;

public class BookDAOTest{

	private static BookDAO bookDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
		bookDAO = new BookDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		bookDAO.close();
	}

	@Test
	public void testCreateBook() throws ParseException, IOException {
		Book newBook = new Book();
		
		Category category = new Category("Programming");
		category.setCategoryId(14);
		newBook.setCategory(category);
		
		newBook.setTitle("Effective Java");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		newBook.setPrice(38.87f);
		newBook.setIsbn("0321356683");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");
		newBook.setPublishDate(publishDate);
		
		String iamagePath = "C:\\Java\\Material Book\\books\\Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(iamagePath));
		newBook.setImage(imageBytes);
		
		Book createdBook = bookDAO.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
	}
	
	@Test
	public void testCreateSecondBook() throws ParseException, IOException {
		Book newBook = new Book();
		
		Category category = new Category("Programming");
		category.setCategoryId(14);
		newBook.setCategory(category);
		
		newBook.setTitle("Java 8 in Action");
		newBook.setAuthor("Alan Mycroft");
		newBook.setDescription("java 8 in Action is a clearly written guide to the new features of Java 8");
		newBook.setPrice(36.72f);
		newBook.setIsbn("1617291994");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("08/28/2014");
		newBook.setPublishDate(publishDate);
		
		String iamagePath = "C:\\Java\\Material Book\\books\\Java 8 in Action.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(iamagePath));
		newBook.setImage(imageBytes);
		
		Book createdBook = bookDAO.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
	}
	
	@Test
	public void testUpdateBook() throws ParseException, IOException {
		Book existBook = new Book();
		existBook.setBookId(1);
		
		Category category = new Category("Technology");
		category.setCategoryId(15);
		existBook.setCategory(category);
		
		existBook.setTitle("Effective Java (3rd Edition)");
		existBook.setAuthor("Joshua Bloch");
		existBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		existBook.setPrice(40f);
		existBook.setIsbn("0321356683");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");
		existBook.setPublishDate(publishDate);
		
		String iamagePath = "C:\\Java\\Material Book\\books\\Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(iamagePath));
		existBook.setImage(imageBytes);
		
		Book updatedBook = bookDAO.update(existBook);
		
		assertEquals(updatedBook.getTitle(),"Effective Java (3rd Edition)");
	}

	@Test(expected = EntityNotFoundException.class)
	public void testDeleteBookFail() {
		Integer bookId = 100;
		bookDAO.delete(bookId);
	}
	
	@Test
	public void testDeleteBookSuccess() {
		Integer bookId = 1;
		bookDAO.delete(bookId);
		assertTrue(true);
	}
	
	
	@Test
	public void testGetBookFail()
	{
		Integer bookId = 99;
		Book book = bookDAO.get(bookId);
		
		assertNull(book);
	}
	
	@Test
	public void testGetBookSuccess()
	{
		Integer bookId = 2;
		Book book = bookDAO.get(bookId);
		
		assertNotNull(book);
	}
	
	@Test
	public void testListAll()
	{
		List<Book> listBooks = bookDAO.listAll();
		for(Book abook : listBooks)
		{
			System.out.println(abook.getTitle() + " - " + abook.getAuthor());
		}
		assertFalse(listBooks.isEmpty());
	}
	
	@Test
	public void testFindByTitleNotExist()
	{
		String title = "Thinkin in Java";
		Book book = bookDAO.findByTitle(title);
		
		assertNull(book);
	}
	
	@Test
	public void testFindByTitleExist()
	{
		String title = "Java 8 in Action";
		Book book = bookDAO.findByTitle(title);
		
		System.out.println(book.getAuthor());
		System.out.println(book.getPrice());
		
		assertNotNull(book);
	}
	
	@Test
	public void testCount() {
		long totalBooks = bookDAO.count();
		assertEquals(2, totalBooks);
	}
	
	@Test
	public void testListByCategory() {
		int categoryId = 14;
		
		List<Book> listBooks = bookDAO.listByCategory(categoryId);
		
		assertTrue(listBooks.size() > 0);
	}
	
	@Test
	public void testListNewBook() {
		
		List<Book> result = bookDAO.listNewBook();
		for(Book abook : result)
		{
			System.out.println(abook.getTitle() + " - " + abook.getPublishDate());
		}
		assertEquals(4, result.size());
	}
	
	@Test
	public void testSearchBookInTitle() {
		String keyword = "Java";
		List<Book> result = bookDAO.search(keyword);
		
		for(Book aBook : result)
		{
			System.out.println(aBook.getTitle());
		}
		
		assertEquals(1, result.size());
	}
	
	@Test
	public void testSearchBookInAuthor() {
		String keyword = "Kathy";
		List<Book> result = bookDAO.search(keyword);
		
		for(Book aBook : result)
		{
			System.out.println(aBook.getTitle());
		}
		
		assertEquals(1, result.size());
	}
	
	@Test
	public void testSearchBookInDescription() {
		String keyword = "The Big Picture";
		List<Book> result = bookDAO.search(keyword);
		
		for(Book aBook : result)
		{
			System.out.println(aBook.getTitle());
		}
		
		assertEquals(1, result.size());
	}
	@Test
	public void testCountByCategory()
	{
		int categoryId = 10;
		
		long numOfBook = bookDAO.countByCategory(categoryId);
		assertTrue(numOfBook == 3);
	}
	
	@Test
	public void testListBestSellingBooks()
	{
		List<Book> topBestSellingBooks = bookDAO.listBestSellingBooks();
		for(Book book : topBestSellingBooks)
		{
			System.out.println(book.getTitle());
		}
		assertEquals(4, topBestSellingBooks.size());
	}
	
	@Test
	public void testListMostFavoredBooks()
	{
		List<Book> topFavoredBooks = bookDAO.listMostFavoreBooks();
		for(Book book : topFavoredBooks)
		{
			System.out.println(book.getTitle());
		}
		assertEquals(4, topFavoredBooks.size());
	}
	
	@Test
	public void testPage()
	{
		List<Book> listBooks = bookDAO.findAllPagedBook(1);
		for(Book book : listBooks)
		{
			System.out.println(book.getTitle());
		}
		assertTrue(listBooks.size() > 0);
	}
	
	@Test
	public void testPageByCategory()
	{
		Integer categoryId = 14; 
		int page = 2;
		List<Book> listBooks = bookDAO.findAllPagedBookByCategory(categoryId, page);
		for(Book book : listBooks)
		{
			System.out.println(book.getTitle());
		}
		assertTrue(listBooks.size() > 0);
	}
}
