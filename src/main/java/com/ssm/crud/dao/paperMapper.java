package com.ssm.crud.dao;

import com.ssm.crud.bean.paper;
import com.ssm.crud.bean.paperExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface paperMapper {
    long countByExample(paperExample example);

    int deleteByExample(paperExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(paper record);

    int insertSelective(paper record);

    List<paper> selectByExample(paperExample example);

    paper selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") paper record, @Param("example") paperExample example);

    int updateByExample(@Param("record") paper record, @Param("example") paperExample example);

    int updateByPrimaryKeySelective(paper record);

    int updateByPrimaryKey(paper record);
}