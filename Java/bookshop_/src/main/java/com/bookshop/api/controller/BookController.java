package com.bookshop.api.controller;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.bookshop.api.model.Book;
import com.bookshop.api.service.BookService;
import com.bookshop.api.service.OwnedBookService;

@Controller
@Validated
public class BookController {
    @Autowired
    private BookService bookService;

    @Autowired
    private OwnedBookService ownedBookService;

    @GetMapping("/owned")
    public String viewOwnedPage(Model model){
        model.addAttribute("listBooks", ownedBookService.getAllBooks());
        return "owned";
    }

    @GetMapping("/owned/deleteBook/{id}")
    public String deleteOwnedBook(@PathVariable("id") Long id) {
        this.ownedBookService.delBook(id);
        return "redirect:/owned";
    }

    @GetMapping("/owned/saveBook/{id}/{returnTo}")
    public String saveOwnedBook(@PathVariable("id") Long id,@PathVariable("returnTo")String returnTo, Model model) {
        ownedBookService.saveBook(bookService.getBookById(id));
        if(returnTo.equals("index")){
            return "redirect:/";
        }
        return "redirect:/"+returnTo;
    }

    @GetMapping("/")
    public String viewHomePage(Model model){
        model.addAttribute("listBooks", bookService.getAllBooks());
        return "index";
    }

    @GetMapping("/unavailable")
    public String viewUnavailablePage(Model model){
        model.addAttribute("listBooks", bookService.getAllBooks());
        return "unavailable";
    }

    @GetMapping("/newBookForm")
    public String showNewBookForm(Model model) {
        model.addAttribute("book", new Book());
        return "new_book";
    }

    @PostMapping("/saveBook")
    public String saveBook(@Valid @ModelAttribute("book") Book book, Model model) {
        try {
            bookService.saveBook(book);
            return "redirect:/";
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "new_book";
        }
    }

    @GetMapping("/updateBookForm/{id}")
    public String showFormForUpdate(@PathVariable("id") Long id, Model model) {
        model.addAttribute("book", bookService.getBookById(id));
        return "update_book";
    }

    @PostMapping("/updateBook")
    public String updateBook(@Valid @ModelAttribute("book") Book book, Model model) {
        try {
            bookService.saveBook(book);
            return "redirect:/";
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "update_book";
        }
    }

    @GetMapping("/deleteBook/{id}/{returnTo}")
    public String deleteBook(@PathVariable("id") Long id,@PathVariable("returnTo")String returnTo) {
        this.bookService.deleteBookById(id);
        if(returnTo.equals("index")){
            return "redirect:/";
        }
        return "redirect:/"+returnTo;
    }
}
