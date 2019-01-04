package main.java.web.web.util;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import main.java.common.util.StrUtils;



/**
 * Group : xx-it.com.
 * 说明：Session Helper
 * 
 * @create Nov 19, 2009 3:47:44 PM
 */

/**
 * Member : xx-it.com
 * 说明：获取Session助手类
 * 
 * @create Nov 8, 2008 2:08:03 PM
 */
public final class SessionHelper {
	
	public static final Logger filterlog = Logger.getLogger(SessionHelper.class);

	public static final String REQUEST_SESSIONUSER_KEY = "su";
	
	public static final String CSRF_COOKIE_TOKEN = "ct";		//用于cookie
	
	public static final String CSRF_TOKEN = "token";			//用于form表单中
	
	/**
	 * 说明：增加csrf相关的cookie信息
	 * 及增加一个token到request中，用于表单中
	 * @param response
	 */
	public static final void addCsrfCookie(HttpServletRequest request,HttpServletResponse response){
		String[] tokenMd5 = CsrfHelper.getTokenMd5();
		Cookie csrfCookie = new Cookie(CSRF_COOKIE_TOKEN,tokenMd5[0]);
		request.setAttribute(CSRF_TOKEN,tokenMd5[1]);
		response.addCookie(csrfCookie);
		filterlog.info("generated csrf:" +tokenMd5[0] + "--"+ tokenMd5[1] );
	}
	
	/**
	 * 说明：校验csrf中token与cooken的token的是否匹配合法。
	 * @param request
	 * @param response
	 * @return
	 */
	public static final boolean validCsrfCookie(HttpServletRequest request,HttpServletResponse response){
		Cookie[] cookies = request.getCookies();
		
		String csrfCookieToken = null;
		for(int i=0;i<cookies.length;i++){
			if(CSRF_COOKIE_TOKEN.equals(cookies[i].getName())){
				csrfCookieToken = cookies[i].getValue();
				break;
			}
		}
		
		if(StrUtils.isEmpty(csrfCookieToken)){
			filterlog.error("csrf cookie token is null");
			return false;
		}

		String token = request.getParameter(CSRF_TOKEN);
		if(StrUtils.isEmpty(token)){
			filterlog.error("csrf form token is null");
			return false;
		}
		
		if(CsrfHelper.valid(csrfCookieToken, token)){
			filterlog.info("csrf valid is ok");
			return true;
		}else{
			filterlog.error("csrf valid false,cookie is " +csrfCookieToken +" .token is " +CsrfHelper.parseMd5(token) );
			return false;
		}
	}
	
	
	/**
	 * 说明：判断请求是否为post方法
	 * @param request
	 * @return
	 */
	public static final boolean isPostMethod(HttpServletRequest request){
		return "POST".equals(request.getMethod());
	}
	
	/**
	 * 说明：从request中获取用户sessionUser
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	public static UserSession getUserSessionByRequest(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession)request.getSession().getAttribute(REQUEST_SESSIONUSER_KEY);
		//		如果此时还为空,则直接创建一个
		if(userSession==null){
			userSession = new UserSession();
			userSession.setUid("_"+System.currentTimeMillis());
			request.setAttribute(REQUEST_SESSIONUSER_KEY, userSession);
		}
		//out.flush();
		return userSession;
	}
	
	/**
	 * 说明：更新session的邮编信息
	 * @param request
	 * @param response
	 * @param postCode
	 */
	public static final void updateUserSessionCheckCode(HttpServletRequest request,HttpServletResponse response,String checkCode){
		try {
			UserSession userSession = getUserSessionByRequest(request,response);
			userSession.setCheckCode(checkCode);
			request.getSession().setAttribute(REQUEST_SESSIONUSER_KEY, userSession);
//			updateUserSessionStatus(request, response, userSession);
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	/**
	 * 说明：判断校验码是否有效
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	public static final boolean checkCodeIsValid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserSession userSession = (UserSession)request.getSession().getAttribute(REQUEST_SESSIONUSER_KEY);
		if(userSession!= null&&userSession.getCheckCode()!=null){
			return userSession.getCheckCode().equalsIgnoreCase(String.valueOf((request.getParameter("checkCode"))))?true:false;
		}else{
			return false;
		}
	}
}

