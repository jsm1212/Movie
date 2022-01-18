package mul.camp.seven.dao;

import mul.camp.seven.dto.MemberDto;

public interface MemberDao {

	/* [rigi.do] > 회원가입 */
	int regiMember(MemberDto dto);
	
	/* [idcheck.do] > ID 중복확인 */
	int duplId(String id);
	
	/* [nickcheck.do] > 닉네임 중복확인 */
	int duplNick(String nickname);
	
	/* [emailcheck.do] > 이메일 중복확인 */
	int duplEmail(String email);
	
	/* [loginAf.do] > 로그인 */
	MemberDto login(MemberDto dto);
	
	/* [userEditAf.do] > 회원정보 수정 */
	int updateMember(MemberDto dto);
	
	/* [userInfo.do] > 회원정보 수정에 따른 session값 재설정 */
	MemberDto userInfo(String id);

}
