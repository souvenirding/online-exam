package com.ssm.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.crud.bean.question;
import com.ssm.crud.dao.questionMapper;

@Service
public class QuestionService {

	@Autowired
	questionMapper questionMapper;


	// 根据题目编号获取题目
	public question getQuestion(int id) {
		return questionMapper.selectByPrimaryKey(id);
	}

	// 管理员获取所有题目
	public List<question> getQuestionlist() {
		return questionMapper.selectByExample(null);
	}

	public int saveQuestion(question question) {
		return questionMapper.insertSelective(question);

	}

	public void updateQuestion(question question) {
		questionMapper.updateByPrimaryKeySelective(question);
	}

	public void deleteQuestion(int questionid) {
		questionMapper.deleteByPrimaryKey(questionid);
	}

}
