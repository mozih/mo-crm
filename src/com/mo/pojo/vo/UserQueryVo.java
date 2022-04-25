package com.mo.pojo.vo;
import java.io.Serializable;

public class UserQueryVo implements Serializable{
	private static final long serialVersionUID = -3249625489171483273L;
	//用户名称
	private String user_name;
	private String user_phone;
	private String user_aut;
		
	//当前页
	private Integer page=1;
		
	//每页数
	private Integer size=10;
		
	//开始行
	private Integer startRow=0;

	public UserQueryVo() {
		super();
		// TODO 自动生成的构造函数存根
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
