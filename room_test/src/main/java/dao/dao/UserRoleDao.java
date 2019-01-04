package main.java.dao.dao;

import java.lang.Integer;
import java.util.List;

import main.java.common.util.page.PageList;
import main.java.common.util.page.PageQuery;
import main.java.dao.model.user.UserRoleDo;

public interface UserRoleDao {

	UserRoleDo loadUserRoleById(Long roleId);

	UserRoleDo createUserRole(UserRoleDo urd);

	List<UserRoleDo> listUserRole(UserRoleDo userRoleDo);

	PageList<UserRoleDo> listUserRoleByPage(UserRoleDo userRoleDo, PageQuery pageQuery);

	boolean updateUserRoleById(UserRoleDo userRoleDo);

}
