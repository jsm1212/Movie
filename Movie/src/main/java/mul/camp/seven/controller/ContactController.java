package mul.camp.seven.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mul.camp.seven.dto.ContactDto;
import mul.camp.seven.dto.ContactParam;
import mul.camp.seven.service.ContactService;

@Controller
public class ContactController {

private static Logger logger = LoggerFactory.getLogger(ContactController.class);
	
	@Autowired
	ContactService service;
	
	@RequestMapping(value="contact.do",  method = RequestMethod.GET)
	public String contact(Model model, ContactParam param) {
		logger.info("ContactController contact()" + new Date());
		
		List<ContactDto> list = service.contact(param);
		model.addAttribute("bbslist", list);
		
		return "contact";
	}
	
	@RequestMapping(value="contactwrite.do", method = RequestMethod.GET)
	public String contactwrite() {
		logger.info("ContactController contactwrite()" + new Date());
		
		return "contactwrite";
	}
	
	@RequestMapping(value="contactwriteAf.do", method =RequestMethod.POST)
	public String contactwriteAf(ContactDto dto) {
		logger.info("ContactController contactwriteAf()" + new Date());
		
		System.out.println(dto.toString());		// 확인
		
		int i = service.contactwrite(dto);
		if(i == 1) {
			System.out.println("성공적으로 추가되었습니다");
		}
		
		return "redirect:/bbslist.do";
	}
}
