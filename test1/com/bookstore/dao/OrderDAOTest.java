package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

public class OrderDAOTest {
	
	private static OrderDAO orderDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}

	@Test
	public void testCreateBookOrder() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(11);
		
		order.setCustomer(customer);
		order.setFirstname("Hoang Cong");
		order.setLastname("Dinh");
		order.setPhone("123456789");
		order.setAddressLine1("65 Ngo Si Lien");
		order.setAddressLine2("Hoa Khanh Bac");
		order.setCity("Da Nang");
		order.setState("Lien Chieu");
		order.setCountry("VN");
		order.setPaymentMethod("paypal");
		order.setZipcode("123456");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();
		
		Book book1 = new Book(25);
		orderDetail.setBook(book1);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(54.66f);
		orderDetail.setBookOrder(order);
		
		orderDetails.add(orderDetail);
		
		order.setOrderDetails(orderDetails);
		order.setTax(6.8f);
		order.setShippingFee(2.0f);
		order.setSubtotal(54.66f);
		order.setTotal(63.46f);


		orderDAO.create(order);
		
		assertTrue(order.getOrderId() > 0 );
	}

	@Test
	public void testUpdateBookOrderShippingAddress() {
		Integer orderId = 7;
		BookOrder order = orderDAO.get(orderId);
		order.setAddressLine1("New Shipping Address");
		
		orderDAO.update(order);
		BookOrder updateBookOrder = orderDAO.get(orderId);
		assertEquals(order.getAddressLine1(), updateBookOrder.getAddressLine1());
	}
	
	@Test
	public void testUpdateBookOrderDetail() {
		Integer orderId = 21;
		BookOrder order = orderDAO.get(orderId);
		
		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();
		
		while(iterator.hasNext())
		{
			OrderDetail orderDetail = iterator.next();
			if(orderDetail.getBook().getBookId() == 25)
			{
				orderDetail.setQuantity(3);
				orderDetail.setSubtotal(120);
			}
		}
		
		orderDAO.update(order);
		BookOrder updateOrder = orderDAO.get(orderId);
		iterator = order.getOrderDetails().iterator();
		
		int expectedQuantity = 3;
		float expectedSubtotal = 120;
		int actualQuantity = 0;
		float actualSubtotal = 0;
		
		while(iterator.hasNext())
		{
			OrderDetail orderDetail = iterator.next();
			if(orderDetail.getBook().getBookId() == 25)
			{
				actualQuantity = orderDetail.getQuantity();
				actualSubtotal = orderDetail.getSubtotal();
				
			}
		}
		
		assertEquals(expectedQuantity, actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal, 0.0f);
	}

	@Test
	public void testGet() {
		Integer orderId = 21;
		
		BookOrder order = orderDAO.get(orderId);
		System.out.println(order.getFirstname());
		System.out.println(order.getLastname());
		System.out.println(order.getPhone());
		System.out.println(order.getAddressLine1());
		System.out.println(order.getAddressLine2());
		System.out.println(order.getCity());
		System.out.println(order.getState());
		System.out.println(order.getCountry());
		System.out.println(order.getZipcode());
		System.out.println(order.getStatus());
		System.out.println(order.getSubtotal());
		System.out.println(order.getShippingFee());
		System.out.println(order.getTax());
		System.out.println(order.getTotal());
		System.out.println(order.getPaymentMethod());
		
		assertEquals(1, order.getOrderDetails().size());
	}
	
	@Test
	public void testGetByIdAndCustomerNull()
	{
		Integer orderId = 10;
		Integer customerId = 99;
		BookOrder order = orderDAO.get(orderId,customerId);
		assertNull(order);
	}
	
	@Test
	public void testGetByIdAndCustomer()
	{
		Integer orderId = 2;
		Integer customerId = 11;
		BookOrder order = orderDAO.get(orderId,customerId);
		assertNotNull(order);
	}
	
	

	@Test
	public void testDeleteObject() {
		int orderId = 7;
		orderDAO.delete(orderId);
		
		BookOrder order = orderDAO.get(orderId);
		assertNull(order);
	}

	@Test
	public void testListAll() {
		List<BookOrder> listOrders = orderDAO.listAll();
		
		for(BookOrder order : listOrders)
		{
			System.out.println(order.getOrderId()+ " - " + order.getCustomer().getFirstname());
			for (OrderDetail detail : order.getOrderDetails()) {
				Book book = detail.getBook();
				int quantity = detail.getQuantity();
				float subtotal = detail.getSubtotal();
				System.out.println("\t" + book.getTitle() + " - " + quantity + " - " + subtotal);
			}
		}
		assertTrue(listOrders.size() == 7);
	}

	@Test
	public void testCount() {
		long totalOrder = orderDAO.count();
		assertEquals(7, totalOrder);
	}
	
	@Test
	public void testListByCustomerNoOrder()
	{
		Integer customerId = 99;
		List<BookOrder> lisOrders = orderDAO.listByCustomer(customerId);
		assertTrue(lisOrders.isEmpty());
	}
	
	@Test
	public void testListByCustomerOrder()
	{
		Integer customerId = 8;
		List<BookOrder> lisOrders = orderDAO.listByCustomer(customerId);
		assertTrue(lisOrders.size() > 0);
	}
	
	@Test
	public void testListMostRecentSales()
	{
		List<BookOrder> recentOrders = orderDAO.listMostRecentSales();
		assertEquals(3, recentOrders.size());
	}
	
	@Test
	public void testPage()
	{
		List<BookOrder> listOrders = orderDAO.findAllPagedOrder(1);
		for(BookOrder order : listOrders)
		{
			System.out.println(order.getOrderId()+ " - " + order.getCustomer().getFirstname());
			for (OrderDetail detail : order.getOrderDetails()) {
				Book book = detail.getBook();
				int quantity = detail.getQuantity();
				float subtotal = detail.getSubtotal();
				System.out.println("\t" + book.getTitle() + " - " + quantity + " - " + subtotal);
			}
		}
		assertTrue(listOrders.size() > 0);
	}
	
	@Test
	public void testPageOrderForCustomer()
	{
		Integer customerId = 11;
		int page = 0;
		List<BookOrder> listOrders = orderDAO.listByCustomerPagedOrder(customerId, page);
		for(BookOrder order : listOrders)
		{
			System.out.println(order.getOrderId()+ " - " + order.getCustomer().getFirstname());
			for (OrderDetail detail : order.getOrderDetails()) {
				Book book = detail.getBook();
				int quantity = detail.getQuantity();
				float subtotal = detail.getSubtotal();
				System.out.println("\t" + book.getTitle() + " - " + quantity + " - " + subtotal);
			}
		}
		assertTrue(listOrders.size() > 0);
	}
}
