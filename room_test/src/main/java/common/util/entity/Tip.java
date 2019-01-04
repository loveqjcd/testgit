package main.java.common.util.entity;

import com.google.gson.JsonObject;

/**
 * Company : wangjubao.com.
 * 说明：用于返回业务逻辑层错误。
 * @author bruce
 * @create Dec 10, 2008 10:52:34 PM
 */
public class Tip implements java.io.Serializable{

	private static final long serialVersionUID = 875028505499479651L;

	private boolean isError;//是否错误
	
	private String tip;		//提示信息
	
	private String code;	//code信息，主要用于具体的错误类型标识
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	private Tip(boolean isError,String tip){
		this.isError = isError;
		this.tip = tip;
	}

	/**
	 * 创建Tip信息
	 * @param isError
	 * @param code
	 * @param tip
	 */
	public Tip(boolean isError,String code,String tip){
		this.isError = isError;
		this.code = code;
		this.tip = tip;
	}

	public boolean isError() {
		return isError;
	}

	public void setError(boolean isError) {
		this.isError = isError;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}
	
	public String toString(){
		return this.tip;
	}
	
	/**
	 * 说明：让json支持cache功能，即可以让用户自定义一些字段信息进来
	 * 例: tip.getJSONObject().put("name","xxx").put("address","bbb")
	 * @return
	 */
	public JsonObject getJsonObject(){
		JsonObject json = new JsonObject();
		json.addProperty("isError", this.isError);
		json.addProperty("tip", tip);
		if(this.code!=null){
			json.addProperty("code", code);
		}
		return json;
	}
	
	/**
	 * 说明：没有错误，用于转换json对像时使用
	 */
	public static Tip Succeed = new Tip(false,"");

	/**
	 * 说明：操作成功
	 */
	public static Tip SucceedOperate = Tip.getSuccessTip("操作成功");

	/**
	 * 说明：无效的操作
	 */
	public static Tip NoOperate = Tip.getErrorTip("没有操作权限");
	
	/**
	 * 说明：没有访问权限
	 */
	public static Tip NoAccess = Tip.getErrorTip("没有访问权限");
	
	/**
	 * 说明：没有找到相关信息
	 */
	public static Tip NotFound = Tip.getErrorTip("没有找到相关信息");
	
	/**
	 * 说明：返回一个成功的Tip提示
	 * @param tip
	 * @return
	 */
	public static final Tip getSuccessTip(String tip){
		return new Tip(false,tip);
	}
	
	/**
	 * 说明：获取带Code的错误提示信息
	 * @param code
	 * @param tip
	 * @return
	 */
	public static final Tip getSuccessTip(String code,String tip){
		return new Tip(false,code,tip);
	}
	
	/**
	 * 说明：返回一个错误的Tip提示
	 * @param tip
	 * @return
	 */
	public static final Tip getErrorTip(String tip){
		return new Tip(true,tip);
	}
	
	/**
	 * 说明：返回一个带code的成功提示信息
	 * @param code
	 * @param tip
	 * @return
	 */
	public static final Tip getErrorTip(String code,String tip){
		return new Tip(true,code,tip);
	}
}
