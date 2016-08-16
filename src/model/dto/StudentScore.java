package model.dto;

public class StudentScore {

	private String stu_id;
	private String stu_name;
	private String stu_gender;
	private float stu_score;
	private int score_id;
	private String stu_subject;
	private String score_month;
	private String staff_id;
	private String staff_name;
	private String staff_position;

	public StudentScore() {
		// TODO Auto-generated constructor stub
	}
	public StudentScore(String stu_id, String stu_name, String stu_gender,
			float stu_score, String stu_subject, String score_month) {
		super();
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_gender = stu_gender;
		this.stu_score = stu_score;
		this.stu_subject = stu_subject;
		this.score_month = score_month;
	}

	public int getScore_id() {
		return score_id;
	}
	public void setScore_id(int score_id) {
		this.score_id = score_id;
	}
	public String getStaff_position() {
		return staff_position;
	}
	public void setStaff_position(String staff_position) {
		this.staff_position = staff_position;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getStu_gender() {
		return stu_gender;
	}

	public void setStu_gender(String stu_gender) {
		this.stu_gender = stu_gender;
	}

	public float getStu_score() {
		return stu_score;
	}

	public void setStu_score(float stu_score) {
		this.stu_score = stu_score;
	}

	public String getStu_subject() {
		return stu_subject;
	}

	public void setStu_subject(String stu_subject) {
		this.stu_subject = stu_subject;
	}

	public String getScore_month() {
		return score_month;
	}

	public void setScore_month(String score_month) {
		this.score_month = score_month;
	}
	@Override
	public String toString() {
		return "StudentScore [stu_id=" + stu_id + ", stu_name=" + stu_name
				+ ", stu_gender=" + stu_gender + ", stu_score=" + stu_score
				+ ", score_id=" + score_id + ", stu_subject=" + stu_subject
				+ ", score_month=" + score_month + ", staff_id=" + staff_id
				+ ", staff_name=" + staff_name + ", staff_position="
				+ staff_position + "]";
	}
	

}
