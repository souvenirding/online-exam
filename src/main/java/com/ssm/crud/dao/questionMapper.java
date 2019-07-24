package com.ssm.crud.dao;

import com.ssm.crud.bean.question;
import com.ssm.crud.bean.questionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface questionMapper {
    long countByExample(questionExample example);

    int deleteByExample(questionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(question record);

    int insertSelective(question record);

    List<question> selectByExample(questionExample example);

    question selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") question record, @Param("example") questionExample example);

    int updateByExample(@Param("record") question record, @Param("example") questionExample example);

    int updateByPrimaryKeySelective(question record);

    int updateByPrimaryKey(question record);
}