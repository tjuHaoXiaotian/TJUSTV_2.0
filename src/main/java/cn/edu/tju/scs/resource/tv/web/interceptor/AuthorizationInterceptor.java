package cn.edu.tju.scs.resource.tv.web.interceptor;

import cn.edu.tju.scs.resource.tv.web.aspect.RequireOwner;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 权限检查
 * Created by jack on 2016/4/13.
 */
public class AuthorizationInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler) throws Exception {

        //处理Permission Annotation，实现方法级权限控制
        HandlerMethod method = (HandlerMethod)handler;
        RequireOwner requireOwner = method.getMethodAnnotation(RequireOwner.class);

        //如果为空在表示该方法不需要进行权限验证
        if (requireOwner == null) {
            return true;
        }else{
            System.out.println("拥有权限。。。。。。");
            MethodParameter [] methodParameters = method.getMethodParameters();
            for(MethodParameter methodParameter : methodParameters){
                System.out.println(methodParameter.getParameterName());
            }
            if(methodParameters[0].hasParameterAnnotation(PathVariable.class)){
                MethodParameter methodParameter = methodParameters[0];
                System.out.println("携带参数 id 。。。。。。"+methodParameter);
                return true;
            }else{
                return false;
            }

//            //验证是否具有权限
//            if (((User)httpServletRequest.getAttribute(Constants.CURRENT_USER)).getUserId() == 1) {
//
//            }
        }

        //注意此处必须返回true，否则请求将停止

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
