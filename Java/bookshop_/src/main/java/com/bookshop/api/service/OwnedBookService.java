package com.bookshop.api.service;

import org.springframework.data.domain.Page;

import com.bookshop.api.model.Book;
import com.bookshop.api.model.OwnedBook;

import java.util.List;

public interface OwnedBookService {
    List<Book> getAllBooks();
    Book saveBook(Book book);
    void delBook(Long id);
}
