package model.dto;

import java.util.Date;




public class Attendent {
	
	private int id;
	private Date at_date;
	private String stu_id;
	private String description;
	private int absent;
	private int permission;
	private int late;
	
	private String profilesrc;
	private String student_name;
	private String studentgeneder;
	private String class_name;
	
	public Attendent(){
		
	}
	//Save Contructor
	public Attendent(Date at_date, String stu_id, String description, int absent, int permission, int late) {
		super();
		this.at_date = at_date;
		this.stu_id = stu_id;
		this.description = description;
		this.absent = absent;
		this.permission = permission;
		this.late = late;
	}
	//Display Contructor
	public Attendent(Date at_date, String stu_id,int absent, int permission, int late,
			String student_name, String studentgeneder, String class_name) {
		super();
		this.at_date = at_date;
		this.stu_id = stu_id;
		this.absent = absent;
		this.permission = permission;
		this.late = late;
		this.student_name = student_name;
		this.studentgeneder = studentgeneder;
		this.class_name = class_name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getProfilesrc() {
		return profilesrc;
	}
	public void setProfilesrc(String profilesrc) {
		this.profilesrc = profilesrc;
	}
	public Date getAt_date() {
		return at_date;
	}
	public void setAt_date(Date at_date) {
		this.at_date = at_date;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getAbsent() {
		return absent;
	}
	public void setAbsent(int absent) {
		this.absent = absent;
	}
	public int getPermission() {
		return permission;
	}
	public void setPermission(int permission) {
		this.permission = permission;
	}
	public int getLate() {
		return late;
	}
	public void setLate(int late) {
		this.late = late;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getStudentgeneder() {
		return studentgeneder;
	}
	public void setStudentgeneder(String studentgeneder) {
		this.studentgeneder = studentgeneder;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	@Override
	public String toString() {
		return "Attendent [id=" + id + ", at_date=" + at_date + ", stu_id="
				+ stu_id + ", description=" + description + ", absent="
				+ absent + ", permission=" + permission + ", late=" + late
				+ ", profilesrc=" + profilesrc + ", student_name="
				+ student_name + ", studentgeneder=" + studentgeneder
				+ ", class_name=" + class_name + "]";
	}

	
}
