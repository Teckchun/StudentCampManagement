package model.dto;

public class StudentClass {
	   private int id;
	   private int stu_id;
	   private int class_id;
	public StudentClass(int id, int stu_id, int class_id) {
		super();
		this.id = id;
		this.stu_id = stu_id;
		this.class_id = class_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStu_id() {
		return stu_id;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	
	
}
