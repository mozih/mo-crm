package com.mo.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Student {
	private int stud_id;
	private String stud_name;
	private String stud_number;
	private String stud_professional;
	private String stud_level;
	private String stud_phone;
	private String stud_address;
	private Date stud_createtime;
	public int getStud_id() {
		return stud_id;
	}
	public void setStud_id(int stud_id) {
		this.stud_id = stud_id;
	}
	public String getStud_name() {
		return stud_name;
	}
	public void setStud_name(String stud_name) {
		this.stud_name = stud_name;
	}
	public String getStud_number() {
		return stud_number;
	}
	public void setStud_number(String stud_number) {
		this.stud_number = stud_number;
	}
	public String getStud_professional() {
		return stud_professional;
	}
	public void setStud_professional(String stud_professional) {
		this.stud_professional = stud_professional;
	}
	public String getStud_level() {
		return stud_level;
	}
	public void setStud_level(String stud_level) {
		this.stud_level = stud_level;
	}
	public String getStud_phone() {
		return stud_phone;
	}
	public void setStud_phone(String stud_phone) {
		this.stud_phone = stud_phone;
	}
	public String getStud_address() {
		return stud_address;
	}
	public void setStud_address(String stud_address) {
		this.stud_address = stud_address;
	}
	public String getStud_createtime() {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return simpleFormat.format(stud_createtime);
	}
	public void setStud_createtime(Date stud_createtime) {
		this.stud_createtime = stud_createtime;
	}
	@Override
	public String toString() {
		return "Student [stud_id=" + stud_id + ", stud_name=" + stud_name + ", stud_number=" + stud_number
				+ ", stud_professional=" + stud_professional + ", stud_level=" + stud_level + ", stud_phone="
				+ stud_phone + ", stud_address=" + stud_address + ", stud_createtime=" + stud_createtime + "]";
	}
}
