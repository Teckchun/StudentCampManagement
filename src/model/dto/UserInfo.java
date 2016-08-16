package model.dto;

public class UserInfo {

	private String userid;
	private String username;
	private String pwd;
	private String email;
	private String usersrc;
	private String bgsrc;
	public UserInfo(){
		
	}
	public UserInfo(String userid,String username,String pwd,String email,String usersrc,String bgsrc){
		this.userid=userid;
		this.username=username;
		this.pwd=pwd;
		this.email=email;
		this.usersrc=usersrc;
		this.bgsrc=bgsrc;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsersrc() {
		return usersrc;
	}
	public void setUsersrc(String usersrc) {
		this.usersrc = usersrc;
	}
	public String getBgsrc() {
		return bgsrc;
	}
	public void setBgsrc(String bgsrc) {
		this.bgsrc = bgsrc;
	}
	
	public String toString(){
		return getUserid()+" "+getUsername()+" "+getPwd()+" "
			+getEmail()+" "+getUsersrc()+" "
			+getBgsrc();
				
	}
}
