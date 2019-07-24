package com.ssm.crud.bean;

import java.util.Date;

public class question {
    private Integer id;

    private String answer;

    private Date jointime;

    private String optiona;

    private String optionb;

    private String optionc;

    private String optiond;

    private String subject;

    private String type;

    private String knowledge;

    private String levle;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public Date getJointime() {
        return jointime;
    }

    public void setJointime(Date jointime) {
        this.jointime = jointime;
    }

    public String getOptiona() {
        return optiona;
    }

    public void setOptiona(String optiona) {
        this.optiona = optiona == null ? null : optiona.trim();
    }

    public String getOptionb() {
        return optionb;
    }

    public void setOptionb(String optionb) {
        this.optionb = optionb == null ? null : optionb.trim();
    }

    public String getOptionc() {
        return optionc;
    }

    public void setOptionc(String optionc) {
        this.optionc = optionc == null ? null : optionc.trim();
    }

    public String getOptiond() {
        return optiond;
    }

    public void setOptiond(String optiond) {
        this.optiond = optiond == null ? null : optiond.trim();
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject == null ? null : subject.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getKnowledge() {
        return knowledge;
    }

    public void setKnowledge(String knowledge) {
        this.knowledge = knowledge == null ? null : knowledge.trim();
    }

    public String getLevle() {
        return levle;
    }

    public void setLevle(String levle) {
        this.levle = levle == null ? null : levle.trim();
    }

	@Override
	public String toString() {
		return "question [id=" + id + ", answer=" + answer + ", jointime=" + jointime + ", optiona=" + optiona
				+ ", optionb=" + optionb + ", optionc=" + optionc + ", optiond=" + optiond + ", subject=" + subject
				+ ", type=" + type + ", knowledge=" + knowledge + ", levle=" + levle + "]";
	}
    
    
}