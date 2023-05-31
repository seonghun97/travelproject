package com.travel.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.project.dao.IDao;


@Controller
public class TravelController {
	@Autowired
	private SqlSession sqlsesstion;
	
	
	@RequestMapping ("/joinOk")
		public String join(HttpServletRequest request, Model model) {
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		String username = request.getParameter("username");
		String userbirth = request.getParameter("userbirth");
		String useremail = request.getParameter("useremail");
		String usermobile = request.getParameter("usermobile");
		
		IDao dao = sqlsesstion.getMapper(IDao.class);

		int joinCheck = 0;
		
		int checkId = dao.checkIdDao(userid); //가입하려는 id 존재여부 체크 1이면 이미 존재
		
		if(checkId == 0) {
			joinCheck = dao.joinDao(userid, userpw, username, userbirth, useremail, usermobile);
			model.addAttribute("checkId", checkId);
		//joincheck 값이 1이면 회원가입성공 아니면 실패
		} else {
			model.addAttribute("checkId", checkId);
		}
		
		if(joinCheck == 1) {
			model.addAttribute("joinFlag", joinCheck);
			model.addAttribute("memberName", username);
			model.addAttribute("memberId", userid);
		}else {//회원가입실패
			model.addAttribute("joinFlag", joinCheck);
		}
		
		return "joinOk";
		}
	@RequestMapping("/join")
	private String joinOk() {
		return "join";
	}
	
	@RequestMapping(value= "/index")
	public String index() {
		return "index";
	}
	

	
	
}
