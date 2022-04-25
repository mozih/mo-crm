package com.mo.dao;

import java.util.List;
import com.mo.pojo.Student;
import com.mo.pojo.vo.StudentQueryVo;

public interface StudentDao {
	//总条数
	public Integer studentCountByQueryVo(StudentQueryVo vo);
	//结果集
	public  List<Student> selectStudentListByQueryVo(StudentQueryVo vo);
	public  List<Student> selectAllStudentListByQueryVo(StudentQueryVo vo);
	
	//通过id查询订单信息
	public Student selectStudentById(Integer id);
	//通过id修改订单信息
	public void updateStudentById(Student student);
	public void deleteStudentById(Integer id);
	//插入新订单
	public void saveNewStudent(Student student);
}
