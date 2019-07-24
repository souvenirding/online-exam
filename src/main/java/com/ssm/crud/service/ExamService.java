package com.ssm.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.crud.bean.exam;
import com.ssm.crud.dao.examMapper;

@Service
public class ExamService {
	@Autowired
	private examMapper examMapper;

	// 插入成功则返回1，失败返回0
	public int saveExam(exam exam) {
		return examMapper.insertSelective(exam);

	}

	// 管理员查询成绩
	public List<exam> getExams() {
		return examMapper.selectByExampleWithPaperandStudent();

	}

	//学生查询成绩
	public List<exam> selectByExampleWithPaper(Integer studentId) {
		return examMapper.selectByExampleWithPaper(studentId);
	}

}
