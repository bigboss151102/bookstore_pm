package com.bookstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Review;
import com.bookstore.entity.Users;

public class ReviewDAO extends JpaDAO<Review> implements GenericDAO<Review> {

	@Override
	public Review create(Review review) {
		review.setReviewTime(new Date());
		return super.create(review);
	}

	@Override
	public Review update(Review review) {
		return super.update(review);
	}

	@Override
	public Review get(Object reviewId) {
		return super.find(Review.class, reviewId);
	}

	@Override
	public void delete(Object reviewId) {
		super.delete(Review.class, reviewId);
		
	}

	@Override
	public List<Review> listAll() {
		return super.findwithNameQuery("Review.listAll");
	}

	@Override
	public long count() {
		return super.countwithNameQuery("Review.countAll");
	}
	
	public long countByCustomer(int customerId)
	{
		return super.countwithNameQuery("Review.countByCustomer", "customerId", customerId);
	}
	
	public Review findByCustomerAndBook(Integer customerId, Integer bookId)
	{
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("customerId", customerId);
		parameters.put("bookId", bookId);
		List<Review> result = super.findwithNameQuery("Review.findByCustomerAndBook", parameters);
		if(!result.isEmpty())
		{
			return result.get(0);
		}
		return null;
	}
	
	public List<Review> listMostRecent()
	{
		return super.findwithNameQuery("Review.listAll", 0, 3);
	}
	
	public List<Review> findAllPagedReview(int page) {
	    int firstResult = (page - 1) * 4;
	    return super.findAllWithPagination("Review.findAll", firstResult, 4);
	}
}
