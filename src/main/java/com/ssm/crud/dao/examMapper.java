package com.ssm.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ssm.crud.bean.exam;
import com.ssm.crud.bean.examExample;

public interface examMapper {
    long countByExample(examExample example);

    int deleteByExample(examExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(exam record);

    int insertSelective(exam record);

    List<exam> selectByExample(examExample example);

    List<exam> selectByExampleWithPaperandStudent();

    List<exam> selectByExampleWithPaper(Integer studentId);

    exam selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") exam record, @Param("example") examExample example);

    int updateByExample(@Param("record") exam record, @Param("example") examExample example);

    int updateByPrimaryKeySelective(exam record);

    int updateByPrimaryKey(exam record);
}