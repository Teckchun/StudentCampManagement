package model.dto;

import java.util.Date;

public class Scholarship {
	private int id;
	private double totalscore;
	private double amount;
	private String stu_id;
	private int approve_id;
	private Date approve_date;
	private String staff_name;
	private String class_name;
	private String course;
	private String generation;
	private String stu_name;
	public Scholarship(){
		
	}
	//Save constructor
	public Scholarship(double totalscore, double amount, String stu_id, int approve_id) {
		super();
		this.totalscore = totalscore;
		this.amount = amount;
		this.stu_id = stu_id;
		this.approve_id = approve_id;
	}
	//Diplay Constructor
	public Scholarship(double totalscore, double amount, String stu_id, String class_name, String course,
			String generation,String stu_name) {
		this.totalscore = totalscore;
		this.amount = amount;
		this.stu_id = stu_id;
		this.class_name = class_name;
		this.course = course;
		this.generation = generation;
		this.stu_name=stu_name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getTotalscore() {
		return totalscore;
	}
	public void setTotalscore(double totalscore) {
		this.totalscore = totalscore;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public int getApprove_id() {
		return approve_id;
	}
	public void setApprove_id(int approve_id) {
		this.approve_id = approve_id;
	}
	public Date getApprove_date() {
		return approve_date;
	}
	public void setApprove_date(Date approve_date) {
		this.approve_date = approve_date;
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
	public String getStu_name(){
		return stu_name;
	}
	public void setStu_name(String stu_name){
		this.stu_name=stu_name;
	}
	@Override
	public String toString() {
		return "Scholarship [id=" + id + ", totalscore=" + totalscore + ", amount=" + amount + ", stu_id=" + stu_id
				+ ", approve_id=" + approve_id + ", approve_date=" + approve_date + ", staff_name=" + staff_name
				+ ", class_name=" + class_name + ", course=" + course + ", generation=" + generation + ", stu_name="
				+ stu_name + "]";
	}	
	
}
