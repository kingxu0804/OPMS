package com.opms.service.impl;
import com.opms.entity.PmsLeaves;
import com.opms.entity.PmsLeavesApprover;
import com.opms.entity.PmsUserManageApproval;
import com.opms.entity.PmsUsersProfileDepartPostion;
import com.opms.mappers.PmsLeavesApproverMapper;
import com.opms.mappers.PmsLeavesMapper;
import com.opms.service.LeaveService;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LeaveServiceImpl implements LeaveService {
	@Autowired
	private PmsLeavesMapper pmsLeavesMapper;
	@Autowired
	private PmsLeavesApproverMapper pmsLeavesApproverMapper;
	
	

	public List<PmsLeaves> listLeave(PmsLeaves pmsLeaves) {
		return pmsLeavesMapper.listselectAllLeave(pmsLeaves);
	}

	// 插入请假信息
	@Override
	public int insertLeave(PmsLeaves pmsLeaves) {
		int flag = pmsLeavesMapper.insertSelective(pmsLeaves);
		return 0;
	}

	@Override
	public PmsLeaves getleaveInfo(Long leaveid) {

		return pmsLeavesMapper.selectByPrimaryKey(leaveid);
	}

	// 根据条件搜索请假信息
	@Override
	public List<PmsLeaves> listSearchLeave(PmsLeaves pmsLeaves) {
		return pmsLeavesMapper.selectLeavesInfo(pmsLeaves);
	}

	/**
	 * 修改请假信息
	 */
	@Override
	public int updateLeaveInfo(PmsLeaves pmsleaves) {
		return pmsLeavesMapper.updateByPrimaryKeySelective(pmsleaves);
	}

	
	//删除请假信息
	@Override
	public int deleteLeave(long leaveid) {
		
		return pmsLeavesMapper.deleteByPrimaryKey(leaveid);
	}
//更改请假状态为正常
	@Override
	public int updateStatus(long leaveid) {
		
		return pmsLeavesMapper.updateStatusbyid(leaveid);
	}
   //获取请假信息详情
	@Override
	public PmsLeaves getLeaveDetail(long leaveid) {
		
		return pmsLeavesMapper.selectByPrimaryKey(leaveid);
	}
//查询请假总数
	@Override
	public int selectCount(PmsLeaves pmsLeaves) {
		return pmsLeavesMapper.selectCount(pmsLeaves);
	}

	//获取已请假时间段
	@Override
	public List<PmsLeaves> listSearchLeaveDate(long userid) {
		return pmsLeavesMapper.listSearchLeaveDate(userid);
	}
//查询员工审批人信息
	@Override
	public List<PmsUserManageApproval> listUserManageInfo(long userid) {
		return pmsLeavesMapper.listUserManageInfo( userid) ;
	}
   //添加请假信息后添加审批人的信息
	@Override
	public int listAddApproverInfo(PmsLeavesApprover pmsLeavesApprover) {
		return pmsLeavesApproverMapper.insertSelective(pmsLeavesApprover);
	}
//获取待审批的请假信息  
	@Override
	public List<PmsLeaves> getApprovalLeave(long userid) {
		
		return pmsLeavesMapper.listSelectUnApproval(userid);
	}
   //根据id查询部门职称等信息
	@Override
	public PmsUsersProfileDepartPostion selectUsersProfileDepartPostion(long userid) {
		return pmsLeavesMapper.selectUsersProfileDepartPostion(userid);
	}
   //获取请假事件的审批人审批状态信息
	@Override
	public List<PmsLeavesApprover> listApprovalInfo(long leaveid) {
	
		return pmsLeavesApproverMapper.listApprovalInfo(leaveid);
	}
   //查找此案件的审批人信息和审批状态
	@Override
	public PmsUserManageApproval selectApprovalUserInfo(PmsLeavesApprover pmsLeavesApprover) {
		return pmsLeavesMapper.selectApprovalUserInfo( pmsLeavesApprover);
	}
  //审批一个案件信息
	@Override
	public int updateLeaveApprovalInfo(PmsLeavesApprover pmsLeavesApprover) {
		// TODO Auto-generated method stub
		return pmsLeavesApproverMapper.updateByPrimaryKeySelective(pmsLeavesApprover);
	}
//根据用户id和请假事件id查询审批时间详情
	@Override
	public PmsLeavesApprover getApprovalInfo(PmsLeavesApprover pmsLeavesApprover) {
		
		return pmsLeavesApproverMapper.getApprovalInfo( pmsLeavesApprover);
	}

}
