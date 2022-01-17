# Movie
세미프로젝트

희정 
1. 회원가입
<<<<<<< hee
    - ❗ 암호화된 비밀번호를 DB에 저장하기 위하여 DB PWD 값의 크기만 100바이트로 늘림 (형식은 그대로 varchar)
3. 로그인

--------------------------------------------
※ 회원가입 
- regi.jsp
- MemberController > regiAf.do
1) (Front_유효성 검사) regi.jsp에서 정규식을 사용하여 회원가입에 필요한 데이터(id, pw 등) 유효성 검사 진행
2) (Back_유효성 검사) MemberController > regiAf.do에서 유효성 검사를 위한 ValChecker class를 생성 및 활용하여 회원가입에 필요한 데이터(id, pw 등) 유효성 검사 진행
3) (Back_암호화) regiAf.do에서 service로 넘겨주기 전에 사용자로부터 입력받은 비밀번호 암호화(SHA-256) 진행
    - ❗ 암호화된 비밀번호를 DB에 저장하기 위하여 DB PWD 값의 크기만 100바이트로 늘림 (형식은 그대로 varchar)
4) (Back_알림창) 회원가입 실패 시 알림창 띄우기 errorAlert.jsp


※ 로그인
- login.jsp
- MemberController > loginAf.do
1) (Front_유효성 검사) login.jsp에서 ID, PWD가 입력되었는지 유효성 검사 진행
2) (Back) 로그인 시 DB에 비밀번호가 암호화 되어 저장되어 있기 때문에 로그인시에도 동일하게 service로 넘겨주기 전 비밀번호 암호화 진행하여 DB 내 비밀번호와 비교
3) (Back_알림창) 로그인 실패 시 알림창 띄우기 errorAlert.jsp
4) (Back) login 성공 시 비밀번호를 제외한 사용자 정보를 session(서버)에 "login"이라는 이름으로 저장
=======
2. 로그인
3. 마이페이지

성민
1. 영화리뷰게시판
2. 문의사항
3. 코드 합병해보기

>>>>>>> main
