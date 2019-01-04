package main.java.dao.model.api;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class ApiDo implements Serializable {
    private static final long serialVersionUID = 1481609547055L;

    private Long id;
    private String apiCode;
    private String apiName;
    private String apiKey;
    private String apiUrl;
    private String apiParam;
    private Integer methodGet;
    private Integer methodPost;
    private Integer orderIndex;
    private String imgIcon;
    private Integer showStatus;
    private Integer status;
    private Date gmtCreate;
    private Date gmtModify;
    
    private List<String> params;

    public List<String> getParams() {
		return params;
	}

	public void setParams(List<String> params) {
		this.params = params;
	}

    public void setId(Long id) {
        this.hasId = Boolean.TRUE;
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setApiCode(String apiCode) {
        this.hasApiCode = Boolean.TRUE;
        this.apiCode = apiCode;
    }

    public String getApiCode() {
        return apiCode;
    }

    public void setApiName(String apiName) {
        this.hasApiName = Boolean.TRUE;
        this.apiName = apiName;
    }

    public String getApiName() {
        return apiName;
    }

    public void setApiKey(String apiKey) {
        this.hasApiKey = Boolean.TRUE;
        this.apiKey = apiKey;
    }

    public String getApiKey() {
        return apiKey;
    }

    public void setApiUrl(String apiUrl) {
        this.hasApiUrl = Boolean.TRUE;
        this.apiUrl = apiUrl;
    }

    public String getApiUrl() {
        return apiUrl;
    }

    public void setApiParam(String apiParam) {
        this.hasApiParam = Boolean.TRUE;
        this.apiParam = apiParam;
    }

    public String getApiParam() {
        return apiParam;
    }

    public void setMethodGet(Integer methodGet) {
        this.hasMethodGet = Boolean.TRUE;
        this.methodGet = methodGet;
    }

    public Integer getMethodGet() {
        return methodGet;
    }

    public void setMethodPost(Integer methodPost) {
        this.hasMethodPost = Boolean.TRUE;
        this.methodPost = methodPost;
    }

    public Integer getMethodPost() {
        return methodPost;
    }

    public void setOrderIndex(Integer orderIndex) {
        this.hasOrderIndex = Boolean.TRUE;
        this.orderIndex = orderIndex;
    }

    public Integer getOrderIndex() {
        return orderIndex;
    }

    public void setImgIcon(String imgIcon) {
        this.hasImgIcon = Boolean.TRUE;
        this.imgIcon = imgIcon;
    }

    public String getImgIcon() {
        return imgIcon;
    }

    public void setShowStatus(Integer showStatus) {
        this.hasShowStatus = Boolean.TRUE;
        this.showStatus = showStatus;
    }

    public Integer getShowStatus() {
        return showStatus;
    }

    public void setStatus(Integer status) {
        this.hasStatus = Boolean.TRUE;
        this.status = status;
    }

    public Integer getStatus() {
        return status;
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
    private Boolean hasApiCode;
    private Boolean hasApiName;
    private Boolean hasApiKey;
    private Boolean hasApiUrl;
    private Boolean hasApiParam;
    private Boolean hasMethodGet;
    private Boolean hasMethodPost;
    private Boolean hasOrderIndex;
    private Boolean hasImgIcon;
    private Boolean hasShowStatus;
    private Boolean hasStatus;
    private Boolean hasGmtCreate;
    private Boolean hasGmtModify;

    public Boolean hasId(){
        return this.hasId != null;
    }

    public Boolean hasApiCode(){
        return this.hasApiCode != null;
    }

    public Boolean hasApiName(){
        return this.hasApiName != null;
    }

    public Boolean hasApiKey(){
        return this.hasApiKey != null;
    }

    public Boolean hasApiUrl(){
        return this.hasApiUrl != null;
    }

    public Boolean hasApiParam(){
        return this.hasApiParam != null;
    }

    public Boolean hasMethodGet(){
        return this.hasMethodGet != null;
    }

    public Boolean hasMethodPost(){
        return this.hasMethodPost != null;
    }

    public Boolean hasOrderIndex(){
        return this.hasOrderIndex != null;
    }

    public Boolean hasImgIcon(){
        return this.hasImgIcon != null;
    }

    public Boolean hasShowStatus(){
        return this.hasShowStatus != null;
    }

    public Boolean hasStatus(){
        return this.hasStatus != null;
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

    public void clearApiCode(){
        this.apiCode = null;
        this.hasApiCode = Boolean.FALSE;
    }

    public void clearApiName(){
        this.apiName = null;
        this.hasApiName = Boolean.FALSE;
    }

    public void clearApiKey(){
        this.apiKey = null;
        this.hasApiKey = Boolean.FALSE;
    }

    public void clearApiUrl(){
        this.apiUrl = null;
        this.hasApiUrl = Boolean.FALSE;
    }

    public void clearApiParam(){
        this.apiParam = null;
        this.hasApiParam = Boolean.FALSE;
    }

    public void clearMethodGet(){
        this.methodGet = null;
        this.hasMethodGet = Boolean.FALSE;
    }

    public void clearMethodPost(){
        this.methodPost = null;
        this.hasMethodPost = Boolean.FALSE;
    }

    public void clearOrderIndex(){
        this.orderIndex = null;
        this.hasOrderIndex = Boolean.FALSE;
    }

    public void clearImgIcon(){
        this.imgIcon = null;
        this.hasImgIcon = Boolean.FALSE;
    }

    public void clearShowStatus(){
        this.showStatus = null;
        this.hasShowStatus = Boolean.FALSE;
    }

    public void clearStatus(){
        this.status = null;
        this.hasStatus = Boolean.FALSE;
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
        result = prime * result + ((apiCode == null) ? 0 : apiCode.hashCode());
        result = prime * result + ((apiName == null) ? 0 : apiName.hashCode());
        result = prime * result + ((apiKey == null) ? 0 : apiKey.hashCode());
        result = prime * result + ((apiUrl == null) ? 0 : apiUrl.hashCode());
        result = prime * result + ((apiParam == null) ? 0 : apiParam.hashCode());
        result = prime * result + ((methodGet == null) ? 0 : methodGet.hashCode());
        result = prime * result + ((methodPost == null) ? 0 : methodPost.hashCode());
        result = prime * result + ((orderIndex == null) ? 0 : orderIndex.hashCode());
        result = prime * result + ((imgIcon == null) ? 0 : imgIcon.hashCode());
        result = prime * result + ((showStatus == null) ? 0 : showStatus.hashCode());
        result = prime * result + ((status == null) ? 0 : status.hashCode());
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
        ApiDo other = (ApiDo) obj;
        if (id == null) {
            if(other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (apiCode == null) {
            if(other.apiCode != null)
                return false;
        } else if (!apiCode.equals(other.apiCode))
            return false;
        if (apiName == null) {
            if(other.apiName != null)
                return false;
        } else if (!apiName.equals(other.apiName))
            return false;
        if (apiKey == null) {
            if(other.apiKey != null)
                return false;
        } else if (!apiKey.equals(other.apiKey))
            return false;
        if (apiUrl == null) {
            if(other.apiUrl != null)
                return false;
        } else if (!apiUrl.equals(other.apiUrl))
            return false;
        if (apiParam == null) {
            if(other.apiParam != null)
                return false;
        } else if (!apiParam.equals(other.apiParam))
            return false;
        if (methodGet == null) {
            if(other.methodGet != null)
                return false;
        } else if (!methodGet.equals(other.methodGet))
            return false;
        if (methodPost == null) {
            if(other.methodPost != null)
                return false;
        } else if (!methodPost.equals(other.methodPost))
            return false;
        if (orderIndex == null) {
            if(other.orderIndex != null)
                return false;
        } else if (!orderIndex.equals(other.orderIndex))
            return false;
        if (imgIcon == null) {
            if(other.imgIcon != null)
                return false;
        } else if (!imgIcon.equals(other.imgIcon))
            return false;
        if (showStatus == null) {
            if(other.showStatus != null)
                return false;
        } else if (!showStatus.equals(other.showStatus))
            return false;
        if (status == null) {
            if(other.status != null)
                return false;
        } else if (!status.equals(other.status))
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
        return "ApiDo[id=" + id + ", apiCode=" + apiCode + ", apiName=" + apiName + ", apiKey=" + apiKey + ", apiUrl=" + apiUrl + ", apiParam=" + apiParam + ", methodGet=" + methodGet + ", methodPost=" + methodPost + ", orderIndex=" + orderIndex + ", imgIcon=" + imgIcon + ", showStatus=" + showStatus + ", status=" + status + ", gmtCreate=" + gmtCreate + ", gmtModify=" + gmtModify + ", hasId=" + hasId + ", hasApiCode=" + hasApiCode + ", hasApiName=" + hasApiName + ", hasApiKey=" + hasApiKey + ", hasApiUrl=" + hasApiUrl + ", hasApiParam=" + hasApiParam + ", hasMethodGet=" + hasMethodGet + ", hasMethodPost=" + hasMethodPost + ", hasOrderIndex=" + hasOrderIndex + ", hasImgIcon=" + hasImgIcon + ", hasShowStatus=" + hasShowStatus + ", hasStatus=" + hasStatus + ", hasGmtCreate=" + hasGmtCreate + ", hasGmtModify=" + hasGmtModify+ "]";
    }
}
