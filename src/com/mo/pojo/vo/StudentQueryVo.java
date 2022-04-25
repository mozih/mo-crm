package com.mo.pojo.vo;

import java.io.Serializable;

public class StudentQueryVo implements Serializable {
	private static final long serialVersionUID = -7094093339511682702L;
	private String studName;
	private String stud_number;
	private String stud_professional;
	private String stud_level;
	private String stud_createtime;
	private Integer stud_id;	
	//当前页
	private Integer page=1;
	//每页数
	private Integer size=10;
	//开始行
	private Integer startRow=0;
	public String getStudName() {
		return studName;
	}
	public void setStudName(String studName) {
		this.studName = studName;
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
	public String getStud_createtime() {
		return stud_createtime;
	}
	public void setStud_createtime(String stud_createtime) {
		this.stud_createtime = stud_createtime;
	}
	public Integer getStud_id() {
		return stud_id;
	}
	public void setStud_id(Integer stud_id) {
		this.stud_id = stud_id;
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
