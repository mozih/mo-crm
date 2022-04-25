package com.mo.pojo.vo;

import java.io.Serializable;

public class OrderQueryVo implements Serializable {
	private static final long serialVersionUID = -7094093339511682702L;
	private String orderType;
	private String orderUptime;
	private String order_id;
	private String order_studname;
	private String order_username;
	//当前页
	private Integer page=1;
	//每页数
	private Integer size=10;
	//开始行
	private Integer startRow=0;
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderUptime() {
		return orderUptime;
	}
	public void setOrderUptime(String orderUptime) {
		this.orderUptime = orderUptime;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getOrder_studname() {
		return order_studname;
	}
	public void setOrder_studname(String order_studname) {
		this.order_studname = order_studname;
	}
	public String getOrder_username() {
		return order_username;
	}
	public void setOrder_username(String order_username) {
		this.order_username = order_username;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Integer getStartRow() {
		return startRow;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
