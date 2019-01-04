package main.java.dao.model.jjr;

import java.util.Date;

public class JjrApply {
	private long id;
	private long jjrUserId;
	private Date qysjBegin;
	private Date qysjEnd;
	private String jjxybh;
	private String jjxybhUploadId;
	private String state;
	private String type;
	private String shState;
	private String shReson;
	private Date createDate;
	private String salary;
	private String userName;
	private String realName;
	private String branchName;

	private String htType;
	private String displayType;
	private String rzsqbUploadId;
	private String zycnhUploadId;

	private String keyCode;
	private long teamId;
	private String teamName;
	private Date applyDate;
	private String applyType;
	private String applyState;

	private String ext1;
	private String ext2;
	private String ext3;
	private String ext4;

	private long jjrId;
	private String changeState;
	private String purposeIden;
	private long preTeam;
	private String preIden;
	private Date fuheDate;
	private long applyId;

	private String identify;
	private Date joinDate;

	private String info;

	private String keyName;
	private int captainCount;
	private int memberCount;

	private int userType;

	private String zqtzjj;
	private String zqtzjjUploadId;
	private String zqtzjjxsjczs;
	private String zqtzjjxsjczsUploadId;
	private String checkUser;
	private String jjrType;

	private String istraining;// 是否培训
	private String trainingUploadId;
	private String trainingUploadId2;
	private String trainingUploadId3;

	private String xqType;
	private String xq_time_limit;

	private Date reviewDate;
	private Integer reviewType;

	private long xskfsjj;// 销售开放式基金
	private long xssmjj;// 销售私募基金
	private long xsjhlccp;// 销售集合理财产品

	private String zydy;

	public String getZydy() {
		return zydy;
	}

	public void setZydy(String zydy) {
		this.zydy = zydy;
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

	public long getXsjhlccp() {
		return xsjhlccp;
	}

	public void setXsjhlccp(long xsjhlccp) {
		this.xsjhlccp = xsjhlccp;
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

	public String getCheckUser() {
		return checkUser;
	}

	public void setCheckUser(String checkUser) {
		this.checkUser = checkUser;
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

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getCaptainCount() {
		return captainCount;
	}

	public void setCaptainCount(int captainCount) {
		this.captainCount = captainCount;
	}

	public String getKeyName() {
		return keyName;
	}

	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public long getApplyId() {
		return applyId;
	}

	public void setApplyId(long applyId) {
		this.applyId = applyId;
	}

	public String getChangeState() {
		return changeState;
	}

	public void setChangeState(String changeState) {
		this.changeState = changeState;
	}

	public Date getFuheDate() {
		return fuheDate;
	}

	public void setFuheDate(Date fuheDate) {
		this.fuheDate = fuheDate;
	}

	public long getJjrId() {
		return jjrId;
	}

	public void setJjrId(long jjrId) {
		this.jjrId = jjrId;
	}

	public String getPreIden() {
		return preIden;
	}

	public void setPreIden(String preIden) {
		this.preIden = preIden;
	}

	public long getPreTeam() {
		return preTeam;
	}

	public void setPreTeam(long preTeam) {
		this.preTeam = preTeam;
	}

	public String getPurposeIden() {
		return purposeIden;
	}

	public void setPurposeIden(String purposeIden) {
		this.purposeIden = purposeIden;
	}

	public String getExt1() {
		return ext1;
	}

	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}

	public String getExt2() {
		return ext2;
	}

	public void setExt2(String ext2) {
		this.ext2 = ext2;
	}

	public String getExt3() {
		return ext3;
	}

	public void setExt3(String ext3) {
		this.ext3 = ext3;
	}

	public String getExt4() {
		return ext4;
	}

	public void setExt4(String ext4) {
		this.ext4 = ext4;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getApplyState() {
		return applyState;
	}

	public void setApplyState(String applyState) {
		this.applyState = applyState;
	}

	public String getApplyType() {
		return applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	public String getKeyCode() {
		return keyCode;
	}

	public void setKeyCode(String keyCode) {
		this.keyCode = keyCode;
	}

	public long getTeamId() {
		return teamId;
	}

	public void setTeamId(long teamId) {
		this.teamId = teamId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getDisplayType() {
		return displayType;
	}

	public void setDisplayType(String displayType) {
		this.displayType = displayType;
	}

	public String getHtType() {
		return htType;
	}

	public void setHtType(String htType) {
		this.htType = htType;
	}

	public String getRzsqbUploadId() {
		return rzsqbUploadId;
	}

	public void setRzsqbUploadId(String rzsqbUploadId) {
		this.rzsqbUploadId = rzsqbUploadId;
	}

	public String getZycnhUploadId() {
		return zycnhUploadId;
	}

	public void setZycnhUploadId(String zycnhUploadId) {
		this.zycnhUploadId = zycnhUploadId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getJjrUserId() {
		return jjrUserId;
	}

	public void setJjrUserId(long jjrUserId) {
		this.jjrUserId = jjrUserId;
	}

	public String getJjxybh() {
		return jjxybh;
	}

	public void setJjxybh(String jjxybh) {
		this.jjxybh = jjxybh;
	}

	public String getJjxybhUploadId() {
		return jjxybhUploadId;
	}

	public void setJjxybhUploadId(String jjxybhUploadId) {
		this.jjxybhUploadId = jjxybhUploadId;
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

	public String getShReson() {
		return shReson;
	}

	public void setShReson(String shReson) {
		this.shReson = shReson;
	}

	public String getShState() {
		return shState;
	}

	public void setShState(String shState) {
		this.shState = shState;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getJjrType() {
		return jjrType;
	}

	public void setJjrType(String jjrType) {
		this.jjrType = jjrType;
	}

	public String getXq_time_limit() {
		return xq_time_limit;
	}

	public void setXq_time_limit(String xq_time_limit) {
		this.xq_time_limit = xq_time_limit;
	}

	public String getXqType() {
		return xqType;
	}

	public void setXqType(String xqType) {
		this.xqType = xqType;
	}

}
