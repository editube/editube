package com.editube.dao;

import com.editube.dto.MemberDto;

public interface MemberDao {

	//패스워드를 가져오는 메소드
	public String getPwd(String id);
	//로그인한 회원 정보를 가져오는 메소드
	public MemberDto getMemInfo(String id);
	//회원 가입 처리 메소드
	public void memberInsert(MemberDto member);
	//중복 ID 확인 메소드
	public int idCheck(String mid);
	//소셜 로그인 회원인증 관련 메소드
	public void authentication(MemberDto dto);
	public int nickCheck(String mnickname);
	public void typechange(String nick);
	public void typechangee(String nick);
	public MemberDto getMemInfoo(String nick);
}
