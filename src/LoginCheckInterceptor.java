
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.slms.app.domain.vo.RegistrationVo;


public class LoginCheckInterceptor implements Interceptor{
	
	public void destroy() {
		System.out.println("CustomInterceptor destroy() is called...");
	}

	//called during interceptor initialization
	public void init() {
		System.out.println("CustomInterceptor init() is called...");
	}

	//put interceptor code here
	public String intercept(ActionInvocation invocation) throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
		RegistrationVo teacherloginDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		if(loginDetail==null && teacherloginDetail==null){
			System.out.println("LoginCheckInterceptor");
			return "login";
		}
		return invocation.invoke();
	}
		

}
