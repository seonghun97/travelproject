package com.travel.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class AnswerDto {

	private int boardnum; // 문의글 번호(기본키)
	private String boardsubject; //글제목
	private String boardcontent; //글내용
	private String boarddate; //글 쓴 날짜
	private String userid; //사용자아이디
}
