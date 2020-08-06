package com.editube.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.editube.dao.BoardDao;
import com.editube.dto.BfileDto;
import com.editube.dto.EBoardDto;
import com.editube.dto.UBoardDto;
import com.editube.dto.CBoardDto;
import com.editube.dto.ChatbotDto;
import com.editube.dto.MemberDto;
import com.editube.dto.ReplyDto;
import com.editube.dto.RequestDto;
import com.editube.util.Paging;

import lombok.extern.java.Log;

@Service
@Log
public class BoardService {
	//DAO 객체
	@Autowired
	private BoardDao bDao;

	//데이터 전달 객체 : ModelAndView
	ModelAndView mv;

	//세션
	@Autowired
	private HttpSession session;

	//페이지 당 글 개수 조정 변수
	private int listCount = 10;
	private int pageCount = 5;

	//게시글 목록 가져오는 서비스 메소드
	public ModelAndView timearry(Integer pageNum) {
		log.info("timearry() - pageNum : " + pageNum);
		mv = new ModelAndView();
		int num = (pageNum == null) ? 1 : pageNum;

		//맵을 만들어서 페이지번호와 글목록 개수를 저장
		Map<String, String> lmap = 
				new HashMap<String, String>();
		lmap.put("pageNum", String.valueOf(num));
		lmap.put("cnt", String.valueOf(listCount));

		List<UBoardDto> utList = bDao.getTList(lmap);

		mv.addObject("utList", utList);

		String paging = getUTPaging(num);
		mv.addObject("paging", paging);
		mv.addObject("sort", "작성일순");

		//세션에 페이지 번호 저장.
		session.setAttribute("pageNum", num);

		//view name을 지정!
		mv.setViewName("youtuberBoard");

		return mv;
	}
	public ModelAndView deadarry(Integer pageNum) {
		log.info("deadarry() - pageNum : " + pageNum);
		mv = new ModelAndView();
		int num = (pageNum == null) ? 1 : pageNum;
		
		//맵을 만들어서 페이지번호와 글목록 개수를 저장
		Map<String, String> lmap = 
				new HashMap<String, String>();
		lmap.put("pageNum", String.valueOf(num));
		lmap.put("cnt", String.valueOf(listCount));
		
		List<UBoardDto> udList = bDao.getDList(lmap);
		
		mv.addObject("udList", udList);
				
		String paging = getUDPaging(num);
		mv.addObject("paging", paging);
		mv.addObject("sort", "마감일순");
		
		//세션에 페이지 번호 저장.
		session.setAttribute("pageNum", num);
		
		//view name을 지정!
		mv.setViewName("youtuberBoard");
		
		return mv;
	}


	private String getUTPaging(int num) {
		//전체 글 개수 구하기
		int maxNum = bDao.getUTBoardCount();
		String listName = "timearry";//게시판 uri
		
		Paging paging = new Paging(maxNum, num, 
				listCount, pageCount, listName);
		
		String pagingHtml = paging.makePaging();
		
		return pagingHtml;
	}
	private String getUDPaging(int num) {
		//전체 글 개수 구하기
		int maxNum = bDao.getUDBoardCount();
		String listName = "deadarry";//게시판 uri
		
		Paging paging = new Paging(maxNum, num, 
				listCount, pageCount, listName);
		
		String pagingHtml = paging.makePaging();
		
		return pagingHtml;
	}

	public ModelAndView getUTContent(Integer ubnum) {
		mv = new ModelAndView();

		//조회수 증가.DB
		bDao.viewUpdate(ubnum);

		//게시글 번호로 글 내용 검색 결과 받아오기.(DB) 
		UBoardDto uboard = bDao.getUTContent(ubnum);
		RequestDto rDto = new RequestDto();
		rDto=bDao.chkReq(ubnum);
		
		if(rDto==null) {
			uboard.setChk(0);
		}else {
			uboard.setChk(1);
		}
		
		System.out.println("zzzzzzzzzzzzzz"+ubnum+uboard.getChk());
		
		mv.addObject("uboard", uboard);

		mv.setViewName("uContent");

		return mv;
	}
	public ModelAndView getUDContent(Integer ubnum) {
		mv = new ModelAndView();
		
		//조회수 증가.DB
		bDao.viewUpdate(ubnum);
		
		//게시글 번호로 글 내용 검색 결과 받아오기.(DB) 
		UBoardDto uboard = bDao.getUDContent(ubnum);
		mv.addObject("uboard", uboard);
		
		mv.setViewName("uContent");
		
		return mv;
	}

