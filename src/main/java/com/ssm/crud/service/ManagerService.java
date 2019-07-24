package com.ssm.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.crud.bean.manager;
import com.ssm.crud.bean.managerExample;
import com.ssm.crud.bean.managerExample.Criteria;
import com.ssm.crud.dao.managerMapper;

@Service
public class ManagerService {
	@Autowired
	private managerMapper managerMapper;

	public List<manager> getManager(String username, String password) {
		managerExample managerExample = new managerExample();
		Criteria criteria = managerExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(password);
		return managerMapper.selectByExample(managerExample);
	}

//	public manager selectManager(String username, String password) {
//		return managerMapper.selectManager(username, password);
//	}

}
