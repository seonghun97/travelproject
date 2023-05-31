package com.travel.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewAnswerDto {
	private int reviewanswernum; //후기댓글번호 (기본키)
	private String reviewanswer; //후기댓글
	private String reviewdate;//후기날짜
	private String userid; //사용자아이디
	private int reviewnum; //후기번호 (외래키)

}
 