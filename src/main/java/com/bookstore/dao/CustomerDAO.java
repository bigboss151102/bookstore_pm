package com.bookstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;

public class CustomerDAO extends JpaDAO<Customer> implements GenericDAO<Customer> {

	@Override
	public Customer create(Customer customer) {
		customer.setRegisterDate(new Date());
		return super.create(customer);
	}

	@Override
	public Customer update(Customer customer) {
		
		return super.update(customer);
	}

	@Override
	public Customer get(Object id) {
		
		return super.find(Customer.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Customer.class, id);
	}

	@Override
	public List<Customer> listAll() {
		
		return super.findwithNameQuery("Customer.findAll");
	}

	@Override
	public long count() {
		
		return super.countwithNameQuery("Customer.countAll");
	}
	
	public Customer findByEmail(String email)
	{
		List<Customer> result = super.findwithNameQuery("Customer.findByEmail", "email", email);
		if(!result.isEmpty())
		{
			return result.get(0);	
		}
		return null;
	}
	
	public Customer checkLogin(String email, String password)
	{
		Map<String,Object> parameters = new HashMap<>();
		parameters.put("email", email);
		parameters.put("pass", password);
		
		List<Customer> result = super.findwithNameQuery("Customer.checkLogin", parameters);
		if(!result.isEmpty())
		{
			return result.get(0);
		}
		return null;
	}
	
	public List<Customer> findAllPagedCustomer(int page) {
	    int firstResult = (page - 1) * 4;
	    return super.findAllWithPagination("Customer.findAll", firstResult, 4);
	}
	

}
