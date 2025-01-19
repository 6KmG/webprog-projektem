package carapibasics.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import carapibasics.Todo;

@Aspect
@Component
public class LoggingAspectGetCar {
    private final Logger logInfo = LoggerFactory.getLogger("fileLoggerInfo");

    @Before("execution(* carapibasics.CarController.getCarById(Long)) && args(itemId)")
    public void logBeforeGetCar(JoinPoint joinPoint, Long itemId) {
        String infoMessage = "\n * Metódus meghívása: " + joinPoint.getSignature().getName() + "\n" +
                " * Az ID=" + itemId + " autó megkeresése elkezdődött.";
        logInfo.info(infoMessage);
    }

    @AfterReturning(pointcut = "execution(* carapibasics.CarController.getCarById(Long)) && args(itemId)", returning = "car", argNames = "itemId,car")
    public void logAfterGetCar(Long itemId, Todo car) {
        logInfo.info("Az ID={} autó lekérdezve: [márka: '{}', model: '{}', évjárat: '{}']", itemId, car.getBrand(), car.getModel(), car.getYear());
    }
}