package mul.camp.seven.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.camp.seven.dao.MovieReplyDao;

@Service
public class MovieReplyServiceImpl implements MovieReplyService{
	
	@Autowired
	MovieReplyDao dao;
}
