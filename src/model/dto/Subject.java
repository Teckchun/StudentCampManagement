package model.dto;

import java.sql.Date;

public class Subject {
	private String subject_id;
	private String subject_name;
	private Date creat_date;
	private String description;
	private int status;
	private float sub_percent;
	
	public Subject(){
		
	}

	public Subject(String subject_id, String subject_name, Date creat_date,
			String description, int status) {
		super();
		this.subject_id = subject_id;
		this.subject_name = subject_name;
		this.creat_date = creat_date;
		this.description = description;
		this.status = status;
	}

	public float getSub_percent() {
		return sub_percent;
	}

	public void setSub_percent(float sub_percent) {
		this.sub_percent = sub_percent;
	}

	public String getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public Date getCreat_date() {
		return creat_date;
	}

	public void setCreat_date(Date creat_date) {
		this.creat_date = creat_date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Subject [subject_id=" + subject_id + ", subject_name="
				+ subject_name + ", creat_date=" + creat_date
				+ ", description=" + description + ", status=" + status
				+ ", sub_percent=" + sub_percent + "]";
	}
}
