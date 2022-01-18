package mul.camp.seven.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.camp.seven.dao.MemberDao;
import mul.camp.seven.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;

	/* [idcheck.do] > ID 중복확인 */
	@Override
	public int duplId(String id) {
		return dao.duplId(id);
	}

	/* [nickcheck.do] > 닉네임 중복확인 */
	@Override
	public int duplNick(String nickname) {
		return dao.duplNick(nickname);
	}

	/* [emailcheck.do] > 이메일 중복확인 */
	@Override
	public int duplEmail(String email) {
		return dao.duplEmail(email);
	}
	
	/* [regiAf.do] > 회원가입 */
	@Override
	public boolean regiMember(MemberDto dto) {
		int count = dao.regiMember(dto);
		
		return count>0?true:false;
	}

	/* [loginAf.do] > 로그인 */
	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	/* [userEditAf.do] > 회원정보 수정 */
	@Override
	public boolean updateMember(MemberDto dto) {
		int count = dao.updateMember(dto);
		
		return count>0?true:false;
	}

	/* [userInfo.do] > 회원정보 수정에 따른 session값 재설정 */
	@Override
	public MemberDto userInfo(String id) {
		return dao.userInfo(id);
	}

}
