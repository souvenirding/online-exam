package com.ssm.crud.bean;

import java.util.Date;

public class paper {
    private Integer id;

    private Date joindate;

    private String papername;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getJoindate() {
        return joindate;
    }

    public void setJoindate(Date joindate) {
        this.joindate = joindate;
    }

    public String getPapername() {
        return papername;
    }

    public void setPapername(String papername) {
        this.papername = papername == null ? null : papername.trim();
    }

	@Override
	public String toString() {
		return "paper [id=" + id + ", joindate=" + joindate + ", papername=" + papername + "]";
	}
    
}