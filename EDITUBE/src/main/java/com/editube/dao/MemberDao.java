package com.editube.dao;

import java.util.List;
import java.util.Map;

import com.editube.dto.MemberDto;
import com.editube.dto.RatingDto;
import com.editube.dto.RequestDto;

public interface MemberDao {

	//패스워드를 가져오는 메소드
	public String getPassword(String id);
	//로그인한 회원 정보를 가져오는 메소드
	public MemberDto getMemInfo(String id);
	//회원 가입 처리 메소드
	public void memberInsert(MemberDto member);
	//중복 ID 확인 메소드
	public int idCheck(String mid);
	//중복 nickname 확인 메소드
	public int nickCheck(String mnickname);
	//마이페이지 요청관리(전체메뉴)
	public List<RequestDto> getAllReqList(String nickname);
	//마이페이지 요청관리(서브메뉴)
	public List<RequestDto> getReqList(Map<String, String> lmap);
	//마이페이지 요청버튼관리
	public void statusChange(RequestDto rDto);
	//평점등록하기
	public void InsertRatFrm(RatingDto raDto);
}
