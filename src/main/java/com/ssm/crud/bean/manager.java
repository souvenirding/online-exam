package com.ssm.crud.bean;

import java.io.Serializable;

@SuppressWarnings("serial")
public class manager implements Serializable{

	private Integer id;

    private String name;

    private String password;

    private String username;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

	@Override
	public String toString() {
		return "manager [id=" + id + ", name=" + name + ", password=" + password + ", username=" + username + "]";
	}
    
}