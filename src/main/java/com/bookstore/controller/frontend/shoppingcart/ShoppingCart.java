package com.bookstore.controller.frontend.shoppingcart;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.bookstore.entity.Book;

public class ShoppingCart {
	
	private Map<Book, Integer> cart = new HashMap<>();  // Trong giỏ hàng là một Số nguyên Integer đại diện cho số lượng sách
	
	public void	addItem(Book book)
	{
		if(cart.containsKey(book)) 						// Nếu sách đã tồn tại trong giỏ hàng
		{
			Integer quantity = cart.get(book) + 1;
			cart.put(book, quantity);
		}else { 										// Nếu sách chưa tồn tại trong giỏ hàng
			cart.put(book, 1);
		}
	}
	
	public Map<Book, Integer> getItems() 
	{
		return this.cart;	
	}
	
	public void removeItem(Book book)
	{
		cart.remove(book);
	}
	
	public int getTotalQuantity()
	{
		int total = 0;
		Iterator<Book> iterator = cart.keySet().iterator();
		while(iterator.hasNext())
		{
			Book next = iterator.next();
			Integer quantity = cart.get(next);
			total += quantity;
		}
		return total;
	}
	
	public float getTotalAmount()
	{
		float total = 0.0f;
		Iterator<Book> iterator = cart.keySet().iterator(); // Trả về một tập hợp chứa tất cả các key trong cart, iterator đc gọi để lấy một vòng lặp trên tập hợp các key đó
		while(iterator.hasNext())                           // Duyệt qua các key trong cart
		{
			Book book = iterator.next();  					// Được gọi để lấy key tiếp theo trong cart
			Integer quantity = cart.get(book);
			double subTotal = quantity * book.getPrice();
			total += subTotal;
		}
		return total;
	}
	
	public void updateCart(int[] bookIds, int[] quantities)
	{
		for(int i = 0; i < bookIds.length; i++)
		{
			Book key = new Book(bookIds[i]); 				// Đối tượng book này được sử dụng như một book trong cart
			Integer value = quantities[i];   				// Đối tượng này như một value trong cart
			cart.put(key, value);            				// Cập nhật giỏ hàng với cặp key-value này 
		}
	}
	
	public void Clear()
	{
		cart.clear();
	}
	
	public int getTotalItems()
	{
		return cart.size();  								// Trả về số lượng cặp key-value trong cart
	}
	
}
