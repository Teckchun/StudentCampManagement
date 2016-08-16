package model.dto;

import java.util.Date;

public class Course {
	private int id;
	private String course_type;
	private String description;
	private Date startdate;
	private Date enddate;
	private Date c_date;
	private int g_id;
	private int status;
	private String g_name;
	private int g_status;


    //For save Contructor
	public Course(String course_type, String description, Date startdate, Date enddate, int g_id) {
		super();
		this.course_type = course_type;
		this.description = description;
		this.startdate = startdate;
		this.enddate = enddate;
		this.g_id = g_id;
	}
	//Diplay contructor
	public Course(int id, String course_type,String g_name,Date startdate, Date enddate,int status,int g_status) {
		super();
		this.id = id;
		this.course_type = course_type;
		this.startdate = startdate;
		this.enddate = enddate;
		this.g_name = g_name;
		this.status=status;
		this.g_status=g_status;
	}
	public int getG_status() {
		return g_status;
	}
	public void setG_status(int g_status) {
		this.g_status = g_status;
	}
	public Course() {

	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourse_type() {
		return course_type;
	}
	public void setCourse_type(String course_type) {
		this.course_type = course_type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public int getStatus(){
		return status;
	}
	public void setStatus(int status){
		this.status=status;
	}
	@Override
	public String toString() {
		return "Course [id=" + id + ", course_type=" + course_type
				+ ", description=" + description + ", startdate=" + startdate
				+ ", enddate=" + enddate + ", c_date=" + c_date + ", g_id="
				+ g_id + ", status=" + status + ", g_name=" + g_name
				+ ", g_status=" + g_status + "]";
	}
	
	
}
