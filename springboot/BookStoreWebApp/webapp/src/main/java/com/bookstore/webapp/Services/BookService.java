package com.bookstore.webapp.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.webapp.Exceptions.BookNotFoundException;
import com.bookstore.webapp.Models.Book;
import com.bookstore.webapp.Repositories.BookRepository;

@Service
public class BookService {
    @Autowired
    private BookRepository bookRepository;

    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    public List<Book> getAvailableBooks() {
        return bookRepository.findByAvailable(true);
    }

    // public Book saveBook(Book book) {
    //     if (book.getTitle() == null || book.getTitle().isEmpty()) {
    //         throw new InvalidBookDataException("Book title cannot be empty");
    //     }
    //     return bookRepository.save(book);
    // }
    
    public Book createBook(Book book) {
        return bookRepository.save(book);
    }
    
    public Book updateBook(Long id, Book updatedBook) {
        System.out.println("edited \n \n \n");
        Book existingBook = bookRepository.findById(id)
                .orElseThrow(() -> new BookNotFoundException("Book with ID=" + id + " not found."));
        
        // Update fields explicitly
        existingBook.setTitle(updatedBook.getTitle());
        existingBook.setAuthor(updatedBook.getAuthor());
        existingBook.setYear(updatedBook.getYear());
        existingBook.setPrice(updatedBook.getPrice());
        existingBook.setAvailable(updatedBook.isAvailable());

        return bookRepository.save(existingBook);
    }

    public Optional<Book> getBookById(Long id) {
        return bookRepository.findById(id);
    }

    public void deleteBook(Long id) {
        if (!bookRepository.existsById(id)) {
            throw new BookNotFoundException(id);
        }
        bookRepository.deleteById(id);
    }

    public List<Book> getAll() {
        return bookRepository.findAll();
    }

    // Get all unavailable books
    public List<Book> getUnavailableBooks() {
        return bookRepository.findByAvailable(false);
    }
}
