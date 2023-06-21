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
import com.travel.project.dto.BoardAnswerDto;
import com.travel.project.dto.Criteria;
import com.travel.project.dto.PageDto;
import com.travel.project.dto.ReservationDto;
import com.travel.project.dto.ReviewDto;
import com.travel.project.dto.UserDto;


@Controller
public class TravelController<JSONArray> {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("/join")
	private String join() {
		return "join";
	}
	@RequestMapping (value="/login")
	 public String login() {
	    return "login";
	 }
	@RequestMapping (value="/test")
	 public String test() {
	    return "test";
	 }
	@RequestMapping(value ="/logout")
	public String logout(HttpSession session) {
		session.invalidate(); //세션 삭제 => logout
		
		return "redirect:index";
	}
	
	@RequestMapping ("/joinOk")
		public String joinOk(HttpServletRequest request, Model model) {
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		String username = request.getParameter("username");
		String userbirth = request.getParameter("userbirth");
		String useremail = request.getParameter("useremail");
		String usermobile = request.getParameter("usermobile");
		
		usermobile = usermobile.replaceAll("-", "");
		
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


	@PostMapping(value = "/loginOk")
	public String loginOk(HttpServletRequest request, HttpSession session) {
	    String userid = request.getParameter("userid");
	    String userpw = request.getParameter("userpw");

	    IDao dao = sqlsession.getMapper(IDao.class);

	    int checkIdPwFlag = dao.checkIdPwDao(userid, userpw);
	    // 1이면 성공, 0이면 실패
	    request.setAttribute("checkIdPwFlag", checkIdPwFlag);

	    if (checkIdPwFlag == 1) {
	        session.setAttribute("sessionId", userid);
	        request.setAttribute("UserDto", dao.getMemberInfo(userid));
	        return "redirect:/index"; 
	    } else {
	        return "loginOk";
	    }
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpServletRequest request, HttpSession session, Model model) {
	    session = request.getSession(false);
	    if (session == null || session.getAttribute("sessionId") == null) {
	        // 로그인 세션이 없으면 경고창을 띄우고 로그인 페이지로 이동
	        return "redirect:/login";
	    }
	    IDao dao = sqlsession.getMapper(IDao.class);
	    String userid = (String) session.getAttribute("sessionId");
	    
	    UserDto user = dao.getMemberInfo(userid);
	    
	    List<ReservationDto> reservationList = dao.reservationCheck(userid);
	    List<AccommodationDto> accommodationList = new ArrayList<>();
	    
	    model.addAttribute("reservationList", reservationList);
	    model.addAttribute("accommodationList", accommodationList);
	    model.addAttribute("user",user);
	    
	    return "mypage";
	}
	@GetMapping("/reserview")
	public String reserview(@RequestParam int resnum, HttpServletRequest request, HttpSession session, Model model) {
	    session = request.getSession(false);
	    if (session == null || session.getAttribute("sessionId") == null) {
	        // 로그인 세션이 없으면 경고창을 띄우고 로그인 페이지로 이동
	        return "redirect:/login";
	    }

	    IDao dao = sqlsession.getMapper(IDao.class);
	    String userid = (String) session.getAttribute("sessionId");
	    UserDto user = dao.getMemberInfo(userid);

	    List<ReservationDto> reservationList = dao.reservationCheck(userid);
	    List<AccommodationDto> accommodationList = new ArrayList<>();

	    for (ReservationDto reservationDto : reservationList) {
	        List<AccommodationDto> accommodationInfo = dao.accommodationInfo(reservationDto.getAccomcode());
	        accommodationList.addAll(accommodationInfo);
	    }

	    ReservationDto selectedReservation = null;
	    for (ReservationDto reservationDto : reservationList) {
	        if (reservationDto.getResnum() == resnum) {
	            selectedReservation = reservationDto;
	            break;
	        }
	    }

		 AccommodationDto accommodationDto = dao.accomviewDao(request.getParameter("accomcode"));

		model.addAttribute("accommodation", accommodationDto);
		model.addAttribute("user",user);
	    request.setAttribute("reservationList", reservationList);
	    request.setAttribute("accommodationList", accommodationList);
	    request.setAttribute("selectedReservation", selectedReservation);
	    

	    return "reserview";
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
	 @RequestMapping("/accommodationview")
	 public String accomoview(HttpServletRequest request, Model model) {
		 
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

	 
	@RequestMapping("/accomlistview")
	public String accomview(HttpServletRequest request, Model model) {

	    IDao dao = sqlsession.getMapper(IDao.class);

	    List<AccommodationDto> accommodationDto = dao.accomlistview(request.getParameter("pcode"));

	    model.addAttribute("accommodationDtos", accommodationDto); 

	    // 예약 날짜 가져오기
	    String fromDate = request.getParameter("fromDate");
	    String toDate = request.getParameter("toDate");
	    model.addAttribute("fromDate", fromDate);
	    model.addAttribute("toDate", toDate);

	    return "accommodation/accomlistview";
	}
	
	 @RequestMapping("/reservationOk")
	 public String reservation(HttpServletRequest request, HttpSession session, Model model) {
	     // 세션에서 로그인된 사용자의 아이디를 가져옴
	     String userid = (String) session.getAttribute("sessionId");

	     // accommodationView 페이지에서 전송된 파라미터를 가져옴
	     String checkindate = request.getParameter("fromDate");
	     String checkoutdate = request.getParameter("toDate");
	     String accomcode = request.getParameter("accomcode");
	     


	     if (userid == null || accomcode == null) {
	         // 로그인이 필요한 경우 경고 메시지 설정
	         model.addAttribute("error", "해당 시스템은 로그인이 필요한 시스템입니다.");
	         return "reservationError"; 
	     }

	     // 숙박 가격을 가져옴
	     String respriceParam = request.getParameter("resprice");
	     int resprice;
	     if (respriceParam != null && !respriceParam.isEmpty()) {
	         resprice = Integer.parseInt(respriceParam);
	     } else {
	         // 오류 처리
	         model.addAttribute("error", "가격에 오류가 있습니다.");
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
		@RequestMapping(value= "/deleteRes")
		public String deleteres(HttpServletRequest request) {
			
			IDao dao = sqlsession.getMapper(IDao.class);
			
			dao.resercancelDao(request.getParameter("resnum"));
			
			return "redirect:mypage";
			
			
		}
		@RequestMapping(value = "/userdel")
		public String userdel(HttpServletRequest request, HttpSession session) {
		    IDao dao = sqlsession.getMapper(IDao.class);
		    
		    String userid = request.getParameter("userid");
		    
		    // 예약 정보 확인
		    int reservationCount = dao.getReservationCount(userid);
		    
		    if (reservationCount > 0) {
		        // 예약 정보가 있을 경우 탈퇴 불가능 메시지 표시
		        return "deleteError";
		    } else {
		        // 리뷰 정보 삭제
		        dao.deleteReviewsByUser(userid);
		        
		        // 예약 정보가 없을 경우 회원 탈퇴 수행
		        dao.userdelDao(userid);
		        
		        // 세션 초기화
		        session.removeAttribute("userid");
		        session.invalidate();
		        
		        return "deletepage";
		    }
		}

		
		
		@RequestMapping(value = "/index")
		private String index(HttpServletRequest request, Model model) {

			
			IDao dao = sqlsession.getMapper(IDao.class);
			
			List<String> cityList = dao.getCityList();
	        model.addAttribute("cityList", cityList);
			
			return "index";
		}
		@RequestMapping(value = "/")
		private String home(HttpServletRequest request, Model model) {

			
			IDao dao = sqlsession.getMapper(IDao.class);
			
			List<String> cityList = dao.getCityList();
	        model.addAttribute("cityList", cityList);
			
			return "index";
		}
		@RequestMapping("/reviewWrite")
		 public String reviewWrite(HttpSession session) {
			 if (session == null || session.getAttribute("sessionId") == null) {
			        // 로그인 세션이 없으면 경고창을 띄우고 로그인 페이지로 이동
				 return "redirect:/login";
			 }else {
			 return "reviewWrite";}
		 }
	     @RequestMapping("/write")
	     public String writeForm(HttpServletRequest request, HttpSession session) {    
	       
	    	 String reviewsubject = request.getParameter("subject");
	    	 String reviewcontent = request.getParameter("content");
	    	 String userid = (String) session.getAttribute("sessionId");
	    	 IDao dao = sqlsession.getMapper(IDao.class);

	    	 dao.reviewDao(reviewsubject, reviewcontent, userid);
	    	 return "redirect:/review";
	 	    }
		 @RequestMapping(value = "/contentView")
			public String contentView(HttpServletRequest request, Model model) {
				
				IDao dao = sqlsession.getMapper(IDao.class);
				
				ReviewDto boardanswerDto = dao.contentreviewDao(request.getParameter("bnum"));
				
				model.addAttribute("boardanswerDto", boardanswerDto);
				
				return "contentView";
		 }
		 @RequestMapping(value="/review")
		 	public String review(Model model, HttpServletRequest request, Criteria criteria) {
			 IDao dao = sqlsession.getMapper(IDao.class);
			 int pageNum = 0;
			 
			 if(request.getParameter("pageNum") == null) {		
					pageNum = 1;
					criteria.setPageNum(pageNum);
				} else {
					pageNum = Integer.parseInt(request.getParameter("pageNum"));
					criteria.setPageNum(pageNum);
				}
			 int total = dao.totalreviewDao();
			 
			 PageDto pageDto = new PageDto(criteria, total);	
			 
			 
			 ArrayList<ReviewDto> dtos = dao.reviewList(criteria.getAmount(),pageNum); 

			 model.addAttribute("pageMaker", pageDto);
			 model.addAttribute("list",dtos);
			 model.addAttribute("total", total);
			 return "review";
		 }
		 @RequestMapping(value="/reviewWatch")
		 	public String reviewWatch(Model model, HttpServletRequest request, HttpSession session) {
			 IDao dao = sqlsession.getMapper(IDao.class);
			 String reviewnum = request.getParameter("reviewnum");
			 ReviewDto redto = dao.contentreviewDao(reviewnum);
			 dao.uphitDao(reviewnum);
			 
			 String sessionId = (String)session.getAttribute("sessionId");
			 
			 if(sessionId == null) {//로그인하지 않은 경우
					model.addAttribute("delCheck", "0");
				} else if(sessionId.equals(redto.getUserid())) { //로그인한 아이디와 글쓴아이디가 일치
					model.addAttribute("delCheck", "1");
				} else { //로그인한 아이디와 글쓴아이디가 일치하지 않은 경우
					model.addAttribute("delCheck", "0");
				}
			 
			 model.addAttribute("redto", redto);
			 
			 return "reviewWatch";
		 }
		 @RequestMapping(value = "/delete")
			public String delete(HttpServletRequest request) {
				
				
				IDao dao = sqlsession.getMapper(IDao.class);
				
				dao.deleteDao(request.getParameter("reviewnum"));
				
				return "redirect:review";
			}
		 @RequestMapping(value= "/edit")
		 	public String edit(HttpSession session, Model model) {
			 
			 IDao dao = sqlsession.getMapper(IDao.class);
			 String userid = (String) session.getAttribute("sessionId");
			    
			 UserDto user = dao.getMemberInfo(userid);
			 model.addAttribute("user",user);
			 return "edit";
		 }
		 @RequestMapping(value="/editMember")
		 public String editMember(HttpServletRequest request, Model model) {
		     String userid = request.getParameter("userid");
		     String userpw = request.getParameter("userpw");
		     String username = request.getParameter("username");
		     String userbirth = request.getParameter("userbirth");
		     String useremail = request.getParameter("useremail");
		     String usermobile = request.getParameter("usermobile");
		     
		     IDao dao = sqlsession.getMapper(IDao.class);
		     
		     dao.updateMember(userid, userpw, username, userbirth, useremail, usermobile);
		         
		     return "redirect:mypage";
		 }
}
	

