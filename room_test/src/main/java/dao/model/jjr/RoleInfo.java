package main.java.dao.model.jjr;

import java.io.Serializable;

public class RoleInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7637854086958919533L;
	private long id;
	private String typeCode;
	private String roleCode;
	private String name;
	private String description;
	private int validFlag;
	private String typeName;
	private long parentId;
	private String parentName;
	private int orderNum;
	private String ext1;
	private String ext2;
	private Integer isManager; // 可管理 0：不可管理 1：分支机构，总部都可管理 2：仅总部可管理 3：仅分支机构可管理
								// （准备废弃）
	private Integer isInside; // 内置角色

	private Integer isFullProvince; // 是否属于全部分支机构标识位 1 属于全体分支机构 0
									// 属于指定分支机构（具体属于哪家见表role_province_relation
	private String childRootSign; // 角色分组根标识位 0非分组根 1 总部 2分支机构
									// 3营业部（代替现在的is_manager使用）
	private String roleClass; // 角色级别

	public String getChildRootSign() {
		return childRootSign;
	}

	public void setChildRootSign(String childRootSign) {
		this.childRootSign = childRootSign;
	}

	public Integer getIsFullProvince() {
		return isFullProvince;
	}

	public void setIsFullProvince(Integer isFullProvince) {
		this.isFullProvince = isFullProvince;
	}

	public String getRoleClass() {
		return roleClass;
	}

	public void setRoleClass(String roleClass) {
		this.roleClass = roleClass;
	}

	public Integer getIsInside() {
		return isInside;
	}

	public void setIsInside(Integer isInside) {
		this.isInside = isInside;
	}

	public Integer getIsManager() {
		return isManager;
	}

	public void setIsManager(Integer isManager) {
		this.isManager = isManager;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
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

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public long getParentId() {
		return parentId;
	}

	public void setParentId(long parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null)
			return false;
		if (!(obj instanceof RoleInfo))
			return false;
		RoleInfo other = (RoleInfo) obj;

		return id == other.getId();

	}
}
