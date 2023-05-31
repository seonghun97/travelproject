package com.travel.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardAnswerDto {
	
	private int answernum; //댓글번호 기본키
	private String answercontent; //댓글내용
	private String answerdate; //댓글쓴날짜
	private String userid; //사용자아이디
	private int boardnum; // 게시글 번호 (외래키)
}
