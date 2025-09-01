package org.egov.util;

import org.egov.tracer.model.CustomException;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;

@Component
public class CommonUtils {

    public  <T> String getTenantId(List<T> objList) {
        Object obj = objList.stream().findAny().get();
        Method getTenantIdMethod = findMethod("getTenantId", obj.getClass());
        String tenantId = (String) ReflectionUtils.invokeMethod(getTenantIdMethod, obj);
        return tenantId;
    }

    private  Method findMethod(String methodName, Class<?> clazz) {
        return (Method) Arrays.stream(ReflectionUtils.getAllDeclaredMethods(clazz)).filter((m) -> m.getName().equals(methodName)).findFirst().orElseThrow(() -> new CustomException("INVALID_OBJECT_OR_METHOD", "Invalid object or method"));
    }
}
