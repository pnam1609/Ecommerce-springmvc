package ptithcm.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import se.ptithcm.detai.model.TaiKhoan;

public class UserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean  preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		HttpSession session = request.getSession();
		//TaiKhoan tk =session.getAttribute("user");
		TaiKhoan tk = (TaiKhoan) session.getAttribute("user");
		
		if(tk ==null) {
			response.sendRedirect(request.getContextPath()+"/homepage");
			return false;
		}
		
		if(!tk.isAdmin()) {//|| tk ==null lỗi không thể gộp 2 if được
			response.sendRedirect(request.getContextPath()+"/homepage");
			return false;
		}
		return true;
		
	}
}
