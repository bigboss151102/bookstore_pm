package com.bookstore.controller.frontend.shoppingcart;

import static org.junit.Assert.*;

import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;

public class ShoppingCartTest {
	private static ShoppingCart cart;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		cart = new ShoppingCart();
		Book book = new Book(11);
		book.setPrice(10);
		cart.addItem(book);
		cart.addItem(book);
	}
	@Test
	public void testAddItem() {
		Map<Book, Integer> items = cart.getItems();
		int quantity = items.get(new Book(11));
		assertEquals(2, quantity);
	}
	
	@Test
	public void testRemoveItem()
	{
		cart.removeItem(new Book(11));
		assertTrue(cart.getItems().isEmpty());
	}
	
	@Test
	public void testRemoveItem2()
	{
		Book book2 = new Book(2);
		cart.addItem(book2);
		cart.removeItem(new Book(2));
		assertNull(cart.getItems().get(book2));
	}
	
	@Test
	public void testgetTotalQuantity()
	{
		Book book3 = new Book(13);
		cart.addItem(book3);
		cart.addItem(book3);
		cart.addItem(book3);
		
		assertEquals(5, cart.getTotalQuantity());
	}
	
	@Test
	public void testgetTotalAmount()
	{
		ShoppingCart cart = new ShoppingCart();
		assertEquals(0.0f,cart.getTotalAmount(),0.0f);
	}
	
	@Test
	public void testgetTotalAmount2()
	{
		assertEquals(20.0f,cart.getTotalAmount(),0.0f);
	}
	
	@Test
	public void testClear()
	{
		cart.Clear();
		assertEquals(0, cart.getTotalQuantity());
	}
	
	@Test
	public void testUpdateCart()
	{
		ShoppingCart cart = new ShoppingCart();
		Book book1 = new Book(11);
		Book book2 = new Book(13);
		
		cart.addItem(book1);
		cart.addItem(book2);
		
		int[] bookIds = {11, 13};
		int[] quantities = {3,4};
		
		cart.updateCart(bookIds, quantities);
		assertEquals(7, cart.getTotalQuantity());
	}

}
