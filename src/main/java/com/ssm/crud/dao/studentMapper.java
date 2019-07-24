package com.ssm.crud.dao;

import com.ssm.crud.bean.student;
import com.ssm.crud.bean.studentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface studentMapper {
    long countByExample(studentExample example);

    int deleteByExample(studentExample example);

    int deleteByPrimaryKey(String id);

    int insert(student record);

    int insertSelective(student record);

    List<student> selectByExample(studentExample example);

    student selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") student record, @Param("example") studentExample example);

    int updateByExample(@Param("record") student record, @Param("example") studentExample example);

    int updateByPrimaryKeySelective(student record);

    int updateByPrimaryKey(student record);
}