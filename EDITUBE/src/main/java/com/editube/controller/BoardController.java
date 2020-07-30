package com.editube.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.editube.service.BoardService;

import lombok.extern.java.Log;

@Controller
@Log
public class BoardController {
	
	@Autowired
	private BoardService bServ;
	
	ModelAndView mv;
	@GetMapping("commuBoard")
	public ModelAndView boardList(Integer pageNum) {
		mv= bServ.getCommuBoard(pageNum);
		return mv;
	}
	@GetMapping("commuContent")
	public ModelAndView commuContent(Integer cbnum) {
		mv=bServ.getContent(cbnum);
		return mv;
	}
	@GetMapping("writeCommuFrm")
	public String writeCommuFrm() {
		return "writeCommuFrm";
	}
	@PostMapping("writeCom")
	public String writeCom(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = bServ.boardInsert(multi, rttr);
		return view;
	}
}
