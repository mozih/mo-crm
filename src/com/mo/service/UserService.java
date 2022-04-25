package com.mo.service;

import com.mo.common.util.Page;
import com.mo.pojo.User;
import com.mo.pojo.vo.UserQueryVo;

public interface UserService {
	public Page<User> selectPageByQueryVo(UserQueryVo vo);
	public User selectUserById(Integer id);
	public void updateUserById(User user);
	public void deleteUserById(Integer id);
	public void saveNewUser(User user);
	public void updateUserState(User user);
}
