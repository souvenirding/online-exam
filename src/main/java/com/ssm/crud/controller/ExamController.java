package com.ssm.crud.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.crud.bean.exam;
import com.ssm.crud.bean.question;
import com.ssm.crud.bean.student;
import com.ssm.crud.service.ExamService;
import com.ssm.crud.service.QuestionService;

@Controller
@RequestMapping("/exam")
public class ExamController {

	public String mainPage = null;
	public String menu = null;

	@Autowired
	private ExamService examService;

	// 管理员查看成绩
	@RequestMapping("/managerselect")
	public String getExams(Model model) {
		List<exam> exams = examService.getExams();
		//System.out.println(exams);
		model.addAttribute("exams", exams);
		mainPage = "examlist.jsp";
		menu = "managermenu.jsp";
		model.addAttribute("menu", menu);
		model.addAttribute("mainPage", mainPage);
		return "main";
	}

	// 学生查看成绩
	@SuppressWarnings("unchecked")
	@RequestMapping("/studentselect")
	public String getExam(HttpSession session, Model model) {
		List<student> studentlist = (List<student>) session.getAttribute("studentsession");
		Iterator<student> iterator = studentlist.iterator();
		student student = null;
		while (iterator.hasNext()) {
			student = iterator.next();
		}
		List<exam> studentexams = examService.selectByExampleWithPaper(Integer.parseInt(student.getId()));
		model.addAttribute("studentexams", studentexams);
		menu = "menu.jsp";
		mainPage = "studentexam.jsp";
		model.addAttribute("mainPage", mainPage);
		model.addAttribute("menu", menu);
		return "main";
	}

	// 保存成绩
	@RequestMapping("/insert")
	public String insertExam(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		Map<String, String[]> keyMap = new HashMap<String, String[]>();
		keyMap = request.getParameterMap();
		Iterator<Entry<String, String[]>> iter = keyMap.entrySet().iterator();
		int totalScore = 0;
		while (iter.hasNext()) {
			Entry<String, String[]> entry = iter.next();
			String keyStr = (String) entry.getKey();
			String[] values = entry.getValue();
			String value = "";
			for (String s : values) {
				value += s + ",";
			}
			value = value.substring(0, value.length() - 1);
			totalScore = totalScore + calScore(keyStr, value.trim());
		}
		List<student> student = (List<student>) session.getAttribute("studentsession");
		System.out.println(student);
		int pID = Integer.parseInt((String) session.getAttribute("pId"));
		session.removeAttribute("pId");
		exam exam = new exam();
		exam.setExamdate(new Date());
		exam.setScore(totalScore);
		exam.setStudentid(student.get(0).getId());
		exam.setPaperid(pID);
		examService.saveExam(exam);
		model.addAttribute("exam", exam);
		menu = "menu.jsp";
		mainPage = "examResult.jsp";
		model.addAttribute("mainPage", mainPage);
		model.addAttribute("menu", menu);
		return "main";
	}

	/**
	 * 计算每道题目的得分
	 *
	 */
	@Autowired
	private QuestionService questionService;

	private int calScore(String questionId, String userAnswer) throws Exception {
		int id = Integer.parseInt(questionId);
		question question = questionService.getQuestion(id);
		if (userAnswer.equals(question.getAnswer())) {
			return 10;
		} else {
			return 0;
		}
	}

}
