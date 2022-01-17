package mul.camp.seven.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		logger.info("MyPageController mypage()" + new Date());

		return "mypage";
	}
	
	/*
	 * @RequestMapping(value = "test.do", method = RequestMethod.GET)
	 * public @ResponseBody Map<String, Object> test(@RequestBody Map<String,
	 * Object> map) { logger.info("Testing!!!!!!!!!!!" + new Date());
	 * 
	 * MemberDto memberDto = new MemberDto(); Map<String, Object> value = new
	 * HashMap<>();
	 * 
	 * memberDto.setId(map.get("ID").toString());
	 * 
	 * Encrypt encrypt = new Encrypt(); String enc_password =
	 * encrypt.hashingWithSHA256(map.get("PWD").toString()); // 암호화 진행
	 * memberDto.setPwd(enc_password);
	 * 
	 * try { MemberDto user = service.login(memberDto);
	 * 
	 * value.put("ID", user.getId()); value.put("Name", user.getName());
	 * value.put("NickName", user.getNickname()); value.put("Age", user.getAge());
	 * value.put("Email", user.getEmail()); value.put("Gender", user.getGender());
	 * 
	 * Date date = new Date(); String dateToStr = DateFormatUtils.format(date,
	 * "yyyy-MM-dd");
	 * 
	 * value.put("Regi_date", dateToStr);
	 * 
	 * logger.info("Value : " + value); return value; }catch(Exception e) {
	 * logger.info(e.toString()); value.put("result Failed ", " 해당하는 사용자가 없습니다.");
	 * return value; } }
	 */
	
}
