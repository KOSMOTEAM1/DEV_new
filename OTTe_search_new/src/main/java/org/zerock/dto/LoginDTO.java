package org.zerock.dto;

public class LoginDTO {

	private String useremail;
	private String userpassword;
	private Integer usernum;
	public Integer getUsernum() {
		return usernum;
	}

	public void setUsernum(Integer usernum) {
		this.usernum = usernum;
	}

	private boolean useCookie;

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

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

}
