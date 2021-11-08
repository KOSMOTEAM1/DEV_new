package org.zerock.domain;

public class UserVO {

	private String useremail;
	private String userpassword;
	private String userid;
	private Integer usernum;
	private int upoint;

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
				+ usernum + ", upoint=" + upoint + "]";
	}
	
	

}
