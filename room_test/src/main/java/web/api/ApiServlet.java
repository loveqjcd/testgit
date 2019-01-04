package main.java.web.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.web.api.impl.ApiImpl;
import main.java.web.api.util.JsonOut;
import main.java.web.api.util.Tools;
import main.java.dao.model.api.ApiDo;
import main.java.common.util.StrUtils;

public class ApiServlet extends HttpServlet {

	private static final long serialVersionUID = 2813852300165712477L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		if(StrUtils.isNotEmpty(pathInfo)) {
			pathInfo = pathInfo.substring(pathInfo.lastIndexOf("/") + 1);
			doOut(pathInfo, "GET", request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		if(StrUtils.isNotEmpty(pathInfo)) {
			pathInfo = pathInfo.substring(pathInfo.lastIndexOf("/") + 1);
			doOut(pathInfo, "POST", request, response);
		}
	}
	
	private void doOut(String pathInfo, String method, HttpServletRequest request, HttpServletResponse response) throws IOException {
		JsonOut out = new JsonOut();
		try {
			ApiDo api = Tools.apiMap.get(pathInfo);
			out = checkApi(api, method);
			if(out.getCode() == 0) {
				if("jztk".equals(pathInfo)) {
					JsonOut jsonOut = new ApiImpl().jztk(request, response);
					jsonOut.out(jsonOut, response);
				}else if("wdjqr".equals(pathInfo)) {
					JsonOut jsonOut = new ApiImpl().wdjqr(request, response);
					jsonOut.out(jsonOut, response);
				}else {
					response.sendRedirect("/");
				}
			}else {
				out.out(out, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.setCode(1);
			out.setMsg("调用接口系统错误");
			out.out(out, response);
		}
	}

	private JsonOut checkApi(ApiDo api, String method) {
		JsonOut out = new JsonOut();
		if(api == null) {
			out.setCode(1);
			out.setMsg("接口不存在");
			return out;
		}
		if("GET".equals(method) && api.getMethodGet() != 0) {
			out.setCode(1);
			out.setMsg("此接口不支持get请求");
			return out;
		}
		if("POST".equals(method) && api.getMethodPost() != 0) {
			out.setCode(1);
			out.setMsg("此接口不支持post请求");
			return out;
		}
		out.setCode(0);
		out.setMsg("success");
		return out;
	}
	
}
