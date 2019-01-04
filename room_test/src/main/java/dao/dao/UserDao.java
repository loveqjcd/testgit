package main.java.dao.dao;

import java.lang.Integer;
import java.util.List;

import main.java.common.util.page.PageList;
import main.java.common.util.page.PageQuery;
import main.java.dao.model.user.UserDo;

public interface UserDao {

	List<UserDo> queryUserList(UserDo user);

	boolean updateUserById(UserDo user);

	PageList<UserDo> listUserByPage(UserDo userDo, PageQuery pageQuery);

	void createUser(UserDo ud);

	UserDo loadUserById(long userId);

	List<UserDo> listUserByTypes(UserDo userDo);

}
