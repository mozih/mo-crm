package com.mo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mo.common.util.Page;
import com.mo.dao.UserDao;
import com.mo.pojo.User;
import com.mo.pojo.vo.UserQueryVo;
import com.mo.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public Page<User> selectPageByQueryVo(UserQueryVo vo) {
		// TODO Auto-generated method stub
		Page<User> page = new Page<User>();
		// 每页数
		vo.setSize(5);
		page.setSize(5);
		if (vo != null) {
			// 判断当前页
			if (vo.getPage() != null) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() - 1) * vo.getSize());
			}
			if (vo.getUser_name() != null && !vo.getUser_name().trim().equals("")) {
				vo.setUser_name(vo.getUser_name().trim());
			}
			if (vo.getUser_phone() != null && !vo.getUser_phone().trim().equals("")) {
				vo.setUser_phone(vo.getUser_phone().trim());
			}
			if (vo.getUser_aut() != null && !vo.getUser_aut().trim().equals("")) {
				vo.setUser_aut(vo.getUser_aut().trim());
			}
			// 总条数
			page.setTotal(userDao.UserCountByQueryVo(vo));
			page.setRows(userDao.selectUserListByQueryVo(vo));
		}
		return page;
	}

	@Override
	public User selectUserById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.selectUserById(id);
	}

	@Override
	public void updateUserById(User user) {
		// TODO Auto-generated method stub
		userDao.updateUserById(user);
	}

	@Override
	public void deleteUserById(Integer id) {
		// TODO Auto-generated method stub
		userDao.deleteUserById(id);
	}

	@Override
	public void saveNewUser(User user) {
		// TODO Auto-generated method stub
		userDao.saveNewUser(user);
	}

	@Override
	public void updateUserState(User user) {
		// TODO Auto-generated method stub
		userDao.updateUserState(user);
	}

}
