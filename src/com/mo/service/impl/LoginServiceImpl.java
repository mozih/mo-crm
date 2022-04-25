package com.mo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mo.common.util.MD5Utils;
import com.mo.dao.LoginDao;
import com.mo.pojo.User;
import com.mo.service.LoginService;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService {
	// 声明DAO属性并注入
	@Autowired
	private LoginDao loginDao;
	@Override
	public User login(String user_name, String user_password) {
		// TODO Auto-generated method stub
		user_password = MD5Utils.MD5(user_password);
		User user = loginDao.login(user_name);
		if(user != null) {
			if(user.getUser_name().equals(user_name)&&user.getUser_password().equals(user_password)){
				return user;
			}
		}
		return null;
	}

}
