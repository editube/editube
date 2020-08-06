package com.editube.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.editube.dao.MemberDao;
import com.editube.dto.MemberDto;
import com.editube.dto.memsearchDto;

@Service
public class MemberService {
	//로그인 처리에 필요한 요소들
	//  DAO 객체, 세션 객체, ModelAndView 객체
	@Inject //서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
	MemberService memberservice; //서비스를 호출하기 위해 의존성을 주입
	@Autowired
	private MemberDao mDao;

	@Autowired
	private HttpSession session;

	private ModelAndView mv;

	//로그인 처리용 메소드
	public ModelAndView loginProc(MemberDto member, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();//화면으로 데이터 전송.

		String view = null;//이동할 jsp 이름 저장 변수.
		String msg = null;//화면에 출력할 메시지

		//DB에서 해당 id의 password 가져오기.
		String get_pw = mDao.getPwd(member.getM_id());

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
				session.setAttribute("mb", member);

				//리다이렉트로 화면을 전환.
				view = "redirect:/";//list는 uri.
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

	public ModelAndView typechange(String nick, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		try {
			//member의 데이터를 DB 저장(insert)
			mDao.typechange(nick);

			//MemberDto member = new MemberDto();
			MemberDto member = (MemberDto)session.getAttribute("mb");
			member.setM_usertype(2);

			//member = mDao.getMemInfoo(nick);
			session.setAttribute("mb", member);

			//회원 등록 성공 -> 로그인 화면으로 전환
			view = "redirect:myEPageSc";
		} catch (Exception e) {
			// 회원 등록 실패 -> 같은 화면에 실패 메시지 전달
			//e.printStackTrace();
			view = "redirect:myUPageSc";
		}

		mv.setViewName(view);
		return mv;
	}

	public ModelAndView typechangee(String nick, RedirectAttributes rttr) {
		mv = new ModelAndView();
		String view = null;

		try {
			//member의 데이터를 DB 저장(insert)
			mDao.typechangee(nick);

			MemberDto member = mDao.getMemInfoo(nick);
			session.setAttribute("mb", member);

			//회원 등록 성공 -> 로그인 화면으로 전환
			view = "redirect:myUPageSc";
		} catch (Exception e) {
			// 회원 등록 실패 -> 같은 화면에 실패 메시지 전달
			//e.printStackTrace();
			view = "redirect:myEPageSc";
		}

		mv.setViewName(view);
		return mv;
	}

	public ModelAndView InfoCh(MemberDto member,RedirectAttributes rttr) {

		mv = new ModelAndView();//화면으로 데이터 전송.
		String msg = null;//화면에 출력할 메시지
		String view = null;//이동할 jsp 이름 저장 변수.
		//세션 정보 가져오기
		MemberDto m = (MemberDto)session.getAttribute("mb");

		String get_pw = mDao.getPwd(m.getM_id());
		BCryptPasswordEncoder pwdEncoder = 
				new BCryptPasswordEncoder();
		if(pwdEncoder.matches(member.getM_password(), get_pw)){

			//리다이렉트로 화면을 전환.
			view = "redirect:myInfoUp";
			rttr.addFlashAttribute("msg", "비밀번호가 일치합니다.");
		}else {
			//패스워드 틀림.
			view = "redirect:myInfo";
			rttr.addFlashAttribute("msg", "패스워드 틀림.");
		}
		mv.setViewName(view);
		return mv;
	}

	public ModelAndView passChange(String cpassword,RedirectAttributes rttr) {
		mv = new ModelAndView();//화면으로 데이터 전송.
		String msg=null;
		String view=null;
		System.out.println("비밀번호"+cpassword);
		if(cpassword==""){
			System.out.println("비밀번호 없음");
			view="redirect:/";
			rttr.addFlashAttribute("msg", "성공적으로 저장하였습니다.");
		}
		else {
			System.out.println("비밀번호 있음");
		BCryptPasswordEncoder pwdEncoder =
				new BCryptPasswordEncoder();

		//위의 인코더를 사용하여 평문 비밀번호를 
		//암호 비밀번호로 변경

		MemberDto m = (MemberDto)session.getAttribute("mb");

		String encPwd = pwdEncoder.encode(cpassword);

		HashMap<String,Object> rmap=new HashMap<>();
		rmap.put("cpassword", encPwd);
		System.out.println(cpassword);
		rmap.put("m", m.getM_id());
		System.out.println(m.getM_id());
		try {
			mDao.changepass(rmap);
			//리다이렉트로 화면을 전환.
			view = "redirect:/";
			rttr.addFlashAttribute("msg", "비밀번호를 성공적으로 변경하였습니다.");
		}catch(Exception e){
			e.printStackTrace();
			view = "redirect:/myInfoUp";
			rttr.addFlashAttribute("msg", "비밀번호 변경을 실패하였습니다.");
		}
		}
		mv.setViewName(view);
		return mv;

	}

	public String delete(String nk, RedirectAttributes rttr) {
		String msg=null;
		String view=null;

		try {
			mDao.deleterp(nk);
			session.invalidate();
			view="redirect:/";
			rttr.addFlashAttribute("msg","탈퇴를 성공적으로 하였습니다.");


		}catch (Exception e) {
			// DB삽입
			e.printStackTrace();
			view="redirect:myInfoUp";
			rttr.addFlashAttribute("msg","탈퇴를 실패하였습니다.");
		}

		return view;

	}

	public String fileup(MultipartHttpServletRequest multi) throws IllegalStateException, IOException {
		MemberDto member=new MemberDto();
		Map<String,String> fmap=new HashMap<String,String>();
		MemberDto m = (MemberDto)session.getAttribute("mb");
		String mr = m.getM_id();
		//파일 정보 저장(DB)에 필요한 정보
		//1. 게시글 번호, 2.실제파일명, 3. 저장파일명
		fmap.put("m",m.getM_id());
		List<MultipartFile> fList = multi.getFiles("file");
		String view=null;
		String filePath=multi.getSession()
				.getServletContext()
				.getRealPath("/")+"resources/images/";
		String sysName=null;
		
		for(int i=0;i<fList.size();i++) {
			MultipartFile mf=fList.get(i);
			//파일의 실제 이름 가져오기
			String oriName = mf.getOriginalFilename();
			fmap.put("oriFileName",oriName);
			//실제 파일명을 맵에 저장
			//로그에 찍어서 확인
			sysName = System.currentTimeMillis()+"."+oriName.substring(oriName.lastIndexOf(".")+1);
			fmap.put("sysFileName",sysName);
			mf.transferTo(new File(filePath+sysName));
			mDao.fileInsert(fmap);
			member=mDao.getMemIn(mr);
		}
		System.out.println(member);
		session.setAttribute("mb",member);
		view="resources/images/"+sysName;
		return view;
	}

	public String filedel() {
		String view=null;
		MemberDto member=new MemberDto();
		Map<String,String> fmap=new HashMap<String,String>();
		MemberDto m = (MemberDto)session.getAttribute("mb");
		String mr = m.getM_id();
		String nick = m.getM_nickname();
		System.out.println(nick);
		mDao.fileDelete(nick);
		member=mDao.getMemIn(mr);
		session.setAttribute("mb",member);
		
		view="resources/images/기본이미지.png";
		return view;
	}

	public ModelAndView findId(String name,String phonenum, RedirectAttributes rttr) {
		mv = new ModelAndView();//화면으로 데이터 전송.
		String msg = null;//화면에 출력할 메시지
		String view = null;//이동할 jsp 이름 저장 변수.
		Map<String,String> rmap=new HashMap<String,String>();
		rmap.put("name", name);
		rmap.put("phonenum", phonenum);
		try {
			//이름과 전화번호를 가지고 select
			MemberDto member=mDao.Idfind(rmap);
			session.setAttribute("mb", member);
			//아이디찾기 성공 -> 아이디 찾는 화면 전환
			view = "redirect:comIdFrm";
			rttr.addFlashAttribute("msg","아이디찾기 성공.");
		} catch (Exception e) {
			// 아이디 찾기 실패 -> 아이디찾기 창으로 감
			//e.printStackTrace();
			view = "redirect:findIdFrm";
			rttr.addFlashAttribute("msg","일치하는 정보가 없습니다.");
		}
		
		mv.setViewName(view);
		return mv;
	}

	public ModelAndView pwfind(String name, String mid, RedirectAttributes rttr) {
		mv = new ModelAndView();//화면으로 데이터 전송.
		String msg = null;//화면에 출력할 메시지
		String view = null;//이동할 jsp 이름 저장 변수.
		try {
			MemberDto member=mDao.pwfind(mid);
			session.setAttribute("mb", member);
			System.out.println(member.getM_name());
			if(member.getM_name().equals(name)){
				view = "redirect:rePwFrm";
				rttr.addFlashAttribute("msg","비밀번호 변경 화면으로 전환 됩니다.");
			}
			else {
				view = "redirect:findPwFrm";
				rttr.addFlashAttribute("msg","일치하는 정보가 없습니다.");
			}
		}catch(Exception e) {
			view = "redirect:findPwFrm";
			rttr.addFlashAttribute("msg","일치하는 정보가 없습니다.");
		}
		mv.setViewName(view);
		return mv;
	}

	public String pwch(String pw, String pwcheck, RedirectAttributes rttr) {
		String msg = null;//화면에 출력할 메시지
		String view = null;//이동할 jsp 이름 저장 변수.
		BCryptPasswordEncoder pwdEncoder =
				new BCryptPasswordEncoder();

		//위의 인코더를 사용하여 평문 비밀번호를 
		//암호 비밀번호로 변경

		MemberDto m = (MemberDto)session.getAttribute("mb");

		String encPwd = pwdEncoder.encode(pwcheck);

		HashMap<String,Object> rmap=new HashMap<>();
		rmap.put("pwcheck", encPwd);
		System.out.println(pwcheck);
		rmap.put("m", m.getM_id());
		System.out.println(m.getM_id());
		if(pw.equals(pwcheck)) {
			try {
				mDao.pwch(rmap);
				session.invalidate();
				view = "redirect:comPwFrm";
				rttr.addFlashAttribute("msg","비밀번호를 성공적으로 변경하였습니다.");
			}catch(Exception e) {
				view = "redirect:rePwFrm";
				rttr.addFlashAttribute("msg","비밀번호 변경을 실패했습니다.");
			}
		}else {
			view = "redirect:rePwFrm";
			rttr.addFlashAttribute("msg","비밀번호가 일치하지 않습니다.");
		}
		return view;
	}

	public String fpw() {
		//세션 정보 지우기
		session.invalidate();

		return "findPwFrm";
	}

	public String jo() {
		//세션 정보 지우기
		session.invalidate();

		return "loginFrm";
	}

	public Map<String, String> sendmail(String email) throws IOException{
		  Random r = new Random();
		  int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
          String setfrom = "1223seho@gmail.com";
          String tomail = email; // 받는 사람 이메일
          System.out.println(email);
          String title = "에디튜브 인증 이메일 입니다."; // 제목
          String content =
          
          System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
          
          System.getProperty("line.separator")+
                  
          "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
          
          +System.getProperty("line.separator")+
          
          System.getProperty("line.separator")+
  
          " 인증번호는 " +dice+ " 입니다. "
          
          +System.getProperty("line.separator")+
          
          System.getProperty("line.separator")+
          
          "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
          
          
          try {
              MimeMessage message = mailSender.createMimeMessage();
              MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                      true, "UTF-8");
  
              messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
              System.out.println("보낸사람: "+setfrom);
              messageHelper.setTo(tomail); // 받는사람 이메일
              System.out.println("받는사람: "+tomail);
              messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
              System.out.println("제목: "+title);
              messageHelper.setText(content); // 메일 내용
              System.out.println(content);
              
              mailSender.send(message);
              System.out.println("메시지: "+message);
          } catch (Exception e) {
              System.out.println(e);
          }
  
          Map<String, String> rmap = new HashMap<String, String>();
          rmap.put("result", "이메일이 발송되었습니다. 인증번호를 입력해주세요.");
          rmap.put("dice", String.valueOf(dice));
          return rmap;
        
    }

