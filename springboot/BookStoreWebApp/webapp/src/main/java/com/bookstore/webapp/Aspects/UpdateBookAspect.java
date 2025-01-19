package com.bookstore.webapp.Aspects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bookstore.webapp.Exceptions.BookNotFoundException;
import com.bookstore.webapp.Models.Book;
import com.bookstore.webapp.Services.BookService;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
@Slf4j(topic = "fileLogger")
public class UpdateBookAspect {
    @Autowired
    private BookService bookService;

    @Before("execution(* com.bookstore.webapp.Services.BookService.updateBook(..)) && args(id, updatedBook)")
    public void beforeUpdateBook(JoinPoint joinPoint, Long id, Book updatedBook) {
        Book book = bookService.getBookById(id)
                .orElseThrow(() -> new BookNotFoundException("Book with ID=" + id + " not found."));
        log.info("Method call: {} - Updating book with ID={}. Previous data -> Title: '{}', Author: '{}', Year: '{}'.",
                joinPoint.getSignature().getName(), id, book.getTitle(), book.getAuthor(), book.getYear());
    }

    @AfterReturning(pointcut = "execution(* com.bookstore.webapp.Services.BookService.updateBook(..))", returning = "book")
    public void afterReturningUpdateBook(Book book) {
        log.info("Book with ID={} successfully updated. Updated book: '{} by {} ({})'", book.getId(), book.getTitle(), book.getAuthor(), book.getYear());
    }

    @AfterThrowing(pointcut = "execution(* com.bookstore.webapp.Services.BookService.updateBook(..))", throwing = "exception")
    public void afterThrowingUpdateBook(BookNotFoundException exception) {
        log.error(exception.getMessage());
    }
}
