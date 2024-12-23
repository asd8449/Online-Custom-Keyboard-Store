package kr.ac.kopo.member.vo;

public class MemberVO {

	private String id;
	private String password;
	private String name;
	private String emailName;
	private String emailDomain;
	private String phone;
	private String type;
	private String regDate;
	
	public MemberVO() {

	}
	
	public MemberVO(String id, String password) {
		this.id = id;
		this.password = password;
	}

	public MemberVO(String id, String name, String type) {
		this.id = id;
		this.name = name;
		this.type = type;
	}
	
	public MemberVO(String id, String password, String name, String emailName, String emailDomain, String phone,
			String type, String regDate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.emailName = emailName;
		this.emailDomain = emailDomain;
		this.phone = phone;
		this.type = type;
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getEmailName() {
		return emailName;
	}
	public void setEmailName(String emailName) {
		this.emailName = emailName;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", emailName=" + emailName
				+ ", emailDomain=" + emailDomain + ", phone=" + phone + ", type=" + type + ", regDate=" + regDate + "]";
	}

	
	
}
