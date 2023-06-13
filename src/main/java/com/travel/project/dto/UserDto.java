package com.travel.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
	private String userid;  //사용자아이디 pk
	private String userpw;   //사용자 비밀번호
	private String username;  //사용자이름 
	private String userbirth;  //사용자 생일
	private String useremail;  //사용자 이메일
	private String usermobile;  //사용자 전화번호
	private String joindate;   //가입날짜
}
