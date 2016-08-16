package model.dto;

import java.util.Date;



public class Student {
	private String stu_id;
	private String fname;
	private String lname;
	private String username;
	private String pwd;
	private String gender;
	private Date dob;
	private String pob;
	private String paddr;
	private int course_id;
	private int class_id;
	private String phone;
	private String email;
	private String fa_name;
	private String fa_phone;
	private String mo_name;
	private String mo_phone;
	private String parents_addr;
	private String emergency_contact;
	private String universit;
	private Date re_date;
	private String img;
	private String profiles;
	private String bg_img;
	private int status;
	private String course;
	private String class_name;
	private String g_name;
    
	public Student(){
  	  
    }
	//Save Construtor
	public Student(String stu_id, String fname, String lname, String username, String pwd, String gender, Date dob,
			String pob, String paddr, int course_id, String phone, String email, String fa_name, String fa_phone,
			String mo_name, String mo_phone, String parents_addr, String emergency_contact, String universit,
			Date re_date, String img, String profiles, String bg_img) {
		this.stu_id = stu_id;
		this.fname = fname;
		this.lname = lname;
		this.username = username;
		this.pwd = pwd;
		this.gender = gender;
		this.dob = dob;
		this.pob = pob;
		this.paddr = paddr;
		this.course_id = course_id;
		this.phone = phone;
		this.email = email;
		this.fa_name = fa_name;
		this.fa_phone = fa_phone;
		this.mo_name = mo_name;
		this.mo_phone = mo_phone;
		this.parents_addr = parents_addr;
		this.emergency_contact = emergency_contact;
		this.universit = universit;
		this.re_date = re_date;
		this.img = img;
		this.profiles = profiles;
		this.bg_img = bg_img;
	}
	//Diplay Constructor
	public Student(String stu_id, String fname, String lname, String gender, String phone, String email, String profiles,
			String course, String class_name, String g_name) {
		super();
		this.stu_id = stu_id;
		this.fname = fname;
		this.lname = lname;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.profiles = profiles;
		this.course = course;
		this.class_name = class_name;
		this.g_name = g_name;
	}


	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getPob() {
		return pob;
	}

	public void setPob(String pob) {
		this.pob = pob;
	}

	public String getPaddr() {
		return paddr;
	}

	public void setPaddr(String paddr) {
		this.paddr = paddr;
	}

	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFa_name() {
		return fa_name;
	}

	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}

	public String getFa_phone() {
		return fa_phone;
	}

	public void setFa_phone(String fa_phone) {
		this.fa_phone = fa_phone;
	}

	public String getMo_name() {
		return mo_name;
	}

	public void setMo_name(String mo_name) {
		this.mo_name = mo_name;
	}

	public String getMo_phone() {
		return mo_phone;
	}

	public void setMo_phone(String mo_phone) {
		this.mo_phone = mo_phone;
	}

	public String getParents_addr() {
		return parents_addr;
	}

	public void setParents_addr(String parents_addr) {
		this.parents_addr = parents_addr;
	}

	public String getEmergency_contact() {
		return emergency_contact;
	}

	public void setEmergency_contact(String emergency_contact) {
		this.emergency_contact = emergency_contact;
	}

	public String getUniversit() {
		return universit;
	}

	public void setUniversit(String universit) {
		this.universit = universit;
	}

	public Date getRe_date() {
		return re_date;
	}

	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getProfiles() {
		return profiles;
	}

	public void setProfiles(String profiles) {
		this.profiles = profiles;
	}

	public String getBg_img() {
		return bg_img;
	}

	public void setBg_img(String bg_img) {
		this.bg_img = bg_img;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
    public int GetClassId(){
    	return class_id;
    }
    public void setClass_Id(int class_id){
    	this.class_id=class_id;
    }
	@Override
	public String toString() {
		return "Student [stu_id=" + stu_id + ", fname=" + fname + ", lname="
				+ lname + ", username=" + username + ", pwd=" + pwd
				+ ", gender=" + gender + ", dob=" + dob + ", pob=" + pob
				+ ", paddr=" + paddr + ", course_id=" + course_id
				+ ", class_id=" + class_id + ", phone=" + phone + ", email="
				+ email + ", fa_name=" + fa_name + ", fa_phone=" + fa_phone
				+ ", mo_name=" + mo_name + ", mo_phone=" + mo_phone
				+ ", parents_addr=" + parents_addr + ", emergency_contact="
				+ emergency_contact + ", universit=" + universit + ", re_date="
				+ re_date + ", img=" + img + ", profiles=" + profiles
				+ ", bg_img=" + bg_img + ", status=" + status + ", course="
				+ course + ", class_name=" + class_name + ", g_name=" + g_name
				+ "]";
	}
	
	
}
