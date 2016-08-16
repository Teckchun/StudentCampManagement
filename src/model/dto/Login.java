package model.dto;

import java.util.Date;

public class Login {
	private int id;
	private int user_id;
	private String username;
	private String password;
	private String user_type;
	private Date c_date;
	private String img;
	private int status;
	
	public Login(){
		
	}
	public Login(int id, int user_id, String username, String password,
			String user_type, Date c_date, String img, int status) {
		this.id = id;
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.user_type = user_type;
		this.c_date = c_date;
		this.img = img;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	

}
