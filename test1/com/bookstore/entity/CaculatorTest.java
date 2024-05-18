package com.bookstore.entity;

import static org.junit.Assert.*;

import org.junit.Test;

public class CaculatorTest {

	@Test
	public void testAdd() {
		Caculator caculator  = new Caculator();
		int a = 1234;
		int b = 5678;
		int result = caculator.add(a, b);
		
		int expect = 6912;
		
		assertEquals(expect, result);
	}

}
