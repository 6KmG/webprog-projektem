package com.bookstore.webapp.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstore.webapp.Models.Book;

public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findByAvailable(boolean available);
}
