package com.ssm.crud.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.crud.bean.Msg;
import com.ssm.crud.bean.student;
import com.ssm.crud.service.StudentService;

/**
 * 处理学生增删改查
 *
 * @author 丁
 *
 */

@Controller
@RequestMapping("/student")
public class StudentController {

	public String menu = null;
	public String mainPage = null;
	@Autowired
	StudentService studentService;

	// 管理员获取所有学生信息
	@RequestMapping("/studentlist")
	public String getStudents(Model model) {
		// 分页功能，传入参数为：开始页，每页大小
		// PageHelper.startPage(pn, 5);
		// startPage紧跟的查询就是一个分页查询
		// 使用pageinfo包装查询后的结果,封装了分页的详细信息,只需要将pageinfo交给页面,连续显示页数为3
		// PageInfo pageInfo = new PageInfo(list, 3);
		List<student> studentlist = studentService.getAll();
		model.addAttribute("studentlist", studentlist);
		mainPage = "studentlist.jsp";
		menu = "managermenu.jsp";
		model.addAttribute("menu", menu);
		model.addAttribute("mainPage", mainPage);
		return "main";
	}

	// 学生登陆验证
	@RequestMapping("/login")
	public String slogin(@RequestParam("id") String id, @RequestParam("password") String password, Model model,
						 String yzm, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sessionVerifyCode = (String) session.getAttribute("verifyCodeValue");
		List<student> student = studentService.getstudent(id.trim(), password.trim());
		if (student.size()>0 && yzm.trim().equalsIgnoreCase(sessionVerifyCode)) {
			session.setAttribute("studentsession", student);
			session.setAttribute("loginuse", student);
			menu = "menu.jsp";
			model.addAttribute("menu", menu);
			return "main";
		} else {
			request.setAttribute("nouser", "账户不存在或验证码错误");
			return "studentlogin";
		}
	}

	// 管理员添加学生
	@RequestMapping("/studentsave")
	@ResponseBody
	public Msg insertStudent(student student) {
		student = student_trim(student);
		student s = studentService.selectStudent(student.getId());
		if (s != null) {
			return Msg.fail().add("result", "准考证号已存在");
		} else {
			studentService.insertStudent(student);
			return Msg.success().add("result", "添加成功");
		}
	}

	// 管理员删除学生
	@RequestMapping("/studentdelete")
	public String deleteStudent(@RequestParam("studentid") String studentid, Model model) {
		studentService.deleteStudent(studentid);
		return getStudents(model);
	}

	// 管理员获取需要更新的学生的信息
	@RequestMapping("/studentupdate")
	public String updateStudent(@RequestParam("studentid") String studentid, Model model) {
		student student = studentService.selectStudent(studentid);
		List<student> list = new ArrayList<student>();
		list.add(student);
		model.addAttribute("student", list);
		mainPage = "studentupdate.jsp";
		menu = "managermenu.jsp";
		model.addAttribute("menu", menu);
		model.addAttribute("mainPage", mainPage);
		return "main";
	}

	// 管理员更新学生信息
	@RequestMapping("/student_update")
	public String update_Student(student student, Model model) {
		student = student_trim(student);
		studentService.updateStudent(student);
		return getStudents(model);
	}

	// 学生修改信息
	// 获取信息
	@SuppressWarnings("unchecked")
	@RequestMapping("/updatestudent")
	public String updatestudent(Model model, HttpSession session) {
		List<student> s = (List<student>) session.getAttribute("studentsession");
		model.addAttribute("student", s);
		menu = "menu.jsp";
		mainPage = "student_update.jsp";
		model.addAttribute("menu", menu);
		model.addAttribute("mainPage", mainPage);
		return "main";
	}

	// 修改信息
	@RequestMapping("/update_student")
	public String update_student(student student, Model model, HttpServletRequest request) {
		student = student_trim(student);
		studentService.updateStudent(student);
		HttpSession session=request.getSession();
		session.removeAttribute("studentsession");
		List<student> students = new ArrayList<student>();
		students.add(student);
		session.setAttribute("studentsession", students);
		request.setAttribute("supdate", "修改成功");
		return updatestudent(model, session);
	}

	// 除去学生属性值中的前后空格
	public student student_trim(student student) {
		if (!student.getId().isEmpty()) {
			student.setId(student.getId().trim());
		}
		if (!student.getCardno().isEmpty()) {
			student.setCardno(student.getCardno().trim());
		}
		if (!student.getName().isEmpty()) {
			student.setName(student.getName().trim());
		}
		if (!student.getPassword().isEmpty()) {
			student.setPassword(student.getPassword().trim());
		}
		if (!student.getPrefession().isEmpty()) {
			student.setPrefession(student.getPrefession());
		}
		if (!student.getSex().isEmpty()) {
			student.setSex(student.getSex());
		}
		return student;
	}
}
