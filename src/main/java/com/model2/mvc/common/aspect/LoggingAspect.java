package com.model2.mvc.common.aspect;

import static com.model2.mvc.common.aspect.ConsoleColorCode.CYAN;
import static com.model2.mvc.common.aspect.ConsoleColorCode.GREEN;
import static com.model2.mvc.common.aspect.ConsoleColorCode.RESET;
import static com.model2.mvc.common.aspect.ConsoleColorCode.YELLOW;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Component
@Aspect
public class LoggingAspect {
    Logger log = LoggerFactory.getLogger(LoggingAspect.class);

    @Around("execution(* com.model2.mvc..*ServiceImpl.*(..))")
    public Object aroundServiceImpl(ProceedingJoinPoint joinPoint) throws Throwable {
        log.debug("{}[Around before] applied method:: {}.{}{}",
                  CYAN.getCode(),
                  joinPoint.getTarget().getClass().getName(),
                  joinPoint.getSignature().getName(),
                  RESET.getCode());
        log.debug("{}[Around before] parameters:: {}{}", CYAN.getCode(), Arrays.toString(joinPoint.getArgs()), RESET.getCode());

        Object methodResult = joinPoint.proceed();

        log.debug("{}[Around after] return: {}{}", CYAN.getCode(), methodResult, RESET.getCode());
        return methodResult;
    }

    @Before("execution(* com.model2.mvc..*Controller.*(..))")
    public void logParameterOfControllers(JoinPoint joinPoint) {
        log.debug("{}Class: {}{}", GREEN.getCode(), joinPoint.getTarget().getClass().getName(), RESET.getCode());
        log.debug("{}Method: {}{}", GREEN.getCode(), joinPoint.getSignature().getName(), RESET.getCode());
        log.debug("{}Signature: {}{}", GREEN.getCode(), joinPoint.getSignature(), RESET.getCode());
        log.debug("{}Params: {}{}", GREEN.getCode(), Arrays.toString(joinPoint.getArgs()), RESET.getCode());
    }

    @Around("execution(* com.model2.mvc..*DAO.*(..))")
    public Object logAroundDAO(ProceedingJoinPoint joinPoint) throws Throwable {
        log.debug("{}Class: {}", YELLOW.getCode(), joinPoint.getTarget().getClass().getName());
        log.debug("Method: {}", joinPoint.getSignature().getName());
        log.debug("Signature: {}", joinPoint.getSignature());
        log.debug("Params: {}", Arrays.toString(joinPoint.getArgs()));

        Object returnValue = joinPoint.proceed();

        log.debug("Returns: {}{}", returnValue, RESET.getCode());
        return returnValue;
    }
}
