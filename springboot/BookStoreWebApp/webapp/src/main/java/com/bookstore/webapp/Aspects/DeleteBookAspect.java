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
public class DeleteBookAspect {
    @Autowired 
    private BookService bookService;

    @Before("execution(* com.bookstore.webapp.Services.BookService.deleteBook(..)) && args(id)")
    public void beforeDeleteBook(JoinPoint joinPoint, Long id) {
        Book book = bookService.getBookById(id).orElseThrow(() -> new BookNotFoundException("Book with ID=" + id + " not found."));

        log.info("Method call: {} - Deleting book with ID={} ('{} by {}, {}').",
                joinPoint.getSignature().getName(), id, book.getTitle(), book.getAuthor(), book.getYear());
    }

    @AfterReturning(pointcut = "execution(* com.bookstore.webapp.Services.BookService.deleteBook(..)) && args(id)", argNames = "id")
    public void afterReturningDeleteBook(Long id) {
        log.info("Book with ID={} successfully deleted.", id);
    }

    @AfterThrowing(pointcut = "execution(* com.bookstore.webapp.Services.BookService.deleteBook(..))", throwing = "exception")
    public void afterThrowingDeleteBook(BookNotFoundException exception) {
        log.error(exception.getMessage());
    }
}

