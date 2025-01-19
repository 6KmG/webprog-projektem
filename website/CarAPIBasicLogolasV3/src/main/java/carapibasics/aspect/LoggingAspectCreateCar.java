package carapibasics.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import carapibasics.Todo;

@Aspect
@Component
public class LoggingAspectCreateCar {
    private final Logger logInfo = LoggerFactory.getLogger("fileLoggerInfo");

    @Before("execution(* carapibasics.CarController.createCar(..)) && args(car)")
    public void logBeforeCreateCar(JoinPoint joinPoint, Todo car) {
        String infoMessage = "\n * Metódus meghívása: " + joinPoint.getSignature().getName() + "\n" +
                " * Autó hozzáadása elkezdődött:\n" +
                " * [márka: '" + car.getBrand() + "', model: " + car.getModel() + ", évjárat: " + car.getYear() + "]";
        logInfo.info(infoMessage);
    }

    @SuppressWarnings("ConstantConditions")
    @AfterReturning(pointcut = "execution(* carapibasics.CarController.createCar(..))", returning = "result")
    public void logAfterCreateCar(ResponseEntity<Todo> result) {
        Todo car = result.getBody();
        //logInfo.info("Autó hozzáadva: [ID={} | '{} {} ({})']", Objects.requireNonNull(car).getId(), car.getBrand(), car.getModel(), car.getYear());
        logInfo.info("Autó hozzáadva: [ID={} | '{} {} ({})']", car.getId(), car.getBrand(), car.getModel(), car.getYear());
    }
}