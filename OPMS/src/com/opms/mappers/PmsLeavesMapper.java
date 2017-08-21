package com.opms.mappers;

import com.opms.entity.PmsLeaves;
import com.opms.entity.PmsLeavesApprover;
import com.opms.entity.PmsUserManageApproval;
import com.opms.entity.PmsUsersProfileDepartPostion;

import java.sql.Date;
import java.util.List;
public interface PmsLeavesMapper {


    int deleteByPrimaryKey(Long leaveid);

    int insert(PmsLeaves record);

    int insertSelective(PmsLeaves record);


    PmsLeaves selectByPrimaryKey(Long leaveid);

    //查询请假总数
    int selectCount(PmsLeaves pmsLeaves);

    int updateByPrimaryKeySelective(PmsLeaves record);

    int updateByPrimaryKey(PmsLeaves record);
    
    List<PmsLeaves> selectLeavesInfo(PmsLeaves record);
    //查询所有请假信息
    List<PmsLeaves> listselectAllLeave(PmsLeaves pmsLeaves);
    //查询未审批请假信息
    List<PmsLeaves> listSelectUnApproval(long userid);
    //修改案件状态
    int updateStatusbyid(long leaveid);
    //获取已请假时间段集合
    List<PmsLeaves> listSearchLeaveDate(long userid);
    //查询员工审批人信息
    List<PmsUserManageApproval> listUserManageInfo(long userid);
    //根据id查询部门名称职称
    PmsUsersProfileDepartPostion selectUsersProfileDepartPostion(long userid);
  //查找此案件审批人信息和审批状态
  	PmsUserManageApproval selectApprovalUserInfo(PmsLeavesApprover pmsLeavesApprover);
	
}