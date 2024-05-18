package com.bookstore.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import com.bookstore.entity.Users;

import net.bytebuddy.implementation.bind.annotation.Super;

public class UserDAO extends JpaDAO<Users> implements GenericDAO<Users> {

	public UserDAO() {
		
	}

	@Override
	public Users create(Users user) {
		return super.create(user);
	}

	@Override
	public Users update(Users user) {
		
		return super.update(user);
	}

	@Override
	public Users get(Object userId) {
		return super.find(Users.class, userId);
	}
	
	@Override
	public void delete(Object userId) {
		super.delete(Users.class, userId);
	}

	@Override
	public List<Users> listAll() {
		return super.findwithNameQuery("Users.findAll");
	}

	@Override
	public long count() {
		return super.countwithNameQuery("Users.countAll");
	}
	
	
	public Users findByEmail(String email) {
		List<Users> listUsers = super.findwithNameQuery("Users.findByEmail","email",email);
		if(listUsers != null && listUsers.size() > 0)
		{
			return listUsers.get(0);
		}
		return null;
	}
	
	public boolean checkLogin(String email, String password)
	{
		
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("email", email);
		parameters.put("password", password);
		List<Users> lisUsers = super.findwithNameQuery("Users.checkLogin", parameters);
		if(lisUsers.size() == 1)
		{
			return true;
		}
		
		return false;	
	}
	
	public List<Users> findAllPagedUser(int page) {
	    int firstResult = (page - 1) * 4;
	    return super.findAllWithPagination("Users.findAll", firstResult, 4);
	}
}
