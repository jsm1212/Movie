package mul.camp.seven.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import mul.camp.seven.service.MovieReplyService;

@Controller
public class MovieReplyController {
	private static Logger logger = LoggerFactory.getLogger(MovieReplyController.class);
	
	@Autowired
	MovieReplyService Service;
}
