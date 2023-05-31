package com.travel.project.dao;

import com.travel.project.dto.UserDto; 
public interface IDao {
		public int joinDao(String userid, String userpw,String username
				,String userbirth,String useremail,String usermobile);//회원가입
		public int checkIdDao(String userid);//가입하려는 id의 존재여부 체크
		public int checkIdPwDao(String userid, String userpw); //아이디와 비밀번호의 일치여부 체크
		public UserDto getMemberInfo(String userid);//아이디로 조회하여 회원 정보 모두 가져오기
	}


