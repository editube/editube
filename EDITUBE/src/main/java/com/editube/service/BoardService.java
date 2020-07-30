package com.editube.service;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.editube.dao.BoardDao;
import com.editube.dto.BoardDto;
import com.editube.util.Paging;

import lombok.extern.java.Log;

@Service
@Log
public class BoardService {
	@Autowired
	private BoardDao cbDao;
	
	ModelAndView mv;
	
	@Autowired
	private HttpSession session;
	
	private int listCount=10;
	private int pageCount=5;
	
	public ModelAndView getCommuBoard(Integer pageNum) {
		log.info("getCommuBoard()-pageNum: "+pageNum);
		mv=new ModelAndView();
		
		int num=(pageNum==null) ?1: pageNum;
		Map<String, String> lmap=new HashMap<String, String>();
		lmap.put("pageNum", String.valueOf(num));
		lmap.put("cnt", String.valueOf(listCount));
		List<BoardDto> cbList=cbDao.getList(lmap);
		
		mv.addObject("cbList", cbList);
		
		String paging = getPaging(num);
		mv.addObject("paging", paging);
		session.setAttribute("pageNum", num);
		mv.setViewName("commuBoard");
		return mv;
	}

	private String getPaging(int num) {
		int maxNum =cbDao.getBoardCount();
		String listName="list";
		Paging paging = new Paging(maxNum, num, listCount, pageCount, listName);
		String pagingHtml = paging.makePaging();
		
		return pagingHtml;
	}
	public ModelAndView getContent(Integer cbnum) {
		mv= new ModelAndView();
		
		BoardDto board = cbDao.getContent(cbnum);
		mv.addObject("board", board);
		mv.setViewName("commuContent");
		return mv;
	}
	@Transactional
	public String boardInsert(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view =null;
		String title =multi.getParameter("cbtitle");
		String content = multi.getParameter("cbcontent");
		String nickname= multi.getParameter("cbnickname");
		content=content.trim();
		BoardDto board =new BoardDto();
		board.setCbnickname(nickname);
		board.setCbtitle(title);
		board.setCbcontent(content);
		
		try {
			cbDao.boardInsert(board);
			view="redirect:commuContent";
		}catch(Exception e){
			view="redirect:writeCommuFrm";
		}
		return view;
	}
	public ModelAndView getCon(Integer cbnum) {
		mv= new ModelAndView();
		BoardDto board =cbDao.getContent(cbnum);
		mv.addObject("baord", board);
		mv.setViewName("upCommuFrm");
		return mv;
	}
}
