package com.ssm.crud.bean;

import java.io.Serializable;

@SuppressWarnings("serial")
public class student implements Serializable{
    private String id;

    private String cardno;

    private String name;

    private String password;

    private String prefession;

    private String sex;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno == null ? null : cardno.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPrefession() {
        return prefession;
    }

    public void setPrefession(String prefession) {
        this.prefession = prefession == null ? null : prefession.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

	@Override
	public String toString() {
		return "student [id=" + id + ", cardno=" + cardno + ", name=" + name + ", password=" + password
				+ ", prefession=" + prefession + ", sex=" + sex + "]";
	}
    
}