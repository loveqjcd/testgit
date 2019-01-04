package main.java.dao.dao;

import java.lang.Integer;
import java.util.List;

import main.java.dao.model.user.UserFunctionInfoDo;

public interface UserFunctionInfoDao {

	List<UserFunctionInfoDo> listUserFunctionInfo(UserFunctionInfoDo userFunctionInfo);

}
