package com.editube.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.editube.dto.MemberDto;
import com.editube.dto.memsearchDto;
import com.editube.service.MemberService;

import lombok.extern.java.Log;
@Log
@Controller
public class HomeController {

	@Inject //서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
	MemberService memberservice; //서비스를 호출하기 위해 의존성을 주입

	@Autowired
	private MemberService mServ;

	private ModelAndView mv;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@GetMapping("/")
	public String main() {
		logger.info("main()");

		return "main";
	}

	//로그인 화면 전환 메소드
	@GetMapping("loginFrm")
	public String loginFrm() {
		logger.info("loginFrm()");

		return "loginFrm";
	}

	@PostMapping("access")
	public ModelAndView accessProc(MemberDto member, 
			RedirectAttributes rttr) {
		logger.info("accessProc()");

		mv = mServ.loginProc(member, rttr);

		return mv;
	}

	@GetMapping("signPageFrm")
	public String signPageFrm() {
		return "signPageFrm";
	}

	@PostMapping("memInsert")
	public ModelAndView memInsert(MemberDto member,	RedirectAttributes rttr) {
		logger.info("memInsert()");

		//서비스에서 처리
		mv = mServ.memberInsert(member, rttr);

		return mv;
	}

	@GetMapping("signWelFrm")
	public String signWelFrm() {
		return "signWelFrm";
	}

	@GetMapping("comIdFrm")
	public String comIdFrm() {
		return "comIdFrm";
	}

	@GetMapping("findIdFrm")
	public String findIdFrm() {
		return "findIdFrm";
	}

	@GetMapping("youtuberBoard")
	public String youtuberBoard() {
		logger.info("youtuberBoard");
		return "youtuberBoard";
	}

	@GetMapping("commuBoard")
	public String commuBoard() {
		logger.info("commuBoard");
		return "commuBoard";
	}

	@GetMapping("commuContent")
	public String commuContent() {
		return "commuContent";
	}

	@GetMapping("editContent")
	public String editContent() {
		return "editContent";
	}

	@PostMapping("findIdMatch")
	public String findIdMatch(String name, String phonenum) {
		//String result = mServ.idFind(name, phonenum);

		return null;//result;
	}

	@GetMapping("findPwFrm")
	public String findPwFrm() {
		return "findPwFrm";
	}

	@GetMapping("rePwFrm")
	public String rePwFrm() {
		return "rePwFrm";
	}

	@GetMapping("comPwFrm")
	public String comPwFrm() {
		return "comPwFrm";
	}

	//글쓰기폼(나중에 post로 처리)
	@GetMapping("writeCommuFrm")
	public String writeCommuFrm() {
		return "writeCommuFrm";
	}

	//커뮤 글수정(나중에 post로 처리)
	@GetMapping("comUpFrm")
	public String comUpFrm() {
		return "comUpFrm";
	}

	//유튜버 글쓰기
	@GetMapping("youtuberWrite")
	public String youtuberWrite() {
		return "youtuberWrite";
	}
	
	//관리자 페이지 이동
	@GetMapping("mDeal")
	public String mDeal() {
		return "mDeal";
	}
	
	//관리자 회원관리
		@GetMapping("Member")
		public ModelAndView mMember() {
			ModelAndView mv=new ModelAndView();
			mv=mServ.mMember();
			return mv;
		}

	//편집자 게시판
	@GetMapping("editBoard")
	public String editBoard() {
		return "editBoard";
	}

	//로그아웃 처리
	@GetMapping("logout")
	public String logout() {
		//세션에 저장된 로그인 정보(회원 정보) 삭제
		//첫번째 페이지로 이동.
		String view = mServ.logout();
		return view;
	}

	@GetMapping("updateUFrm")
	public String updateUFrm() {
		return "updateUFrm";
	}

	@GetMapping("myInfo")
	public String myInfo() {
		return "myInfo";
	}

	@GetMapping("myInfoUp")
	public String myInfoUp() {
		return "myInfoUp";
	}

