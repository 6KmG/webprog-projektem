package com.bookstore.webapp.Aspects;

import java.util.List;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
@Slf4j(topic = "fileLogger")
public class GetAllBooksAspect {
    @Around("execution(* com.bookstore.webapp.Services.BookService.getAllBooks(..))")
    public Object logAroundGetAllBooks(ProceedingJoinPoint joinPoint) throws Throwable {
        log.info("Method call: {} - Fetching all books started.", joinPoint.getSignature().getName());
        Object result = joinPoint.proceed();
        if (result instanceof List && !((List<?>) result).isEmpty())
            log.info("Books successfully fetched. Number of books: {}.", ((List<?>) result).size());
        else log.info("The book list is empty.");
        return result;
    }
}

