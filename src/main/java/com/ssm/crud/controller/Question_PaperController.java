package com.ssm.crud.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssm.crud.bean.Msg;
import com.ssm.crud.bean.question;
import com.ssm.crud.bean.question_paper;
import com.ssm.crud.service.QuestionService;
import com.ssm.crud.service.Question_PaperService;

@Controller
@RequestMapping("/q_p")
public class Question_PaperController {

	@Autowired
	Question_PaperService Question_PaperService;
	@Autowired
	QuestionService QuestionService;

	// 追加试卷上的题目
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("q_psave")
	@ResponseBody
	public Msg q_psave(String questionid, String paperid) {
		int paperID = Integer.parseInt(paperid);
		List<question_paper> question_papers = Question_PaperService.getQuestions(paperID);
		// System.out.println(question_papers);
		String[] qid = null;
		if (question_papers.size() > 0) {
			Iterator<question_paper> it = question_papers.iterator();
			question_paper qp = it.next();
			qp.setQuestionid(qp.getQuestionid() + "," + questionid);
			qid = qp.getQuestionid().split(",");
			Set set = new HashSet();
			for (int i = 0; i < qid.length; i++) {
				set.add(qid[i]);
			}
			qid = (String[]) set.toArray(new String[0]);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < qid.length; i++) {
				sb.append(qid[i] + ",");
			}
			Question_PaperService.updateQP(sb.substring(0, sb.length() - 1), paperID, qp.getId());
		} else {
			Question_PaperService.insertQP(questionid, paperID);
		}
		return Msg.success().add("result", "添加成功");
	}

	// 根据试卷编号查询试卷上所有题目考察的知识点
	@SuppressWarnings("unchecked")
	@RequestMapping("/selectknow")
	// @ResponseBody
	public void selectknowledge(String paperid, HttpServletResponse response) throws Exception {
		// System.out.println(paperid);
		List<question_paper> question_papers = Question_PaperService.getQuestions(Integer.parseInt(paperid));
		Iterator<question_paper> it = question_papers.iterator();
		// qp可能会出现空值异常
		question_paper qp = it.next();
		// System.out.println(qp);
		String[] questionid = qp.getQuestionid().split(",");
		List<String> knowledge = new ArrayList<String>();
		for (int i = 0; i < questionid.length; i++) {
			question question = QuestionService.getQuestion(Integer.parseInt(questionid[i]));
			// System.out.println(question);
			knowledge.add(question.getKnowledge());
		}
		// System.out.println(knowledge);
		// 去掉知识点中的重复项
		@SuppressWarnings({ "rawtypes" })
		HashSet h = new HashSet(knowledge);
		knowledge.clear();
		knowledge.addAll(h);
		// System.out.println(knowledge);
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(knowledge);
		response.setContentType("text/javascript");
		response.getWriter().print(result);
	}

	//查询试卷对应的题目
	@RequestMapping("/selectquestion")
	public String selectq_pbypaperid(String paperId, Model model) {
		List<question_paper> question_papers = Question_PaperService.getQuestions(Integer.parseInt(paperId));
		model.addAttribute("question_papers", question_papers);
		String menu = "managermenu.jsp";
		model.addAttribute("menu", menu);
		String mainPage = "questionpaper.jsp";
		model.addAttribute("mainPage", mainPage);
		return "main";
	}

	//更新试卷对应的题目
	@RequestMapping("/update")
	public String updatequestion_paper(question_paper question_paper,Model model){
		Question_PaperService.updateQP(question_paper.getQuestionid(), question_paper.getPaperid(), question_paper.getId());
		String menu = "managermenu.jsp";
		model.addAttribute("menu", menu);
		String mainPage = "success.jsp";
		model.addAttribute("mainPage", mainPage);
		return "main";
	}
}
