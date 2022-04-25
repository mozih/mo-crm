package com.mo.dao;

import java.util.List;
import com.mo.pojo.Order;
import com.mo.pojo.vo.OrderQueryVo;

public interface OrderDao {
	//总条数
	public Integer orderCountByQueryVo(OrderQueryVo vo);
	//结果集
	public  List<Order> selectOrderListByQueryVo(OrderQueryVo vo);
	public  List<Order> selectAllOrderListByQueryVo(OrderQueryVo vo);
	
	//通过id查询订单信息
	public Order selectOrderById(Integer id);
	//通过id修改订单信息
	public void updateOrderById(Order order);
	public void deleteOrderById(Integer id);
	//插入新订单
	public void saveNewOrder(Order order);
	public Long check(Order order);
}
