package model.dto;

import java.util.Date;

public class LoginInfo {
	private int id;
	private int user_login_id;
	private Date login_date;

	public LoginInfo() {

	}

	public LoginInfo(int id, int user_login_id, Date login_date) {
		super();
		this.id = id;
		this.user_login_id = user_login_id;
		this.login_date = login_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_login_id() {
		return user_login_id;
	}

	public void setUser_login_id(int user_login_id) {
		this.user_login_id = user_login_id;
	}

	public Date getLogin_date() {
		return login_date;
	}

	public void setLogin_date(Date login_date) {
		this.login_date = login_date;
	}

}
