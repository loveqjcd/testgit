package main.java.web.api.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

public class JsonOut {

	private Integer code;
	private String msg;
	
	public JsonOut() {
		this.code = 1;
		this.msg = "";
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void out(JsonOut jsonOut, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(JSON.toJSONString(jsonOut));
	}
}
