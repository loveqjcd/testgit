package main.java.service.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import main.java.dao.dao.UserDao;
import main.java.dao.dao.UserFunctionInfoDao;
import main.java.dao.dao.UserRoleDao;
import main.java.dao.model.user.UserDo;
import main.java.dao.model.user.UserFunctionInfoDo;
import main.java.dao.model.user.UserRoleDo;
import main.java.service.service.UserService;
import main.java.common.util.StrUtils;
import main.java.common.util.entity.BaseEntity;
import main.java.common.util.page.PageList;
import main.java.common.util.page.PageQuery;

public class UserServiceImpl implements UserService {

	private UserDao userDao;
	
	private UserRoleDao userRoleDao;
	
	private UserFunctionInfoDao userFunctionInfoDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserRoleDao getUserRoleDao() {
		return userRoleDao;
	}

	public void setUserRoleDao(UserRoleDao userRoleDao) {
		this.userRoleDao = userRoleDao;
	}

	public UserFunctionInfoDao getUserFunctionInfoDao() {
		return userFunctionInfoDao;
	}

	public void setUserFunctionInfoDao(UserFunctionInfoDao userFunctionInfoDao) {
		this.userFunctionInfoDao = userFunctionInfoDao;
	}

	@Override
	public List<UserDo> queryUserList(UserDo user) {
		
		return this.getUserDao().queryUserList(user);
	}

	@Override
	public void queryRolesFunctions(UserDo user) {
		UserRoleDo userRole = new UserRoleDo();
		userRole.setStatus(BaseEntity.STATUS_SUCCESS);
		if(user.getRoleId() != null) {
			userRole = this.getUserRoleDao().loadUserRoleById(user.getRoleId());
		}
		
		List<UserFunctionInfoDo> infos = null;
		if(userRole == null && user.getType() != null && user.getType() == 1) {
			UserFunctionInfoDo userFunctionInfo = new UserFunctionInfoDo();
			userFunctionInfo.setStatus(BaseEntity.DELETED_NO);
			infos = this.getUserFunctionInfoDao().listUserFunctionInfo(userFunctionInfo);
			if(infos != null && infos.size() > 0) {
				StringBuffer keywords = new StringBuffer();
				for(UserFunctionInfoDo ufi : infos) {
					if(keywords.length() == 0) {
						keywords.append(ufi.getId().toString());
					}else {
						keywords.append(",").append(ufi.getId().toString());
					}
				}
				UserRoleDo urd = new UserRoleDo();
				urd.setKeywords(keywords.toString());
				urd.setStatus(BaseEntity.STATUS_SUCCESS);
				urd.setName("超级管理员");
				urd.setType(1);
				urd.setCreateUserId(user.getId());
				urd.setCreateTime(new Date());
				urd.setMemo("此角色居然是  "+user.getUsername()+"  创建的");
				urd = this.getUserRoleDao().createUserRole(urd);
				
				user.setRoleId(urd.getId());
				user.setUpdateTime(new Date());
				boolean flag = this.getUserDao().updateUserById(user);
			}
		}else {
			if(StrUtils.isNotEmpty(userRole.getKeywords())) {
				UserFunctionInfoDo ufi = new UserFunctionInfoDo();
				ufi.setIds(userRole.getKeywords());
				ufi.setStatus(BaseEntity.DELETED_NO);
				infos = this.getUserFunctionInfoDao().listUserFunctionInfo(ufi);
			}
		}
		
		if(infos != null && infos.size() > 0) {
			List<UserFunctionInfoDo> functionInfos = new ArrayList<UserFunctionInfoDo>();
			List<UserFunctionInfoDo> subInfos = null;
			for(UserFunctionInfoDo info : infos) {
				if(info.getFunctionLevel() == 1) {
					subInfos = new ArrayList<UserFunctionInfoDo>();
					for(UserFunctionInfoDo ifDo : infos) {
						if(ifDo.getFunctionLevel() == 2 && ifDo.getParentId().longValue() == info.getId().longValue()) {
							subInfos.add(ifDo);
						}
					}
					info.setSubFunctions(subInfos);
					functionInfos.add(info);
				}
			}
			user.setFunctionInfos(functionInfos);
		}
	}

	@Override
	public boolean updateUserById(UserDo user) {
		
		return this.getUserDao().updateUserById(user);
	}

	@Override
	public PageList<UserDo> listUserByPage(UserDo userDo, PageQuery pageQuery) {
		
		return this.getUserDao().listUserByPage(userDo, pageQuery);
	}

	@Override
	public void createUser(UserDo ud) {
		
		this.getUserDao().createUser(ud);
	}

	@Override
	public List<UserRoleDo> listUserRole(UserRoleDo userRoleDo) {
		
		return this.getUserRoleDao().listUserRole(userRoleDo);
	}

	@Override
	public UserDo loadUserById(long userId) {
		
		return this.getUserDao().loadUserById(userId);
	}

	@Override
	public PageList<UserRoleDo> listUserRoleByPage(UserRoleDo userRoleDo, PageQuery pageQuery) {
		
		return this.getUserRoleDao().listUserRoleByPage(userRoleDo, pageQuery);
	}

	@Override
	public List<UserDo> listUserByTypes(UserDo userDo) {
		
		return this.getUserDao().listUserByTypes(userDo);
	}

	@Override
	public List<UserFunctionInfoDo> listUserFunctionInfo(UserFunctionInfoDo userFunctionInfo) {
		
		return this.getUserFunctionInfoDao().listUserFunctionInfo(userFunctionInfo);
	}

	@Override
	public UserRoleDo loadUserRoleById(Long roleId) {
		
		return this.getUserRoleDao().loadUserRoleById(roleId);
	}

	@Override
	public void createUserRole(UserRoleDo userRoleDo) {
		
		this.getUserRoleDao().createUserRole(userRoleDo);
	}

	@Override
	public boolean updateUserRoleById(UserRoleDo userRoleDo) {
		
		return this.getUserRoleDao().updateUserRoleById(userRoleDo);
	}

}
