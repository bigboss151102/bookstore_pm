package com.bookstore.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.bookstore.entity.Book;
import com.bookstore.entity.Users;

public class BookDAO extends JpaDAO<Book> implements GenericDAO<Book> {

	public BookDAO() {
		
	}

	@Override
	public Book create(Book book) {
		book.setLastUpdateTime(new Date());
		return super.create(book);
	}

	@Override
	public Book update(Book book) {
		book.setLastUpdateTime(new Date());
		return super.update(book);
	}

	@Override
	public Book get(Object bookId) {
		return super.find(Book.class, bookId);
	}

	@Override
	public void delete(Object bookId) {
		super.delete(Book.class, bookId);
	}

	@Override
	public List<Book> listAll() {
		return super.findwithNameQuery("Book.findAll");
	}
	
	public Book findByTitle(String title)
	{
		List<Book> result = super.findwithNameQuery("Book.findByTitle", "title", title);
		if(!result.isEmpty())
		{
			return result.get(0);
		}
		return null;
	}
	
	public List<Book> listByCategory(int categoryId)
	{
		return super.findwithNameQuery("Book.findByCategory", "catId", categoryId);
	}
	
	
	public List<Book> listNewBook(){
		return super.findwithNameQuery("Book.listNew", 0, 4);
	}
	
	public List<Book> search(String keyword)
	{
		return super.findwithNameQuery("Book.search", "keyword", keyword);
	}
	
	@Override
	public long count() {
		
		return super.countwithNameQuery("Book.countAll");
	}
	
	public long countByCategory(int categoryId)
	{
		return super.countwithNameQuery("Book.countByCategory","catId", categoryId);
	}

	public List<Book> listBestSellingBooks()
	{
		return super.findwithNameQuery("OrderDetail.bestSelling", 0, 4);
	}
	
	public List<Book> listMostFavoreBooks()
	{
		List<Book> mostFavaredBooks = new ArrayList<>();
		
		List<Object[]> result =  super.findwithNameQueryObjects("Review.mostFavoredBooks", 0, 4);
		if(!result.isEmpty())
		{
			for(Object[] elements : result)
			{
				Book book = (Book) elements[0];
				mostFavaredBooks.add(book);
			}
		}
		
		return mostFavaredBooks;
	}
	
	public List<Book> findAllPagedBook(int page) {
	    int firstResult = (page - 1) * 4;
	    return super.findAllWithPagination("Book.findAll", firstResult, 4);
	}
	
	public List<Book> findAllPagedBookByCategory(Integer categoryId, int page) {
	    int firstResult = (page - 1) * 12;
	    return super.findwithNameQueryWithPagination("Book.findByCategory", "catId", categoryId, firstResult, 12);
	}
	
}
