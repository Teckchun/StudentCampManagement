package model.dto;

public class Message {
       private String sms_id;
       private String user_id;
       private String sender_id;
       private String sender;
       private String title;
       private String description;
       private String time;
       private String img_info;
       private String sender_img;
       private String post_date;
       private int status;
	public String getSms_id() {
		return sms_id;
	}
	public void setSms_id(String sms_id) {
		this.sms_id = sms_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getSender_id() {
		return sender_id;
	}
	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}
	
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	public String getImg_info() {
		return img_info;
	}
	public void setImg_info(String img_info) {
		this.img_info = img_info;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getSender_img() {
		return sender_img;
	}
	public void setSender_img(String sender_img) {
		this.sender_img = sender_img;
	}
	
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	@Override
	public String toString() {
		return "Message [sms_id=" + sms_id + ", user_id=" + user_id + ", sender_id=" + sender_id + ", sender=" + sender
				+ ", title=" + title + ", description=" + description + ", time=" + time + ", img_info=" + img_info
				+ ", sender_img=" + sender_img + ", post_date=" + post_date + ", status=" + status + "]";
	}
	
}
