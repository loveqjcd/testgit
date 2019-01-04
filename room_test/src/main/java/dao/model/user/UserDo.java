package main.java.dao.model.user;

import java.util.Date;
import java.util.List;

import main.java.common.util.entity.BaseEntity;

public class UserDo extends BaseEntity {
	
	private static final long serialVersionUID = 1430882634732L;
    
    public static final String USER_SESSION_NAME = "userrole";

	public static final String SESSION_LOGIN_USER = "login_user";

	public static final String SESSION_LOGIN_TYPE = "login_type";

    private Long id;
    private String username;
    private String password;
    private String passwordReal;
    private Integer type;
    private String mobile;
    private String tel;
    private String email;
    private String realName;
    private String memo;
    private Long roleId;
    private Integer status;
    private Long createUserId;
    private Long updateUserId;
    private Date gmtCreate;
    private Date gmtModify;
    
    private List<UserFunctionInfoDo> functionInfos;
    
    private String types;
    
    private List<UserDo> subUsers;
    
    private UserRoleDo userRole;
    
    private UserDo createUser;

    public List<UserFunctionInfoDo> getFunctionInfos() {
		return functionInfos;
	}

	public void setFunctionInfos(List<UserFunctionInfoDo> functionInfos) {
		this.functionInfos = functionInfos;
	}

	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	public List<UserDo> getSubUsers() {
		return subUsers;
	}

	public void setSubUsers(List<UserDo> subUsers) {
		this.subUsers = subUsers;
	}

