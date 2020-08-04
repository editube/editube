package com.editube.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	public void changepass(Map<String,Object> rmap);
	public void deleterp(String nk);
	public void fileInsert(Map<String, String> fmap);
	public void fileDelete(String nick);
	public MemberDto Idfind(Map<String,String> rmap);
	public MemberDto pwfind(String mid);
	public void pwch(HashMap<String, Object> rmap);
	public MemberDto getMemIn(String mr);
}
