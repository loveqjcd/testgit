package main.java.dao.model.jjr;

import java.io.Serializable;
import java.util.Date;

public class UserBasicInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5665269168582855355L;
	private long id;
	private String userName;
	private String realName;
	private String password;
	private String email;
	private int userType;
	private Date createDate;
	private int isDeleted;
	private Date modifyDate;
	private long loginCount;
	private String account;
	private String type;
	private String question;
	private String answer;
	private long branchId;
	private String tradePassword;
	private String employeeId;
	private String state;
	private String firstPassword;
	private String position;
	private long innerBranchId;
	private String innerBranchName;
	private String roles;
	private String race;
	private String sex;
	private Date s_date;
	private Date e_date;
	private String flagopr;
	private String cardNum;
	private String old;
	private String internetFlag;

	private String branchName;
	private String Situation;
	private String mobile;
	private String province;

	private String sort;
	private String sortType;

	private String identityLvl;

	private String wsgs;

	private long teamId;

	private int timeLimit;
	private int zyTimeLimit;
	private String brokernumber;

	/**
	 * 2010-09-16 wyp 存放博客专用博客用户类型。
	 */
	private String blogType;

	/**
	 * 2010-09-20 wyp 用户备注，取自user_extend_info
	 */
	private String intro;

	/*
	 * 执业资格的离职日期 20170322 by 6.
	 */
	private Date preEndtime;

	/*
	 * 执业资格的离职日期 20180410 by 6.
	 */
	private Date beginDate;

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getPreEndtime() {
		return preEndtime;
	}

	public void setPreEndtime(Date preEndtime) {
		this.preEndtime = preEndtime;
	}

	public String getIdentityLvl() {
		return identityLvl;
	}

	public void setIdentityLvl(String identityLvl) {
		this.identityLvl = identityLvl;
	}

	public long getTeamId() {
		return teamId;
	}

	public void setTeamId(long teamId) {
		this.teamId = teamId;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getSituation() {
		return Situation;
	}

	public void setSituation(String situation) {
		Situation = situation;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getInternetFlag() {
		return internetFlag;
	}

	public void setInternetFlag(String internetFlag) {
		this.internetFlag = internetFlag;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public String getFirstPassword() {
		return firstPassword;
	}

	public void setFirstPassword(String firstPassword) {
		this.firstPassword = firstPassword;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public long getBranchId() {
		return branchId;
	}

	public void setBranchId(long branchId) {
		this.branchId = branchId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}

	public long getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(long loginCount) {
		this.loginCount = loginCount;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getTradePassword() {
		return tradePassword;
	}

	public void setTradePassword(String tradePassword) {
		this.tradePassword = tradePassword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public long getInnerBranchId() {
		return innerBranchId;
	}

	public void setInnerBranchId(long innerBranchId) {
		this.innerBranchId = innerBranchId;
	}

	public String getInnerBranchName() {
		return innerBranchName;
	}

	public void setInnerBranchName(String innerBranchName) {
		this.innerBranchName = innerBranchName;
	}

	public String getRace() {
		return race;
	}

	public void setRace(String race) {
		this.race = race;
	}

	public String getFlagopr() {
		return flagopr;
	}

	public void setFlagopr(String flagopr) {
		this.flagopr = flagopr;
	}

	public Date getE_date() {
		return e_date;
	}

	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getOld() {
		return old;
	}

	public void setOld(String old) {
		this.old = old;
	}

	public String getWsgs() {
		return wsgs;
	}

	public void setWsgs(String wsgs) {
		this.wsgs = wsgs;
	}

	public String getBlogType() {
		return blogType;
	}

	public void setBlogType(String blogType) {
		this.blogType = blogType;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getTimeLimit() {
		return timeLimit;
	}

	public void setTimeLimit(int timeLimit) {
		this.timeLimit = timeLimit;
	}

	public String getBrokernumber() {
		return brokernumber;
	}

	public void setBrokernumber(String brokernumber) {
		this.brokernumber = brokernumber;
	}

	public int getZyTimeLimit() {
		return zyTimeLimit;
	}

	public void setZyTimeLimit(int zyTimeLimit) {
		this.zyTimeLimit = zyTimeLimit;
	}

}
