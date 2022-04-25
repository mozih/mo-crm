package com.mo.service;

import com.mo.common.util.Page;
import com.mo.pojo.Student;
import com.mo.pojo.vo.StudentQueryVo;

public interface StudentService {
	public Page<Student> selectPageByQueryVo(StudentQueryVo vo);
	public Student selectStudentById(Integer id);
	public void updateStudentById(Student student);
	public void deleteStudentById(Integer id);
	public void saveNewStudent(Student student);
}
