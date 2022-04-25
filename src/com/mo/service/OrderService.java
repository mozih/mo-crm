package com.mo.service;

import com.mo.common.util.Page;
import com.mo.pojo.Order;
import com.mo.pojo.vo.OrderQueryVo;

public interface OrderService {
	public Page<Order> selectPageByQueryVo(OrderQueryVo vo);
	public Order selectOrderById(Integer id);
	public void updateOrderById(Order order);
	public void deleteOrderById(Integer id);
	public void saveNewOrder(Order order);
	public boolean check(String orderid, String ordertype, String orderprice, String studname,String username);	
}
