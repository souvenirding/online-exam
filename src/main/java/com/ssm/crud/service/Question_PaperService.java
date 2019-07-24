package com.ssm.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssm.crud.bean.question_paper;
import com.ssm.crud.bean.question_paperExample;
import com.ssm.crud.bean.question_paperExample.Criteria;
import com.ssm.crud.dao.question_paperMapper;

@Service
public class Question_PaperService {

	@Autowired
	question_paperMapper question_paperMapper;
	public List<question_paper> getQuestions(int paperid) {
		question_paperExample question_paperExample = new question_paperExample();
		Criteria criteria = question_paperExample.createCriteria();
		criteria.andPaperidEqualTo(paperid);
		return question_paperMapper.selectByExample(question_paperExample);
	}

	public void selectQ_P(int parseInt) {


	}

	public int insertQP(String questionid, int paperID) {
		question_paper question_paper = new question_paper();
		question_paper.setPaperid(paperID);
		question_paper.setQuestionid(questionid);
		return question_paperMapper.insertSelective(question_paper);

	}

	public int updateQP(String questionid,int paperid,int qpid) {
		question_paper question_paper = new question_paper();
		question_paper.setId(qpid);
		question_paper.setQuestionid(questionid);
		question_paper.setPaperid(paperid);
		return question_paperMapper.updateByPrimaryKey(question_paper);

	}

}
