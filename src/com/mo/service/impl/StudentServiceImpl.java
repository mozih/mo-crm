package com.mo.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mo.common.util.Page;
import com.mo.dao.StudentDao;
import com.mo.pojo.Student;
import com.mo.pojo.vo.StudentQueryVo;
import com.mo.service.StudentService;

@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {
	// 声明DAO属性并注入
	@Autowired
	private StudentDao studentDao;
	
	//通过条件，查询分页对象
	@Override
	public Page<Student> selectPageByQueryVo(StudentQueryVo vo) {
		// TODO Auto-generated method stub
		Page<Student> page = new Page<Student>();
		//每页数
		vo.setSize(5);
		page.setSize(5);
		if(vo!=null) {
			//判断当前页
			if(vo.getPage()!=null) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage()-1)*vo.getSize());
			}
			if(vo.getStudName()!=null && !vo.getStudName().trim().equals("")) {
				vo.setStudName(vo.getStudName().trim());
			}
			if(vo.getStud_number()!=null && !vo.getStud_number().trim().equals("")) {
				vo.setStud_number(vo.getStud_number().trim());
			}
			if(vo.getStud_professional()!=null && !vo.getStud_professional().trim().equals("")) {
				vo.setStud_professional(vo.getStud_professional().trim());
			}
			if(vo.getStud_level()!=null && !vo.getStud_level().trim().equals("")) {
				vo.setStud_level(vo.getStud_level().trim());
			}
			if(vo.getStud_createtime()!=null && !vo.getStud_createtime().trim().equals("")) {
				vo.setStud_createtime(vo.getStud_createtime().trim());
			}
			//总条数
			page.setTotal(studentDao.studentCountByQueryVo(vo));
			page.setRows(studentDao.selectStudentListByQueryVo(vo));
		}
		return page;
	}
	@Override
	public Student selectStudentById(Integer id) {
		// TODO Auto-generated method stub
		return studentDao.selectStudentById(id);
	}

	@Override
	public void updateStudentById(Student student) {
		// TODO Auto-generated method stub
		studentDao.updateStudentById(student);
	}

	@Override
	public void deleteStudentById(Integer id) {
		// TODO Auto-generated method stub
		studentDao.deleteStudentById(id);
	}

	@Override
	public void saveNewStudent(Student student) {
		// TODO Auto-generated method stub
		student.setStud_createtime(new Date());
		studentDao.saveNewStudent(student);
	}

}
