package main.java.dao.model.jjr;

import java.util.Date;

/**
 * 经纪人详细信息 author xudong
 */
public class JjrInfo {

	/*
	 * 经纪人状态
	 */
	private String state;

	/*
	 * 执业地域
	 */
	private String zydy;
	/*
	 * 合同提前终止时间
	 */
	private Date preendtime;
	/*
	 * 用户ID
	 */
	private long userId;

	/*
	 * 姓名
	 */
	private String realName;

	/*
	 * 用户名
	 */
	private String userName;

	/*
	 * Email
	 */
	private String email;

	/*
	 * 证件类型
	 */
	private String cardType;

	/*
	 * 用身份证号码
	 */
	private String cardNum;

	/*
	 * 性别
	 */
	private String sex;

	/*
	 * 生日
	 */
	private Date birthday;

	/*
	 * 所属营业部ID
	 */
	private long innerBranchId;

	/*
	 * 营业部ID
	 */
	private String ext1;

	public String getExt1() {
		return ext1;
	}

	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}

	/*
	 * 所属营业部名称
	 */
	private String innerBranchName;

	/*
	 * 学历
	 */
	private String degree;

	/*
	 * 描述
	 */
	private String description;

	/*
	 * 户籍地
	 */
	private String hjAddr;

	/*
	 * 照片
	 */
	private byte[] photo;

	/*
	 * 邮政编码
	 */
	private String postCode;

	/*
	 * 地址
	 */
	private String address;

	/*
	 * 手机号码
	 */
	private String mobile;

	/*
	 * 家庭号码
	 */
	private String phone;

	/*
	 * 居间协议编号
	 */
	private String jjxybh;

	/*
	 * 展业扶持期开始时间
	 */
	private Date qysjBegin;

	/*
	 * 展业扶持期结束时间
	 */
	private Date qysjBegin_1;

	/*
	 * 扶持延长期开始时间
	 */
	private Date qysjEnd_1;

	/*
	 * 扶持延长期结束时间
	 */
	private Date qysjEnd;

	/*
	 * 提成比例
	 */
	private String tcbl;

	/*
	 * 居间人报酬收款人姓名
	 */
	private String jjrskName;

	/*
	 * 收款银行全称
	 */
	private String skyh;

	/*
	 * 收款银行帐号
	 */
	private String skyhzh;

	/*
	 * 证券市场基础知识成绩合格证编号
	 */
	private String jczsHgzbh;

	/*
	 * 证券交易成绩合格证编号
	 */
	private String zqjyHgzbh;

	/*
	 * 证券市场基础成绩合格证编号
	 */
	private String zqscjcHgzbh;

	/*
	 * 证券经纪业务营销成绩合格者编号
	 */
	private String zqjjywHgzbh;

	/*
	 * 是否网上公示
	 */
	private String internetFlag;

	/*
	 * 年龄
	 */
	private String old;

	private String blName;

	/*
	 * 展业扶持期底薪
	 */
	// private Long salary;
	// private String salary;
	private Double salary;

	/*
	 * 扶持延长期底薪
	 */
	private Double salary_1;
	// private Float salary;

	/*
	 * 扶持期限
	 */
	private int time_limit;
	private String isFinish;
	private String cause;
	private long xskfsjj;// 销售开放式基金
	private long xssmjj;// 销售私募基金
	private long xsjhlccp;// 销售集合理财产品
	private int template_flag;// 模板标志
	private int ehrJjr;// 营销人员转经纪人
	private int htCount;// 合同次数
	private int zy_time_limit;// 展业期限

	private String tcblbz;// 提成比例备注
	private String istraining;// 是否培训
	private String trainingUploadId;
	private String trainingUploadId2;
	private String trainingUploadId3;

	private int flag;
	/*
	 * 邮编
	 */
	private String fax;

	/*
	 * 证券经纪人证书编号
	 */
	private String brokernumber;

	private String branchName;
	private String brOffshootId;

	private String idCardUploadId;
	private String degreeUploadId;
	private String brokerNumberUploadId;
	private String jjxybhUploadId;
	private String qysjUploadId;
	private String tcblUploadId;
	private String jjrskNameUploadId;
	private String salaryUploadId;
	private String skyhUploadId;
	private String skyhzhUploadId;
	private String jczsHgzbhUploadId;
	private String zqjyHgzbhUploadId;
	private String zqscjcHgzbhUploadId;
	private String zqjjywHgzbhUploadId;
	private String rzsqbUploadId;
	private String zycnhUploadId;
	private byte[] xxjl;
	private byte[] gzjl;
	private String text1;// ---审核不通过的原因

	private String identityLvl;
	private long teamId;

	private String performanceType;

	private String zqtzjj;
	private String zqtzjjUploadId;
	private String zqtzjjxsjczs;
	private String zqtzjjxsjczsUploadId;

	private String type;
	private String answer;
	private Date e_date;
	private int contractList;

	private String provinceName;
	private Integer cancelledStatus;
	private Date endTime;

	private Date reviewDate;
	private Integer reviewType;

	private Integer contractLength;

	private String zqtzfx;
	private String zqtzfxUploadId;
	private String zqfxycx;
	private String zqfxycxUploadId;

	// 新增经纪人证书类型
	private String zqscjbflfg;
	private String zqscjbflfgUploadId;
	private String jrscjczs;
	private String jrscjczsUploadId;
	private String zqtzjjjczs;
	private String zqtzjjjczsUploadId;
	private String jjflfgzyddyywgf;
	private String jjflfgzyddyywgfUploadId;

	// 新增经纪人证书类型 20170330
	private String smgqtzjjjczs;
	private String smgqtzjjjczsUploadId;

	public String getSmgqtzjjjczs() {
		return smgqtzjjjczs;
	}

	public void setSmgqtzjjjczs(String smgqtzjjjczs) {
		this.smgqtzjjjczs = smgqtzjjjczs;
	}

	public String getSmgqtzjjjczsUploadId() {
		return smgqtzjjjczsUploadId;
	}

	public void setSmgqtzjjjczsUploadId(String smgqtzjjjczsUploadId) {
		this.smgqtzjjjczsUploadId = smgqtzjjjczsUploadId;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public Integer getReviewType() {
		return reviewType;
	}

	public void setReviewType(Integer reviewType) {
		this.reviewType = reviewType;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getE_date() {
		return e_date;
	}

	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPerformanceType() {
		return performanceType;
	}

	public void setPerformanceType(String performanceType) {
		this.performanceType = performanceType;
	}

	public String getBrOffshootId() {
		return brOffshootId;
	}

	public void setBrOffshootId(String brOffshootId) {
		this.brOffshootId = brOffshootId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getHjAddr() {
		return hjAddr;
	}

	public void setHjAddr(String hjAddr) {
		this.hjAddr = hjAddr;
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

	public String getInternetFlag() {
		return internetFlag;
	}

	public void setInternetFlag(String internetFlag) {
		this.internetFlag = internetFlag;
	}

	public String getJczsHgzbh() {
		return jczsHgzbh;
	}

	public void setJczsHgzbh(String jczsHgzbh) {
		this.jczsHgzbh = jczsHgzbh;
	}

	public String getJjrskName() {
		return jjrskName;
	}

	public void setJjrskName(String jjrskName) {
		this.jjrskName = jjrskName;
	}

	public String getJjxybh() {
		return jjxybh;
	}

	public void setJjxybh(String jjxybh) {
		this.jjxybh = jjxybh;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getOld() {
		return old;
	}

	public void setOld(String old) {
		this.old = old;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public Date getQysjBegin() {
		return qysjBegin;
	}

	public void setQysjBegin(Date qysjBegin) {
		this.qysjBegin = qysjBegin;
	}

	public Date getQysjEnd() {
		return qysjEnd;
	}

	public void setQysjEnd(Date qysjEnd) {
		this.qysjEnd = qysjEnd;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	// public Long getSalary() {
	// return salary;
	// }
	//
	//
	// public void setSalary(Long salary) {
	// this.salary = salary;
	// }

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSkyh() {
		return skyh;
	}

	public void setSkyh(String skyh) {
		this.skyh = skyh;
	}

	public String getSkyhzh() {
		return skyhzh;
	}

	public void setSkyhzh(String skyhzh) {
		this.skyhzh = skyhzh;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTcbl() {
		return tcbl;
	}

	public void setTcbl(String tcbl) {
		this.tcbl = tcbl;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getZqjjywHgzbh() {
		return zqjjywHgzbh;
	}

	public void setZqjjywHgzbh(String zqjjywHgzbh) {
		this.zqjjywHgzbh = zqjjywHgzbh;
	}

	public String getZqjyHgzbh() {
		return zqjyHgzbh;
	}

	public void setZqjyHgzbh(String zqjyHgzbh) {
		this.zqjyHgzbh = zqjyHgzbh;
	}

	public String getZqscjcHgzbh() {
		return zqscjcHgzbh;
	}

	public void setZqscjcHgzbh(String zqscjcHgzbh) {
		this.zqscjcHgzbh = zqscjcHgzbh;
	}

	public String getBrokernumber() {
		return brokernumber;
	}

	public void setBrokernumber(String brokernumber) {
		this.brokernumber = brokernumber;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getBrokerNumberUploadId() {
		return brokerNumberUploadId;
	}

	public void setBrokerNumberUploadId(String brokerNumberUploadId) {
		this.brokerNumberUploadId = brokerNumberUploadId;
	}

	public String getDegreeUploadId() {
		return degreeUploadId;
	}

	public void setDegreeUploadId(String degreeUploadId) {
		this.degreeUploadId = degreeUploadId;
	}

	public String getIdCardUploadId() {
		return idCardUploadId;
	}

	public void setIdCardUploadId(String idCardUploadId) {
		this.idCardUploadId = idCardUploadId;
	}

	public String getJczsHgzbhUploadId() {
		return jczsHgzbhUploadId;
	}

	public void setJczsHgzbhUploadId(String jczsHgzbhUploadId) {
		this.jczsHgzbhUploadId = jczsHgzbhUploadId;
	}

	public String getJjrskNameUploadId() {
		return jjrskNameUploadId;
	}

	public void setJjrskNameUploadId(String jjrskNameUploadId) {
		this.jjrskNameUploadId = jjrskNameUploadId;
	}

	public String getJjxybhUploadId() {
		return jjxybhUploadId;
	}

	public void setJjxybhUploadId(String jjxybhUploadId) {
		this.jjxybhUploadId = jjxybhUploadId;
	}

	public String getQysjUploadId() {
		return qysjUploadId;
	}

	public void setQysjUploadId(String qysjUploadId) {
		this.qysjUploadId = qysjUploadId;
	}

	public String getRzsqbUploadId() {
		return rzsqbUploadId;
	}

	public void setRzsqbUploadId(String rzsqbUploadId) {
		this.rzsqbUploadId = rzsqbUploadId;
	}

	public String getSalaryUploadId() {
		return salaryUploadId;
	}

	public void setSalaryUploadId(String salaryUploadId) {
		this.salaryUploadId = salaryUploadId;
	}

	public String getSkyhUploadId() {
		return skyhUploadId;
	}

	public void setSkyhUploadId(String skyhUploadId) {
		this.skyhUploadId = skyhUploadId;
	}

	public String getSkyhzhUploadId() {
		return skyhzhUploadId;
	}

	public void setSkyhzhUploadId(String skyhzhUploadId) {
		this.skyhzhUploadId = skyhzhUploadId;
	}

	public String getTcblUploadId() {
		return tcblUploadId;
	}

	public void setTcblUploadId(String tcblUploadId) {
		this.tcblUploadId = tcblUploadId;
	}

	public String getZqjjywHgzbhUploadId() {
		return zqjjywHgzbhUploadId;
	}

	public void setZqjjywHgzbhUploadId(String zqjjywHgzbhUploadId) {
		this.zqjjywHgzbhUploadId = zqjjywHgzbhUploadId;
	}

	public String getZqjyHgzbhUploadId() {
		return zqjyHgzbhUploadId;
	}

	public void setZqjyHgzbhUploadId(String zqjyHgzbhUploadId) {
		this.zqjyHgzbhUploadId = zqjyHgzbhUploadId;
	}

	public String getZqscjcHgzbhUploadId() {
		return zqscjcHgzbhUploadId;
	}

	public void setZqscjcHgzbhUploadId(String zqscjcHgzbhUploadId) {
		this.zqscjcHgzbhUploadId = zqscjcHgzbhUploadId;
	}

	public String getZycnhUploadId() {
		return zycnhUploadId;
	}

	public void setZycnhUploadId(String zycnhUploadId) {
		this.zycnhUploadId = zycnhUploadId;
	}

	public byte[] getGzjl() {
		return gzjl;
	}

	public void setGzjl(byte[] gzjl) {
		this.gzjl = gzjl;
	}

	public byte[] getXxjl() {
		return xxjl;
	}

	public void setXxjl(byte[] xxjl) {
		this.xxjl = xxjl;
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

	public String getBlName() {
		return blName;
	}

	public void setBlName(String blName) {
		this.blName = blName;
	}

	public String getZqtzjj() {
		return zqtzjj;
	}

	public void setZqtzjj(String zqtzjj) {
		this.zqtzjj = zqtzjj;
	}

	public String getZqtzjjUploadId() {
		return zqtzjjUploadId;
	}

	public void setZqtzjjUploadId(String zqtzjjUploadId) {
		this.zqtzjjUploadId = zqtzjjUploadId;
	}

	public String getZqtzjjxsjczs() {
		return zqtzjjxsjczs;
	}

	public void setZqtzjjxsjczs(String zqtzjjxsjczs) {
		this.zqtzjjxsjczs = zqtzjjxsjczs;
	}

	public String getZqtzjjxsjczsUploadId() {
		return zqtzjjxsjczsUploadId;
	}

	public void setZqtzjjxsjczsUploadId(String zqtzjjxsjczsUploadId) {
		this.zqtzjjxsjczsUploadId = zqtzjjxsjczsUploadId;
	}

	public String getZydy() {
		return zydy;
	}

	public void setZydy(String zydy) {
		this.zydy = zydy;
	}

	public Date getPreendtime() {
		return preendtime;
	}

	public void setPreendtime(Date preendtime) {
		this.preendtime = preendtime;
	}

	public String getText1() {
		return text1;
	}

	public void setText1(String text1) {
		this.text1 = text1;
	}

	public Date getQysjBegin_1() {
		return qysjBegin_1;
	}

	public void setQysjBegin_1(Date qysjBegin_1) {
		this.qysjBegin_1 = qysjBegin_1;
	}

	public Date getQysjEnd_1() {
		return qysjEnd_1;
	}

	public void setQysjEnd_1(Date qysjEnd_1) {
		this.qysjEnd_1 = qysjEnd_1;
	}

	public Double getSalary_1() {
		return salary_1;
	}

	public void setSalary_1(Double salary_1) {
		this.salary_1 = salary_1;
	}

	public int getTime_limit() {
		return time_limit;
	}

	public void setTime_limit(int time_limit) {
		this.time_limit = time_limit;
	}

	public String getIsFinish() {
		return isFinish;
	}

	public void setIsFinish(String isFinish) {
		this.isFinish = isFinish;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public long getXsjhlccp() {
		return xsjhlccp;
	}

	public void setXsjhlccp(long xsjhlccp) {
		this.xsjhlccp = xsjhlccp;
	}

	public long getXskfsjj() {
		return xskfsjj;
	}

	public void setXskfsjj(long xskfsjj) {
		this.xskfsjj = xskfsjj;
	}

	public long getXssmjj() {
		return xssmjj;
	}

	public void setXssmjj(long xssmjj) {
		this.xssmjj = xssmjj;
	}

	public int getTemplate_flag() {
		return template_flag;
	}

	public void setTemplate_flag(int template_flag) {
		this.template_flag = template_flag;
	}

	public int getEhrJjr() {
		return ehrJjr;
	}

	public void setEhrJjr(int ehrJjr) {
		this.ehrJjr = ehrJjr;
	}

	public int getHtCount() {
		return htCount;
	}

	public void setHtCount(int htCount) {
		this.htCount = htCount;
	}

	public int getZy_time_limit() {
		return zy_time_limit;
	}

	public void setZy_time_limit(int zy_time_limit) {
		this.zy_time_limit = zy_time_limit;
	}

	public String getTcblbz() {
		return tcblbz;
	}

	public void setTcblbz(String tcblbz) {
		this.tcblbz = tcblbz;
	}

	public String getIstraining() {
		return istraining;
	}

	public void setIstraining(String istraining) {
		this.istraining = istraining;
	}

	public String getTrainingUploadId() {
		return trainingUploadId;
	}

	public void setTrainingUploadId(String trainingUploadId) {
		this.trainingUploadId = trainingUploadId;
	}

	public String getTrainingUploadId2() {
		return trainingUploadId2;
	}

	public void setTrainingUploadId2(String trainingUploadId2) {
		this.trainingUploadId2 = trainingUploadId2;
	}

	public String getTrainingUploadId3() {
		return trainingUploadId3;
	}

	public void setTrainingUploadId3(String trainingUploadId3) {
		this.trainingUploadId3 = trainingUploadId3;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public int getContractList() {
		return contractList;
	}

	public void setContractList(int contractList) {
		this.contractList = contractList;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public Integer getCancelledStatus() {
		return cancelledStatus;
	}

	public void setCancelledStatus(Integer cancelledStatus) {
		this.cancelledStatus = cancelledStatus;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getContractLength() {
		return contractLength;
	}

	public void setContractLength(Integer contractLength) {
		this.contractLength = contractLength;
	}

	public String getZqtzfx() {
		return zqtzfx;
	}

	public void setZqtzfx(String zqtzfx) {
		this.zqtzfx = zqtzfx;
	}

	public String getZqtzfxUploadId() {
		return zqtzfxUploadId;
	}

	public void setZqtzfxUploadId(String zqtzfxUploadId) {
		this.zqtzfxUploadId = zqtzfxUploadId;
	}

	public String getZqfxycx() {
		return zqfxycx;
	}

	public void setZqfxycx(String zqfxycx) {
		this.zqfxycx = zqfxycx;
	}

	public String getZqfxycxUploadId() {
		return zqfxycxUploadId;
	}

	public void setZqfxycxUploadId(String zqfxycxUploadId) {
		this.zqfxycxUploadId = zqfxycxUploadId;
	}

	public String getZqscjbflfg() {
		return zqscjbflfg;
	}

	public void setZqscjbflfg(String zqscjbflfg) {
		this.zqscjbflfg = zqscjbflfg;
	}

	public String getZqscjbflfgUploadId() {
		return zqscjbflfgUploadId;
	}

	public void setZqscjbflfgUploadId(String zqscjbflfgUploadId) {
		this.zqscjbflfgUploadId = zqscjbflfgUploadId;
	}

	public String getJrscjczs() {
		return jrscjczs;
	}

	public void setJrscjczs(String jrscjczs) {
		this.jrscjczs = jrscjczs;
	}

	public String getJrscjczsUploadId() {
		return jrscjczsUploadId;
	}

	public void setJrscjczsUploadId(String jrscjczsUploadId) {
		this.jrscjczsUploadId = jrscjczsUploadId;
	}

	public String getZqtzjjjczs() {
		return zqtzjjjczs;
	}

	public void setZqtzjjjczs(String zqtzjjjczs) {
		this.zqtzjjjczs = zqtzjjjczs;
	}

	public String getZqtzjjjczsUploadId() {
		return zqtzjjjczsUploadId;
	}

	public void setZqtzjjjczsUploadId(String zqtzjjjczsUploadId) {
		this.zqtzjjjczsUploadId = zqtzjjjczsUploadId;
	}

	public String getJjflfgzyddyywgf() {
		return jjflfgzyddyywgf;
	}

	public void setJjflfgzyddyywgf(String jjflfgzyddyywgf) {
		this.jjflfgzyddyywgf = jjflfgzyddyywgf;
	}

	public String getJjflfgzyddyywgfUploadId() {
		return jjflfgzyddyywgfUploadId;
	}

	public void setJjflfgzyddyywgfUploadId(String jjflfgzyddyywgfUploadId) {
		this.jjflfgzyddyywgfUploadId = jjflfgzyddyywgfUploadId;
	}

}
