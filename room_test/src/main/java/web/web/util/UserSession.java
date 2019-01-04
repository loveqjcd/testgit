package main.java.web.web.util;


/**
 * Company : xx-it.com.
 * 说明：主要是记录用户登录后的session信息，其中包括用户的uid,等
 * 当用户未登录的时候，且只有postCode信息
 * 
 * @create Apr 18, 2009 4:06:05 PM
 */
public class UserSession implements java.io.Serializable{

	private static final long serialVersionUID = 6748557445925381085L;
	
	/**
	 * 说明：uid的cookie key
	 */
	public static final String COOKIE_UID = "_pid";
	
	/**
	 * 说明：邮编的cookie key;
	 */
	public static final String COOKIE_POSTCODE="_p";
	
	/**
	 * 说明：user email的cookie key;
	 */
	public static final String COOKIE_USEREMAIL="_ue";//user email

	private String uid;
	
	private Long userId;
	
	private String userMail;
	
	private String postCode;		//当前选择的postCode信息
	
	private boolean isLogin ;
	
	private String checkCode;		//用于保存全局的checkCode;

	
	/**
	 * 说明：设置用户为登录状态
	 */
	public void setUserLogin(){
		this.isLogin = true;
	}
	
	/**
	 * 说明：设置用户为登出状态
	 */
	public void setUserLogout(){
		this.isLogin = false;
	}
	
	/**
	 * 说明：判断是否登录了。
	 * @return
	 */
	public boolean isLogin(){
		return isLogin;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
}
