package main.java.web.api.impl;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.JsonObject;
import main.java.web.api.util.JsonOut;
import main.java.dao.model.api.DriveSubjectDo;
import main.java.common.util.StrUtils;
import main.java.common.util.page.PageList;
import main.java.common.util.page.PageQuery;

public class ApiImpl {

	/**
	 * 驾照题库
	 * @param request
	 * @param response
	 * @return
	 */
	public JsonOut jztk(HttpServletRequest request, HttpServletResponse response) {
		JsonOut jsonOut = new JsonOut();
		try {
			String subject = request.getParameter("subject");
			String model = request.getParameter("model");
			String pageNo = request.getParameter("pageNo");
			if(StrUtils.isEmpty(pageNo)) {
				pageNo = "1";
			}
			
			DriveSubjectDo subjectDo = new DriveSubjectDo();
			if(StrUtils.isNotEmpty(subject)) {
				subjectDo.setSubject(Integer.parseInt(subject));
			}
			if(StrUtils.isNotEmpty(model) && StrUtils.isNotEmpty(subject) && "1".equals(subject)) {
				subjectDo.setModel(model);
			}
			PageList<DriveSubjectDo> pageList = new PageList<DriveSubjectDo>();//ServicePool.subjectService.listDriveSubejctByPage(subjectDo, new PageQuery(Integer.valueOf(pageNo), 10));
			JsonObject json = new JsonObject();
			json.addProperty("total", pageList.getPaginator().getItems());
			json.addProperty("currentlyPageNo", pageList.getPaginator().getPage());
			json.addProperty("totalPage", pageList.getPaginator().getPages());
			List<DriveSubjectDo> list = new ArrayList<DriveSubjectDo>();
			if(pageList != null && pageList.size() > 0) {
				for(int i=0;i<pageList.size();i++) {
					list.add(pageList.get(i));
				}
			}
			json.addProperty("result", JSONObject.toJSONString(list));
			jsonOut.setCode(0);
			jsonOut.setMsg(json.toString());
		} catch (Exception e) {
			e.printStackTrace();
			jsonOut.setCode(1);
			jsonOut.setMsg("系统错误");
		}
		return jsonOut;
	}
	
	/*
	 * 问答机器人
	 */
	public JsonOut wdjqr(HttpServletRequest request, HttpServletResponse response) {
		JsonOut jsonOut = new JsonOut();
		try {
			String info = request.getParameter("info");
			if(StrUtils.isEmpty(info) || StrUtils.isNum(info) || info.length() < 2) {
				jsonOut.setCode(1);
				jsonOut.setMsg("楞发的啥呀？");
				return jsonOut;
			}
			JsonObject json = new JsonObject();//ServicePool.apiHttpService.queryRobotJson("info="+URLEncoder.encode(info+"","UTF-8")+"&");
			jsonOut.setCode(json.get("code").getAsInt());
			jsonOut.setMsg(json.get("msg").getAsString());
		} catch (Exception e) {
			e.printStackTrace();
			jsonOut.setCode(1);
			jsonOut.setMsg("系统错误");
		}
		return jsonOut;
	}
	
}
