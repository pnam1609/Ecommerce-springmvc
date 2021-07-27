package ptithcm.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import se.ptithcm.detai.model.TaiKhoan;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean  preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		HttpSession session = request.getSession();
		//TaiKhoan tk =session.getAttribute("user");
		TaiKhoan tk = (TaiKhoan) session.getAttribute("user");
		
		
		if(tk==null) {
			return true;
		}
		if(tk.isAdmin()==true) {
			response.sendRedirect(request.getContextPath()+"/homepage1");
		}
		return true;
	}
}