package com.travel.project.controller;

import java.io.IOException;
import java.lang.StackWalker.Option;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.project.dao.IDao;


@Controller
public class TravelController<JSONArray> {
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("/join")
	private String join() {
		return "join";
	}
	@RequestMapping("/index")
	private String index() {
		return "index";
	}
	@RequestMapping (value="/login")
	 public String login() {
	    return "login";
	 }
	@RequestMapping(value ="/logout")
	public String logout(HttpSession session) {
		session.invalidate(); //세션 삭제 => logout
		
		return "redirect:index";
	}
	@RequestMapping(value ="/cal")
	public String cal() {
		return "cal";
	}
	
	
	@RequestMapping ("/joinOk")
		public String joinOk(HttpServletRequest request, Model model) {
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
			model.addAttribute("userName", username);
			model.addAttribute("userId", userid);
		}else {//회원가입실패
			model.addAttribute("joinFlag", joinCheck);
		}
		
		return "joinOk";
		}


	@RequestMapping(value = "/loginOk")
	public String loginOk(HttpServletRequest request, Model model, HttpSession session) {
	    String userid = request.getParameter("userid");
	    String userpw = request.getParameter("userpw");

	    IDao dao = sqlsession.getMapper(IDao.class);

	    int checkIdPwFlag = dao.checkIdPwDao(userid, userpw);
	    // 1이면 성공, 0이면 실패
	    model.addAttribute("checkIdPwFlag", checkIdPwFlag);

	    if (checkIdPwFlag == 1) {
	        session.setAttribute("sessionId", userid);
	        model.addAttribute("UserDto", dao.getMemberInfo(userid));
	        return "index";
	    } else {
	        return "redirect:login"; // 로그인 실패 시 로그인 페이지로 이동
	    }
	}
 
	@GetMapping("/mypage")
	public String mypage(HttpServletRequest request, HttpSession session) {
	    session = request.getSession(false);
	    if (session == null || session.getAttribute("sessionId") == null) {
	        // 로그인 세션이 없으면 경고창을 띄우고 로그인 페이지로 이동
	        return "redirect:/login";
	    }
	    // 로그인 세션이 있는 경우 문의게시판 페이지로 이동
	    return "mypage";
	}
	 @RequestMapping("/accommodation")
	    public String showAccommodationPage(Model model) {
	        String[] cities = {"--도시를선택해주세요--","도쿄", "쿄토", "오사카", "오키나와", "삿포루", "요코하마", "나고야"};
	        model.addAttribute("cities", cities);
	        	
	        return "accommodation";
	    }
	 
	 @PostMapping("/processForm")
	 public String processForm(@RequestParam(name = "location") String location,
	                           @RequestParam(name = "startDate", required = false) String startDate,
	                           @RequestParam(name = "city", required = false) String city,
	                           HttpServletRequest request) {
	     if (location.equals("airplain") && startDate != null && !startDate.isEmpty() && city != null) {
	         // 비행기 + 날짜 + 도시를 선택한 경우, 해당 날짜와 도시로 향하는 비행기 목록이 표시
	         // startDate를 원하는 방식으로 처리
	         request.setAttribute("startDate", startDate); // 예시: request에 startDate를 저장

	         return "airplain/airplainlist"; // 예시: 비행기 목록 페이지로 이동
	     } else if (location.equals("accommodation") && city != null) {
	         // 숙소 + 도시를 선택한 경우, 선택한 도시에 있는 모든 숙소가 표시
	         return "accommodation/accommodationlist"; // 예시: 숙소 목록 페이지로 이동
	     }

	     return "redirect:accommodation"; // 폼 페이지로 리디렉션합니다.
	 }
	 @RequestMapping("/board")
	 public String board() {
		 return "board";
	 }
	 
	 @RequestMapping("/review")
	 public String review() {
		 return "review";
	 }
	 @RequestMapping("/test")
	 public String test() {
		 return "test";
	 }
	}
	

