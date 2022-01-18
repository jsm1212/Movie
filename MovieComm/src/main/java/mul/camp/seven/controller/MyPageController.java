package mul.camp.seven.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mul.camp.seven.service.MemberService;
import mul.camp.seven.tool.Encrypt;
import mul.camp.seven.tool.ValChecker;
import mul.camp.seven.dto.MemberDto;

@Controller
public class MyPageController {
	
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	private ValChecker valchecker = new ValChecker();
	
	@Autowired
	MemberService service;
	
	/* [mypage.do] > mypage.jsp로 단순 이동 */
	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	public String mypage() {
		logger.info("MemberController mypage()" + new Date());
		
		return "mypage";
	}
	
	/* [userEdit.do] > 단순 회원정보 수정 페이지로 이동 */
	@RequestMapping(value = "userEdit.do", method=RequestMethod.POST)
	public String userEdit() {
		logger.info("MyPageController userEdit()" + new Date());
		
		return "userEdit";
	}
	
	
	/* [userEditAf.do] > 회원정보 수정 */
	@RequestMapping(value = "userEditAf.do", method=RequestMethod.POST)
	public String userEditAf(MemberDto dto, Model model) {
		logger.info("MyPageController userEditAf()" + new Date());
		System.out.println("userEditAf() 전달받은 값 확인: " + dto.toString());
		
		/* (Back) 회원정보 수정 데이터 유효성 check _ ValChecker참조 */
		// PWD
		String checkResult = valchecker.checkPassword(dto.getPwd());
		if(checkResult == "false") {
			System.out.println("PWD 유효성 검사 fail- > 패스워드값: " + dto.getPwd());
			
			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "regi.do");
			return "errorAlert";
		}
		// NAME
		checkResult = valchecker.checkNAME(dto.getName());
		if(checkResult == "false") {
			System.out.println("NAME 유효성 검사 fail- > name값: " + dto.getName());
			
			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "regi.do");
			return "errorAlert";
		}
		// NICKNAME
		checkResult = valchecker.checkEmpty(dto.getNickname());
		if(checkResult == "false") {
			System.out.println("NICKNAME 유효성 검사 fail- > nickname값: " + dto.getNickname());
			
			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "regi.do");
			return "errorAlert";
		}
		// AGE
		checkResult = valchecker.checkNumber(Integer.toString(dto.getAge()));
		if(checkResult == "false") {
			System.out.println("AGE 유효성 검사 fail- > age값: " + dto.getAge());
			
			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "regi.do");
			return "errorAlert";
		}
		// EMAIL
		checkResult = valchecker.checkEmail(dto.getEmail());
		if(checkResult == "false") {
			System.out.println("EMAIL 유효성 검사 fail- > email값: " + dto.getEmail());
			
			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "regi.do");
			return "errorAlert";
		}
		
		/* 비밀번호 암호화 */
		Encrypt encrypt = new Encrypt();
	      String enc_password = encrypt.hashingWithSHA256(dto.getPwd());		// 암호화 진행 
	      logger.info("패스워드 암호화: " + enc_password);							// 암호화된 PWD값 확인용 LOG
	      dto.setPwd(enc_password);		
	      
	    /* 회원정보 수정 진행 */
	    boolean result = service.updateMember(dto);
	    if(result == true) {
	    	System.out.println("회원정보 수정이 완료되었습니다.");
	    }
		
		/* return "redirect:/login.do"; */
	    return "redirect:/userInfo.do";
	}
	
	/* [userInfo.do] > session값 재설정(회원정보 수정 후 mypage 업데이트를 위하여) */
	@RequestMapping(value = "userInfo.do", method=RequestMethod.GET)
	public String userInfo(MemberDto dto, HttpServletRequest req) {
		logger.info("MyPageController userInfo()" + new Date());
		
		// 1) 기존 session 값 가져오기 (DB에 현재 접속한 사용자의 id값을 넘겨주기 위하여)
		HttpSession session = req.getSession();
		MemberDto user = (MemberDto)session.getAttribute("login");
		// System.out.println("가져온 session값 확인용: " + user);
		
		// 2) session 값 재설정
		MemberDto userUpdate = service.userInfo(user.getId());
		if(userUpdate != null) {
			session.removeAttribute("login"); 							// "login" 세션 삭제
			req.getSession().setAttribute("login", userUpdate);			// "login" 세션 재설정
		
			return "redirect:/mypage.do";
		}
		System.out.println("seesion값 재설정 실패 userInfo()");
		return "redirect:/userEdit.do";
	}
	
	/* [movieBbslist.do] > 작성한 자유게시판(DB_MOVIEBBS) 불러오기, Ajax 사용(비동기처리) */
	@ResponseBody
	@RequestMapping(value = "movieBbslist.do", method=RequestMethod.POST)
	public String movieBbslist() {
		logger.info("MyPageController movieBbslist()" + new Date());
		
		return "";
	}
	
}
