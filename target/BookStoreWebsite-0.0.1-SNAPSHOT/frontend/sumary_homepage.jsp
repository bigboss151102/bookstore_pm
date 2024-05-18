<div class="col-sm-3 text-center">
	<div>
		<a href="view_book?id=${book.bookId}">
			<img style="width: 128px; height: 164px;"  
				src="data:image/jpg;base64,${book.base64Image}"/>	
		</a>
	</div>
	<div>
		<a href="view_book?id=${book.bookId}">
		<b>${book.title}</b>
		</a>
	</div>
	<div>
		<jsp:directive.include file="book_rating.jsp"/>
	</div>
	<div>
		<i>${book.author}</i>
	</div>
	<div>
		<b>$ ${book.price}</b>
	</div>
	<div>&nbsp;</div>
</div>

