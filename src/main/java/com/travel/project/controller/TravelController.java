package com.travel.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.project.dao.IDao;


@Controller
public class TravelController {
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("/join")
	   private String joinOk() {
	      return "join";
	   }
	   
	   @RequestMapping ("/joinOk")
	      public String join(HttpServletRequest request, Model model) {
	      String userid = request.getParameter("userid");
	      String userpw = request.getParameter("userpw");
	      String username = request.getParameter("username");
	      String userbirth = request.getParameter("userbirth");
	      String useremail = request.getParameter("useremail");
	      String usermobile = request.getParameter("usermobile");
	      
	      IDao dao = sqlsession.getMapper(IDao.class);

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
	   @RequestMapping (value="/loginOk")
	   	private String loginOk(HttpServletRequest request, Model model, HttpSession session) {
		   String userid = request.getParameter("userid");
		   String userpw = request.getParameter("userpw");
		   
		   IDao dao = sqlsession.getMapper(IDao.class);
		   
		   int checkIdPwFlag = dao.checkIdPwDao(userid, userpw);
		   //1이면 성공, 0이면 실패
		   model.addAttribute("checkIdPwFlag", checkIdPwFlag);
		   
		   if(checkIdPwFlag == 1) {
			  session.setAttribute("sessionId",userid);
			  model.addAttribute("UserDto", dao.getMemberInfo(userid));
			  return "index";
		   }
		   else 
		   {
			   
			  return "loginOk";
		   }
	   }
	   @RequestMapping (value="/login")
	   private String login() {
		   return "login";
	   }
}
