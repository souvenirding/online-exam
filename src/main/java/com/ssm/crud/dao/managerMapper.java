package com.ssm.crud.dao;

import com.ssm.crud.bean.manager;
import com.ssm.crud.bean.managerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface managerMapper {
    long countByExample(managerExample example);

    int deleteByExample(managerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(manager record);

    int insertSelective(manager record);

    List<manager> selectByExample(managerExample example);

    manager selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") manager record, @Param("example") managerExample example);

    int updateByExample(@Param("record") manager record, @Param("example") managerExample example);

    int updateByPrimaryKeySelective(manager record);

    int updateByPrimaryKey(manager record);
}