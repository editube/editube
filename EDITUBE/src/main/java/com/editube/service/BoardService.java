package com.editube.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.editube.dto.MemberDto;
import com.editube.dto.ReplyDto;
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
	private int listCount = 5;
	private int pageCount = 2;

	//게시글 목록 가져오는 서비스 메소드
	public ModelAndView getUBoardList(Integer pageNum) {
		log.info("getUBoardList() - pageNum : " + pageNum);

		mv = new ModelAndView();

		int num = (pageNum == null) ? 1 : pageNum;

		//맵을 만들어서 페이지번호와 글목록 개수를 저장
		Map<String, String> lmap = 
				new HashMap<String, String>();
		lmap.put("pageNum", String.valueOf(num));
		lmap.put("cnt", String.valueOf(listCount));

		List<UBoardDto> ubList = bDao.getUList(lmap);

		mv.addObject("ubList", ubList);

		String paging = getUPaging(num);
		mv.addObject("paging", paging);

		//세션에 페이지 번호 저장.
		session.setAttribute("pageNum", num);

		//view name을 지정!
		mv.setViewName("youtuberBoard");

		return mv;
	}

	private String getUPaging(int num) {
		//전체 글 개수 구하기
		int maxNum = bDao.getUBoardCount();
		String listName = "list";//게시판 uri

		Paging paging = new Paging(maxNum, num, 
				listCount, pageCount, listName);

		String pagingHtml = paging.makePaging();

		return pagingHtml;
	}

	public ModelAndView getUContents(Integer ubnum) {
		mv = new ModelAndView();

		//조회수 증가.DB
		bDao.viewUpdate(ubnum);

		//게시글 번호로 글 내용 검색 결과 받아오기.(DB) 
		UBoardDto uboard = bDao.getUContents(ubnum);
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
		uboard.setUbtitle(title);
		uboard.setUbcontent(content);

		//insert, update, delete를 할 경우
		//웬만하면....... try/catch로 처리해 주세요...
		try {
			bDao.uboardInsert(uboard);

			view = "redirect:ucontents?ubnum=" + uboard.getUbnum();
			rttr.addFlashAttribute("check", 2);

		}catch (Exception e) {
			//DB 삽입 오류 시 글쓰기폼으로 돌아감.
			view = "redirect:writeUFrm";
			rttr.addFlashAttribute("check", 1);
		}

		return view;
	}	

	public Map<String, List<ReplyDto>> 
	rInsert(ReplyDto reply) {
		Map<String, List<ReplyDto>> rMap = null;

		try {
			//1. 넘어온 댓글 -> DB에 insert 처리
			bDao.replyInsert(reply);
			//2. 새로 추가된 댓글 포함 전체 댓글 목록 가져오기
			List<ReplyDto> rList = bDao.getReplyList
					(reply.getR_bnum());
			//3. 전체 댓글 목록을 rMap에 추가하여 반환
			rMap = new HashMap<String, List<ReplyDto>>();
			rMap.put("rList", rList);
		}catch (Exception e) {
			e.printStackTrace();
			rMap = null;
		}
		return rMap;
	}

	public ModelAndView updateFrm(int bnum, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		BoardDto board = bDao.getContents(bnum);
		MemberDto member = 
				(MemberDto)session.
				getAttribute("mb");
		String sId = member.getM_id();

		if(board.getBid().equals(sId)) {
			mv.addObject("board", board);
			List<BfileDto> bfList = bDao.getBfList(bnum);
			mv.addObject("bfList", bfList);
			view = "updateFrm";
		}
		else {
			view = "redirect:contents?bnum=" + bnum;
			rttr.addFlashAttribute("check", 1);
		}

		mv.setViewName(view);

		return mv;
	}

	@Transactional
	public String boardUpdate(MultipartHttpServletRequest multi, RedirectAttributes rttr) {

		int num = Integer.parseInt(multi.getParameter("bnum"));
		String title = 
				multi.getParameter("btitle");
		String contents = 
				multi.getParameter("bcontents");
		int fcheck = Integer.parseInt
				(multi.getParameter("fileCheck"));
		

		contents = contents.trim();
		//int check = Integer.parseInt(
		//		multi.getParameter("fileCheck"));

		String id = multi.getParameter("bid");
		log.info(title + "," + contents + ","
				+ id);

		BoardDto board = new BoardDto();
		board.setBnum(num);
		board.setBtitle(title);
		board.setBid(id);
		board.setBcontents(contents);

		String view = null;

		try {
			bDao.boardUpdate(board);

			if(fcheck == 1) {
				String fname = bDao.getFileName(num);
				sysFileDel(fname);
				
				fileChange(multi, num);
			if(bDao.getFileName(num) == null) {
				//업로드할 파일이 있음
				fileUp(multi, num);
			}
			}

			rttr.addFlashAttribute("check", 2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			rttr.addFlashAttribute("check", 3);
		}

		view = "redirect:contents?bnum=" 
				+ num;

		return view;
	}

}








