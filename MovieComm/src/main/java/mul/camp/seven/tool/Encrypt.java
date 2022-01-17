package mul.camp.seven.tool;

import java.math.BigInteger;
import java.security.MessageDigest;


public class Encrypt {
	
	// salt값은 없음
    public String hashingWithSHA256(String plnData){
    	
        try{
            MessageDigest md = MessageDigest.getInstance("SHA-256");	// SHA-256 암호화 알고리즘 사용
           
            // 원래 해시암호화는 BYTE로 입력받아 BYTE로 출력함
            // 현재는 String 값으로 비밀번호를 받아 UTF-8 형식의 Byte 값으로 변환
            // 변환된 값을 md(메세지 다이제스트)안에 넣는다. 
            md.update(plnData.getBytes("UTF-8"));
            
            // 암호화 진행 시 결과값이 BYTE로 반환되서 STIRNG으로 반환되게끔 함 (현재 DB PWD값이 VARCHAR)
            // %064x: %x=16진수, %와 x 사이의 숫자는 메세지 길이를 의미함 (64길이)
            // BigInteger: 무한대 정수(long보다 큼), 뒤에 어떠한 값이 올지 모르기 때문에 BigInteger 사용
            String enc_string = String.format("%064x", new BigInteger(1, md.digest()));
            
            return enc_string;
        }catch(Exception e){
            return "false";
        }
    }
}