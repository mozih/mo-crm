package com.mo.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Order {
	private int id;
	private String order_id;
	private String order_studname;
	private String order_username;
	private String order_type;
	private double order_price;
	private Date order_createtime;
	private Date order_uptime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public double getOrder_price() {
		return order_price;
	}
	public void setOrder_price(double order_price) {
		this.order_price = order_price;
	}
	public String getOrder_createtime() {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return simpleFormat.format(order_createtime);
	}
	public void setOrder_createtime(Date order_createtime) {
		this.order_createtime = order_createtime;
	}
	public String getOrder_uptime() {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return simpleFormat.format(order_uptime);
	}
	public void setOrder_uptime(Date order_uptime) {
		this.order_uptime = order_uptime;
	}
}
