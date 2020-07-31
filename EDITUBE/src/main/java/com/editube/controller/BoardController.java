package com.editube.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	//데이터 전달 객체
	ModelAndView mv;

	//이 메소드는 나중에 BoardController로 이전할 예정임.
	@GetMapping("ulist")//list?pageNum=3
	public ModelAndView UboardList(Integer pageNum) {
		log.info("UboardList()");

		mv = bServ.getUBoardList(pageNum);		

		return mv;
	}

	@GetMapping("ucontents")
	public ModelAndView boardContents(Integer ubnum) {
		log.info("UboardContents - ubnum:" + ubnum);

		//DB에서 bnum(게시글 번호)에 해당하는 게시글
		//정보를 가져와서 model에 추가.
		mv = bServ.getUContents(ubnum);

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

	//댓글 추가 및 댓글 목록 처리 메소드
	@PostMapping(value = "replyInsert",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<ReplyDto>> 
	replyInsert(ReplyDto reply){
		log.info("replyInsert - bnum : " 
				+ reply.getR_cbnum());	

		Map<String, List<ReplyDto>> rMap = 
				bServ.rInsert(reply);

		return rMap;
	}

	//게시글 수정
	@GetMapping("updateFrm")
	public ModelAndView updateFrm(int bnum, 
			RedirectAttributes rttr) {
		log.warning("글번호 : " + bnum);
		mv = bServ.updateFrm(bnum, rttr);

		return mv;
	}
	
	@PostMapping("boardUpdate")
	public String boardUpdate
		(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		String view = bServ.boardUpdate(multi, rttr);
		
		return view;
	}
	
	
}//class end








