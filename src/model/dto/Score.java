package model.dto;

import java.util.Date;

public class Score {
	private int id;
	private Date score_date;
	private String month;
	private float score;
	
	private int rank;
	private String subj_id;
	private String subject;
	
	private float kscore;
	private float jscore;
	private float wscore;
	private float attscore;
	
	private String stu_id;
	private String stu_name;
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	private String stu_profile;
	private String stu_gender;
	
	private String cls_name;
	
	private String course_type;
	
	private String generation_name;
	
	private String staff_id;
	

	public Score(){
	}
	//Save contructor
	public Score(Date score_date, String month, String subj_id, String stu_id, String staff_id, float score) {
		super();
		this.score_date = score_date;
		this.month = month;
		this.subj_id = subj_id;
		this.stu_id = stu_id;
		this.staff_id = staff_id;
		this.score = score;
	}
	//Display Constructor
	public Score(Date score_date, String month, String stu_id, float score, String stu_name, String subject) {
		super();
		this.score_date = score_date;
		this.month = month;
		this.stu_id = stu_id;
		this.score = score;
		this.stu_name = stu_name;
		this.subject = subject;
	}
	
	public float getKscore() {
		return kscore;
	}
	public void setKscore(float kscore) {
		this.kscore = kscore;
	}
	public float getJscore() {
		return jscore;
	}
	public void setJscore(float jscore) {
		this.jscore = jscore;
	}
	public float getWscore() {
		return wscore;
	}
	public void setWscore(float wscore) {
		this.wscore = wscore;
	}
	public float getAttscore() {
		return attscore;
	}
	public void setAttscore(float attscore) {
		this.attscore = attscore;
	}
	public String getStu_profile() {
		return stu_profile;
	}
	public void setStu_profile(String stu_profile) {
		this.stu_profile = stu_profile;
	}
	public String getStu_gender() {
		return stu_gender;
	}
	public void setStu_gender(String stu_gender) {
		this.stu_gender = stu_gender;
	}
	public String getCls_name() {
		return cls_name;
	}
	public void setCls_name(String cls_name) {
		this.cls_name = cls_name;
	}
	public String getCourse_type() {
		return course_type;
	}
	public void setCourse_type(String course_type) {
		this.course_type = course_type;
	}
	public String getGeneration_name() {
		return generation_name;
	}
	public void setGeneration_name(String generation_name) {
		this.generation_name = generation_name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getScore_date() {
		return score_date;
	}
	public void setScore_date(Date score_date) {
		this.score_date = score_date;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getSubj_id() {
		return subj_id;
	}
	public void setSubj_id(String subj_id) {
		this.subj_id = subj_id;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "Score [id=" + id + ", score_date=" + score_date + ", month="
				+ month + ", score=" + score + ", rank=" + rank + ", subj_id="
				+ subj_id + ", subject=" + subject + ", kscore=" + kscore
				+ ", jscore=" + jscore + ", wscore=" + wscore + ", attscore="
				+ attscore + ", stu_id=" + stu_id + ", stu_name=" + stu_name
				+ ", stu_profile=" + stu_profile + ", stu_gender=" + stu_gender
				+ ", cls_name=" + cls_name + ", course_type=" + course_type
				+ ", generation_name=" + generation_name + ", staff_id="
				+ staff_id + "]";
	}

}
