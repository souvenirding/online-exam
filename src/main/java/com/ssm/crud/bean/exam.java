package com.ssm.crud.bean;

import java.util.Date;

public class exam {
    private Integer id;

    private Date examdate;

    private Integer score;

    private Integer paperid;

    private String studentid;
    
    private paper paper;
    
    private student student;

    public student getStudent() {
		return student;
	}

	public void setStudent(student student) {
		this.student = student;
	}

	public paper getPaper() {
		return paper;
	}

	public void setPaper(paper paper) {
		this.paper = paper;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getExamdate() {
        return examdate;
    }

    public void setExamdate(Date examdate) {
        this.examdate = examdate;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getPaperid() {
        return paperid;
    }

    public void setPaperid(Integer paperid) {
        this.paperid = paperid;
    }

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid == null ? null : studentid.trim();
    }

	@Override
	public String toString() {
		return "exam [id=" + id + ", examdate=" + examdate + ", score=" + score + ", paperid=" + paperid
				+ ", studentid=" + studentid + ", paper=" + paper + ", student=" + student + "]";
	}

	
	
    
}