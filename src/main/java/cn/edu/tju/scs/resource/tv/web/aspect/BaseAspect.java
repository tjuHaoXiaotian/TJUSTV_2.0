package cn.edu.tju.scs.resource.tv.web.aspect;

import cn.edu.tju.scs.oauth2.common.BizCode;
import cn.edu.tju.scs.oauth2.common.StateCode;
import cn.edu.tju.scs.oauth2.entity.User;
import cn.edu.tju.scs.oauth2.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class BaseAspect {


	@Autowired
	private UserService userService;

	// 选择特定类型的连接点
	@Pointcut("execution(* cn.edu.tju.scs.resource.tv.web.controller.*.*(..))")
	public void pointcut() {}

	// 匹配当前包下的任何类（连接点的范围）
	@Pointcut("within(cn.edu.tju.scs.resource.tv.web.controller.*)")
	public void bizPointcut() {}


//	// Before
//	@Before("pointcut()")
//	public void before() {
//		System.out.println("Before.");
//	}
//
//	// Before with arguments, 即 对应方法上传入的参数
//	@Before("pointcut() && args(arg)")
//	public void beforeWithParam(Object arg) {
//		System.out.println("BeforeWithParam." + arg);
//	}
//
//	@Before("pointcut() && @annotation(requestMapping)")
//	public void beforeWithAnnotaion(RequestMapping requestMapping) {
//		System.out.println("Before With Annotation." + requestMapping.value()[0]);
//	}
//
	@Pointcut("execution(* cn.edu.tju.scs.resource.tv.web.controller.*.*(..)) &&  @annotation(requireOwner)")
	public void pointcutWithAnnotation(RequireOwner requireOwner) {}
//
//
//	@Before(value = "pointcutWithAnnotation(requestMapping)", argNames = "requestMapping")
//	public void beforeWithAnnotaion2(RequestMapping requestMapping) {
//		System.out.println("Before With Annotation." + requestMapping.value()[0]);
//	}
//
//	// AfterReturning
//	@AfterReturning(pointcut="bizPointcut()")
//	public void afterReturningNoReturnValue() {
//		System.out.println("AfterReturning no return value: --------------");
//	}
//
//	// AfterReturning with return value
//	@AfterReturning(pointcut="bizPointcut()", returning="returnValue")
//	public void afterReturning(Object returnValue) {
//		System.out.println("AfterReturning with return value---------------: " + returnValue);
//	}
//
//	// AfterThrowing
//	@AfterThrowing(pointcut="pointcut()")
//	public Object afterThrowingWithOutValue() {
//		System.out.println("AfterThrowing ======================================: ");
//		return "error";
//	}
//
//	// AfterThrowing with return value
//	@AfterThrowing(pointcut="pointcut()", throwing="e")
//	public Object afterThrowing(RuntimeException e) {
//		System.out.println("AfterThrowing ======================================: " + e.getMessage());
//		return "error";
//	}
//
//
//	// 必须准备处理正常和异常两种返回方式
//	@After("pointcut()")
//	public void after() {
//		System.out.println("After.");
//	}


//	@Around("pointcut()")
//	public Object around(ProceedingJoinPoint pjp) throws Throwable {
//
//		System.out.println("@Around：执行目标方法之前...");
//
//		// 权限验证
//		MethodSignature signature = (MethodSignature) pjp.getSignature();
//		Method method = signature.getMethod();
//		// 如果加了设定只有自己可看的权限注解
//		if(method.isAnnotationPresent(RequireOwner.class)){
//
//			Parameter [] parameters = method.getParameters();
//			System.out.println("参数名字：--------------------------------------");
//
//			for(Parameter parameter:parameters){
////				if(parameter.isAnnotationPresent(PathVariable.class) && parameter.getName().equals("id")){
////
////				}
//				System.out.println("参数名字："  + parameter.getName());
//			}
//
//			System.out.println("参数名字：------------------end--------------------");
//
//			RequireOwner requireOwner = (RequireOwner)method.getAnnotation(RequireOwner.class);
//			String tableName = requireOwner.value();
//			System.out.println("Table Name is ： --------------------" + tableName);
//
//			//访问目标方法的参数：
//			Object[] args = pjp.getArgs();
//
//			if (args != null && args.length > 0) {
//				System.out.println("参数值：--------------------------------------");
//				for(Object arg:args){
//					if(arg.getClass() == Integer.class){
//
//					}
//					System.out.println("参数值："  + arg);
//				}
//				System.out.println("参数值：------------------end--------------------");
//			}
//		}
//
//
//
//		// 调用真正执行的方法（），由于不确定是否有返回值，所以采用一种通用的 Object 的方式，处理返回值
//		Object obj = pjp.proceed();
//		System.out.println("@Around：执行目标方法之后...");
//
//		System.out.println("Around : " + obj);
//		return obj;
//	}



	@Around(value = "pointcutWithAnnotation(requireOwner)", argNames = "pjp,requireOwner")
	public Object aroundAuthorization(ProceedingJoinPoint pjp,RequireOwner requireOwner) throws Throwable {

		Object obj;

        System.out.println("@Around：执行目标方法之前...");

		// 权限验证
//		MethodSignature signature = (MethodSignature) pjp.getSignature();
//		Method method = signature.getMethod();
//		// 如果加了设定只有自己可看的权限注解
//
//		Parameter [] parameters = method.getParameters();
//		System.out.println("参数名字：--------------------------------------");
//
//		for(Parameter parameter:parameters){
//				if(parameter.isAnnotationPresent(PathVariable.class) && parameter.getName().equals("id")){
//                   // 能取到对应的 参数名儿为 id 的参数值么？
//				}
//			System.out.println("参数名字："  + parameter.getName());
//		}
//
//		System.out.println("参数名字：------------------end--------------------");

		String tableName = requireOwner.value();
		System.out.println("Table Name is ： --------------------" + tableName);

		//访问目标方法的参数：
		Object[] args = pjp.getArgs();


		if (args != null && args.length > 0) {
			System.out.println("参数值：--------------------------------------");
			for (Object arg : args) {
				if (arg.getClass() == Integer.class) {

					String username = (String) SecurityUtils.getSubject().getPrincipal();
					User user = userService.findByUsername(username);
					System.out.println("Username is " + username);

					if (user != null && user.getUserId() == (Integer) arg) {
						System.out.println("User " + user.getUserId() + " is :" + user);
						System.out.println("参数值：" + arg);
						// 调用真正执行的方法（），由于不确定是否有返回值，所以采用一种通用的 Object 的方式，处理返回值
						obj = pjp.proceed();
						return obj;
					} else {
						System.out.println("User  is :" + user);
						System.out.println("参数值：" + arg);
						return StateCode.buildCode(BizCode.WRONGPERMISSION);
					}
				}
				System.out.println("参数值：" + arg);
			}
			System.out.println("参数值：------------------end--------------------");

		}else {
			obj = pjp.proceed();
		}

        System.out.println("@Around：执行目标方法之后...");
		return obj = StateCode.buildCode(BizCode.FAIL);
	}

}
