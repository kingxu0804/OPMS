package com.opms.entity;

public class PmsUserManageApproval {
  
@Override
	public String toString() {
		return "PmsUserManageApproval [userid=" + userid + ", avatar=" + avatar + ", realname=" + realname + ", name="
				+ name + ", status=" + status + "]";
	}
public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
public long getUserid() {
		return userid;
	}
	public void setUserid(long userid) {
		this.userid = userid;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
  private long userid;
  private String avatar;
  private String realname;
  private String name;
  private int status;
  
  
  public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
