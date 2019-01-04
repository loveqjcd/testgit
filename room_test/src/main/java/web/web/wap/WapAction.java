package main.java.web.web.wap;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.JsonObject;
import main.java.common.util.StrUtils;
import main.java.web.web.util.view.JsonView;

public class WapAction extends MultiActionController {
	
	private static final String QUESTION_CODE = "question_code";
	
	/*
	 * wap首页面
	 */
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("title", "常识小哥");
		return new ModelAndView("wap/qxWapHome", map);
	}
	
	/**
	 * 生成答题
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView getCode(HttpServletRequest request, HttpServletResponse response) {
		JsonObject json = new JsonObject();
		try {
			int a = getNum();
			int b = getNum();
			String str = a+getMark()+b;
			
			int d = (int) Math.round(getDob(str));
			System.out.println("="+d);
			int i = (int)(Math.random() * 2);
			int asw;
			if(i == 0) {
				asw = a;
			}else {
				asw = b;
			}
			request.getSession().setAttribute(QUESTION_CODE, asw);
			System.out.println(asw);
			str = str.replace(""+asw, "x");
			String ss = "已知 " + str + " = " + d + " 问  x = ?";
			
			json.addProperty("code", "0");
			json.addProperty("msg", ss);
		} catch (Exception e) {
			e.printStackTrace();
			json.addProperty("code", "1");
			json.addProperty("msg", "1 + 1 = ?");
			request.getSession().setAttribute(QUESTION_CODE, "2");
		}
		return new ModelAndView(new JsonView(json.toString()));
	}
	
	private double getDob(String str) {
		ScriptEngineManager factory = new ScriptEngineManager();  
	    ScriptEngine engine = factory.getEngineByName("JavaScript");  
		try {
			Object o = engine.eval(str);
			return Double.parseDouble(o.toString());
		} catch (ScriptException e) {
			e.printStackTrace();
			return 0;
		}
	}

	private int getNum() {
		
		return 10 + (int)(Math.random() * 90);
	}
	
	private String getMark() {
		String[] chars = {" + "," - "};
		return chars[(int)(Math.random()*2)];
	}
	
	/*
	 * 周公解梦
	 */
	public ModelAndView zgjm(HttpServletRequest request, HttpServletResponse response) {
		JsonObject json = new JsonObject();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			String opt = request.getParameter("opt");
			if(StrUtils.isNotEmpty(opt) && "q".equals(opt)) {
				String code = request.getParameter("code");
				if(StrUtils.isEmpty("code") || !code.equals(request.getSession().getAttribute(QUESTION_CODE).toString())) {
					json.addProperty("code", "1");
					json.addProperty("msg", "验证答案错误");
					return new ModelAndView(new JsonView(json.toString()));
				}
				String q = request.getParameter("q");
				if(StrUtils.isEmpty(q) || StrUtils.isNum(q) || q.length() < 2) {
					json.addProperty("code", "1");
					json.addProperty("msg", "请输入关键字，且不少于两个字符");
					return new ModelAndView(new JsonView(json.toString()));
				}
				String full = "1"; //是否显示详细信息，1:是 0:否，默认0
				StringBuffer sb = new StringBuffer();
				sb.append("q=").append(URLEncoder.encode(q, "utf-8")).append("&full=").append(full).append("&");

				return new ModelAndView(new JsonView(json.toString()));
			}
			map.put("title", "周公解梦");
			return new ModelAndView("wap/qxWapZgjm", map);
		} catch (Exception e) {
			e.printStackTrace();
			json.addProperty("code", "1");
			json.addProperty("msg", "系统错误");
			return new ModelAndView(new JsonView(json.toString()));
		}
	}
	
}
