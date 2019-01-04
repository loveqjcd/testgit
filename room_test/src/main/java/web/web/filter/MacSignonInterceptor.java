package main.java.web.web.filter;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import main.java.dao.model.user.UserDo;
import main.java.dao.model.user.UserFunctionInfoDo;
import main.java.common.util.StrUtils;

/**
 * 说明：后台管理员登录拦截器
 */
public class MacSignonInterceptor extends HandlerInterceptorAdapter {
	
	/**
	 * 说明：重定向的URL
	 */
    //public static final String RECIRECT_URLs = "http://pro.xx-it.com";
    public static final String RECIRECT_URL_LOC = "../userLogin.htm";

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        request.getSession().setAttribute("url", request.getRequestURL()+"?"+request.getQueryString());
        UserDo user = (UserDo) request.getSession().getAttribute(UserDo.SESSION_LOGIN_USER);
        boolean hadleYes = true;
        
        System.out.print("requestURL:"+request.getRequestURL() + "\tqueryString:"+request.getQueryString()+"\n");

        if (user == null) {
            response.sendRedirect(RECIRECT_URL_LOC);
            hadleYes= false;
        } else {
            boolean isfunction = iroles(request, response, user);
            if (isfunction) {
                String urlstop= request.getHeader("referer")!=null?request.getHeader("referer").toString():user.getFunctionInfos().get(0).getFunctionUrl();
                if(urlstop.indexOf("?m=") == -1){
                    urlstop = urlstop+"?m=list&stop=yes";
                }
                response.sendRedirect(urlstop);
                hadleYes= false;
            }
        }

        return hadleYes;
    }
    
    /**
     * 验证用户权限
     * 
     * @param httpRequest
     * @param httpResponse
     * @param user
     * @return
     */
    private boolean iroles(HttpServletRequest httpRequest, HttpServletResponse httpResponse,
                           UserDo user) {
        try {

            String url = httpRequest.getRequestURI();
            if (url != null && url.contains("fancybox/fancy_")) {
                return false;
            }
            if (StrUtils.isNotEmpty(url)) {
                url = ".." + url;
            }
            String cpath = httpRequest.getContextPath() + "/";
            String m = httpRequest.getParameter("m");
            List<UserFunctionInfoDo> infos = user.getFunctionInfos();

            boolean isfunction = true;
            if (url.equals("../tb/analyse.htm")
                    && ("getDateZone".equals(m) || "export".equals(m) || "exportCSV".equals(m))) {
                return false;
            }

            // 功能权限
            if (infos != null && StrUtils.isNotEmpty(url)) {
                for (UserFunctionInfoDo info : infos) {
                    List<UserFunctionInfoDo> functions = info.getSubFunctions();

                    // 先验证二级菜单权限，子级菜单权限
                    if (functions != null) {
                        for (UserFunctionInfoDo f : functions) {
                            if (StrUtils.isNotEmpty(f.getFunctionUrl().trim())) {
                                if (f.getFunctionUrl().startsWith(url)) {
                                    isfunction = false;
                                    return isfunction;
                                }
                            }
                        }
                    }
                    // 再验证主菜单权限
                    if (StrUtils.isNotEmpty(info.getFunctionUrl())
                            && info.getFunctionUrl().startsWith(url)) {
                        isfunction = false;
                        return isfunction;
                    }

                }
            }
            return isfunction;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
	
}