	public ModelAndView getUContent(Integer ubnum) {
		mv = new ModelAndView();
		//조회수 증가.DB
		bDao.viewUpdate(ubnum);
		
		//게시글 번호로 글 내용 검색 결과 받아오기.(DB) 
		UBoardDto uboard = bDao.getUContent(ubnum);
		RequestDto rDto = new RequestDto();
		rDto=bDao.chkReq(ubnum);
		
		if(rDto==null) {
			uboard.setChk(0);
		}else {
			uboard.setChk(1);
		}
		
		System.out.println("zzzzzzzzzzzzzz"+ubnum+uboard.getChk());
		
		mv.addObject("uboard", uboard);
		mv.setViewName("uContent");
		
		return mv;
	}
	//insert, update, delete 작업용 메소드는 
	//트랜잭션 처리가 필요
	@Transactional
	public String uboardInsert(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = null;

		//Multipart request에서 데이터 추출
		String title = multi.getParameter("ubtitle");
		String content = multi.getParameter("ubcontent");
		String nickname = multi.getParameter("ubnickname");
		String dateformat = multi.getParameter("ubdeadline");
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date deadline = null;
		try {
			deadline = fm.parse(dateformat);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String status = multi.getParameter("ubstatus");
		String positiontype = multi.getParameter("ubpositiontype");
		int cost = Integer.parseInt(multi.getParameter("ubcost"));
		String sysname = multi.getParameter("msysname");
		String oriname = multi.getParameter("moriname");
		
		/*//다음과 같이 세션에서 id값을 꺼내올 수도 있음.
		MemberDto mem = (MemberDto)session.getAttribute("mb");
		String id = mem.getM_id();
		 */

		//일반적으로 textarea에서 들어오는 데이터는
		//본 내용 앞 뒤에 쓸데없는 공백이 포함됨.
		//공백 제거 처리. trim()
		content = content.trim();

		UBoardDto uboard = new UBoardDto();
		uboard.setUbnickname(nickname);
		uboard.setUbcontent(content);
		uboard.setUbtitle(title);
		uboard.setUbdeadline(deadline);
		uboard.setUbstatus(status);
		uboard.setUbpositiontype(positiontype);
		uboard.setUbcost(cost);
		uboard.setMsysname(sysname);
		uboard.setMoriname(oriname);

		//insert, update, delete를 할 경우
		//웬만하면....... try/catch로 처리해 주세요...
		try {
			bDao.uboardInsert(uboard);

			view = "redirect:ucontent?ubnum=" + uboard.getUbnum();
			rttr.addFlashAttribute("check", 2);

		}catch (Exception e) {
			//DB 삽입 오류 시 글쓰기폼으로 돌아감.
			view = "redirect:writeUFrm";
			rttr.addFlashAttribute("check", 1);
		}

		return view;
	}	

//	public Map<String, List<ReplyDto>> 
//	rInsert(ReplyDto reply) {
//		Map<String, List<ReplyDto>> rMap = null;
//
//		try {
//			//1. 넘어온 댓글 -> DB에 insert 처리
//			bDao.replyInsert(reply);
//			//2. 새로 추가된 댓글 포함 전체 댓글 목록 가져오기
//			List<ReplyDto> rList = bDao.getReplyList
//					(reply.getR_bnum());
//			//3. 전체 댓글 목록을 rMap에 추가하여 반환
//			rMap = new HashMap<String, List<ReplyDto>>();
//			rMap.put("rList", rList);
//		}catch (Exception e) {
//			e.printStackTrace();
//			rMap = null;
//		}
//		return rMap;
//	}

	public ModelAndView updateUFrm(int bnum, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		UBoardDto board = bDao.getUContent(bnum);
		MemberDto member = 
				(MemberDto)session.
				getAttribute("mb");
		String sNickname = member.getM_nickname();

		if(board.getUbnickname().equals(sNickname)) {
			mv.addObject("board", board);
			view = "updateUFrm";
		}
		else {
			view = "redirect:ucontent?bnum=" + bnum;
			rttr.addFlashAttribute("check", 1);
		}

		mv.setViewName(view);

		return mv;
	}

	@Transactional
	public String UboardUpdate(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		int num = Integer.parseInt(multi.getParameter("ubnum"));
		String title = multi.getParameter("ubtitle");
		String content = multi.getParameter("ubcontent");
		String dateformat = multi.getParameter("ubdeadline");
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date deadline = null;
		try {
			deadline = fm.parse(dateformat);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String status = multi.getParameter("ubstatus");
		String positiontype = multi.getParameter("ubpositiontype");
		int cost = Integer.parseInt(multi.getParameter("ubcost"));
		String sysname = multi.getParameter("msysname");
		String oriname = multi.getParameter("moriname");

		content = content.trim();
		//int check = Integer.parseInt(
		//		multi.getParameter("fileCheck"));

		UBoardDto uboard = new UBoardDto();
		uboard.setUbnum(num);
		uboard.setUbcontent(content);
		uboard.setUbtitle(title);
		uboard.setUbdeadline(deadline);
		uboard.setUbstatus(status);
		uboard.setUbpositiontype(positiontype);
		uboard.setUbcost(cost);
		uboard.setMsysname(sysname);
		uboard.setMoriname(oriname);

		String view = null;

		try {
			bDao.boardUpdate(uboard);
			rttr.addFlashAttribute("check", 2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			rttr.addFlashAttribute("check", 3);
		}

		view = "redirect:utcontent?ubnum=" 
				+ num;

		return view;
	}
	
	@Transactional
	public String deleteUBoard(int ubnum, RedirectAttributes rttr) {
		String view = null;

		try {
			// 원글 삭제
			bDao.boardUDelete(ubnum);

			view = "redirect:timearry";
			rttr.addFlashAttribute("check", 3);
		}catch(Exception e) {
			view = "redirect:ucontent?ubnum=" + ubnum;
			rttr.addFlashAttribute("check", 4);
		}

		return view;
	}

	public ModelAndView getChat(String nick) {
		mv = new ModelAndView();
		session.setAttribute("nick",nick);
		MemberDto member = (MemberDto)session.getAttribute("mb");
		List<ChatbotDto> cList = null;
		
		Map<String, String> lmap = 
				new HashMap<String, String>();
		lmap.put("nickname", String.valueOf(member.getM_nickname()));
		lmap.put("targetnickname", String.valueOf(nick));
		
		try {
			cList=bDao.getCList(lmap);
			mv.addObject("cList", cList);
		} catch (Exception e) {
			
		}
		mv.setViewName("chating");
		
		return mv;
	}
	
	@Transactional
	public ModelAndView chatInsert(ChatbotDto cDto, RedirectAttributes rttr) {
		mv = new ModelAndView();
		MemberDto member = (MemberDto)session.getAttribute("mb");
		List<ChatbotDto> cList = null;
		cDto.setCh_mnickname(member.getM_nickname());
		System.out.println(cDto);
		
		Map<String, String> lmap = 
				new HashMap<String, String>();
		lmap.put("nickname", String.valueOf(member.getM_nickname()));
		lmap.put("targetnickname", String.valueOf(cDto.getCh_targetnickname()));
		
		try {
			bDao.chatInsert(cDto);
			cList=bDao.getCList(lmap);
			mv.addObject("cList", cList);
		} catch (Exception e) {
			
		}
		mv.setViewName("chating");
		
		return mv;
	}


}








