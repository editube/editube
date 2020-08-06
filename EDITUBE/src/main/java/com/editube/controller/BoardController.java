package com.editube.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.editube.dto.ChatbotDto;
import com.editube.dto.MemberDto;
import com.editube.dto.ReplyDto;
import com.editube.service.BoardService;
import com.editube.service.MemberService;

import lombok.extern.java.Log;

@Controller
@Log
public class BoardController {

	//서비스 객체
	@Autowired
	private BoardService bServ;
	
	@Autowired
	private MemberService mServ;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	//데이터 전달 객체
	ModelAndView mv;
	
	@GetMapping("timearry")
	public ModelAndView timearry(Integer pageNum, RedirectAttributes rttr) {
		logger.info("timearry()");

		//서비스에서 처리
		mv = bServ.timearry(pageNum);
		//rttr.addFlashAttribute("sort", "작성일순");

		return mv;
	}
	@GetMapping("deadarry")
	public ModelAndView deadarry(Integer pageNum) {
		logger.info("deadarry()");
		
		//서비스에서 처리
		mv = bServ.deadarry(pageNum);
		
		return mv;
	}

	@GetMapping("utcontent")
	public ModelAndView boardtContent(Integer ubnum) {
		log.info("UboardtContent - ubnum:" + ubnum);

		//DB에서 bnum(게시글 번호)에 해당하는 게시글
		//정보를 가져와서 model에 추가.
		mv = bServ.getUTContent(ubnum);

		return mv;
	}
	@GetMapping("udcontent")
	public ModelAndView boarddContent(Integer ubnum) {
		log.info("UboarddContent - ubnum:" + ubnum);
		
		//DB에서 bnum(게시글 번호)에 해당하는 게시글
		//정보를 가져와서 model에 추가.
		mv = bServ.getUDContent(ubnum);
		
		return mv;
	}
	@GetMapping("ucontent")
	public ModelAndView boardContent(Integer ubnum) {
		log.info("UboardContent - ubnum:" + ubnum);
		
		//DB에서 bnum(게시글 번호)에 해당하는 게시글
		//정보를 가져와서 model에 추가.
		mv = bServ.getUContent(ubnum);
		
		return mv;
	}

	@PostMapping("chating")
	public ModelAndView chating(ChatbotDto cDto,RedirectAttributes rttr) {
		mv = bServ.chatInsert(cDto,rttr);

		return mv;
	}
	
	@GetMapping("chating")
	public ModelAndView chating(String nick) {
		mv=bServ.getChat(nick);
		
		return mv;
	}
	
	@GetMapping("writeUFrm")
	public String writeFrm() {
		log.info("writeUFrm()");

		return "writeUFrm";
	}

	//writeFrm에서 들어온 데이터 처리 메소드
	//action uri는 "boardWrite"
	@PostMapping("uboardWrite")
	public String uboardWrite
	(MultipartHttpServletRequest multi, 
			RedirectAttributes rttr) {
		log.info("uboardWrite()");

		String view = bServ.uboardInsert(multi, rttr);
		
		return view;
	}

//	//댓글 추가 및 댓글 목록 처리 메소드
//	@PostMapping(value = "replyInsert",
//			produces = "application/json; charset=utf-8")
//	@ResponseBody
//	public Map<String, List<ReplyDto>> 
//	replyInsert(ReplyDto reply){
//		log.info("replyInsert - bnum : " 
//				+ reply.getR_cbnum());	
//
//		Map<String, List<ReplyDto>> rMap = 
//				bServ.rInsert(reply);
//
//		return rMap;
//	}

	//게시글 수정
	@GetMapping("updateUFrm")
	public ModelAndView updateUFrm(int ubnum, 
			RedirectAttributes rttr) {
		log.warning("글번호 : " + ubnum);
		mv = bServ.updateUFrm(ubnum, rttr);

		return mv;
	}
	
	@PostMapping("UboardUpdate")
	public String UboardUpdate
		(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		String view = bServ.UboardUpdate(multi, rttr);
		
		return view;
	}
	
	@GetMapping("udelete")
	public String deleteUBoard(int ubnum, RedirectAttributes rttr) {
		log.info("delete() - ubnum : " + ubnum);
		String view = bServ.deleteUBoard(ubnum, rttr); 
		return view;
	}

	
}//class end








