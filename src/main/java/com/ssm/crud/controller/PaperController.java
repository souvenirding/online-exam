package com.ssm.crud.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.crud.bean.Msg;
import com.ssm.crud.bean.paper;
import com.ssm.crud.bean.question;
import com.ssm.crud.bean.question_paper;
import com.ssm.crud.service.Paperservice;
import com.ssm.crud.service.QuestionService;
import com.ssm.crud.service.Question_PaperService;

@Controller
@RequestMapping("/paper")
public class PaperController {
	private List<question> squestionList = new ArrayList<question>();// 单选题
	private List<question> mquestionList = new ArrayList<question>();// 多选题
	private List<question> jquestionList = new ArrayList<question>();// 判断题
	private List<question> cquestionList = new ArrayList<question>();// 填空题

	public String mainPage = null;
	public String menu = null;

	@Autowired
	private Paperservice paperservice;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private Question_PaperService question_paperservice;

	// 学生获取选取试卷所需要的试卷信息
	@RequestMapping("/paperlist")
	public String list(Model model) throws Exception {
		List<paper> papers = paperservice.getPapers();
		model.addAttribute("papers", papers);
		mainPage = "selectpaper.jsp";
		model.addAttribute("mainPage", mainPage);
		menu = "menu.jsp";
		model.addAttribute("menu", menu);
		return "main";
	}

	// 获取试卷详情
	@RequestMapping("/getdetail")
	public String getDetail(@RequestParam("paperId") String paperId, String levle, String knowledge, Model model,
							HttpSession session) throws Exception {
		int id = Integer.parseInt(paperId);
		session.setAttribute("pId", paperId);
		List<question_paper> question_papers = question_paperservice.getQuestions(id);
		Iterator<question_paper> it = question_papers.iterator();
		squestionList.clear();
		mquestionList.clear();
		jquestionList.clear();
		cquestionList.clear();
		String[] questionids = null;
		while (it.hasNext()) {
			question_paper question_paper = it.next();
			questionids = question_paper.getQuestionid().split(",");
		}
		for (String i : questionids) {
			question q = questionService.getQuestion(Integer.parseInt(i));
			if (levle.equals(q.getLevle()) && knowledge.equals(q.getKnowledge())) {
				if ("1".equals(q.getType())) {
					squestionList.add(q);
				} else if ("2".equals(q.getType())) {
					mquestionList.add(q);
				} else if ("3".equals(q.getType())) {
					jquestionList.add(q);
				} else {
					cquestionList.add(q);
				}
			}
		}
		System.out.println(squestionList.size());
		System.out.println(mquestionList.size());
		System.out.println(jquestionList.size());
		System.out.println(cquestionList.size());
		if (squestionList.size() < 3 || mquestionList.size() < 2 || jquestionList.size() < 2
				|| cquestionList.size() < 2) {
			mainPage = "paperselecterror.jsp";
		} else {
			squestionList = this.getRandomQuestion(squestionList, 3);
			mquestionList = this.getRandomQuestion(mquestionList, 2);
			jquestionList = this.getRandomQuestion(jquestionList, 2);
			cquestionList = this.getRandomQuestion(cquestionList, 3);
			model.addAttribute("squestionList", squestionList);
			model.addAttribute("mquestionList", mquestionList);
			model.addAttribute("jquestionList", jquestionList);
			model.addAttribute("cquestionList", cquestionList);
			paper paper = paperservice.getPaper(id);
			model.addAttribute("paper", paper);
			mainPage = "paper.jsp";
		}
		model.addAttribute("mainPage", mainPage);
		menu = "menu.jsp";
		model.addAttribute("menu", menu);
		return "main";
	}

	// 获取随机试题
	private List<question> getRandomQuestion(List<question> questionList, int num) {
		List<question> resultList = new ArrayList<question>();// 用于获取随即题目
		Random random = new Random();
		for (int i = 1; i <= num; i++) {
			int n = random.nextInt(questionList.size());
			question q = questionList.get(n);
			// a.contains(b)方法是查看a中是否有b，有返回true，否则false
			if (resultList.contains(q)) {
				//如果resultList.contains(q)为真，说明随机到相同的题目，执行i--；
				//然后又执行for循环的i++，相当于本次随机无效，且i值不变,重新for
				i--;
			} else {
				resultList.add(questionList.get(n));
			}
		}
		return resultList;
	}

	// 管理员获取试卷
	@RequestMapping("/managerselect")
	public String papaerlist(Model model) throws Exception {
		List<paper> papers = paperservice.getPapers();
		model.addAttribute("papers", papers);
		mainPage = "paperlist.jsp";
		model.addAttribute("mainPage", mainPage);
		menu = "managermenu.jsp";
		model.addAttribute("menu", menu);
		return "main";
	}

	// 管理员添加试题时所需的试卷信息
	@RequestMapping("/getpapers")
	@ResponseBody
	public Msg getPapers() {
		List<paper> paperlist = paperservice.getPapers();
		return Msg.success().add("paperlist", paperlist);

	}

	// 管理员添加试卷
	@RequestMapping("/papersave")
	@ResponseBody
	public Msg savePaper(paper paper) {
		paper.setJoindate(new Date());
		List<paper> plist = paperservice.selectByExample(paper.getPapername().trim());
		if (plist.size() == 0) {
			paperservice.savePaper(paper);
			return Msg.success().add("result", "添加成功");
		} else {
			return Msg.fail().add("result", "试卷已存在");
		}

	}

	// 管理员删除试卷
	@RequestMapping("/paperdelete")
	public String deletePaper(@RequestParam("paperId") String paperId, Model model) throws Exception {
		int paperid = Integer.parseInt(paperId);
		List<question_paper> listquestion = question_paperservice.getQuestions(paperid);
		if (listquestion.size() == 0 && listquestion.isEmpty()) {
			paperservice.deletePaper(paperid);
			return papaerlist(model);
		} else {
			menu = "managermenu.jsp";
			model.addAttribute("menu", menu);
			mainPage = "paperdeleteerror.jsp";
			model.addAttribute("mainPage", mainPage);
			return "main";
		}

	}

	// 管理员获取需要修改的试卷信息
	@RequestMapping("/paperupdate")
	public String updatePaper(@RequestParam("paperId") String paperId, Model model) {
		int paperid = Integer.parseInt(paperId);
		paper paper = paperservice.getPaper(paperid);
		List<paper> list = new ArrayList<paper>();
		list.add(paper);
		model.addAttribute("paper", list);
		menu = "managermenu.jsp";
		model.addAttribute("menu", menu);
		mainPage = "paperupdate.jsp";
		model.addAttribute("mainPage", mainPage);
		return "main";
	}

	// 管理员修改试卷信息
	@RequestMapping("/paper_update")
	public String update_Paper(@RequestParam("id") String paperId, @RequestParam("papername") String papername,
							   Model model) throws Exception {
		List<paper> plist = paperservice.selectByExample(papername.trim());
		if (plist.size() == 0) {
			int paperid = Integer.parseInt(paperId);
			paper paper = new paper();
			paper.setId(paperid);
			paper.setPapername(papername.trim());
			paper.setJoindate(new Date());
			paperservice.updatePaper(paper);
			return papaerlist(model);
		} else {
			menu = "managermenu.jsp";
			model.addAttribute("menu", menu);
			mainPage = "paperupdateerror.jsp";
			model.addAttribute("mainPage", mainPage);
			return "main";
		}
	}
}
