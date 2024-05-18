package com.bookstore.controller.admin.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.BookService;


@WebServlet("/admin/update_book")
@MultipartConfig(
		fileSizeThreshold = 1024 * 10,	
		maxFileSize = 1024 * 300,		
		maxRequestSize = 1024 * 1024	
)
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public UpdateBookServlet() {

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookService bookService = new BookService(request, response);
		bookService.updateBook();
	}

}
