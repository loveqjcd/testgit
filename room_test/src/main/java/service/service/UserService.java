package main.java.service.service;

import java.util.List;

import main.java.common.util.page.PageList;
import main.java.common.util.page.PageQuery;
import main.java.dao.model.user.UserDo;
import main.java.dao.model.user.UserFunctionInfoDo;
import main.java.dao.model.user.UserRoleDo;

public interface UserService {

	/**
     * 说明：根据用户登录查询列表
     * 
     * @param user
     * @return
     */
	List<UserDo> queryUserList(UserDo user);

	/**
     * 说明：获得某个用户的具体权限(店铺和功能)
     * 
     * @param user
     * @return
     */
	void queryRolesFunctions(UserDo user);

	/**
	 * 修改用户资料
	 * @param user
	 * @return
	 */
	boolean updateUserById(UserDo user);

	/**
	 * 账号分页查询
	 * @param userDo
	 * @param pageQuery
	 * @return
	 */
	PageList<UserDo> listUserByPage(UserDo userDo, PageQuery pageQuery);

	/**
	 * 创建用户
	 * @param ud
	 */
	void createUser(UserDo ud);

	/**
	 * 查询角色
	 * @param userRoleDo
	 * @return
	 */
	List<UserRoleDo> listUserRole(UserRoleDo userRoleDo);

	/**
	 * 根据id查询user
	 * @param parseLong
	 * @return
	 */
	UserDo loadUserById(long parseLong);

	/**
	 * 角色分页查询
	 * @param userRoleDo
	 * @param pageQuery
	 * @return
	 */
	PageList<UserRoleDo> listUserRoleByPage(UserRoleDo userRoleDo, PageQuery pageQuery);
	
	/**
	 * 根据types查询user
	 * @param ud
	 * @return
	 */
	List<UserDo> listUserByTypes(UserDo ud);

	/**
	 * 查询功能权限
	 * @param userFunctionInfo
	 * @return
	 */
	List<UserFunctionInfoDo> listUserFunctionInfo(UserFunctionInfoDo userFunctionInfo);

	/**
	 * 查询role
	 * @param roleId
	 * @return
	 */
	UserRoleDo loadUserRoleById(Long roleId);

	/**
	 * 创建用户角色
	 * @param userRoleDo
	 */
	void createUserRole(UserRoleDo userRoleDo);

	/**
	 * 更新用户角色
	 * @param userRoleDo
	 * @return
	 */
	boolean updateUserRoleById(UserRoleDo userRoleDo);

}
