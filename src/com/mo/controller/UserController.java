package com.mo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mo.common.util.Page;
import com.mo.pojo.User;
import com.mo.pojo.vo.UserQueryVo;
import com.mo.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	Page<User> page = null;
	@RequestMapping(value = "/user/list")
	public String list(UserQueryVo vo,Model model,HttpSession httpSession) {
		//通过条件，查询分页对象
		User user = (User) httpSession.getAttribute("USER");
		model.addAttribute("userInf", user);
		page = userService.selectPageByQueryVo(vo);
		model.addAttribute("page", page);
		return "userManage";
	}
	
	//修改用户信息页面
	@RequestMapping(value = "/user/updateUser")
	public String updateUser(Integer id,Model model) {
		User user = userService.selectUserById(id);
		model.addAttribute("userInf", user);
		return "updateUser";
	}
	
	//保存修改
	@RequestMapping(value = "/user/saveUpdateUser")
	public String update(User user) {
		userService.updateUserById(user);
		return "redirect:list";
	}
	
	//删除用户
	@RequestMapping(value = "/user/delete")
	public @ResponseBody void deleteUser(Integer id) {
		userService.deleteUserById(id);
	}
	
	//新增用户页面
	@RequestMapping(value = "/user/addUser")
	public String addUser() {
		return "addUser";
	}
	
	//保存新增用户
	@RequestMapping(value = "/user/saveAddUser")
	public String saveAddUser(User user) {
		userService.saveNewUser(user);
		return "redirect:list";
	}
	
	//更改用户状态
	@RequestMapping(value = "/user/updateUserState")
	public String updateUserState(Integer id) {
		User user = userService.selectUserById(id);
		userService.updateUserState(user);
		return "redirect:list";
	}
}
