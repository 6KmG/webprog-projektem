package com.bookshop.api.service;

import org.springframework.data.domain.Page;

import com.bookshop.api.model.Book;

import java.util.List;

public interface BookService {
    List<Book> getAllBooks();
    Book saveBook(Book book);
    Book getBookById(Long id);
    void deleteBookById(Long id);
    Page<Book> findPaginated(Integer pageNo, Integer pageSize, String sortField, String sortDirection);
}
