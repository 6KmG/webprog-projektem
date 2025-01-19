package com.bookstore.webapp.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstore.webapp.Exceptions.BookNotFoundException;
import com.bookstore.webapp.Models.Book;
import com.bookstore.webapp.Services.BookService;
import com.bookstore.webapp.Services.MyBookService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private MyBookService myBookService;


    // Főoldal: összes könyv listázása
    @GetMapping
    public String listBooks(Model model) {
        List<Book> books = bookService.getAllBooks();
        model.addAttribute("books", books);

        List<Long> myBookIds = myBookService.getAll().stream()
            .map(myBook -> myBook.getBook().getId())
            .toList();
        model.addAttribute("myBookIds", myBookIds);

        // Statisztikai adatok
        Book mostExpensiveBook = books.stream().max((b1, b2) -> b1.getPrice().compareTo(b2.getPrice())).orElse(null);
        long availableBooks = bookService.getAvailableBooks().size();
        long unavailableBooks = books.size() - availableBooks;
        long myBooksCount = myBookService.getAllMyBooks().size();

        model.addAttribute("mostExpensiveBook", mostExpensiveBook);
        model.addAttribute("availableBooks", availableBooks);
        model.addAttribute("unavailableBooks", unavailableBooks);
        model.addAttribute("myBooksCount", myBooksCount);

        return "books/list";
    }
    

    @GetMapping("/unavailable")
    public String listUnavailableBooks(Model model) {
        List<Book> books = bookService.getUnavailableBooks();
        model.addAttribute("books", books);
        return "books/unavailable_books";
    }

    // Új könyv létrehozása: űrlap megjelenítése
    @GetMapping("/create")
    public String createBookForm(Model model) {
        model.addAttribute("book", new Book());
        return "books/form";
    }

    // // Könyv mentése (létrehozás vagy módosítás)
    // @PostMapping("/save")
    // public String saveBook(@Valid @ModelAttribute("book") Book book,
    //                        BindingResult result,
    //                        RedirectAttributes redirectAttributes) {
    //     if (result.hasErrors()) {
    //         throw new InvalidBookDataException("Invalid book data: " + result.getAllErrors());
    //     }
    
    //     if (book.getId() != null && book.getId() > 0) {
    //         // Ha van ID, akkor frissítés
    //         bookService.saveBook(book);
    //         redirectAttributes.addFlashAttribute("message", "A könyv sikeresen frissítve lett.");
    //     } else {
    //         // Ha nincs ID, akkor új könyv létrehozása
    //         bookService.saveBook(book);
    //         redirectAttributes.addFlashAttribute("message", "A könyv sikeresen mentésre került.");
    //     }
    
    //     return "redirect:/books";
    // }

    @PostMapping("/create")
    public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "books/form";
        }
        bookService.createBook(book); // Dedicated create method
        redirectAttributes.addFlashAttribute("message", "A könyv sikeresen mentésre került.");
        return "redirect:/books";
    }

    @PostMapping("/update/{id}")
    public String updateBook(@PathVariable Long id, @Valid @ModelAttribute("book") Book book, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "books/form";
        }
        bookService.updateBook(id, book); // Dedicated update method
        redirectAttributes.addFlashAttribute("message", "A könyv sikeresen frissítve lett.");
        return "redirect:/books";
    }

    
    // Könyv törlése
    @GetMapping("/delete/{id}")
    public String deleteBook(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        bookService.deleteBook(id);
        redirectAttributes.addFlashAttribute("message", "A könyv sikeresen törölve lett.");
        return "redirect:/books";
    }

    @GetMapping("/edit/{id}")
    public String editBookForm(@PathVariable Long id, Model model) {
        Book book = bookService.getAllBooks().stream()
                .filter(b -> b.getId().equals(id))
                .findFirst()
                .orElseThrow(() -> new BookNotFoundException(id));
        model.addAttribute("book", book);
        return "books/form";
    }

}
