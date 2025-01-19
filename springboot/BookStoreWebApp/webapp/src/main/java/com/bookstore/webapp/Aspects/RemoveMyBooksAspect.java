package com.bookstore.webapp.Aspects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
@Slf4j(topic = "fileLogger")
public class RemoveMyBooksAspect {
    @Before("execution(* com.bookstore.webapp.Services.MyBookService.removeBookFromMyList(..)) && args(bookId)")
public void beforeRemoveBookFromMyList(JoinPoint joinPoint, Long bookId) {
    log.info("Method call: {} - Removing book with ID={} from my books.", joinPoint.getSignature().getName(), bookId);
}

@AfterReturning("execution(* com.bookstore.webapp.Services.MyBookService.removeBookFromMyList(..)) && args(bookId)")
public void afterReturningRemoveBookFromMyList(Long bookId) {
    log.info("Book with ID={} successfully removed from my books.", bookId);
}

@AfterThrowing(pointcut = "execution(* com.bookstore.webapp.Services.MyBookService.removeBookFromMyList(..))", throwing = "exception")
public void afterThrowingRemoveBookFromMyList(Exception exception) {
    log.error("Error occurred while removing book from my books: {}", exception.getMessage());
}
}
