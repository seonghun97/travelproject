package com.travel.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReservationDto {
	private int resnum; //숙박예약번호(기본키)
	private String checkindate; //체크인날짜
	private String checkoutdate;// 체크아웃날짜
	private int resprice; //숙박가격
	private String userid; //사용자아이디(외래키)
	private String accomcode; //숙소코드(외래키)
}
