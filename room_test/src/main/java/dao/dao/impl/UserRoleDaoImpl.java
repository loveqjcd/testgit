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
import main.java.dao.dao.UserRoleDao;
import main.java.dao.model.user.UserRoleDo;

public class UserRoleDaoImpl extends SqlMapClientDaoSupport implements UserRoleDao {

	@Override
	public UserRoleDo loadUserRoleById(Long roleId) {
		
		return (UserRoleDo) this.getSqlMapClientTemplate()
				.queryForObject("t_user_role.loadUserRoleById", roleId);
	}

	@Override
	public UserRoleDo createUserRole(UserRoleDo urd) {
		
		Long id = (Long) this.getSqlMapClientTemplate().insert("t_user_role.createUserRole", urd);
		urd.setId(id);
		return urd;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserRoleDo> listUserRole(UserRoleDo userRoleDo) {
		
		return this.getSqlMapClientTemplate().queryForList("t_user_role.listUserRole", userRoleDo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public PageList<UserRoleDo> listUserRoleByPage(UserRoleDo userRoleDo,
			PageQuery pageQuery) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", userRoleDo.getStatus());
		map.put("type", userRoleDo.getType());
		map.put("types", userRoleDo.getTypes());
		map.put("name", userRoleDo.getName());
		map.put("memo", userRoleDo.getMemo());
		map.put("createUserId", userRoleDo.getCreateUserId());
		map.put("startIndex", pageQuery.getStartIndex());
		map.put("pageSize", pageQuery.getPageSize());
		
		Integer	count = (Integer) this.getSqlMapClientTemplate()
				.queryForObject("t_user_role.listUserRoleByPage_count", map);
		List<UserRoleDo> list = Collections.EMPTY_LIST;
		if (count.intValue() > 0) {
			list = (List<UserRoleDo>) getSqlMapClientTemplate()
					.queryForList("t_user_role.listUserRoleByPage", map);
		}
		Paginator paginator = new Paginator(pageQuery.getPageSize(), count);
		paginator.setPage(pageQuery.getPageNum());

		PageList<UserRoleDo> result = new PageList<UserRoleDo>(list);
		result.setPaginator(paginator);
		return result;
	}

	@Override
	public boolean updateUserRoleById(UserRoleDo userRoleDo) {
		
		return this.getSqlMapClientTemplate().update("t_user_role.updateUserRoleById", userRoleDo) > 0;
	}

}
