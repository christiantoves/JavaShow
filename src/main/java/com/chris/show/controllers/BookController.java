package com.chris.show.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chris.show.models.Book;
import com.chris.show.services.BookService;



@Controller
public class BookController {
	 private final BookService bookService;
	 
	 public BookController(BookService bookService) {
	     this.bookService = bookService;
	 }
	 
	 @RequestMapping("/books")
	 public String index(Model model) {
	     List<Book> books = bookService.allBooks();
	     model.addAttribute("books", books);
	     return "/books/index.jsp";
	 }
	 
	 @RequestMapping("/books/new")
	 public String newBook(@ModelAttribute("book") Book book) {
		 return "/books/new.jsp";
	 }
	 
	 
	 @RequestMapping(value="/books", method=RequestMethod.POST)
	 public String create(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		 if (result.hasErrors()) {
			 return "/books/new.jsp";
		 } else {
			 bookService.createBook(book);
			 return "redirect:/books";
		 }
	 }
	 
	 @RequestMapping("/books/{id}")
	 public String viewOne(@PathVariable(value="id") String id, Model model) {
		 Long idLong = Long.parseLong(id);
		 Book book = bookService.findBook(idLong);
		 model.addAttribute(book);
		 return "/books/view.jsp";
	 }
	 
	 @RequestMapping("/books/{id}/edit")
	 public String edit(@PathVariable("id") Long id, Model model) {
		 Book book = bookService.findBook(id);
		 model.addAttribute("book", book);
		 return "/books/edit.jsp";
	 }
	    
	 @RequestMapping(value="/books/{id}", method=RequestMethod.PUT)
	 public String update(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		 System.out.println("hello");
		 if (result.hasErrors()) {
			 return "/books/edit.jsp";
		 } else {
			 System.out.println(book.getId());
			 bookService.updateBook(book.getId(), book.getTitle(), book.getDescription(), book.getLanguage(), book.getNumberOfPages());
			 return "redirect:/books";
		 }
	 }
	 
	 @RequestMapping(value="/books/{id}", method=RequestMethod.DELETE)
	 public String destroy(@PathVariable("id") Long id) {
		 bookService.deleteBook(id);
		 return "redirect:/books";
	 }
}