package com.ssm.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.crud.bean.studentExample.Criteria;
import com.ssm.crud.bean.student;
import com.ssm.crud.bean.studentExample;
import com.ssm.crud.dao.studentMapper;

@Service
public class StudentService {

	@Autowired
	studentMapper studentMapper;

	public List<student> getAll() {
		return studentMapper.selectByExample(null);
	}

	public List<student> getstudent(String id, String password) {
		studentExample studentExample = new studentExample();
		Criteria criteria = studentExample.createCriteria();
		criteria.andIdEqualTo(id);
		criteria.andPasswordEqualTo(password);
		return studentMapper.selectByExample(studentExample);
	}

	public int insertStudent(student student) {
		return studentMapper.insertSelective(student);

	}

	public int deleteStudent(String studentid) {
		return studentMapper.deleteByPrimaryKey(studentid);

	}

	public int updateStudent(student student) {
		return studentMapper.updateByPrimaryKeySelective(student);

	}

	public student selectStudent(String studentid) {
		return studentMapper.selectByPrimaryKey(studentid);

	}

}