	//id 중복 체크 처리 메소드
	@GetMapping(value = "idCheck",
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String idCheck(String mid) {
		logger.info("idCheck() - mid : " + mid);

		String result = mServ.idCheck(mid);

		return result;
	}

	//닉네임 중복 체크 처리 메소드
	@GetMapping(value = "nickCheck",
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String nickCheck(String mnickname) {
		logger.info("nickCheck() - mnickname : " + mnickname);

		String result = mServ.nickCheck(mnickname);

		return result;
	}

	@GetMapping("typechangee")
	public ModelAndView typechangee(String nick,	RedirectAttributes rttr) {
		logger.info("typechangee()");

		//서비스에서 처리
		mv = mServ.typechangee(nick, rttr);

		return mv;
	}

	@GetMapping("typechange")
	public ModelAndView typechange(String nick,	RedirectAttributes rttr) {
		logger.info("typechange()");

		//서비스에서 처리
		mv = mServ.typechange(nick, rttr);

		return mv;
	}

	//mailSending 코드
	@PostMapping(value = "email" ,produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> mailSending(String email) throws IOException {
		Map<String, String> rmap = new HashMap<String, String>();
		rmap=mServ.sendmail(email);
		return rmap;
	}
	
	
	//계정 설정 비밀번호 인증
	@PostMapping(value = "Infopwcheck")
	public ModelAndView InfoCheck(MemberDto member,RedirectAttributes rttr) {
		ModelAndView mv = new ModelAndView();
		mv=mServ.InfoCh(member, rttr);
		return mv;
	}

	//계정 설정에서 비밀번호 변경
	@PostMapping("passcheck")
	public ModelAndView passcheck(String cpassword,RedirectAttributes rttr) {
		mv = new ModelAndView();//화면으로 데이터 전송.;
		System.out.println(cpassword);
		mv=mServ.passChange(cpassword,rttr);
		return mv;
	}

	//회원탈퇴
	@GetMapping("delete")
	public String delete(String nk,RedirectAttributes rttr) {
		String view=mServ.delete(nk,rttr);
		System.out.println(nk);

		return view;
	}
	//사진 수정
	@PostMapping(value = "fileup", produces="application/text; charset=utf-8")
	@ResponseBody
	public String fileup(MultipartHttpServletRequest multi) throws IllegalStateException, IOException{
		String view=mServ.fileup(multi);
		return view;
	}
	//사진 삭제
	@PostMapping(value = "filedel", produces="application/text; charset=utf-8")
	@ResponseBody
	public String filedel() {
		String view=mServ.filedel();
		return view;
	}

	//ID찾기
	@PostMapping("findId")
	public ModelAndView findId(String name, String phonenum,RedirectAttributes rttr) {
		mv=new ModelAndView();
		System.out.println(name);
		System.out.println(phonenum);
		mv = mServ.findId(name, phonenum,rttr);
		return mv;
	}

	//PW찾기
	@PostMapping("pwfind")
	public ModelAndView pwfind(String name, String mid,RedirectAttributes rttr) {
		mv=new ModelAndView();
		System.out.println(name);
		System.out.println(mid);
		mv = mServ.pwfind(name, mid,rttr);
		return mv;
	}

	//PW변경
	@PostMapping("pwch")
	public String pwch(String pw, String pwcheck,RedirectAttributes rttr) {
		String view=null;
		System.out.println(pw);
		System.out.println(pwcheck);
		view = mServ.pwch(pw, pwcheck,rttr);
		return view;
	}

	//아이디 찾기 후 비밀번호 찾기
	@GetMapping("fpw")
	public String fpw() {
		String view = mServ.fpw();
		return view;
	}

	//아이디 찾기 후 로그인
	@GetMapping("jo")
	public String jo() {
		//세션에 저장된 로그인 정보(회원 정보) 삭제
		//첫번째 페이지로 이동.
		String view = mServ.jo();
		return view;
	}
	
	@GetMapping("mdelete")
	public String mdelete(String m_nickname,RedirectAttributes rttr) {
		System.out.println(m_nickname);
		String view=mServ.mdelete(m_nickname,rttr);
		
		return view;
	}
	
	@GetMapping("dateSearch")
	   public ModelAndView dateSearch(memsearchDto memsea, MemberDto member) {
	      logger.info("dateSearch()");
	      //서비스에서 처리
	      mv = mServ.dateSearch(member,memsea);
	      
	      return mv;
	   }


}
