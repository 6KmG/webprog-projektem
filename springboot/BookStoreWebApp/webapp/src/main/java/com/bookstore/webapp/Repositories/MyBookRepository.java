package com.bookstore.webapp.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bookstore.webapp.Models.MyBook;

@Repository
public interface MyBookRepository extends JpaRepository<MyBook, Long> {
    boolean existsByBookId(Long bookId);
}
