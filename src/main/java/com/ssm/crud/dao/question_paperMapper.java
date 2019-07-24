package com.ssm.crud.dao;

import com.ssm.crud.bean.question_paper;
import com.ssm.crud.bean.question_paperExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface question_paperMapper {
    long countByExample(question_paperExample example);

    int deleteByExample(question_paperExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(question_paper record);

    int insertSelective(question_paper record);

    List<question_paper> selectByExample(question_paperExample example);

    question_paper selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") question_paper record, @Param("example") question_paperExample example);

    int updateByExample(@Param("record") question_paper record, @Param("example") question_paperExample example);

    int updateByPrimaryKeySelective(question_paper record);

    int updateByPrimaryKey(question_paper record);
}