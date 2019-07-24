package com.ssm.crud.bean;

public class question_paper {
    private Integer id;

    private Integer paperid;

    private String questionid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPaperid() {
        return paperid;
    }

    public void setPaperid(Integer paperid) {
        this.paperid = paperid;
    }

    public String getQuestionid() {
        return questionid;
    }

    public void setQuestionid(String questionid) {
        this.questionid = questionid == null ? null : questionid.trim();
    }

	@Override
	public String toString() {
		return "question_paper [id=" + id + ", paperid=" + paperid + ", questionid=" + questionid + "]";
	}
    
}