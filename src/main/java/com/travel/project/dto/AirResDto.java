package com.travel.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AirResDto {
	private String userid; // 유저아이디(외래키)
	private int airseq; //항공번호(외래키)
	private String airresdate; //예약한시간
	
}
