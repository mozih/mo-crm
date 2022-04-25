package com.mo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mo.pojo.User;
import com.mo.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	//前往登录页面
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login(){
		return "login";
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(String user_name,String user_password,HttpSession httpSession,Model model,HttpServletResponse response) {
		User user = loginService.login(user_name, user_password);
	    /*response.setContentType("text/html; charset=UTF-8"); //转码
	    PrintWriter out;
		try {
			out = response.getWriter();
			if(user.getUser_state() ==0) {
			    out.flush();
			    out.println("<script>");
			    out.println("alert('此用户已被禁用!');");
			    out.println("history.back();");
			    out.println("</script>");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		if(user!=null) {
			if(user.getUser_state() == 0) {
				model.addAttribute("msg", "failure1");
				return "login";
			}
			model.addAttribute("msg", "done");
			System.out.println("login ok");
			httpSession.setAttribute("USER", user);
			return "redirect:home";
		}
		model.addAttribute("msg", "failure2");
		System.out.println("login failing");
		return "login";
	}
	
	@RequestMapping(value = "/home")
	public String home() {
		System.out.println("enter home");
		return "main";
	}
	//系统首页
	@RequestMapping(value = "index")
	public String index() {
		return "index";
	}
	//退出登录
	@RequestMapping(value = "/exitlogin")
	public String login(HttpSession httpSession){
		System.out.println("开始关闭");
		httpSession.invalidate();
		return "redirect:login";
	}

}
