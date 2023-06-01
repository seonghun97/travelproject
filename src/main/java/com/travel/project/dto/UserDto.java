package com.travel.project.dto;



public class UserDto {
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserbirth() {
		return userbirth;
	}
	public void setUserbirth(String userbirth) {
		this.userbirth = userbirth;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUsermobile() {
		return usermobile;
	}
	public void setUsermobile(String usermobile) {
		this.usermobile = usermobile;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	private String userid;  //사용자아이디
	private String userpw;   //사용자 비밀번호
	private String username;  //사용자이름 
	private String userbirth;  //사용자 생일
	private String useremail;  //사용자 이메일
	private String usermobile;  //사용자 전화번호
	private String joindate;   //가입날짜
	public UserDto(String userid, String userpw, String username, String userbirth, String useremail, String usermobile,
			String joindate) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userbirth = userbirth;
		this.useremail = useremail;
		this.usermobile = usermobile;
		this.joindate = joindate;
		
	}
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
