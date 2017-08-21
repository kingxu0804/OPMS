package com.opms.entity;

import java.util.Date;

public class PmsAlbumsCommentAndUsers {
	private Long comtid;

    private Long userid;

    private Long albumid;

    private String content;

    private Date created;

    private Integer status;
    
    private String username;
    
    private String comment_created;

	public String getComment_created() {
		return comment_created;
	}

	public void setComment_created(String comment_created) {
		this.comment_created = comment_created;
	}

	public Long getComtid() {
		return comtid;
	}

	public void setComtid(Long comtid) {
		this.comtid = comtid;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public Long getAlbumid() {
		return albumid;
	}

	public void setAlbumid(Long albumid) {
		this.albumid = albumid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	private String avatar;

}
