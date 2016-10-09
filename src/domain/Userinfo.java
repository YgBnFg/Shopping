package domain;

public class Userinfo {
	private Integer id;
	private String name;
	private String password;
	private String realname;
	private String sex;
	private String tel;
	public String getName() {
		return name;
	}
	public void setName(String username) {
		this.name = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id1) {
		this.id = id1;
	}
	public void setRealname(String realname1) {
		this.realname=realname1;
	}
	public void setTel(String tel1) {
		this.tel=tel1;
	}
	public void setSex(String sex2) {
		this.sex=sex2;
	}

	public String getSex() {
		return sex;
	}

	public String getRealname() {
		return realname;
	}
	public String getTel() {
		return tel;
	}
}
