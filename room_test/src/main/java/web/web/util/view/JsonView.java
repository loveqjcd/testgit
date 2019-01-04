package main.java.web.web.util.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.view.AbstractView;

import com.google.gson.JsonObject;
import main.java.common.util.entity.BaseEntity;
import main.java.common.util.entity.Tip;


/**
 * Group : wangjubao.com
 * 说明：支持Json或String类型的view
 * @author bruce
 * @create Dec 18, 2008 9:48:25 AM
 */
public class JsonView extends AbstractView{

	
	static final Logger logger = Logger.getLogger(JsonView.class);
	
	private String jsonString;
	
	public String getJsonString() {
		return jsonString;
	}

	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}

	/**
	 * 传入一个String类型返回到页面
	 * @param json
	 */
	public JsonView(JsonObject json){
		this.jsonString = json.toString();
	}
	
	/**
	 * 传入一个BaseEntity返回到页面，主要是读取Entity中的tip信息
	 * @param entity
	 */
	public JsonView(BaseEntity entity){
		this.jsonString = entity.getTip().getJsonObject().toString();
	}
	
	/**
	 * 传入一个Tip类型返回到页面
	 * @param json
	 */
	public JsonView(Tip tip){
		this.jsonString = tip.getJsonObject().toString();
	}
	
	
	/**
	 * 说明：根据String转换成JSONView
	 * @param json
	 * @return
	 */
	public static final JsonView valuesOf(String str){
		return new JsonView(str);
	}

	/**
	 * 说明：根据json转换成JSONView
	 * @param json
	 * @return
	 */
	public static final JsonView valuesOf(JsonObject json){
		return new JsonView(json);
	}
	
	/**
	 * 说明：根据tip转换成jsonView
	 * @param tip
	 * @return
	 */
	public static final JsonView valuesOf(Tip tip){
		return new JsonView(tip.getJsonObject());
	}
	
	/**
	 * 传入一个json对象返回
	 * @param jsonString
	 */
	public JsonView(String jsonString){
		this.jsonString = jsonString;
	}
	
	/**
	 * 说明：公共的true
	 */
	public static final JsonView TRUE = new JsonView("true");
	
	/**
	 * 说明：公共的false
	 */
	public static final JsonView FALSE = new JsonView("false");
	
	@Override
	protected void renderMergedOutputModel(Map model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(jsonString);
		}catch(Exception e){
			logger.error("json view render is error",e);
		}finally{
			response.getWriter().close();
		}
	}

	
	
}
