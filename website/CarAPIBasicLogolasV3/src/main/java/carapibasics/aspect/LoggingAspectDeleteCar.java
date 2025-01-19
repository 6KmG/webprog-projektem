package carapibasics.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspectDeleteCar {
    private final Logger logInfo = LoggerFactory.getLogger("fileLoggerInfo");

    @Before("execution(* carapibasics.CarController.deleteCar(Long)) && args(itemId)")
    public void logBeforeDeleteCar(JoinPoint joinPoint, Long itemId) {
        String infoMessage = "\n * Metódus meghívása: " + joinPoint.getSignature().getName() + "\n" +
                " * Az ID=" + itemId + " autó törlése elkezdődött.";
        logInfo.info(infoMessage);
    }

    @AfterReturning(pointcut = "execution(* carapibasics.CarController.deleteCar(Long)) && args(itemId)", argNames = "itemId")
    public void logAfterDeleteCar(Long itemId) {
        logInfo.info("Az ID={} autó eltávolítva.", itemId);
    }
}