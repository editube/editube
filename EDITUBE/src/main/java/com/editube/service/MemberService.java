package com.editube.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.editube.controller.HomeController;
import com.editube.dao.MemberDao;
import com.editube.dto.MemberDto;
import com.editube.dto.RatingDto;
import com.editube.dto.RequestDto;
import com.editube.util.LoginUser;

import lombok.extern.java.Log;

@Service
@Log
public class MemberService {
	//로그인 처리에 필요한 요소들
	//  DAO 객체, 세션 객체, ModelAndView 객체
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mv;
	
	//로그인 처리용 메소드
	public ModelAndView loginProc(MemberDto member, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();//화면으로 데이터 전송.
		List<RequestDto> reqHList = null;
		LoginUser login = new LoginUser();
		
		String view = null;//이동할 jsp 이름 저장 변수.
		String msg = null;//화면에 출력할 메시지
		
		//DB에서 해당 id의 password 가져오기.
		String get_pw = mDao.getPassword(member.getM_id());
		
		BCryptPasswordEncoder pwdEncoder = 
				new BCryptPasswordEncoder();
		

		
		
		//로그인 처리			
		if(get_pw != null) {
			//아이디 있음.
			if(pwdEncoder.matches(member.getM_password(), get_pw)) {
				//패스워드 맞음. 로그인 성공.
				//세션에 로그인 성공한 회원 정보 저장
				//로그인 한 회원의 정보를 가져오기.
				member = mDao.getMemInfo(member.getM_id());
				if(member.getM_usertype()==1) {
					reqHList=mDao.getUReqList(member.getM_nickname());
				}
				else {
					reqHList=mDao.getEReqList(member.getM_nickname());
				}
				login.setUserId(member.getM_id());
				session.setAttribute("mb", member);
				session.setAttribute("reqHList", reqHList);
				//리다이렉트로 화면을 전환.
				view = "redirect:/";
			}
			else {
				//패스워드 틀림.
				view = "redirect:loginFrm";
				msg = "패스워드 틀림.";
			}
		}
		else {
			//아이디 없음.
			view = "redirect:loginFrm";
			msg = "아이디 없음.";
		}
		
		mv.setViewName(view);
		rttr.addFlashAttribute("msg", msg);
		return mv;
	}
	
	public ModelAndView memberInsert(MemberDto member, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;
		
		//비밀번호 암호화 처리
		//스프링 시큐리티는 암호화만 해줌.
		//복호화는 안해줌.
		BCryptPasswordEncoder pwdEncoder =
				new BCryptPasswordEncoder();
		
		//위의 인코더를 사용하여 평문 비밀번호를 
		//암호 비밀번호로 변경
		String encPwd = pwdEncoder.encode(member.getM_password());
		//암호화된 비밀번호를 member에 다시 저장
		member.setM_password(encPwd);
		
		try {
			//member의 데이터를 DB 저장(insert)
			mDao.memberInsert(member);
			//회원 등록 성공 -> 로그인 화면으로 전환
			view = "redirect:signWelFrm";
		} catch (Exception e) {
			// 회원 등록 실패 -> 같은 화면에 실패 메시지 전달
			//e.printStackTrace();
			view = "redirect:signPageFrm";
			rttr.addFlashAttribute("msg", "아이디 중복");
		}
		
		mv.setViewName(view);
		return mv;
	}	

	public String logout() {
		//세션 정보 지우기
		session.invalidate();
		
		return "main";
	}

