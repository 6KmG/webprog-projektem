package com.bookstore.webapp.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.webapp.Models.Book;
import com.bookstore.webapp.Models.MyBook;
import com.bookstore.webapp.Repositories.BookRepository;
import com.bookstore.webapp.Repositories.MyBookRepository;

@Service
public class MyBookService {
    @Autowired
    private MyBookRepository myBookRepository;

    public void addBookToMyList(MyBook myBook) {
        myBookRepository.save(myBook);
    }

    public void removeBookFromMyList(Long id) {
        myBookRepository.deleteById(id);
    }

    public List<MyBook> getAll() {
        return myBookRepository.findAll();
    }

    public List<Book> getAllMyBooks() {
        return myBookRepository.findAll().stream()
                .map(myBook -> myBook.getBook()) 
                .toList();
    }

    @Autowired
    private BookRepository bookRepository;

    // public void addBookToMyBooks(Long bookId) {
    //     System.out.println("adding book \n \n");
    //     Book book = bookRepository.findById((long)24)
    //             .orElseThrow(() -> new IllegalArgumentException("Invalid book ID: " + bookId));
    //     System.out.println(book.getTitle()+"\n"+"\n");
    //     MyBook myBook = new MyBook();
    //     myBook.setBook(book);

    //     myBookRepository.save(myBook);
    // }

    public void addBookToMyBooks(Long bookId) {
        boolean exists = myBookRepository.existsByBookId(bookId);
        if (exists) {
            throw new IllegalArgumentException("Ez a könyv már szerepel a listában.");
        }
        // Validate and fetch the book
        Book book = bookRepository.findById(bookId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid book ID: " + bookId));

        // Create and save a new MyBook entity
        MyBook myBook = new MyBook();
        myBook.setBook(book); // This sets the book relationship correctly
        myBookRepository.save(myBook);
        
    }
}
