package mul.camp.seven.service;

import mul.camp.seven.dto.MemberDto;

public interface MemberService {
	
	/* [idcheck.do] > ID 중복확인 */
	int duplId(String id);
	
	/* [nickcheck.do] > 닉네임 중복확인 */
	int duplNick(String nickname);
	
	/* [emailcheck.do] > 이메일 중복확인 */
	int duplEmail(String email);
	
	/* [regiAf.do] > 회원가입 */
	boolean regiMember(MemberDto dto);
	
	/* [loginAf.do] > 로그인 */
	MemberDto login(MemberDto dto);
	
	/* [userEditAf.do] > 회원정보 수정 */
	boolean updateMember(MemberDto dto);
	
	/* [userInfo.do] > 회원정보 수정에 따른 session값 재설정 */
	MemberDto userInfo(String id);
}
