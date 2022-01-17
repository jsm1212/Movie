package mul.camp.seven.tool;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValChecker {

    private static final Logger LOG = LoggerFactory.getLogger(ValChecker.class);

    // null 값 들어오면 문자열로 반환
    public String checkEmpty (Object object) {
        if(object == null){
            object = "null";
        }
        else if(StringUtils.isEmpty(object)){
	        LOG.info("Null 값");
	        return "false";
	    }
        return String.valueOf(object);
    }
	
	// 패스워드
    public String checkPassword(String value){
        try{
            value = value.replace(" ", "");
			/*
			 * Pattern p1 = Pattern.compile("[A-Z]"); Pattern p2 = Pattern.compile("[a-z]");
			 * Pattern p3 = Pattern.compile("[0-9]"); Pattern p4 =
			 * Pattern.compile("[`~!@#$%^&*|\'\";:/?]"); Pattern p5 =
			 * Pattern.compile("{7,15}"); Matcher m1 = p1.matcher(value); Matcher m2 =
			 * p2.matcher(value); Matcher m3 = p3.matcher(value); Matcher m4 =
			 * p4.matcher(value); Matcher m5 = p5.matcher(value);
			 */
            Pattern p = Pattern.compile("^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\\\(\\\\)\\-_=+]).{8,16}$");
            Matcher m = p.matcher(value);
            
            if(!m.find()){
                LOG.info("유효하지 않은 비밀번호");
                LOG.info(value);
                return "false";
            }else{
                return value;
            }

        }catch(Exception e){
            e.printStackTrace();
            return "false";
        }
    }
    
    // name 값
    public String checkNAME(String value){
        try{
            if(value.equals("")){
                LOG.info("빈 값");
                return "false";
            }
            Pattern p = Pattern.compile("^[A-Za-z가-힣]*$");
            Matcher m = p.matcher(value);
            if(!m.find()){
                LOG.info("유효하지 않은 아이디");
                return "false";
            }else{
                return value;
            }

        }catch(Exception e){
            e.printStackTrace();
            return "false";
        }
    }
    
    // 숫자인지 아닌지 검사
    public String checkNumber(String value){
        try{
            if(value.isEmpty()){
                LOG.info("빈값");
                return "false";
            }
            int temp = (int)Double.parseDouble(value) + 1;
            if(temp < 0 || temp > 200){
                LOG.info("허용되지 않은 범위");
                return "false";
            }
            Pattern p = Pattern.compile("^[0-9]*$");
            Matcher m = p.matcher(String.valueOf(temp));
            if(!m.find()){
                LOG.info("유효하지 않은 입력값");
                return "false";
            }else{
                return value;
            }
        }catch(NullPointerException e){
            throw new Error("There is no value");
        }
    }
    
    // 이메일 값 체크
    public String checkEmail(String value){
        try{
            if(value.equals("")){
                LOG.info("빈값");
                return "false";
            }
            value = value.replace(" ", "");
            Pattern p = Pattern.compile("^[a-z0-9_+.-]+@([a-z0-9-]+\\.)+[a-z0-9]{2,4}$");
            Matcher m = p.matcher(value);
            if(!m.find()){
                LOG.info("유효하지 않은 이메일");
                return "false";
            }else{
                return value;
            }

        }catch(Exception e){
            e.printStackTrace();
            return "false";
        }
    }
    
    // xss 특수문자 치환
    public String cleanXss(String value){
        LOG.info("value : {}",value);

        if(value.equals("")){
            LOG.info("값이 비어있음");
        }
        value = value.replace("&", "&amp;");
        value = value.replace("\"", "&quot;");
        value = value.replace("'", "&apos;");
        value = value.replace("<", "&lt;");
        value = value.replace(">", "&gt;");
        value = value.replace("\r", "<br>");
        value = value.replace("\n", "<p>");
        value = value.replace("-", "");

        return value;
    }
    
    // 이메일 인증값 확인
    public String checkCODE(String value){

        if(StringUtils.isEmpty(value)){
            LOG.info("Null 값");
            return "false";
        }
        value = value.toUpperCase();
        Pattern p = Pattern.compile("^[0-9A-Z]*$");
        Matcher m = p.matcher(value);
        if(!m.find()){
            LOG.info("패턴 검증 에러");
            return "false";
        }
        return value;
    }

    // 확장자가 이미지인지 확인
    public String checkImgPrefix(String value){
        value = value.toLowerCase();
        String[] allowedImgPrefix = {"jpg", "jpeg", "png"};
        for(int i =0 ; i < allowedImgPrefix.length; i++){
            if (value.equals(allowedImgPrefix[i])){
                return value;
            }
        }
        return "jpg";
    }

    // 문자열인지 확인 (특수문자는 replace)
    public String checkString(String value){
        LOG.info("String value : {}",value);
        if(StringUtils.isEmpty(value)){
            LOG.error("NULL 값이 입력됨");
            return "";
        }
        value = value.replace("\"","");
        value = value.replace("\'","");
        value = value.replace("[","").replace("]","");
        value = value.replace("{","").replace("}","");
        return value;

    }
    
    public String checkSimple(String value){
    	
	    if(StringUtils.isEmpty(value)){
	        LOG.info("Null 값");
	        return "false";
	    }
	    value = value.toUpperCase();
	    String num = value.substring(0,3);
	    String var = value.substring(4,4);
	    Pattern p1 = Pattern.compile("^[0-9]*$");
	    Pattern p2 = Pattern.compile("^[A-Z]*$");
	    Matcher m1 = p1.matcher(num);
	    Matcher m2 = p2.matcher(var);
	    if(!m1.find() || !m2.find()){
	        LOG.info("패턴 검증 에러");
	        return "false";
	    }
	    return value;
	}

    

}
