package main.java.common.util.entity;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;


/**
 * Group : wangjubao.com
 * 说明：基类实体
 * @author bruce
 * @create Jun 30, 2009 6:13:09 PM
 */
public abstract class BaseEntity implements java.io.Serializable{
	
	private static final long serialVersionUID = -4789309259483505674L;

	public static final Integer STATUS_CLOSE_WRITE = 2; // 邮件/短信内容关闭修改
	
	public static final int ASC = 1;   					//升序
	
	public static final int DESC = 0;   				//降序
	
	public static final Integer GENDER_ALL = 3	;		//包括男女

	public static final Integer GENDER_MAN = 1;			//男
	
	public static final Integer GENDER_WOMEN = 2;		//女

	public static final Integer GENDER_NONE = 0;		//未知
	
	public static final Integer DELETED_YES = 1;		//禁用
	
	public static final Integer DELETED_NO = 0;			//启用
	
	public static final Integer STATUS_SUCCESS=0;		//启用

	public static final Integer STATUS_FAIL=1;			//禁用
	
	public static final Integer STATUS_YES=1;			//有

	public static final Integer STATUS_NO=0;			//无
	
	public static final Integer STATUS_TO_YES=1;        //已分配
	
	public static final Integer STATUS_TO_NO=0;        //未分配
	
	private  Integer pageSize = 10;			//每页显示记录数(默认值)
	
	private  Integer pageNo = 1;				//页码(默认值)
	
	private  Integer limit;					//返回指定条数记录(仅用于查询)
	
	private Integer status;								//状态 0成功，1失败
	
	private Date createTime;							//创建时间
	
	private Date updateTime;							//最后更新时间
	
	private Long createUserId;							//创建者id
	
	private Long updateUserId;							//最后最新者Id
	
	
	private Integer deleted;					//删除状态
	
	private String fields;						// 导出 用户选择的需要导出字段
	
	private String showFields; 					// 导出 用于查询导出的数据库字段  field,field,field
	
	private String orderField;					// 要排序的字段
	
	private String desc;						// 是否desc
	
	private  Tip tip;					//错误提示信息
	
	private String searchSql;							//对应的sql字段
	
	/**
	 * 说明：
	 * @deprecated
	 */
	private String optLog;
	
	//说明：状态参数
	public static final Map<String, String> deletedMap = new LinkedHashMap<String, String>();
	static  {
    	deletedMap.put(BaseEntity.DELETED_NO.toString(), "启用");
    	deletedMap.put(BaseEntity.DELETED_YES.toString(), "禁用");
    }
	
	/**
	 * 说明：判断当前是否有错误信息。
	 * @return
	 */
	public boolean isError(){
		return (tip!=null && tip.isError())?true:false;
	}
	
	/**
	 * 说明：判断当前是否没有错误
	 * @return
	 */
	public boolean isNotError(){
		return !isError();
	}
	
	/**
	 * 说明：设置成yes
	 */
	public void setDeletedYes(){
		this.setDeleted(BaseEntity.DELETED_YES);
	}
	
	/**
	 * 说明：设置成no
	 */
	public void setDeletedNo(){
		this.setDeleted(BaseEntity.DELETED_NO);
	}
	
	/**
	 * 说明：判断当前实体是否删除
	 * @return
	 */
	public boolean isDeleted(){
		return BaseEntity.DELETED_YES.equals(this.deleted);
	}

	/**
	 * 说明：判断当前实体是否未删除
	 * @return
	 */
	public boolean isNotDeleted(){
		return BaseEntity.DELETED_NO.equals(this.deleted);
	}
	

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getFields() {
		return fields;
	}

	public void setFields(String fields) {
		this.fields = fields;
	}

	public String getShowFields() {
		return showFields;
	}

	public void setShowFields(String showFields) {
		this.showFields = showFields;
	}


	public void setCreateTime(){
		this.setCreateTime(new Date());
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}


	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Long getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(Long updateUserId) {
		this.updateUserId = updateUserId;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getDeleted() {
		return deleted;
	}

	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}

	public Tip getTip() {
		return tip;
	}

	public void setTip(Tip tip) {
		this.tip = tip;
	}

	public String getOptLog() {
		return optLog;
	}

	public void setOptLog(String optLog) {
		this.optLog = optLog;
	}

	public String getSearchSql() {
		return searchSql;
	}

	public void setSearchSql(String searchSql) {
		this.searchSql = searchSql;
	}

}
