package com.ssm.crud.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssm.crud.bean.paper;
import com.ssm.crud.bean.paperExample;
import com.ssm.crud.bean.paperExample.Criteria;
import com.ssm.crud.dao.paperMapper;
@Service
public class Paperservice {

	@Autowired
	paperMapper paperMapper;
	//获取所有试卷
	public List<paper> getPapers(){
		return paperMapper.selectByExample(null);
	}
	//获取指定试卷
	public paper getPaper(int id) {
		return paperMapper.selectByPrimaryKey(id);
	}
	//删除指定试卷
	public int deletePaper(int id) {
		return paperMapper.deleteByPrimaryKey(id);
	}

	public int savePaper(paper paper) {
		return paperMapper.insertSelective(paper);

	}
	public int updatePaper(paper paper) {
		return paperMapper.updateByPrimaryKeySelective(paper);
	}

	//主要用来判断添加试卷时试卷名是否已存在
	public List<paper> selectByExample(String papername){
		paperExample paperExample = new paperExample();
		Criteria criteria = paperExample.createCriteria();
		criteria.andPapernameEqualTo(papername);
		return paperMapper.selectByExample(paperExample);
	}
}
