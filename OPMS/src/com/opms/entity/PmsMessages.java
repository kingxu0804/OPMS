/**
 * 
 */
package com.opms.entity;

import com.opms.unti.RandomTest;
import com.opms.unti.StringDate;

/**
 * description:
 * @author liyanpeng
 * @date 2017年8月11日
 */
public class PmsMessages {
	private long msgid;
	private long userid;
	private long touserid;//发出消息的人
	private String touseidusername;
	private Integer type;//类型1评论2赞3审批
	private Integer subtype;//11知识评论12相册评论21知识赞22相册赞31请假审批32加班33报销34出差35外出36物品
	private String subtypetext;
	private String title;//标题
	private String url;
	private Integer view;
	private String created;
	
	
	public PmsMessages() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param userid
	 * @param touseid
	 * @param type
	 * @param subtype
	 * @param title
	 * @param url
	 * @param view
	 */
	public PmsMessages(long touserid, Integer type, Integer subtype, String title, String url) {
		super();
		this.touserid = touserid;
		this.type = type;
		this.subtype = subtype;
		this.title = title;
		this.url = url;
		this.view=1;
		this.created=new StringDate().getNowStringDate();
	}
	public long getMsgid() {
		return msgid;
	}
	public void setMsgid(long msgid) {
		this.msgid = msgid;
	}
	public long getUserid() {
		return userid;
	}
	public void setUserid(long userid) {
		this.userid = userid;
	}
	public long getTouserid() {
		return touserid;
	}
	public void setTouserid(long touserid) {
		this.touserid = touserid;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getSubtype() {
		return subtype;
	}
	public void setSubtype(Integer subtype) {
		this.subtype = subtype;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getView() {
		return view;
	}
	public void setView(Integer view) {
		this.view = view;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getTouseidusername() {
		return touseidusername;
	}
	public void setTouseidusername(String touseidusername) {
		this.touseidusername = touseidusername;
	}
	public String getSubtypetext() {
		return subtypetext;
	}
	public void setSubtypetext(String subtypetext) {
		this.subtypetext = subtypetext;
	}
}
