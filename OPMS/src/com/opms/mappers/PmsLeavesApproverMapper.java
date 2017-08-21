package com.opms.mappers;

import java.util.List;

import com.opms.entity.PmsLeavesApprover;

public interface PmsLeavesApproverMapper {


    int deleteByPrimaryKey(Long approverid);

    int insert(PmsLeavesApprover record);

    int insertSelective(PmsLeavesApprover record);


    PmsLeavesApprover selectByPrimaryKey(Long approverid);



    int updateByPrimaryKeySelective(PmsLeavesApprover record);

    int updateByPrimaryKey(PmsLeavesApprover record);
    //获取请假事件审批人的审批状态
    List<PmsLeavesApprover> listApprovalInfo(long leaveid);
    //审批一个人的请假信息
    int updateLeaveApprovalInfo(PmsLeavesApprover pmsLeavesApprover);
    //根据用户id和请假事件id查询，审批事件详情
    PmsLeavesApprover getApprovalInfo(PmsLeavesApprover pmsLeavesApprover);
}