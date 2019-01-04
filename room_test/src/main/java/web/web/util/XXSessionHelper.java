package main.java.web.web.util;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Company : xx-it.com.
 * 说明：Taobao相关session帮助类
 * @author bruce
 * @create Jan 18, 2011 1:36:04 PM
 */
public class XXSessionHelper {

	// 提示常量
	public static final String FINISH = "finish";		//操作成功
	
	public static final String STATUS_0 = "status_0";	//启用成功
	
	public static final String STATUS_1 = "status_1";	//禁用成功

	public static final String SAVE_FINISH = "save_finish";			//保存成功
	public static final String DELETE_FINISH = "delete_finish";			//删除成功

	public static final String UPDATE_FINISH = "update_finish";		//修改成功
	
	public static final String ADD_NEW_SELLER = "add_new_seller";	//修改成功

	public static final String FAILED = "failed";					//操作失败

	public static final String FAILED_APP_KEY = "failed_key";		//操作失败 APP KEY 设置错误

	public static final String FAILED_DUP_NICK = "failed_dup_nick";		//操作失败 卖家在系统已经存在
	
	public static final String USEREVENT_START = "userevent_start";			//营销活动开始进入发送计划

	public static final String APP_KEY_FAILED = "app_key_failed";			// appkey设置不正确
	
	public static final String HAS_TOP_SESSION = "has_top_session";			//需要topsession
	
	public static final String HAS_TAOBAO_USER = "has_taobao_user";			//需要topsession
	
	public static final String HAS_NAMES = "has_names";			//需要topsession
	
	public static final String REPORT_ERROR = "report_error";   //该类目下无数据，无法加载报表图形
	/**
	 * 说明：session User key
	 */
	public static final String SESSION_USER = "sessionUser";
	
	/**
	 * 说明：top session key 
	 */
	public static final String TOP_SESSION = "top_session";
	
	/**
	 * 说明：同步状态
	 */
	public static final String SYNC_STATUS = "_sync";
	
	
	public static final String SYNC_TRADE = "_syncO";
	
	//存储最后同步的时间
	public static final String lastSyncTime = "_lastSyncTime";

	public static final String loginType = "login_type";
	
	//提示信息
	public static final String SESSION_MESSAGE = "_message";
	
	public static final String FOCUS_STATUS_YES = "focusStatusYes";
	
	public static final String FOCUS_STATUS_NO = "focusStatusNo";  
	
	public static final String REPORT_LATER = "_report";  //效果报告重新计算提示
	/**
	 * 说明：更新session中当前用户的最后同步时间
	 * @param session
	 * @param dateTime
	 */
	public static final void updateLastSyncTime(HttpSession session,Date dateTime){
		session.setAttribute(lastSyncTime, dateTime);
	}
	
	/**
	 * 说明：获取session string
	 * @param request
	 * @return
	 */
	public static final String getTopSessionByParameter(HttpServletRequest request){
		return request.getParameter(TOP_SESSION);
	}

}
