package com.todoapi.todoapi.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.todoapi.todoapi.Todo;

@Aspect
@Component
public class LoggingAspectCreateTodo {
    private final Logger logInfo = LoggerFactory.getLogger("fileLoggerInfo");

    @Before("execution(* com.todoapi.todoapi.TodoController.createTodo(..)) && args(todo)")
    public void logBeforeCreateTodo(JoinPoint joinPoint, Todo todo) {
        String infoMessage = "\n * Metódus meghívása: " + joinPoint.getSignature().getName() + "\n" +
                " * Feladat hozzáadása elkezdődött:\n" +
                " * [név: '" + todo.getName() + "', leírás: " + todo.getDescription() + ", dátum: " + todo.getDate() + "]";
        logInfo.info(infoMessage);
    }

    @AfterReturning(pointcut = "execution(* com.todoapi.todoapi.TodoController.createTodo(..))", returning = "result")
    public void logAfterCreateTodo(ResponseEntity<Todo> result) {
        Todo todo = result.getBody();
        logInfo.info("Feladat hozzáadva: [ID={} | '{}']", todo.getId(), todo.getName());
    }
}
