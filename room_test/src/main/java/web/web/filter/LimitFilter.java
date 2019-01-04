package main.java.web.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import main.java.common.util.StrUtils;
import main.java.web.web.util.Token;

/**
 * Company : xx-it.com. 说明：记录所有的访问日志
 * 
 * @author bruce
 * @create Jul 2, 2010 2:25:42 PM
 */
public class LimitFilter implements Filter {

	public static final String SEPARATOR = "@@";

	/**
	 * 说明：主要是防止格式变更后，新的程序无法解析。所以可以根据日志记录的版本，识别不同的日志记录。
	 */
	public static final String LOG_VERSION = "V1";

	public static final Logger logger = Logger.getLogger(LimitFilter.class);

	public static final Logger filterlog = Logger.getLogger("filterlog");

	public void destroy() {
	}

	/**
	 * 访问记录
	 */
	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		//System.out.println("filter1:"+request.getRequestURL());
		
		filterlog.info(SEPARATOR
				+ LOG_VERSION
				+ SEPARATOR
				+ System.currentTimeMillis()
				+ SEPARATOR
				+ request.getRequestURI()
				+ SEPARATOR
				+ StrUtils.trimToEmpty(((HttpServletRequest) request)
						.getRemoteAddr()));
		// 防重复提交处理流程
		String token = request.getParameter(Token.TOKEN_STRING_NAME);
		System.out.println(" ----- token = " + token + " ------");
		if(StrUtils.isNotEmpty(token)) {
			if (Token.isTokenStringValid(request.getParameter(Token.TOKEN_STRING_NAME), request.getSession())) {
				filterChain.doFilter(request, response);
			} else {
				request.setAttribute("token", "du");
				String method = request.getParameter("method");
				String url = request.getRequestURI();
				if(StrUtils.isNotEmpty(method)) {
					url += "?m=" + method;
				}
				response.sendRedirect(url);
				
			}
		}else {
			filterChain.doFilter(request, response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
