package mul.camp.seven.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.camp.seven.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession session;
	
	String ns = "MovieMember.";

	/* [idcheck.do] > ID 중복확인 */
	@Override
	public int duplId(String id) {
		return session.selectOne(ns + "duplId", id);
	}

	/* [nickcheck.do] > 닉네임 중복확인 */
	@Override
	public int duplNick(String nickname) {
		return session.selectOne(ns + "duplNick", nickname);
	}
	
	/* [emailcheck.do] > 이메일 중복확인 */
	@Override
	public int duplEmail(String email) {
		return session.selectOne(ns + "duplEmail", email);
	}

	/* [rigi.do] > 회원가입 */
	@Override
	public int regiMember(MemberDto dto) {
		return session.insert(ns + "regiMember", dto);
	}

	/* [loginAf.do] > 로그인 */
	@Override
	public MemberDto login(MemberDto dto) {
		return session.selectOne(ns + "login", dto);
	}

	/* [userEditAf.do] > 회원정보 수정 */
	@Override
	public int updateMember(MemberDto dto) {
		return session.update(ns + "updateMember", dto);
	}

	/* [userInfo.do] > 회원정보 수정에 따른 session값 재설정 */
	@Override
	public MemberDto userInfo(String id) {
		return session.selectOne(ns + "userInfo", id);
	}

}
