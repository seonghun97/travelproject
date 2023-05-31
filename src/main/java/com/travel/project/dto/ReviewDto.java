package com.travel.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDto {

	private int reviewnum; //후기번호 (기본키)
	private String reviewsubject; //후기제목
	private String reviewcontent; //후기내용
	private String reviewpic; //사진
	private String reviewdate; //후기쓴날짜
	private int hit; //조회수 
}
