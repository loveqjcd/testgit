package main.java.dao.model.user;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class UserFunctionInfoDo implements Serializable {
    private static final long serialVersionUID = 1420525733726L;

    private Long id;
    private String functionName;
    private String functionUrl;
    private Integer functionLevel;
    private Long parentId;
    private String iconSrc;
    private Integer status;
    private String leaf;
    private Float orderIndex;
    private String memo;
    private Date gmtCreate;
    private Date gmtModified;
    
    private List<UserFunctionInfoDo> subFunctions;
    
    private String ids;
    
    private String isChecked;

    public String getIsChecked() {
		return isChecked;
	}

	public void setIsChecked(String isChecked) {
		this.isChecked = isChecked;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public List<UserFunctionInfoDo> getSubFunctions() {
		return subFunctions;
	}

	public void setSubFunctions(List<UserFunctionInfoDo> subFunctions) {
		this.subFunctions = subFunctions;
	}

	public void setId(Long id) {
        this.hasId = Boolean.TRUE;
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setFunctionName(String functionName) {
        this.hasFunctionName = Boolean.TRUE;
        this.functionName = functionName;
    }

    public String getFunctionName() {
        return functionName;
    }

    public void setFunctionUrl(String functionUrl) {
        this.hasFunctionUrl = Boolean.TRUE;
        this.functionUrl = functionUrl;
    }

    public String getFunctionUrl() {
        return functionUrl;
    }

    public void setFunctionLevel(Integer functionLevel) {
        this.hasFunctionLevel = Boolean.TRUE;
        this.functionLevel = functionLevel;
    }

    public Integer getFunctionLevel() {
        return functionLevel;
    }

    public void setParentId(Long parentId) {
        this.hasParentId = Boolean.TRUE;
        this.parentId = parentId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setIconSrc(String iconSrc) {
        this.hasIconSrc = Boolean.TRUE;
        this.iconSrc = iconSrc;
    }

    public String getIconSrc() {
        return iconSrc;
    }

    public void setStatus(Integer status) {
        this.hasStatus = Boolean.TRUE;
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setLeaf(String leaf) {
        this.hasLeaf = Boolean.TRUE;
        this.leaf = leaf;
    }

    public String getLeaf() {
        return leaf;
    }

    public void setOrderIndex(Float orderIndex) {
        this.hasOrderIndex = Boolean.TRUE;
        this.orderIndex = orderIndex;
    }

    public Float getOrderIndex() {
        return orderIndex;
    }

    public void setMemo(String memo) {
        this.hasMemo = Boolean.TRUE;
        this.memo = memo;
    }

    public String getMemo() {
        return memo;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.hasGmtCreate = Boolean.TRUE;
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtModified(Date gmtModified) {
        this.hasGmtModified = Boolean.TRUE;
        this.gmtModified = gmtModified;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    private Boolean hasId;
    private Boolean hasFunctionName;
    private Boolean hasFunctionUrl;
    private Boolean hasFunctionLevel;
    private Boolean hasParentId;
    private Boolean hasIconSrc;
    private Boolean hasStatus;
    private Boolean hasLeaf;
    private Boolean hasOrderIndex;
    private Boolean hasMemo;
    private Boolean hasGmtCreate;
    private Boolean hasGmtModified;

    public Boolean hasId(){
        return this.hasId != null;
    }

    public Boolean hasFunctionName(){
        return this.hasFunctionName != null;
    }

    public Boolean hasFunctionUrl(){
        return this.hasFunctionUrl != null;
    }

    public Boolean hasFunctionLevel(){
        return this.hasFunctionLevel != null;
    }

    public Boolean hasParentId(){
        return this.hasParentId != null;
    }

    public Boolean hasIconSrc(){
        return this.hasIconSrc != null;
    }

    public Boolean hasStatus(){
        return this.hasStatus != null;
    }

    public Boolean hasLeaf(){
        return this.hasLeaf != null;
    }

    public Boolean hasOrderIndex(){
        return this.hasOrderIndex != null;
    }

    public Boolean hasMemo(){
        return this.hasMemo != null;
    }

    public Boolean hasGmtCreate(){
        return this.hasGmtCreate != null;
    }

    public Boolean hasGmtModified(){
        return this.hasGmtModified != null;
    }

    public void clearId(){
        this.id = null;
        this.hasId = Boolean.FALSE;
    }

    public void clearFunctionName(){
        this.functionName = null;
        this.hasFunctionName = Boolean.FALSE;
    }

    public void clearFunctionUrl(){
        this.functionUrl = null;
        this.hasFunctionUrl = Boolean.FALSE;
    }

    public void clearFunctionLevel(){
        this.functionLevel = null;
        this.hasFunctionLevel = Boolean.FALSE;
    }

    public void clearParentId(){
        this.parentId = null;
        this.hasParentId = Boolean.FALSE;
    }

    public void clearIconSrc(){
        this.iconSrc = null;
        this.hasIconSrc = Boolean.FALSE;
    }

    public void clearStatus(){
        this.status = null;
        this.hasStatus = Boolean.FALSE;
    }

    public void clearLeaf(){
        this.leaf = null;
        this.hasLeaf = Boolean.FALSE;
    }

    public void clearOrderIndex(){
        this.orderIndex = null;
        this.hasOrderIndex = Boolean.FALSE;
    }

    public void clearMemo(){
        this.memo = null;
        this.hasMemo = Boolean.FALSE;
    }

    public void clearGmtCreate(){
        this.gmtCreate = null;
        this.hasGmtCreate = Boolean.FALSE;
    }

    public void clearGmtModified(){
        this.gmtModified = null;
        this.hasGmtModified = Boolean.FALSE;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((functionName == null) ? 0 : functionName.hashCode());
        result = prime * result + ((functionUrl == null) ? 0 : functionUrl.hashCode());
        result = prime * result + ((functionLevel == null) ? 0 : functionLevel.hashCode());
        result = prime * result + ((parentId == null) ? 0 : parentId.hashCode());
        result = prime * result + ((iconSrc == null) ? 0 : iconSrc.hashCode());
        result = prime * result + ((status == null) ? 0 : status.hashCode());
        result = prime * result + ((leaf == null) ? 0 : leaf.hashCode());
        result = prime * result + ((orderIndex == null) ? 0 : orderIndex.hashCode());
        result = prime * result + ((memo == null) ? 0 : memo.hashCode());
        result = prime * result + ((gmtCreate == null) ? 0 : gmtCreate.hashCode());
        result = prime * result + ((gmtModified == null) ? 0 : gmtModified.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        UserFunctionInfoDo other = (UserFunctionInfoDo) obj;
        if (id == null) {
            if(other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (functionName == null) {
            if(other.functionName != null)
                return false;
        } else if (!functionName.equals(other.functionName))
            return false;
        if (functionUrl == null) {
            if(other.functionUrl != null)
                return false;
        } else if (!functionUrl.equals(other.functionUrl))
            return false;
        if (functionLevel == null) {
            if(other.functionLevel != null)
                return false;
        } else if (!functionLevel.equals(other.functionLevel))
            return false;
        if (parentId == null) {
            if(other.parentId != null)
                return false;
        } else if (!parentId.equals(other.parentId))
            return false;
        if (iconSrc == null) {
            if(other.iconSrc != null)
                return false;
        } else if (!iconSrc.equals(other.iconSrc))
            return false;
        if (status == null) {
            if(other.status != null)
                return false;
        } else if (!status.equals(other.status))
            return false;
        if (leaf == null) {
            if(other.leaf != null)
                return false;
        } else if (!leaf.equals(other.leaf))
            return false;
        if (orderIndex == null) {
            if(other.orderIndex != null)
                return false;
        } else if (!orderIndex.equals(other.orderIndex))
            return false;
        if (memo == null) {
            if(other.memo != null)
                return false;
        } else if (!memo.equals(other.memo))
            return false;
        if (gmtCreate == null) {
            if(other.gmtCreate != null)
                return false;
        } else if (!gmtCreate.equals(other.gmtCreate))
            return false;
        if (gmtModified == null) {
            if(other.gmtModified != null)
                return false;
        } else if (!gmtModified.equals(other.gmtModified))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "UserFunctionInfoDo[id=" + id + ", functionName=" + functionName + ", functionUrl=" + functionUrl + ", functionLevel=" + functionLevel + ", parentId=" + parentId + ", iconSrc=" + iconSrc + ", status=" + status + ", leaf=" + leaf + ", orderIndex=" + orderIndex + ", memo=" + memo + ", gmtCreate=" + gmtCreate + ", gmtModified=" + gmtModified + ", hasId=" + hasId + ", hasFunctionName=" + hasFunctionName + ", hasFunctionUrl=" + hasFunctionUrl + ", hasFunctionLevel=" + hasFunctionLevel + ", hasParentId=" + hasParentId + ", hasIconSrc=" + hasIconSrc + ", hasStatus=" + hasStatus + ", hasLeaf=" + hasLeaf + ", hasOrderIndex=" + hasOrderIndex + ", hasMemo=" + hasMemo + ", hasGmtCreate=" + hasGmtCreate + ", hasGmtModified=" + hasGmtModified+ "]";
    }
}
