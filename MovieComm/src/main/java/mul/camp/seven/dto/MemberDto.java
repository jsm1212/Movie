package mul.camp.seven.dto;

import java.io.Serializable;
import java.util.Date;

public class MemberDto implements Serializable {

	private String id;
	private String pwd;
	private String name;
	private String nickname;
	private int age;
	private int gender;
	private String email;
	private Date regi_date;
	
	public MemberDto() {
	}

	public MemberDto(String id, String pwd, String name, String nickname, int age, int gender, String email,
			Date regi_date) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.regi_date = regi_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname + ", age=" + age
				+ ", gender=" + gender + ", email=" + email + ", regi_date=" + regi_date + "]";
	}

}
