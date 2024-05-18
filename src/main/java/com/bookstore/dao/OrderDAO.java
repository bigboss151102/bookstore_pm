package com.bookstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;
import com.bookstore.entity.Users;

public class OrderDAO extends JpaDAO<BookOrder> implements GenericDAO<BookOrder> {

	@Override
	public BookOrder create(BookOrder order) {
		order.setOrderDate(new Date());
		order.setStatus("Processing");
		return super.create(order);
	}

	@Override
	public BookOrder update(BookOrder order) {
		// TODO Auto-generated method stub
		return super.update(order);
	}

	@Override
	public BookOrder get(Object oderId) {
		
		return super.find(BookOrder.class, oderId);
	}
	

	public BookOrder get(Integer oderId, Integer customerId) {
		
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("orderId", oderId);
		parameters.put("customerId", customerId);
		
		List<BookOrder> result = super.findwithNameQuery("BookOrder.findByIdAndCustomer",parameters);
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public void delete(Object orderId) {
		// TODO Auto-generated method stub
		super.delete(BookOrder.class, orderId);
	}

	@Override
	public List<BookOrder> listAll() {
		
		return super.findwithNameQuery("BookOrder.findAll");
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return super.countwithNameQuery("BookOrder.countAll");
	}
	
	public long countOrderByIdCustomer(Integer customerId)
	{
		return super.countwithNameQuery("BookOrder.countOrderByIdCustomer", "customerId", customerId);
	}
	
	public long countOrderDetailByBook(int bookId) {
		return super.countwithNameQuery("OrderDetail.countByBook", "bookId", bookId);
	}	
	
	public long countByCustomer(int customerId)
	{
		return super.countwithNameQuery("BookOrder.countByCustomer", "customerId", customerId);
	}
	
	public List<BookOrder> listByCustomer(Integer customerId)
	{
		return super.findwithNameQuery("BookOrder.findByCustomer","customerId",customerId);
	}
	
	public List<BookOrder> listMostRecentSales()
	{
		return super.findwithNameQuery("BookOrder.findAll",0,3);
	}
	
	public List<BookOrder> findAllPagedOrder(int page) {
	    int firstResult = (page - 1) * 4;
	    return super.findAllWithPagination("BookOrder.findAll", firstResult, 4);
	}
	
	public List<BookOrder> listByCustomerPagedOrder(Integer customerId, int page) {
	    int firstResult = (page - 1) * 4;
	    return super.findwithNameQueryWithPagination("BookOrder.findByCustomer", "customerId", customerId, firstResult, 4);
	}

}
