package com.editube.dao;

import java.util.List;
import java.util.Map;

import com.editube.dto.CashDto;
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
	
	public List<RequestDto> getUReqList(String m_nickname);
	
	public List<RequestDto> getEReqList(String m_nickname);
	//요청문
	public void goReq(RequestDto request);
	//관리자 관리 리스트 메소드
	public List<RequestDto> getmDeal(Integer num);
	
	//////////////캐시 관련 메소드들 //////////
	//캐시 충전 내역 추가 메소드ㅇ
	public void chargingList(CashDto cash);
	
	//캐시 전환 내역 추가 메소드ㅇ
	public void changemoney(CashDto cash);
	
	//전체 수입캐시 가져오는 메소드
	public Integer getTotalInCash(CashDto cash);
	
	//전체 지출캐시 가져오는 메소드
	public Integer getTotalOutCash(CashDto cash);
	
	//보유 캐시 업데이트 메소드
	public void countMyCash(CashDto cash);
	
	//캐시 내역 총 개수 구하는 메소드
	public int getCashCount();
	
	//캐시 내역 불러오는 메소드
	public List<CashDto> getCashList(Map<String, String> lmap);
	
	//캐시 내역 날짜 조회하는 메소드
	public List<CashDto> cashSearch(Map<String, String> lmap);
	
}
