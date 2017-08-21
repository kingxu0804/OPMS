package com.opms.control;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.opms.entity.PmsLeaves;
import com.opms.entity.PmsLeavesApprover;
import com.opms.entity.PmsMessages;
import com.opms.entity.PmsResumes;
import com.opms.entity.PmsUserManageApproval;
import com.opms.entity.PmsUserPms;
import com.opms.entity.PmsUsers;
import com.opms.entity.PmsUsersProfileDepartPostion;
import com.opms.service.LeaveService;
import com.opms.service.OrganizationService;
import com.opms.unti.IntDate;
import com.opms.unti.MessageType;
import com.opms.unti.RandomTest;
import com.opms.unti.StringDate;
import com.opms.unti.TimeDate;


@Controller
public class LeaveManageController {

	@Autowired
	private LeaveService leaveservice;
	@Autowired 
	OrganizationService organizationService;
	@RequestMapping("approvalindex")
	public String goApprovalIndex(){
		return "approval_index";
	}
	
	
    //查询所有请假记录
	@RequestMapping("leavemanage{pageNum}")
	public String listLeaves(Model mod,HttpSession session,@RequestParam(required=true,defaultValue="1") Integer pageNum,@RequestParam(required=false,defaultValue="10") Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		PmsUsers user=(PmsUsers)session.getAttribute("user");
		PmsLeaves pmsLeaves=new PmsLeaves();
		pmsLeaves.setUserid(user.getUserid());
		
		List<PmsLeaves> listleave= leaveservice.listLeave(pmsLeaves);
		List<List> listAppInfo=new ArrayList<List>();
		for (PmsLeaves pmsL : listleave) {
			List<PmsLeavesApprover> listleaveApp=leaveservice.listApprovalInfo(pmsL.getLeaveid());
			 List<PmsUserManageApproval> listuser=new ArrayList<PmsUserManageApproval>();
			 PmsLeavesApprover pa=null;
			 for (PmsLeavesApprover pmsLeavesApprover : listleaveApp) {
				  pa=new PmsLeavesApprover();
				 pa.setUserid(pmsLeavesApprover.getUserid());
				 pa.setLeaveid(pmsLeavesApprover.getLeaveid());
				 PmsUserManageApproval pmsUserManageApproval=leaveservice.selectApprovalUserInfo(pa);
			     listuser.add(pmsUserManageApproval);
			 }
			 listAppInfo.add(listuser);
		}
		mod.addAttribute("SumCount", leaveservice.selectCount(pmsLeaves));
		PageInfo<PmsLeaves> pageInfo = new PageInfo<PmsLeaves>(listleave);
		mod.addAttribute("listleave",listleave);
		mod.addAttribute("count", listleave.size());
		mod.addAttribute("pageInfo", pageInfo);
		mod.addAttribute("listAppInfo",listAppInfo );
		return "leave_manage";

	}
	
	
	

	
	//跳转添加请假信息页面
	@RequestMapping("goaddleavemanage")
	public String  goaddleave(Model model,HttpSession session) {	
		PmsUsers user=(PmsUsers)session.getAttribute("user");
		long userid=user.getUserid();
		List<PmsLeaves> leaveData=leaveservice.listSearchLeaveDate(userid);
	    List<PmsUserManageApproval> leaveapproval=leaveservice.listUserManageInfo(userid);
		model.addAttribute("leaveDates",leaveData);
		model.addAttribute("leaveapproval", leaveapproval);
		return "add_leave_manage";
	}
	