	public UserRoleDo getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRoleDo userRole) {
		this.userRole = userRole;
	}

	public UserDo getCreateUser() {
		return createUser;
	}

	public void setCreateUser(UserDo createUser) {
		this.createUser = createUser;
	}

	public void setId(Long id) {
        this.hasId = Boolean.TRUE;
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setUsername(String username) {
        this.hasUsername = Boolean.TRUE;
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.hasPassword = Boolean.TRUE;
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setPasswordReal(String passwordReal) {
        this.hasPasswordReal = Boolean.TRUE;
        this.passwordReal = passwordReal;
    }

    public String getPasswordReal() {
        return passwordReal;
    }

    public void setType(Integer type) {
        this.hasType = Boolean.TRUE;
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

    public void setMobile(String mobile) {
        this.hasMobile = Boolean.TRUE;
        this.mobile = mobile;
    }

    public String getMobile() {
        return mobile;
    }

    public void setTel(String tel) {
        this.hasTel = Boolean.TRUE;
        this.tel = tel;
    }

    public String getTel() {
        return tel;
    }

    public void setEmail(String email) {
        this.hasEmail = Boolean.TRUE;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setRealName(String realName) {
        this.hasRealName = Boolean.TRUE;
        this.realName = realName;
    }

    public String getRealName() {
        return realName;
    }

    public void setMemo(String memo) {
        this.hasMemo = Boolean.TRUE;
        this.memo = memo;
    }

    public String getMemo() {
        return memo;
    }

    public void setRoleId(Long roleId) {
        this.hasRoleId = Boolean.TRUE;
        this.roleId = roleId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setStatus(Integer status) {
        this.hasStatus = Boolean.TRUE;
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setCreateUserId(Long createUserId) {
        this.hasCreateUserId = Boolean.TRUE;
        this.createUserId = createUserId;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public void setUpdateUserId(Long updateUserId) {
        this.hasUpdateUserId = Boolean.TRUE;
        this.updateUserId = updateUserId;
    }

    public Long getUpdateUserId() {
        return updateUserId;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.hasGmtCreate = Boolean.TRUE;
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtModify(Date gmtModify) {
        this.hasGmtModify = Boolean.TRUE;
        this.gmtModify = gmtModify;
    }

    public Date getGmtModify() {
        return gmtModify;
    }

    private Boolean hasId;
    private Boolean hasUsername;
    private Boolean hasPassword;
    private Boolean hasPasswordReal;
    private Boolean hasType;
    private Boolean hasBuyerId;
    private Boolean hasMobile;
    private Boolean hasTel;
    private Boolean hasEmail;
    private Boolean hasRealName;
    private Boolean hasMemo;
    private Boolean hasRoleId;
    private Boolean hasStatus;
    private Boolean hasCreateUserId;
    private Boolean hasUpdateUserId;
    private Boolean hasGmtCreate;
    private Boolean hasGmtModify;

    public Boolean hasId(){
        return this.hasId != null;
    }

    public Boolean hasUsername(){
        return this.hasUsername != null;
    }

    public Boolean hasPassword(){
        return this.hasPassword != null;
    }

    public Boolean hasPasswordReal(){
        return this.hasPasswordReal != null;
    }

    public Boolean hasType(){
        return this.hasType != null;
    }

    public Boolean hasBuyerId(){
        return this.hasBuyerId != null;
    }

    public Boolean hasMobile(){
        return this.hasMobile != null;
    }

    public Boolean hasTel(){
        return this.hasTel != null;
    }

    public Boolean hasEmail(){
        return this.hasEmail != null;
    }

    public Boolean hasRealName(){
        return this.hasRealName != null;
    }

    public Boolean hasMemo(){
        return this.hasMemo != null;
    }

    public Boolean hasRoleId(){
        return this.hasRoleId != null;
    }

    public Boolean hasStatus(){
        return this.hasStatus != null;
    }

    public Boolean hasCreateUserId(){
        return this.hasCreateUserId != null;
    }

    public Boolean hasUpdateUserId(){
        return this.hasUpdateUserId != null;
    }

    public Boolean hasGmtCreate(){
        return this.hasGmtCreate != null;
    }

    public Boolean hasGmtModify(){
        return this.hasGmtModify != null;
    }

    public void clearId(){
        this.id = null;
        this.hasId = Boolean.FALSE;
    }

    public void clearUsername(){
        this.username = null;
        this.hasUsername = Boolean.FALSE;
    }

    public void clearPassword(){
        this.password = null;
        this.hasPassword = Boolean.FALSE;
    }

    public void clearPasswordReal(){
        this.passwordReal = null;
        this.hasPasswordReal = Boolean.FALSE;
    }

    public void clearType(){
        this.type = null;
        this.hasType = Boolean.FALSE;
    }

    public void clearMobile(){
        this.mobile = null;
        this.hasMobile = Boolean.FALSE;
    }

    public void clearTel(){
        this.tel = null;
        this.hasTel = Boolean.FALSE;
    }

    public void clearEmail(){
        this.email = null;
        this.hasEmail = Boolean.FALSE;
    }

    public void clearRealName(){
        this.realName = null;
        this.hasRealName = Boolean.FALSE;
    }

    public void clearMemo(){
        this.memo = null;
        this.hasMemo = Boolean.FALSE;
    }

    public void clearRoleId(){
        this.roleId = null;
        this.hasRoleId = Boolean.FALSE;
    }

    public void clearStatus(){
        this.status = null;
        this.hasStatus = Boolean.FALSE;
    }

    public void clearCreateUserId(){
        this.createUserId = null;
        this.hasCreateUserId = Boolean.FALSE;
    }

    public void clearUpdateUserId(){
        this.updateUserId = null;
        this.hasUpdateUserId = Boolean.FALSE;
    }

    public void clearGmtCreate(){
        this.gmtCreate = null;
        this.hasGmtCreate = Boolean.FALSE;
    }

    public void clearGmtModify(){
        this.gmtModify = null;
        this.hasGmtModify = Boolean.FALSE;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((username == null) ? 0 : username.hashCode());
        result = prime * result + ((password == null) ? 0 : password.hashCode());
        result = prime * result + ((passwordReal == null) ? 0 : passwordReal.hashCode());
        result = prime * result + ((type == null) ? 0 : type.hashCode());
        result = prime * result + ((mobile == null) ? 0 : mobile.hashCode());
        result = prime * result + ((tel == null) ? 0 : tel.hashCode());
        result = prime * result + ((email == null) ? 0 : email.hashCode());
        result = prime * result + ((realName == null) ? 0 : realName.hashCode());
        result = prime * result + ((memo == null) ? 0 : memo.hashCode());
        result = prime * result + ((roleId == null) ? 0 : roleId.hashCode());
        result = prime * result + ((status == null) ? 0 : status.hashCode());
        result = prime * result + ((createUserId == null) ? 0 : createUserId.hashCode());
        result = prime * result + ((updateUserId == null) ? 0 : updateUserId.hashCode());
        result = prime * result + ((gmtCreate == null) ? 0 : gmtCreate.hashCode());
        result = prime * result + ((gmtModify == null) ? 0 : gmtModify.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        UserDo other = (UserDo) obj;
        if (id == null) {
            if(other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (username == null) {
            if(other.username != null)
                return false;
        } else if (!username.equals(other.username))
            return false;
        if (password == null) {
            if(other.password != null)
                return false;
        } else if (!password.equals(other.password))
            return false;
        if (passwordReal == null) {
            if(other.passwordReal != null)
                return false;
        } else if (!passwordReal.equals(other.passwordReal))
            return false;
        if (type == null) {
            if(other.type != null)
                return false;
        } else if (!type.equals(other.type))
            return false;
        if (mobile == null) {
            if(other.mobile != null)
                return false;
        } else if (!mobile.equals(other.mobile))
            return false;
        if (tel == null) {
            if(other.tel != null)
                return false;
        } else if (!tel.equals(other.tel))
            return false;
        if (email == null) {
            if(other.email != null)
                return false;
        } else if (!email.equals(other.email))
            return false;
        if (realName == null) {
            if(other.realName != null)
                return false;
        } else if (!realName.equals(other.realName))
            return false;
        if (memo == null) {
            if(other.memo != null)
                return false;
        } else if (!memo.equals(other.memo))
            return false;
        if (roleId == null) {
            if(other.roleId != null)
                return false;
        } else if (!roleId.equals(other.roleId))
            return false;
        if (status == null) {
            if(other.status != null)
                return false;
        } else if (!status.equals(other.status))
            return false;
        if (createUserId == null) {
            if(other.createUserId != null)
                return false;
        } else if (!createUserId.equals(other.createUserId))
            return false;
        if (updateUserId == null) {
            if(other.updateUserId != null)
                return false;
        } else if (!updateUserId.equals(other.updateUserId))
            return false;
        if (gmtCreate == null) {
            if(other.gmtCreate != null)
                return false;
        } else if (!gmtCreate.equals(other.gmtCreate))
            return false;
        if (gmtModify == null) {
            if(other.gmtModify != null)
                return false;
        } else if (!gmtModify.equals(other.gmtModify))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "UserDo[id=" + id + ", username=" + username + ", password=" + password + ", passwordReal=" + passwordReal + ", type=" + type + ", mobile=" + mobile + ", tel=" + tel + ", email=" + email + ", realName=" + realName + ", memo=" + memo + ", roleId=" + roleId + ", status=" + status + ", createUserId=" + createUserId + ", updateUserId=" + updateUserId + ", gmtCreate=" + gmtCreate + ", gmtModify=" + gmtModify + ", hasId=" + hasId + ", hasUsername=" + hasUsername + ", hasPassword=" + hasPassword + ", hasPasswordReal=" + hasPasswordReal + ", hasType=" + hasType + ", hasBuyerId=" + hasBuyerId + ", hasMobile=" + hasMobile + ", hasTel=" + hasTel + ", hasEmail=" + hasEmail + ", hasRealName=" + hasRealName + ", hasMemo=" + hasMemo + ", hasRoleId=" + hasRoleId + ", hasStatus=" + hasStatus + ", hasCreateUserId=" + hasCreateUserId + ", hasUpdateUserId=" + hasUpdateUserId + ", hasGmtCreate=" + hasGmtCreate + ", hasGmtModify=" + hasGmtModify+ "]";
    }
}
