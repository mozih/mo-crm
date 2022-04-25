package com.mo.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mo.common.util.Page;
import com.mo.pojo.Order;
import com.mo.pojo.User;
import com.mo.pojo.vo.OrderQueryVo;
import com.mo.service.OrderService;
import com.sun.xml.internal.ws.resources.HttpserverMessages;

@Controller
public class OrderController {
	//依赖注入
	@Autowired
	private OrderService orderService;
	
	Page<Order> page = null;
	
	@RequestMapping(value = "/order/list")
	public String list(OrderQueryVo vo, Model model) {
		//通过条件，查询分页对象
		page = orderService.selectPageByQueryVo(vo);
		model.addAttribute("page", page);
		return "orderManage";
	}
	//修改订单页面
	@RequestMapping(value = "/order/updateOrder")
	public String edit(Integer id,Model model) {
		Order order = orderService.selectOrderById(id);
		model.addAttribute("orderInf",order);
		return "updateOrder";
	}
	//保存修改
	@RequestMapping(value = "/order/update")
	public String update(Order order) {
		orderService.updateOrderById(order);
//		System.out.println(order.getId());
//		System.out.println(order.getOrder_type());
//		System.out.println("222"+order.getOrder_studname()+"aaa");
		return "redirect:list";
	}
	
	//删除
	@RequestMapping(value = "order/delete")
	public @ResponseBody
	void delete(Integer id) {
		orderService.deleteOrderById(id);
	}
	
	//新增订单页面
	@RequestMapping(value = "/order/addOrder")
	public String addOrder(HttpSession httpSession,Model model) {
		User user = (User) httpSession.getAttribute("USER");
//		System.out.println(user.getUser_name());
		if(user == null) {
			System.out.println("登录已过期");
			return "login";
		}
		model.addAttribute("username", user.getUser_name());
		return "addOrder";
	}
	//保存新增
	@RequestMapping(value = "/order/saveAddOrder")
	public String saveAddOrder(Order order,HttpSession httpSession) {
		User user = (User) httpSession.getAttribute("USER");
		System.out.println(user.getUser_name()+"aaa"+order.getOrder_studname());
		orderService.saveNewOrder(order);
		return "redirect:list";
	}
	@RequestMapping(value = "order/checkOrder")
	public void checkOrder(HttpServletResponse response,String orderid, String ordertype, String orderprice, String studname,String username) {
		boolean isExist = orderService.check(orderid, ordertype, orderprice, studname, username);
		try {
			response.getWriter().write("{\"isExist\":"+isExist+"}");
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