	/**
	 * 
	 * description 添加请假信息
	 * @author xukang
	 * @throws UnsupportedEncodingException 
	 * @time 2017年7月28日
	 */
	@RequestMapping("addleave")	   
	public String  insertLeaveInfo(PmsLeaves pmsLeaves) {
		pmsLeaves.setStatus(1) ;
		pmsLeaves.setLeaveid(new RandomTest().random());
		pmsLeaves.setCreated(new java.sql.Timestamp(new java.util.Date().getTime()));
		pmsLeaves.setApproverids(pmsLeaves.getApproverids().substring(1,pmsLeaves.getApproverids().length()));
	   leaveservice.insertLeave(pmsLeaves);
	   if (pmsLeaves.getApproverids()!=null) {
		   String [] approvalids=pmsLeaves.getApproverids().split(",");
		    for (String approvalidS : approvalids) {
				long approverid=Long.parseLong(approvalidS);
				PmsLeavesApprover pmsLeavesApprover=new PmsLeavesApprover();
				pmsLeavesApprover.setApproverid(new RandomTest().random());
				pmsLeavesApprover.setLeaveid(pmsLeaves.getLeaveid());
				pmsLeavesApprover.setUserid(approverid);
				pmsLeavesApprover.setCreated(new java.sql.Timestamp(new java.util.Date().getTime()));
			    leaveservice.listAddApproverInfo(pmsLeavesApprover);
		     }
	    }
	  
	return "redirect:leavemanage";
	}
	//图片上传查看
	@RequestMapping("uploadPicture")
	public void uploadPicture(String image,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		String path = request.getServletContext().getRealPath("/");	
			java.io.FileInputStream fis = new java.io.FileInputStream(image);
			String jpgpath="uploadFile/"+new RandomTest().random()+".jpg";
			java.io.FileOutputStream fos = new java.io.FileOutputStream(path+jpgpath);
			int t= 0;
			while((t = fis.read())!= -1){
				fos.write(t);
			}
			fos.close();
			fis.close();
			response.getWriter().write(JSONArray.toJSONString(jpgpath));
		
	
		}
	
