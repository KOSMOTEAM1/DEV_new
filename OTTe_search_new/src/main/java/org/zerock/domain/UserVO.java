package org.zerock.domain;

import java.util.Random;

public class UserVO {

	private String useremail;
	private String userpassword;
	private String userid;
	private Integer usernum;
	private String fromMail;
	private String title;
	private String content;
	private String temp;
	private Integer admin;
	/*
	 * private Random rnd;
	 * 
	 * 
	 * 
	 * public Random getRnd() { return rnd; }
	 * 
	 * public void setRnd(Random rnd) { this.rnd = rnd; }
	 */

	public Integer getAdmin() {
		return admin;
	}

	public void setAdmin(Integer admin) {
		this.admin = admin;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	private int upoint;

	public String getFromMail() {
		return fromMail;
	}

	public void setFromMail(String fromMail) {
		this.fromMail = fromMail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getUsernum() {
		return usernum;
	}

	public void setUsernum(Integer usernum) {
		this.usernum = usernum;
	}

	public String getuseremail() {
		return useremail;
	}

	public void setuseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getUpoint() {
		return upoint;
	}

	public void setUpoint(int upoint) {
		this.upoint = upoint;
	}

	@Override
	public String toString() {
		return "UserVO [useremail=" + useremail + ", userpassword=" + userpassword + ", userid=" + userid + ", usernum="
				+ usernum + ", fromMail=" + fromMail + ", title=" + title + ", content=" + content + ", temp=" + temp
				+ ", admin=" + admin + ", upoint=" + upoint + "]";
	}


	

}
