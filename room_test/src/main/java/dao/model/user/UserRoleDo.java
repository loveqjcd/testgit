package main.java.dao.model.user;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class UserRoleDo implements Serializable {
    private static final long serialVersionUID = 1421299514168L;

    private Long id;
    private String name;
    private String keywords;
    private Integer type;
    private Long createUserId;
    private String memo;
    private Integer status;
    private Date createTime;
    private Date updateTime;
    
    private String types;

    private UserDo createUser;
    
	public UserDo getCreateUser() {
		return createUser;
	}

	public void setCreateUser(UserDo createUser) {
		this.createUser = createUser;
	}

	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	public void setId(Long id) {
        this.hasId = Boolean.TRUE;
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setName(String name) {
        this.hasName = Boolean.TRUE;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setKeywords(String keywords) {
        this.hasKeywords = Boolean.TRUE;
        this.keywords = keywords;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setType(Integer type) {
        this.hasType = Boolean.TRUE;
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

    public void setCreateUserId(Long createUserId) {
        this.hasCreateUserId = Boolean.TRUE;
        this.createUserId = createUserId;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public void setMemo(String memo) {
        this.hasMemo = Boolean.TRUE;
        this.memo = memo;
    }

    public String getMemo() {
        return memo;
    }

    public void setStatus(Integer status) {
        this.hasStatus = Boolean.TRUE;
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setCreateTime(Date createTime) {
        this.hasCreateTime = Boolean.TRUE;
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.hasUpdateTime = Boolean.TRUE;
        this.updateTime = updateTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    private Boolean hasId;
    private Boolean hasName;
    private Boolean hasKeywords;
    private Boolean hasType;
    private Boolean hasCreateUserId;
    private Boolean hasMemo;
    private Boolean hasStatus;
    private Boolean hasCreateTime;
    private Boolean hasUpdateTime;

    public Boolean hasId(){
        return this.hasId != null;
    }

    public Boolean hasName(){
        return this.hasName != null;
    }

    public Boolean hasKeywords(){
        return this.hasKeywords != null;
    }

    public Boolean hasType(){
        return this.hasType != null;
    }

    public Boolean hasCreateUserId(){
        return this.hasCreateUserId != null;
    }

    public Boolean hasMemo(){
        return this.hasMemo != null;
    }

    public Boolean hasStatus(){
        return this.hasStatus != null;
    }

    public Boolean hasCreateTime(){
        return this.hasCreateTime != null;
    }

    public Boolean hasUpdateTime(){
        return this.hasUpdateTime != null;
    }

    public void clearId(){
        this.id = null;
        this.hasId = Boolean.FALSE;
    }

    public void clearName(){
        this.name = null;
        this.hasName = Boolean.FALSE;
    }

    public void clearKeywords(){
        this.keywords = null;
        this.hasKeywords = Boolean.FALSE;
    }

    public void clearType(){
        this.type = null;
        this.hasType = Boolean.FALSE;
    }

    public void clearCreateUserId(){
        this.createUserId = null;
        this.hasCreateUserId = Boolean.FALSE;
    }

    public void clearMemo(){
        this.memo = null;
        this.hasMemo = Boolean.FALSE;
    }

    public void clearStatus(){
        this.status = null;
        this.hasStatus = Boolean.FALSE;
    }

    public void clearCreateTime(){
        this.createTime = null;
        this.hasCreateTime = Boolean.FALSE;
    }

    public void clearUpdateTime(){
        this.updateTime = null;
        this.hasUpdateTime = Boolean.FALSE;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((keywords == null) ? 0 : keywords.hashCode());
        result = prime * result + ((type == null) ? 0 : type.hashCode());
        result = prime * result + ((createUserId == null) ? 0 : createUserId.hashCode());
        result = prime * result + ((memo == null) ? 0 : memo.hashCode());
        result = prime * result + ((status == null) ? 0 : status.hashCode());
        result = prime * result + ((createTime == null) ? 0 : createTime.hashCode());
        result = prime * result + ((updateTime == null) ? 0 : updateTime.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        UserRoleDo other = (UserRoleDo) obj;
        if (id == null) {
            if(other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (name == null) {
            if(other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (keywords == null) {
            if(other.keywords != null)
                return false;
        } else if (!keywords.equals(other.keywords))
            return false;
        if (type == null) {
            if(other.type != null)
                return false;
        } else if (!type.equals(other.type))
            return false;
        if (createUserId == null) {
            if(other.createUserId != null)
                return false;
        } else if (!createUserId.equals(other.createUserId))
            return false;
        if (memo == null) {
            if(other.memo != null)
                return false;
        } else if (!memo.equals(other.memo))
            return false;
        if (status == null) {
            if(other.status != null)
                return false;
        } else if (!status.equals(other.status))
            return false;
        if (createTime == null) {
            if(other.createTime != null)
                return false;
        } else if (!createTime.equals(other.createTime))
            return false;
        if (updateTime == null) {
            if(other.updateTime != null)
                return false;
        } else if (!updateTime.equals(other.updateTime))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "UserRoleDo[id=" + id + ", name=" + name + ", keywords=" + keywords + ", type=" + type + ", createUserId=" + createUserId + ", memo=" + memo + ", status=" + status + ", createTime=" + createTime + ", updateTime=" + updateTime + ", hasId=" + hasId + ", hasName=" + hasName + ", hasKeywords=" + hasKeywords + ", hasType=" + hasType + ", hasCreateUserId=" + hasCreateUserId + ", hasMemo=" + hasMemo + ", hasStatus=" + hasStatus + ", hasCreateTime=" + hasCreateTime + ", hasUpdateTime=" + hasUpdateTime+ "]";
    }
}
