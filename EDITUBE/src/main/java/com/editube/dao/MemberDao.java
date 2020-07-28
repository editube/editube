package com.editube.dao;

import java.util.Map;

import com.editube.dto.MemberDto;

public interface MemberDao {

	//패스워드를 가져오는 메소드
	public String getPassword(String id);
	//로그인한 회원 정보를 가져오는 메소드
	public MemberDto getMemInfo(String id);
	public MemberDto getMemInfoo(String nick);
	//회원 가입 처리 메소드
	public void memberInsert(MemberDto member);
	//중복 ID 확인 메소드
	public int idCheck(String mid);
	//중복 nickname 확인 메소드
	public int nickCheck(String mnickname);
	
	public void typechange(String nick);
	public void typechangee(String nick);
}
