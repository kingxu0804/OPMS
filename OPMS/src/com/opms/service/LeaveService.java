package com.opms.service;

import java.sql.Date;
import java.util.List;

import com.opms.entity.PmsLeaves;
import com.opms.entity.PmsLeavesApprover;
import com.opms.entity.PmsUserManageApproval;
import com.opms.entity.PmsUsersProfileDepartPostion;

public interface LeaveService {

	//获取请假列表信息
	List<PmsLeaves> listLeave(PmsLeaves pmsLeaves);
	//查询请假总数
	int selectCount(PmsLeaves pmsLeaves);
	//添加请假信息
	int  insertLeave(PmsLeaves pmsLeaves);
	//获取需要修改的请假信息
	PmsLeaves getleaveInfo(Long leaveid);
    //根据条件搜索请假信息
	List<PmsLeaves> listSearchLeave(PmsLeaves pmsLeaves);
	//更新请假信息
	int updateLeaveInfo(PmsLeaves pmsleaves);
	//获取未审批的请假案件
	List<PmsLeaves> getApprovalLeave(long userid);
	//删除案件信息
	int deleteLeave( long leaveid);
	//更改案件状态为正常
	int updateStatus(long leaveid);
	//查看案件详情
	PmsLeaves getLeaveDetail(long leaveid);
	//查询请假事假段集合
	List<PmsLeaves> listSearchLeaveDate(long userid);
	//查询员工同部门领导
	List<PmsUserManageApproval> listUserManageInfo(long userid);
	//添加审批表添加审批信息
	int listAddApproverInfo(PmsLeavesApprover pmsLeavesApprover);
	//根据id查询部门职称等
	PmsUsersProfileDepartPostion selectUsersProfileDepartPostion(long userid);
	//获取案件审批人信息list
	List<PmsLeavesApprover> listApprovalInfo(long leaveid);
	//查找此案件审批人信息和审批状态
	PmsUserManageApproval selectApprovalUserInfo(PmsLeavesApprover pmsLeavesApprover);
	//审批一个请假事件
	int updateLeaveApprovalInfo(PmsLeavesApprover pmsLeavesApprover);
	//根据用户id和请假事件id查询审批时间id
	PmsLeavesApprover getApprovalInfo(PmsLeavesApprover pmsLeavesApprover);
}
