package com.buzz.controller;

import com.buzz.pojo.Book;
import com.buzz.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @program: ssm
 * @description:
 * @author: buzz
 * @create: 2022-02-10 17:15
 **/
@Controller
@RequestMapping("/book")
public class BookController {
    private BookService bookService;

    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping("/all-book")
    public String findAllBook(Model model) {
        List<Book> all = bookService.findAll();
        model.addAttribute("books",all);
        return "all-book";
    }

    @RequestMapping("/toAddBookPage")
    public String toAddBookPage() {
        return "add-book";
    }

    @RequestMapping("/addNewBook")
    public String addNewBook(Book book) {
        bookService.addBook(book);
        return "forward:/book/all-book";
    }

    @RequestMapping("/updateBookPage/{bookId}")
    public String toUpdateBook(@PathVariable int bookId, Model model) {
        model.addAttribute("updateBook", bookService.findById(bookId));
        return "update-book";
    }

    @RequestMapping("/updateBook")
    public String updateBook(Book book) {
        bookService.updateBook(book);
        return "forward:/book/all-book";
    }

    @RequestMapping("/deleteBook/{id}")
    public String deleteBook(@PathVariable int id) {
        bookService.deleteBook(id);
        return "forward:/book/all-book";
    }

    @RequestMapping("/queryBook")
    public String queryBook(@RequestParam("queryName") String name, Model model) {
        List<Book> byName = bookService.findByName(name);
        model.addAttribute("books", byName);
        return "all-book";
    }



}
