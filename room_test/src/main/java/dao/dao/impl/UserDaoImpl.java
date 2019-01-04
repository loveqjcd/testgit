package main.java.dao.dao.impl;

import java.lang.Integer;
import java.util.HashMap;
import java.util.List;
import java.util.Collections;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import main.java.common.util.page.PageList;
import main.java.common.util.page.PageQuery;
import main.java.common.util.page.Paginator;
import main.java.dao.dao.UserDao;
import main.java.dao.model.user.UserDo;

public class UserDaoImpl extends SqlMapClientDaoSupport implements UserDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<UserDo> queryUserList(UserDo user) {
		
		return this.getSqlMapClientTemplate().queryForList("t_user.queryUserList", user);
	}

	@Override
	public boolean updateUserById(UserDo user) {
		
		return this.getSqlMapClientTemplate().update("t_user.updateUserById", user) > 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public PageList<UserDo> listUserByPage(UserDo userDo, PageQuery pageQuery) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", userDo.getId());
		map.put("status", userDo.getStatus());
		map.put("type", userDo.getType());
		map.put("types", userDo.getTypes());
		map.put("username", userDo.getUsername());
		map.put("mobile", userDo.getMobile());
		map.put("createUserId", userDo.getCreateUserId());
		map.put("startIndex", pageQuery.getStartIndex());
		map.put("pageSize", pageQuery.getPageSize());
		
		Integer	count = (Integer) this.getSqlMapClientTemplate()
				.queryForObject("t_user.listUserByPage_count", map);
		List<UserDo> list = Collections.EMPTY_LIST;
		if (count.intValue() > 0) {
			list = (List<UserDo>) getSqlMapClientTemplate()
					.queryForList("t_user.listUserByPage", map);
		}
		Paginator paginator = new Paginator(pageQuery.getPageSize(), count);
		paginator.setPage(pageQuery.getPageNum());

		PageList<UserDo> result = new PageList<UserDo>(list);
		result.setPaginator(paginator);
		return result;
	}

	@Override
	public void createUser(UserDo ud) {
		
		this.getSqlMapClientTemplate().insert("t_user.createUser", ud);
	}

	@Override
	public UserDo loadUserById(long userId) {
		
		return (UserDo) this.getSqlMapClientTemplate()
				.queryForObject("t_user.loadUserById", userId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserDo> listUserByTypes(UserDo userDo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("types", userDo.getTypes());
		return this.getSqlMapClientTemplate().queryForList("t_user.listUserByTypes", map);
	}

}
