/**
 * 
 */
package com.opms.unti;

import java.util.HashMap;
import java.util.Map;

/**
 * description:
 * @author liyanpeng
 * @date 2017年8月11日
 */
public class MessageType {
	public static final Map<Integer, String> type=new HashMap<Integer, String>();
	public static final int COMMENT=1;
	public static final String COMMENT_text="评论了";
	public static final int PRAISE=2;
	public static final String PRAISE_text="赞了";
	public static final int APPROVE=3;
	public static final String APPROVE_text="审批了";
	public static final String APPROVE_TITLE="去审批处理";
	public static final String APPROVE_AGREE="同意";
	public static final String APPROVE_REFUSE="拒绝";
	public static final int NOTICE=4;
	public static final int KNOWLEDGE_COMMENT=11;
	public static final int PHOTO_COMMENT=12;
	public static final int KNOWLEDGE_PRAISE=21;
	public static final int PHOTO_PRAISE=22;
	public static final int LEAVE_APPROVE1=311;
	public static final int LEAVE_APPROVE2=312;
	public static final int OVERTIME_APPROVE1=321;
	public static final int OVERTIME_APPROVE2=322;
	public static final int APPLY_APPROVE1=331;
	public static final int APPLY_APPROVE2=332;
	public static final int EVECTION_APPROVE1=341;
	public static final int EVECTION_APPROVE2=342;
	public static final int GOOUT_APPROVE1=351;
	public static final int GOOUT_APPROVE2=352;
	public static final int GOODS_APPROVE1=361;
	public static final int GOODS_APPROVE2=362;
	static{
		type.put(4, "发布了新公告");
		type.put(11, "评论了知识");
		type.put(12, "评论了相册");
		type.put(21, "赞了知识");
		type.put(22, "赞了相册");
		type.put(312, "审批了加班");
		type.put(311, "新增了加班");
		type.put(322, "审批了报销");
		type.put(321, "新增了加班");
		type.put(332, "审批了报销");
		type.put(331, "新增了报销");
		type.put(342, "审批了物品");
		type.put(341, "新增了物品");
		type.put(352, "审批了外出");
		type.put(351, "新增了外出");
		type.put(362, "审批了物品");
		type.put(361, "新增了物品");
	}
}
