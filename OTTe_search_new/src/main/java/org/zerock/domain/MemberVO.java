package org.zerock.domain;

public class MemberVO {

	private String useremail;
	private String userid;
	private String userpassword;

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}



	/*
	 * @Override public String toString() { return "MemberVO [useremail=" +
	 * useremail + ", userid=" + userid + ", userpassword=" + userpassword +
	 * ", regDate=" + regDate + "]"; }
	 */

}
