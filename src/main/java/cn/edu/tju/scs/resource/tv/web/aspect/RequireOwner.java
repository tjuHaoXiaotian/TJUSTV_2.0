package cn.edu.tju.scs.resource.tv.web.aspect;

import java.lang.annotation.*;

/**
 * 对是否是用户自己做拦截检查
 * Created by jack on 2016/4/13.
 */

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequireOwner {
    String value();

}
