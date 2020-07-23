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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.editube.dto.MemberDto;
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

	@GetMapping("signPageFrm")
	public String signPageFrm() {
		return "signPageFrm";
	}

	@PostMapping("memInsert")
	public ModelAndView memInsert(MemberDto member,
			RedirectAttributes rttr) {
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
	
	
	@PostMapping("findIdMatch")
	public String findIdMatch(String name, String phonenum) {
		String result = mServ.idFind(mname, mphonenum);
		
		return result;
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
	
}
