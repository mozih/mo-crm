package com.mo.service.impl;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mo.common.util.Page;
import com.mo.dao.OrderDao;
import com.mo.pojo.Order;
import com.mo.pojo.vo.OrderQueryVo;
import com.mo.service.OrderService;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
	// 声明DAO属性并注入
	@Autowired
	private OrderDao orderDao;
	
	//通过条件，查询分页对象
	public Page<Order> selectPageByQueryVo(OrderQueryVo vo) {
		// TODO Auto-generated method stub
		Page<Order> page = new Page<Order>();
		//每页数
		vo.setSize(5);
		page.setSize(5);
		if(vo!=null) {
			//判断当前页
			if(vo.getPage()!=null) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage()-1)*vo.getSize());
			}
			if(vo.getOrder_id()!=null && !vo.getOrder_id().trim().equals("")) {
				vo.setOrder_id(vo.getOrder_id().trim());
			}
			if(vo.getOrderType()!=null && !vo.getOrderType().trim().equals("")) {
				vo.setOrderType(vo.getOrderType().trim());
			}
			if(vo.getOrderUptime()!=null && !vo.getOrderUptime().trim().equals("")) {
				vo.setOrderUptime(vo.getOrderUptime().trim());
			}
			if(vo.getOrder_studname()!=null && !vo.getOrder_studname().trim().equals("")) {
				vo.setOrder_studname(vo.getOrder_studname().trim());
			}
			if(vo.getOrder_username()!=null && !vo.getOrder_username().trim().equals("")) {
				vo.setOrder_username(vo.getOrder_username().trim());
			}
			//总条数
			page.setTotal(orderDao.orderCountByQueryVo(vo));
			page.setRows(orderDao.selectOrderListByQueryVo(vo));
		}
		return page;
	}
	public Order selectOrderById(Integer id) {
		// TODO Auto-generated method stub
		return orderDao.selectOrderById(id);
	}

	public void updateOrderById(Order order) {
		// TODO Auto-generated method stub
		order.setOrder_uptime(getupDate());
		orderDao.updateOrderById(order);
	}
	public Date getupDate(){
		Date date=new Date();
		return date;
	}

	public void deleteOrderById(Integer id) {
		// TODO Auto-generated method stub
		orderDao.deleteOrderById(id);
	}

	@Override
	public void saveNewOrder(Order order) {
		// TODO Auto-generated method stub
		order.setOrder_createtime(getupDate());
		order.setOrder_uptime(getupDate());
		orderDao.saveNewOrder(order);
	}

	@Override
	public boolean check(String orderid, String ordertype, String orderprice, String studname, String username) {
		// TODO Auto-generated method stub
		Order order = new Order();
		order.setOrder_id(orderid);
		order.setOrder_type(ordertype);
		Double price = Double.parseDouble(orderprice);
		order.setOrder_price(price);
		order.setOrder_studname(studname);
		order.setOrder_username(username);
		Long isExist = orderDao.check(order);
		System.out.println(isExist);
		return isExist>0?true:false;
	}

}
