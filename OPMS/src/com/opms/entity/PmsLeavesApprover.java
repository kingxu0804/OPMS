package com.opms.entity;

import java.sql.Date;
import java.sql.Timestamp;

public class PmsLeavesApprover {
	
	@Override
	public String toString() {
		return "PmsLeavesApprover [approverid=" + approverid + ", leaveid=" + leaveid + ", userid=" + userid
				+ ", summary=" + summary + ", status=" + status + ", created=" + created + ", changed=" + changed + "]";
	}

	private Long approverid;

    private Long leaveid;

    private Long userid;

    private String summary;

    private Integer status;

    private Timestamp created;

    private Timestamp changed;

	
	
	public Long getApproverid() {
		return approverid;
	}

	public void setApproverid(Long approverid) {
		this.approverid = approverid;
	}

	public Long getLeaveid() {
		return leaveid;
	}

	public void setLeaveid(Long leaveid) {
		this.leaveid = leaveid;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public Timestamp getChanged() {
		return changed;
	}

	public void setChanged(Timestamp changed) {
		this.changed = changed;
	}


   
	
	



}