	public String idCheck(String mid) {
		String result = null;
		
		try {
			//cnt : 중복 id가 있을 경우 1, 없을 경우 0
			int cnt = mDao.idCheck(mid);
			
			if(cnt == 1) {
				result = "fail";
			}
			else {
				result = "success";
			}
		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public String nickCheck(String mnickname) {
		String result = null;
		
		try {
			//cnt : 중복 id가 있을 경우 1, 없을 경우 0
			int cnt = mDao.nickCheck(mnickname);
			
			if(cnt == 1) {
				result = "fail";
			}
			else {
				result = "success";
			}
		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@Transactional
	public ModelAndView goReq(Integer bnum, String nick) {
		mv = new ModelAndView();
		RequestDto request = new RequestDto();
		MemberDto member = (MemberDto)session.getAttribute("mb");
		String view = null;
		
		request.setRq_mnickname(member.getM_id());
		request.setRq_status(member.getM_usertype());
		request.setRq_targetnickname(nick);
		request.setRq_bnum(bnum);
		
		if(member.getM_usertype()==1) {
			request.setRq_targetstatus(2);
			request.setRq_type(1);
		}
		else {
			request.setRq_targetstatus(1);
			request.setRq_type(2);
		}
		
		try {
				mDao.goReq(request);
				view= "redirect:utcontent?ubnum="+request.getRq_bnum();
		}catch (Exception e) {
			view= "redirect:utcontent?ubnum="+request.getRq_bnum();
		}
		
		mv.setViewName(view);
		return mv;
	}

	public ModelAndView getReqList(Integer status) {
		mv = new ModelAndView();
		RequestDto request = new RequestDto();
		List<RequestDto> reqList = null;
		MemberDto member = (MemberDto)session.getAttribute("mb");
		String nickname = member.getM_nickname();
		
		Map<String, String> lmap = 
				new HashMap<String, String>();
		lmap.put("nickname", String.valueOf(nickname));
		lmap.put("status", String.valueOf(status));
		
		if(status==null) {
			reqList = mDao.getAllReqList(nickname);
			for(int i=0; i<reqList.size();i++) {
				request=reqList.get(i);
				if(request.getRq_mnickname().equals(member.getM_nickname())) {
					InsertMsg(request.getRq_status());
					request.setRq_msg(request.getRq_targetnickname()+InsertMsg(request.getRq_status()));					
				}
				else {
					InsertMsg(request.getRq_targetstatus());
					request.setRq_msg(request.getRq_mnickname()+InsertMsg(request.getRq_targetstatus()));		
				}
			}
			mv.addObject("reqList", reqList);
		}
		else {		
			reqList = mDao.getReqList(lmap);
			for(int i=0; i<reqList.size();i++) {
				request=reqList.get(i); 
				if(request.getRq_mnickname().equals(member.getM_nickname())) {
					InsertMsg(request.getRq_status());
					request.setRq_msg(request.getRq_targetnickname()+InsertMsg(request.getRq_status()));					
				}
				else {
					InsertMsg(request.getRq_targetstatus());
					request.setRq_msg(request.getRq_mnickname()+InsertMsg(request.getRq_targetstatus()));		
				}
			}
			mv.addObject("reqList", reqList);
		}
		
		mv.setViewName("myEPageReqM");   
		
		return mv;   
	}
	
	public String InsertMsg(Integer num) {
		String msg =null;
		
		if(num==1) {
			msg="님이 거래를 요청했습니다.";
		}
		else if(num==2){
			msg="님에게 거래요청을 보냈습니다.";
		}				
		else if(num==3){
			msg="님과 거래중입니다.";
		}
		else if(num==4){
			msg="님의 완료요청을 대기중입니다.";
		}
		else if(num==5){
			msg="님의 완료요청이 도착했습니다.";
		}
		else if(num==6){
			msg="님과의 거래가 취소요청중 입니다.";
		}
		else if(num==7){
			msg="님과의 거래가 완료됬습니다.";
		}
		else if(num==8){
			msg="님과의 거래가 취소되었습니다.";	
		}
		return msg;
	}
	
	@Transactional
	public ModelAndView statusChange(Integer rnum, Integer myNum, String rtnick, Integer targetNum) {
		mv = new ModelAndView();
		RequestDto rDto = new RequestDto();
		String view = null;
		MemberDto mDto = (MemberDto)session.getAttribute("mb");
		
		rDto.setRq_targetnickname(rtnick);
		rDto.setRq_num(rnum);
		rDto.setRq_status(myNum);
		rDto.setRq_targetstatus(targetNum);
		
		try {
			mDao.statusChange(rDto);
			view= "redirect:myEPageReqM";
		} catch (Exception e) {
			view= "redirect:myEPageReqM";
		}
		
		mv.setViewName(view);
		return mv;
	}

	@Transactional
	public ModelAndView InsertRatFrm(RatingDto rating, RedirectAttributes rttr) {
		mv = new ModelAndView();
		RatingDto raDto = new RatingDto();
		String view = null;
		log.info("boardInsert - filecheck: " + 
			rating.getM_nickname()+
			rating.getRa_content()+
			rating.getRa_nickname()+
			rating.getRa_score()
		);
		
		try {
			mDao.InsertRatFrm(rating);
			view= "redirect:myEPageReqM";
		}catch (Exception e) {
			view="redirect:myEPageReqM";
		}
		
		mv.setViewName(view);
		return mv;
	}

	public ModelAndView getmDeal() {
		mv= new ModelAndView();
		List<RequestDto> rDto = null;
		
		try {
			rDto = mDao.getmDeal(6);
			mv.addObject("rMList",rDto);
		} catch (Exception e) {
			
		}
		
		
		
		mv.setViewName("mDeal");
		return mv;
	}
	
	
	@Transactional
	public void cancelOk(Integer rnum, Integer conNum) {
		//관리자 취소요청 메소드
		RequestDto rDto = new RequestDto();
	
		if(conNum==1) {
			//수락요청처리
			rDto.setRq_num(rnum);
			rDto.setRq_status(8);
			rDto.setRq_targetstatus(8);
		}else {
			//거절요청처리
			rDto.setRq_num(rnum);
			rDto.setRq_status(3);
			rDto.setRq_targetstatus(3);
		}
		
		try {
			mDao.statusChange(rDto);
		} catch (Exception e) {
			System.out.println("업데이트에 실패하였습니다.");
		}
	} //메소드끝


	

}
