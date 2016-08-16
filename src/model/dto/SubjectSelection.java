package model.dto;

import java.util.Date;

public class SubjectSelection {
	private int id;
	private int class_id;
	private String staff_id;
	private String name;
	private String sub_id;
	private Date c_date;
	private String description;
	private int status;
	private String staff_name;
	private String class_name;
	private String course;
	private String generation;
	private int subject_status;

	public SubjectSelection() {
	}
	//Save constructor
	public SubjectSelection(int id, int class_id, String staff_id, String name, String description) {
		super();
		this.id = id;
		this.class_id = class_id;
		this.staff_id = staff_id;
		this.name = name;
		this.description = description;
	}
	//Display Constructor
	public SubjectSelection(int id, String name, Date c_date, int status, String staff_name, String class_name, String course,
			String generation) {
		super();
		this.id = id;
		this.name = name;
		this.c_date = c_date;
		this.status = status;
		this.staff_name = staff_name;
		this.class_name = class_name;
		this.course = course;
		this.generation = generation;
	}
	
	public SubjectSelection(int id, int class_id, String staff_id, String name,
			String sub_id, Date c_date, String description, int status,
			String staff_name, String class_name, String course,
			String generation) {
		super();
		this.id = id;
		this.class_id = class_id;
		this.staff_id = staff_id;
		this.name = name;
		this.sub_id = sub_id;
		this.c_date = c_date;
		this.description = description;
		this.status = status;
		this.staff_name = staff_name;
		this.class_name = class_name;
		this.course = course;
		this.generation = generation;
	}
	public int getSubject_status() {
		return subject_status;
	}
	public void setSubject_status(int subject_status) {
		this.subject_status = subject_status;
	}
	public String getSub_id() {
		return sub_id;
	}
	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
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
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getGeneration() {
		return generation;
	}
	public void setGeneration(String generation) {
		this.generation = generation;
	}
	@Override
	public String toString() {
		return "SubjectSelection [id=" + id + ", class_id=" + class_id
				+ ", staff_id=" + staff_id + ", name=" + name + ", sub_id="
				+ sub_id + ", c_date=" + c_date + ", description="
				+ description + ", status=" + status + ", staff_name="
				+ staff_name + ", class_name=" + class_name + ", course="
				+ course + ", generation=" + generation + ", subject_status="
				+ subject_status + "]";
	}
}
