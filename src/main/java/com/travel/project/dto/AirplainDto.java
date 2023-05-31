package com.travel.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class AirplainDto {
	private int airnum; //항공번호 (기본키)
	private String airname; //항공사명
	private String airstart; //출발장소
	private String airend; //도착장소
	private String airstarttime; //출발시간
	private String airendtime; //도착시간
	private String airstartdate; //출발날짜
	private String airenddate; //도착날짜
	private int airsit; //좌석수
}
