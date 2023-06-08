package com.travel.project.controller;

import java.io.IOException;
import java.lang.StackWalker.Option;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
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
import com.travel.project.dto.AccommodationDto;
import com.travel.project.dto.ReservationDto;


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
	public String mypage(HttpServletRequest request, HttpSession session, Model model) {
	    session = request.getSession(false);
	    if (session == null || session.getAttribute("sessionId") == null) {
	        // 로그인 세션이 없으면 경고창을 띄우고 로그인 페이지로 이동
	        return "redirect:/login";
	    }
	    // 로그인 세션이 있는 경우 문의게시판 페이지로 이동
	    IDao dao = sqlsession.getMapper(IDao.class);
	    
	    String userid = (String) session.getAttribute("sessionId");
	    
	    ReservationDto reservationDto = dao.reservationCheck(userid);
	    AccommodationDto accommodationDto = dao.accommodationInfo(reservationDto.getAccomcode());
	    
	    model.addAttribute("reservationDto", reservationDto);
	    model.addAttribute("accommodationDto", accommodationDto);
	    
	    return "mypage";
	}
	@RequestMapping(value = "/AccommodationForm")
	public String accform(Model model, HttpServletRequest request, HttpSession session) {

	    String cityname = request.getParameter("city");
	    String fromDate = request.getParameter("fromDate");
	    String toDate = request.getParameter("toDate");

	    IDao dao = sqlsession.getMapper(IDao.class);

	    List<AccommodationDto> accommodationDtos = dao.accomcityListDao(cityname);

	    model.addAttribute("accommodationDtos", accommodationDtos);
	    model.addAttribute("fromDate", fromDate);
	    model.addAttribute("toDate", toDate);

	    return "accommodation/accommodationlist";
	}

	 @PostMapping("/AirplaneForm")
	 	public String airform() {
		 return "airplane/airplanelist";
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
	 
	 @RequestMapping("/accommodationview")
	 public String accomview(HttpServletRequest request, Model model) {
		 
		 IDao dao = sqlsession.getMapper(IDao.class);

		 AccommodationDto accommodationDto = dao.accomviewDao(request.getParameter("accomcode"));

		 model.addAttribute("accommodation", accommodationDto);

		 // 예약 날짜 가져오기
		 String fromDate = request.getParameter("fromDate");
		 String toDate = request.getParameter("toDate");
		 model.addAttribute("fromDate", fromDate);
		 model.addAttribute("toDate", toDate);

		 return "accommodation/accommodationview";
	 }
	
	 @RequestMapping("/reservationOk")
	 public String reservation(HttpServletRequest request, HttpSession session, Model model) {
	     // 세션에서 로그인된 사용자의 아이디를 가져옴
	     String userid = (String) session.getAttribute("sessionId");

	     // accommodationView 페이지에서 전송된 파라미터를 가져옴
	     String checkindate = request.getParameter("fromDate");
	     String checkoutdate = request.getParameter("toDate");
	     String accomcode = request.getParameter("accomcode");

	     if (checkindate == null || checkindate.isEmpty() || checkoutdate == null || checkoutdate.isEmpty()) {
	         // 오류 메시지 설정
	         model.addAttribute("error", "체크인 날짜와 체크아웃 날짜를 선택해주세요.");
	         return "reservationError";
	     }
	      
	     if (userid == null || accomcode == null) {
	         // 오류 메시지 설정
	         model.addAttribute("error", "사용자 정보나 숙박 정보가 올바르지 않습니다.");
	         return "reservationError";
	     }

	     // 숙박 가격을 가져옴
	     String respriceParam = request.getParameter("resprice");
	     int resprice;
	     if (respriceParam != null && !respriceParam.isEmpty()) {
	         resprice = Integer.parseInt(respriceParam);
	     } else {
	         // 오류 처리
	         model.addAttribute("error", "숙박 가격을 선택해주세요.");
	         return "reservationError";
	     }
	     
	     // 체크인 날짜와 체크아웃 날짜 사이의 일수 계산
	     LocalDate fromDate = LocalDate.parse(checkindate);
	     LocalDate toDate = LocalDate.parse(checkoutdate);
	     int nights = (int) ChronoUnit.DAYS.between(fromDate, toDate);

	     // 예약 가격 계산
	     int totalprice = resprice * nights;
	     
	     IDao dao = sqlsession.getMapper(IDao.class);
	     dao.reservationDao(checkindate, checkoutdate, totalprice, userid, accomcode); // resnum 값을 받아옴

	     model.addAttribute("fromDate", checkindate);
	     model.addAttribute("toDate", checkoutdate);
	     model.addAttribute("resprice", totalprice);

	     return "reservationOk";
	 }
}
	

