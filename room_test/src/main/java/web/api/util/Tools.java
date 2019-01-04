package main.java.web.api.util;

import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import main.java.dao.model.api.ApiDo;

public class Tools extends HttpServlet {

	private static final long serialVersionUID = -2655580930280214379L;

	public static Map<String, ApiDo> apiMap;
	
	@Override
	public void init() throws ServletException {

		LoggerInfo.info("----- Tools ---- init() -----");
	}
	
}
