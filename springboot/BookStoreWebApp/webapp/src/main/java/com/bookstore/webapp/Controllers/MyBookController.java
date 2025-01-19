package com.bookstore.webapp.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstore.webapp.Services.MyBookService;

@Controller
@RequestMapping("/mybooks")
public class MyBookController {

    @Autowired
    private MyBookService myBookService;

    // Saját könyvek listájának megjelenítése
    @GetMapping
    public String listMyBooks(Model model) {
        model.addAttribute("myBooks", myBookService.getAll());
        return "mybooks/list";
    }

    // @PostMapping("/add")
    // public ResponseEntity<String> addBookToMyBooks(@RequestParam Long bookId) {
    //     try {
    //         myBookService.addBookToMyBooks(bookId); // Pass the bookId dynamically
    //         return ResponseEntity.ok("Book added to MyBooks successfully.");
    //     } catch (IllegalArgumentException e) {
    //         return ResponseEntity.badRequest().body(e.getMessage());
    //     } catch (Exception e) {
    //         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
    //                 .body("An unexpected error occurred: " + e.getMessage());
    //     }
    // }

    @PostMapping("/add")
    public String addBookToMyBooks(@RequestParam Long bookId, RedirectAttributes redirectAttributes) {
        try {
            myBookService.addBookToMyBooks(bookId); // Pass the bookId dynamically
            redirectAttributes.addFlashAttribute("successMessage", "Book added to MyBooks successfully.");
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
        }
        return "redirect:/books"; // Redirect to /books
    }
    

    // Könyv eltávolítása a saját listából
    @PostMapping("/delete/{id}")
    public String removeBookFromMyBooks(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            myBookService.removeBookFromMyList(id);
            redirectAttributes.addFlashAttribute("successMessage", "A könyv sikeresen eltávolítva a saját könyvek közül.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Egy váratlan hiba történt.");
        }
        return "redirect:/mybooks";
    }
    
}
