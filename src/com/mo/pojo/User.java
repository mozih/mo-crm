package com.mo.pojo;
/**
 * 用户持久化类
 */
public class User {
	private int user_id;
	private String user_name;
	private String user_password;
	private String user_phone;
	private String user_aut;
	private int user_state;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_aut() {
		return user_aut;
	}
	public void setUser_aut(String user_aut) {
		this.user_aut = user_aut;
	}
	public int getUser_state() {
		return user_state;
	}
	public void setUser_state(int user_state) {
		this.user_state = user_state;
	}
}
