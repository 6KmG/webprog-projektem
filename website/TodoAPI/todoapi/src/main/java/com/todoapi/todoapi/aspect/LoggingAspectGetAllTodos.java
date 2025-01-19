package com.todoapi.todoapi.aspect;

import java.util.List;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspectGetAllTodos {
    private final Logger logInfo = LoggerFactory.getLogger("fileLoggerInfo");

    @Around("execution(* com.todoapi.todoapi.TodoController.getAllTodos(..))")
    public Object logAroundGetAllCars(ProceedingJoinPoint joinPoint) throws Throwable {
        // Before rész: A metódus meghívása előtt fut
        logInfo.info("Metódus meghívása: {} - Az összes autó lekérdezése elkezdődött.", joinPoint.getSignature().getName());

        // A célmetódus meghívása
        Object result = joinPoint.proceed();
        // AfterReturning rész: A metódus sikeres végrehajtása után fut
        if (result instanceof List && !((List<?>) result).isEmpty())
            logInfo.info("Autók sikeresen lekérdezve. Az autók száma: {}.", ((List<?>) result).size());
        else logInfo.info("Az autólista üres.");

        return result;
    }
}
