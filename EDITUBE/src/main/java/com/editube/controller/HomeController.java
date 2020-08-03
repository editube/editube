package com.editube.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.editube.dto.RatingDto;
import com.editube.service.MemberService;

@Controller
public class HomeController {

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
	
	@GetMapping("uContent")
	public String uContent() {
		return "uContent";
	}
	
	@GetMapping("myUPageCash")
	public String myUPageCash() {
		return "myUPageCash";
	}
	
	@GetMapping("editContent")
	public String editContent() {
		return "editContent";
	}
	@GetMapping("myUPageReqM")
	public String myUPageReqM() {
		return "myUPageReqM";
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
	
	
	@GetMapping("comIdFrm")
	public String comIdFrm() {
		return "comIdFrm";
	}
	
	@GetMapping("findIdFrm")
	public String findIdFrm() {
		return "findIdFrm";
	}
	@GetMapping("upPortfolio")
	public String upPortfolio() {
		return "upPortfolio";
	}
	
	
//	@PostMapping("findIdMatch")
//	public String findIdMatch(String name, String phonenum) {
//		String result = mServ.idFind(mname, mphonenum);
//		
//		return result;
//	}
	
	@GetMapping("InsertRatFrm")
	public ModelAndView InsertRatFrm(RatingDto rating, RedirectAttributes rttr) {
		
		mv = mServ.InsertRatFrm(rating, rttr);
		
		return mv;
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
	@GetMapping("signWelFrm")
	public String signWelFrm() {
		return "signWelFrm";
	}
	
	@GetMapping("myInfo")
	public String myInfo() {

		return "myInfo";
	}

	@GetMapping("myUPageSc")
	public String myUPageSc() {
		
		return "myUPageSc";
	}
	@GetMapping("doubleBoard")
	public String doubleBoard() {
		
		return "doubleBoard";
	}
	@GetMapping("youtuberBoard")
	public String youtuberBoard() {
		
		return "youtuberBoard";
	}
	@GetMapping("commuBoard")
	public String commuBoard() {
		
		return "commuBoard";
	}
	@GetMapping("commuContent")
	public String commuContent() {
		
		return "commuContent";
	}
	@GetMapping("writeCommuFrm")
	public String writeCommuFrm() {
		
		return "writeCommuFrm";
	}
	@GetMapping("writecom")
	public String writecom() {
		
		return "writecom";
	}
	@GetMapping("commuNav")
	public String commuNav() {
		
		return "commuNav";
	}
	@GetMapping("editBoard")
	public String editBoard() {
		
		return "editBoard";
	}
	
	
	@GetMapping("myEPage")
	public String myEPage() {
		
		return "myEPage";
	}
	@GetMapping("myEPageCash")
	public String myEPageCash() {
		
		return "myEPageCash";
	}
	@GetMapping("myEPagePf")
	public String myEPagePf() {
		
		return "myEPagePf";
	}
	
	@GetMapping("statusChange")
	public ModelAndView statusChange(Integer rnum, Integer myNum, String rtnick, Integer targetNum) {
		mv=mServ.statusChange(rnum, myNum, rtnick, targetNum);
		
		return mv;
	}
	
	@GetMapping("myEPageReqM")
	public ModelAndView myEPageReqM(Integer status) {
		mv=mServ.getReqList(status);
		
		return mv;
	}
	
	@GetMapping("myEPageSc")
	public String myEPageSc() {
		
		return "myEPageSc";
	}

	//로그아웃 처리
	@GetMapping("logout")
	public String logout() {
		//세션에 저장된 로그인 정보(회원 정보) 삭제
		//첫번째 페이지로 이동.
		String view = mServ.logout();
		return view;
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
	
}
