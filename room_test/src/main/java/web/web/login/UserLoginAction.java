package main.java.web.web.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.view.RedirectView;

import main.java.web.web.util.EncryptHelper;
import main.java.web.web.util.XXSessionHelper;
import main.java.web.web.util.view.JsonView;

/**
 * Company : xx-it.com. 说明：基于数据库的登录
 */

public class UserLoginAction extends MultiActionController {

	/**
	 * 说明：登录
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Map<String, Object> model = new HashMap<String, Object>();
		
		System.out.println("---------- UserLoginAction ------------");
		
		return new ModelAndView("login/login_finally", model);

	}

	/**
	 * 说明：登出
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> model = new HashMap<String, Object>();
		request.getSession().removeAttribute("url");

		return new ModelAndView("login/login_finally", model);
	}

	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
}
