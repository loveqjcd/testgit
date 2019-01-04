package main.java.dao.dao.impl;

import java.lang.Integer;
import java.util.HashMap;
import java.util.List;
import java.util.Collections;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import main.java.dao.dao.UserFunctionInfoDao;
import main.java.dao.model.user.UserFunctionInfoDo;

public class UserFunctionInfoDaoImpl extends SqlMapClientDaoSupport implements UserFunctionInfoDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<UserFunctionInfoDo> listUserFunctionInfo(UserFunctionInfoDo userFunctionInfo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ids", userFunctionInfo.getIds());
		map.put("status", userFunctionInfo.getStatus());
		
		return this.getSqlMapClientTemplate()
				.queryForList("t_user_function_info.listUserFunctionInfo", map);
	}

}
