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
public class LoggingAspectUpdateTodo {
    private final Logger logInfo = LoggerFactory.getLogger("fileLoggerInfo");

    @Before(value = "execution(* com.todoapi.todoapi.TodoController.updateTodo(..)) && args(id, updatedTodo)", argNames = "joinPoint,id,updatedTodo")
    public void logBeforeUpdateTodo(JoinPoint joinPoint, Long id, Todo updatedTodo) {
        String infoMessage = "\n * Metódus meghívása: " + joinPoint.getSignature().getName() + "\n" +
                " * Módosítás előtt (adatok beolvasása): " +
                "[ID=" + id + ", '" + updatedTodo.getName() + " " + updatedTodo.getDescription() + " " + updatedTodo.getDate() + "']";
        logInfo.info(infoMessage);
    }

    @AfterReturning(pointcut = "execution(* com.todoapi.todoapi.TodoController.updateTodo(..)) && args(id, ..)", returning = "response", argNames = "response,id")
    public void logAfterUpdateTodo(ResponseEntity<Todo> response, Long id) {
        Todo todo = response.getBody();
        logInfo.info("Az ID={} feladat módosítva. Új adatok: [név: '{}', leírás: '{}', dátum: '{}']", id, todo.getName(), todo.getDescription(), todo.getDate());
    }
}
