package com.mo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mo.common.util.Page;
import com.mo.pojo.Student;
import com.mo.pojo.vo.StudentQueryVo;
import com.mo.service.StudentService;

@Controller
public class CustomerController {
	//依赖注入
	@Autowired
	private StudentService studentService;
	
	Page<Student> page = null;
	Page<Student> allpage = null;
	
	
	@RequestMapping(value = "/customer/list")
	public String list(StudentQueryVo vo,Model model) {
		//通过条件，查询分页对象
		page = studentService.selectPageByQueryVo(vo);
		model.addAttribute("page", page);
		return "customerManage";
	}
	
	//修改客户页面
	@RequestMapping(value = "/customer/updateCustomer")
	public String updateCustomer(Integer id,Model model) {
		Student student = studentService.selectStudentById(id);
		model.addAttribute("studentInf", student);
		return "updateCustomer";
	}
	//保存修改
	@RequestMapping(value = "/customer/update")
	public String update(Student student) {
//		System.out.println(student.getStud_id()+"jjjj"+student);
		studentService.updateStudentById(student);
		return "redirect:list";
	}
	
	//删除
	@RequestMapping(value = "/customer/delete")
	public @ResponseBody void delete(Integer id) {
		studentService.deleteStudentById(id);
	}
	
	//新增客户页面
	@RequestMapping(value = "/customer/addCustomer")
	public String addCustomer() {
		return "addCustomer";
	}
	
	//保存新增客户信息
	@RequestMapping(value = "/customer/saveAddCustomer")
	public String saveAddCustomer(Student student) {
		studentService.saveNewStudent(student);
		return "redirect:list";
	}
}