	public ModelAndView mMember() {
		ModelAndView mv=new ModelAndView();
		String msg = null;//화면에 출력할 메시지
		String view = null;//이동할 jsp 이름 저장 변수.
		MemberDto m = (MemberDto)session.getAttribute("mb");
		String nick=m.getM_nickname();
		try {
			List<MemberDto> mList =mDao.allmem(nick);
			System.out.println(mList);
			mv.addObject("mList", mList);
			
			view = "./mMember";
		}catch(Exception e) {
			view = "redirect:mDeal";
		}
		mv.setViewName(view);
		
		return mv;
	}
	
	@Transactional
	public String mdelete(String m_nickname, RedirectAttributes rttr) {
		String msg = null;//화면에 출력할 메시지
		String view = null;//이동할 jsp 이름 저장 변수.
		try {
			mDao.mdelete(m_nickname);
			view="redirect:Member";
			rttr.addFlashAttribute("msg","성공적으로 회원을 제명했습니다.");
		}catch(Exception e){
			view="redirect:Member";
			rttr.addFlashAttribute("msg","회원 제명을 실패하였습니다.");
		}
		return view;
	}

	public ModelAndView dateSearch(MemberDto member,memsearchDto memsea) {
		mv = new ModelAndView();
		String view = null;//이동할 jsp 이름 저장 변수.
		Map<String, String> lmap = new HashMap<String, String>();
		MemberDto m = (MemberDto)session.getAttribute("mb");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      int d = memsea.getReqDateend().getDate() + 1;
	      memsea.getReqDateend().setDate(d);
	      lmap.put("sDate", sdf.format(memsea.getReqDatestart()));
	      lmap.put("eDate", sdf.format(memsea.getReqDateend()));
	    List<MemberDto> mList = mDao.searchmem(lmap);
	    mv.addObject("mList", mList);
	    view = "./mMember";
	    mv.setViewName(view);
	      
		return mv;
	}
	
}