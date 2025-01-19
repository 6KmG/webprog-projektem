package com.todoapi.todoapi.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.todoapi.todoapi.Todo;

@Aspect
@Component
public class LoggingAspectGetTodo {
    private final Logger logInfo = LoggerFactory.getLogger("fileLoggerInfo");

    @Before("execution(* com.todoapi.todoapi.TodoController.getTodoById(Long)) && args(todoId)")
    public void logBeforeGetTodo(JoinPoint joinPoint, Long todoId) {
        String infoMessage = "\n * Metódus meghívása: " + joinPoint.getSignature().getName() + "\n" +
                " * Az ID=" + todoId + " feladat megkeresése elkezdődött.";
        logInfo.info(infoMessage);
    }

    @AfterReturning(pointcut = "execution(* com.todoapi.todoapix.TodoController.getTodoById(Long)) && args(todoId)", returning = "todo", argNames = "todoId,todo")
    public void logAfterGetTodo(Long todoId, Todo todo) {
        logInfo.info("Az ID={} feladat lekérdezve: [név: '{}', leírás: '{}']", todoId, todo.getName(), todo.getDescription());
    }
}
