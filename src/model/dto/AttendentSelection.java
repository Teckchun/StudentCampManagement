package model.dto;

import java.util.Date;

public class AttendentSelection {
	private String title;
	private Date start;
	private int absence;
	private int late;
	private int permission;
	private int att_id;
	
	public AttendentSelection(){
		
	}
	
	public AttendentSelection(String title, Date start) {
		super();
		this.title = title;
		this.start = start;
	}
	public int getAbsence() {
		return absence;
	}
	
	

	public int getAtt_id() {
		return att_id;
	}

	public void setAtt_id(int att_id) {
		this.att_id = att_id;
	}

	public void setAbsence(int absence) {
		this.absence = absence;
	}

	public int getLate() {
		return late;
	}

	public void setLate(int late) {
		this.late = late;
	}

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date date) {
		this.start = date;
	}
	@Override
	public String toString() {
		return "AttendentSelection [title=" + title + ", start=" + start
				+ ", absence=" + absence + ", late=" + late + ", permission="
				+ permission + ", att_id=" + att_id + "]";
	}

	
}
