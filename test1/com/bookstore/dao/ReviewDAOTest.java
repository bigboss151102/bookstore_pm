package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;
import com.bookstore.entity.Users;

public class ReviewDAOTest {
	
	private static ReviewDAO reviewDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		reviewDao = new ReviewDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		reviewDao.close();
	}

	@Test
	public void testCreateReview() {
		Review review = new Review();
		
		Book book = new Book();
		book.setBookId(11);
		
		Customer customer = new Customer();
		customer.setCustomerId(10);
		
		review.setBook(book);
		review.setCustomer(customer);
		review.setHeadline("Excellent book!");
		review.setRating(4);
		review.setComment("This book is very bad!.");
		
		Review savedReview = reviewDao.create(review);
		
		assertTrue(savedReview.getReviewId() > 0);
		
	}
	


	@Test
	public void testUpdateReview() {
		Integer reviewId = 1;
		Review review = reviewDao.get(reviewId);
		review.setHeadline("Excellent book");
		Review updatedReview = reviewDao.update(review);
		assertEquals(review.getHeadline(), updatedReview.getHeadline());
	}

	@Test
	public void testGet() {
		Integer reviewId = 1;
		Review review = reviewDao.get(reviewId);
		
		assertNotNull(review);
	}

	@Test
	public void testDeleteObject() {
		int reviewId = 1;
		reviewDao.delete(reviewId);
		
		Review review = reviewDao.get(reviewId);
		
		assertNull(review);
	}

	@Test
	public void testListAll() {
		List<Review> listReview = reviewDao.listAll();
		assertTrue(listReview.size() > 0);
		
	}

	@Test
	public void testCount() {
		long totalReviews = reviewDao.count();
		assertTrue(totalReviews > 0 );
	}
	
	@Test
	public void testFindByCustomerAndBookNotFound() {
		Integer customerId = 100;
		Integer bookId = 99;
		Review result = reviewDao.findByCustomerAndBook(customerId, bookId);
		assertNull(result);
	}
	@Test
	public void testFindByCustomerAndBookFound() {
		Integer customerId = 11;
		Integer bookId = 13;
		Review result = reviewDao.findByCustomerAndBook(customerId, bookId);
		assertNotNull(result);
	}
	
	@Test
	public void testListMostRecent()
	{
		List<Review> recentReview = reviewDao.listMostRecent();
		assertEquals(3, recentReview.size());
	}
	
	@Test
	public void testPage()
	{
		List<Review> listReviews = reviewDao.findAllPagedReview(1);
		for(Review review : listReviews)
		{
			System.out.println(review.getRating());
		}
		assertTrue(listReviews.size() > 0);
	}
	

}
