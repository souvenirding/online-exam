package com.ssm.crud.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.crud.bean.Msg;
import com.ssm.crud.bean.paper;
import com.ssm.crud.bean.question;
import com.ssm.crud.service.Paperservice;
import com.ssm.crud.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {
	public String menu = null;
	public String mainPage = null;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private Paperservice paperService;
//	@Autowired
//	private Question_PaperService question_paperService;

	// 管理员获取所有题目
	@RequestMapping("/questionlist")
	public String getQuestionlist(Model model) {
		List<paper> paperlist = paperService.getPapers();
		model.addAttribute("paper_list",paperlist);
		List<question> questionlist = questionService.getQuestionlist();
		model.addAttribute("questionlist", questionlist);
		menu = "managermenu.jsp";
		mainPage = "questionlist.jsp";
		model.addAttribute("menu", menu);
		model.addAttribute("mainPage", mainPage);
		return "main";
	}

	// 管理员添加题目
	@RequestMapping("/questionsave")
	@ResponseBody
	public Msg questionSave(question question) {
		question.setJointime(new Date());
		question = question_trim(question);
		int result = questionService.saveQuestion(question);
		return Msg.success().add("result", result);
	}

	//管理员获取需要修改的题目
	@RequestMapping("/questionupdate")
	public String questionupdate(@RequestParam("questionid")String questionid,Model model){
		int id=Integer.parseInt(questionid);
		question question = questionService.getQuestion(id);
		List<question> qList = new ArrayList<question>();
		qList.add(question);
		menu = "managermenu.jsp";
		mainPage = "questionupdate.jsp";
		model.addAttribute("qList", qList);
		model.addAttribute("menu", menu);
		model.addAttribute("mainPage", mainPage);
		return "main";
	}

	//管理员保存修改后的题目
	@RequestMapping("/question_update")
	public String question_update(question question,Model model){
		question.setJointime(new Date());
		question = question_trim(question);
		questionService.updateQuestion(question);
		return getQuestionlist(model);
	}

	//管理员删除题目
	@RequestMapping("/questiondelete")
	public String questiondelete(String questionid,Model model){
		int qid = Integer.parseInt(questionid);
		questionService.deleteQuestion(qid);
		return getQuestionlist(model);
	}

	//管理员添加题目到某一试卷
	@RequestMapping("/q_add_paper")
	public String q_add_p(String questionid,Model model){
		question question = questionService.getQuestion(Integer.parseInt(questionid));
		List<question> questionlist = new ArrayList<question>();
		questionlist.add(question);

		return "";
	}

//	//管理员依据试卷名称查询所有题目
//	@RequestMapping("s_q_bypid")
//	public String selectquestionbypaperid(String paper_id,Model model){
//		List<question_paper> q_List = question_paperService.getQuestions(Integer.parseInt(paper_id));
//
//		model.addAttribute("questionlist", q_List);
//		List<paper> paperlist = paperService.getPapers();
//		model.addAttribute("paper_list",paperlist);
//		menu = "managermenu.jsp";
//		mainPage = "questionlist.jsp";
//		model.addAttribute("menu", menu);
//		model.addAttribute("mainPage", mainPage);
//		return "main";
//	}

	//去掉题目属性值中前后空格
	public question question_trim(question question){
		if(!question.getAnswer().isEmpty()){
			question.setAnswer(question.getAnswer().trim());
		}
		if(!question.getOptiona().isEmpty()){
			question.setOptiona(question.getOptiona().trim());
		}
		if(!question.getOptionb().isEmpty()){
			question.setOptionb(question.getOptionb().trim());
		}
		if(!question.getOptionc().isEmpty()){
			question.setOptionc(question.getOptionc().trim());
		}
		if(!question.getOptiond().isEmpty()){
			question.setOptiond(question.getOptiond().trim());
		}
		if(!question.getSubject().isEmpty()){
			question.setSubject(question.getSubject().trim());
		}
		return question;
	}
}
