package com.travel.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccommodationDto {
	private String accomcode; //숙소코드(기본키)
	private String accomname; //숙소이름
	private String accompic; //숙소사진
	private String accomdes; //상세내용
	private String accomlocation; //숙소위치
	private String accomnotice; //숙소공지
	private String cityname; //도시이름
	private String roomname;// 방번호
	private int accomprice;//가격
	private String pcode; //부모코드
	
}
