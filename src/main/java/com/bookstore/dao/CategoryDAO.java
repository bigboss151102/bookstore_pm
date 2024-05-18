package com.bookstore.dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.bookstore.entity.Category;
import com.bookstore.entity.Users;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

	public CategoryDAO() {
	
	}

	@Override
	public Category create(Category category) {
		
		return super.create(category);
	}

	@Override
	public Category update(Category category) {
		
		return super.update(category);
	}

	@Override
	public Category get(Object catId) {
		return super.find(Category.class, catId);
	}

	@Override
	public void delete(Object catId) {
		super.delete(Category.class, catId);
		
	}

	@Override
	public List<Category> listAll() {
		return super.findwithNameQuery("Category.findAll");
	}

	@Override
	public long count() {
		return super.countwithNameQuery("Category.countAll");
	}
	
	public Category findByName(String categoryName)
	{
		List<Category> listCategories = super.findwithNameQuery("Category.findByName","name",categoryName);
		if(listCategories != null && listCategories.size() > 0)
		{
			return listCategories.get(0);
		}
		return null;
	}
	
	public List<Category> findAllPagedCategory(int page)
	{
		int firstResult = (page - 1) * 4;
		return super.findAllWithPagination("Category.findAll", firstResult, 4);
	}
	

}
