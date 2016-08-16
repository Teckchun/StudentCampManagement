package model.dto;

import java.util.Date;

public class Staff {
	private String id;
	private String name;
	private Date dob;
	private String gender;
	private String username;
	private String pwd;
	private String address;
	private String email;
	private String phone;
	private Date register_date;
	private String imagesrc;
	private String profile;
	private String bgimag;
	private int status;
	private String position;
	private String class_name;
	
	public Staff(){
		
	}
	//Display constructor
	public Staff(String id,String profile,String name, String gender, String email, String phone,String position,int status) {
		super();
		this.id = id;
		this.profile=profile;
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.position=position;
		this.status = status;
	}
	//For set session
	public Staff(String id, String imagesrc, String profile, String bgimag, String position) {
		super();
		this.id = id;
		this.imagesrc = imagesrc;
		this.profile = profile;
		this.bgimag = bgimag;
		this.position = position;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public String getImagesrc() {
		return imagesrc;
	}
	public void setImagesrc(String imagesrc) {
		this.imagesrc = imagesrc;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getBgimag() {
		return bgimag;
	}
	public void setBgimag(String bgimag) {
		this.bgimag = bgimag;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	@Override
	public String toString() {
		return "Staff [id=" + id + ", name=" + name + ", dob=" + dob + ", gender=" + gender + ", address=" + address
				+ ", email=" + email + ", phone=" + phone + ", profile=" + profile + ", status=" + status
				+ ", position=" + position + "]";
	}
	
}