	//查询登录用户已请假时间段
	@RequestMapping("searchLeaveDate")
	public void listSearchLeaveDate(HttpSession session,HttpServletResponse response){
		PmsUsers user=(PmsUsers)session.getAttribute("user");
		long userid=user.getUserid();
		List<PmsLeaves> leaveData=leaveservice.listSearchLeaveDate(userid);
		String jsonArray = JSONArray.toJSONString(leaveData);   
		response.setCharacterEncoding("UTF-8");
		try {
		
			response.getWriter().write(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	//跳转编辑请假信息
	@RequestMapping("editleavemanage")
	public String goEditLeave(Long leaveid,Model mod){	
		
		mod.addAttribute("editleave", leaveservice.getleaveInfo(leaveid));
		return "edit_leave_manage";
	}
	
	//提交修改请假信息
	@RequestMapping("updateLeaveInfo")
	public String updateLeaveInfo(PmsLeaves pmsleaves){	
		pmsleaves.setCreated(new java.sql.Timestamp(new java.util.Date().getTime()));
		leaveservice.updateLeaveInfo(pmsleaves);
		return "redirect:leavemanage";
	}
	//搜索请假信息
	@RequestMapping("searchLeaveInfo{pageNum}")
	public String selectLeaveInfo(Model mod,PmsLeaves pmsLeaves,HttpSession session){	
		PmsUsers user=(PmsUsers)session.getAttribute("user");
		pmsLeaves.setUserid(user.getUserid());
		List<PmsLeaves> ListLeave= leaveservice.listSearchLeave(pmsLeaves);
		mod.addAttribute("SumCount", leaveservice.selectCount(pmsLeaves));
		PageInfo<PmsLeaves> pageInfo = new PageInfo<PmsLeaves>(ListLeave);
		mod.addAttribute("listleave",ListLeave);
		mod.addAttribute("count", ListLeave.size());
		mod.addAttribute("pageInfo", pageInfo);
		mod.addAttribute("searchType", 1);
		return "leave_manage";
	}
	
	//获取未审批案件信息并且跳转待审批界面
	@RequiresRoles("leave-approval")
	@RequestMapping("approvalleave")
	public String goapprovalleave(Model mod,HttpSession session){
		PmsUsers user=(PmsUsers)session.getAttribute("user");
		long userid=user.getUserid();
		List<PmsLeaves> unApproveleave=leaveservice.getApprovalLeave(userid);
		for (PmsLeaves pmsLeaves : unApproveleave) {
			String realName=leaveservice.selectUsersProfileDepartPostion(pmsLeaves.getUserid()).getRealname();
			pmsLeaves.setRealName(realName);
		}
	
		List<List> listAppInfo=new ArrayList<List>();
		for (PmsLeaves pmsL : unApproveleave) {
			List<PmsLeavesApprover> listleaveApp=leaveservice.listApprovalInfo(pmsL.getLeaveid());
			 List<PmsUserManageApproval> listuser=new ArrayList<PmsUserManageApproval>();
			 PmsLeavesApprover pa=null;
			 for (PmsLeavesApprover pmsLeavesApprover : listleaveApp) {
				  pa=new PmsLeavesApprover();
				 pa.setUserid(pmsLeavesApprover.getUserid());
				 pa.setLeaveid(pmsLeavesApprover.getLeaveid());
				 PmsUserManageApproval pmsUserManageApproval=leaveservice.selectApprovalUserInfo(pa);
			     listuser.add(pmsUserManageApproval);
			 }
			 listAppInfo.add(listuser);
		}
		mod.addAttribute("listAppInfo",listAppInfo );
		mod.addAttribute("listUnApproval", unApproveleave);
	    
		return "approval_leave";
	}
	
	//删除请假信息
	@RequestMapping("deleteLeave")
	public String deleteLeaveInfo(Long leaveid){
		leaveservice.deleteLeave(leaveid);
		return "redirect:leavemanage";
	}
//修改请假状态
	@RequestMapping("updateLeaveStatus")
	public String updateStatusInfo(Long leaveid){
		leaveservice.updateStatus(leaveid);
		return "redirect:leavemanage";
	}
//查看请假信息详情
	@RequestMapping("leavedetail")
	public String  getLeaveDetail(Model mod, Long leaveid){
	 mod.addAttribute("leavedetail",leaveservice.getLeaveDetail( leaveid));
		
	 return "leave_detail";
	}
	
  //获取审批案件详情，以便审批请假事件
	@RequestMapping("GetleaveApproval")
   public  String GetleaveApprovalInfo(Model model,Long leaveid,HttpSession session){
		PmsLeavesApprover spid=new PmsLeavesApprover();
		PmsUsers user=(PmsUsers) session.getAttribute("user");
		spid.setUserid(user.getUserid());
		spid.setLeaveid(leaveid);
		PmsLeavesApprover SPID=leaveservice.getApprovalInfo(spid);
		PmsLeaves unapprovalLeave=leaveservice.getLeaveDetail(leaveid);
		PmsUsersProfileDepartPostion userDetail=leaveservice.selectUsersProfileDepartPostion(unapprovalLeave.getUserid());
		List listAppInfo=new ArrayList<List>();
			List<PmsLeavesApprover> listleaveApp=leaveservice.listApprovalInfo(unapprovalLeave.getLeaveid());
			PmsLeavesApprover pa=null;
			 for (PmsLeavesApprover pmsLeavesApprover : listleaveApp) {
				  pa=new PmsLeavesApprover();
				 pa.setUserid(pmsLeavesApprover.getUserid());
				 pa.setLeaveid(pmsLeavesApprover.getLeaveid());
				 PmsUserManageApproval pmsUserManageApproval=leaveservice.selectApprovalUserInfo(pa);
				 listAppInfo.add(pmsUserManageApproval);
			 }
			 model.addAttribute("SPID", SPID);
	    model.addAttribute("listAppInfo", listAppInfo);
		model.addAttribute("unappLeave", unapprovalLeave);
		model.addAttribute("userDetail", userDetail);
		return "leave_approval";
	}
	
	//提交审批意见
	@RequestMapping("updateLeaveApprovalInfo")
	public String updateLeaveApprovalInfo(PmsLeavesApprover pmsLeavesApprover,HttpSession session){
		pmsLeavesApprover.setCreated(new java.sql.Timestamp(new java.util.Date().getTime()));
		PmsUsers user=(PmsUsers) session.getAttribute("user");
		pmsLeavesApprover.setUserid(user.getUserid());
		
		PmsLeaves pmsLeaves=leaveservice.getLeaveDetail(pmsLeavesApprover.getLeaveid());
		leaveservice.updateLeaveApprovalInfo(pmsLeavesApprover);
		String massage=null;
		if (pmsLeavesApprover.getStatus()==1) {
			 massage=MessageType.APPROVE_AGREE;
		}else{
			 massage=MessageType.APPROVE_REFUSE;
		}
		
		
		PmsMessages message=new PmsMessages(user.getUserid(), MessageType.APPROVE, MessageType.LEAVE_APPROVE2, massage, "#");
		PmsUserPms user1=new PmsUserPms();
		PmsUsers us = new PmsUsers();
		us.setUserid(pmsLeaves.getUserid());//接收方userid
		user1.setPmsUsers(us);
		List<PmsUserPms> userlist=new ArrayList<PmsUserPms>();
		userlist.add(user1);
		organizationService.addPmsMessages(message, userlist);

		
		
		
		return "redirect:approvalleave";
	}
	
	
}
