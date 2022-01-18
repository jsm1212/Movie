package mul.camp.seven.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MovieReplyDaoImpl implements MovieReplyDao{

	@Autowired
	SqlSession session;
	
	String ns = "Review.";
}
