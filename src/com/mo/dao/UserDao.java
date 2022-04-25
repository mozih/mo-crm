package com.mo.dao;

import java.util.List;
import com.mo.pojo.User;
import com.mo.pojo.vo.UserQueryVo;

public interface UserDao {
	//总条数
	public Integer UserCountByQueryVo(UserQueryVo vo);
	//结果集
	public  List<User> selectUserListByQueryVo(UserQueryVo vo);
	//通过id查询用户信息
	public User selectUserById(Integer id);
	//通过id修改用户信息
	public void updateUserById(User user);
	public void deleteUserById(Integer id);
	//插入新用户
	public void saveNewUser(User user);
	
	public void updateUserState(User user);
}
