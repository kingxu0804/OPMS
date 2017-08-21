package com.opms.mappers;

import java.util.List;

import com.opms.entity.PmsMessages;
import com.opms.entity.PmsNotices;
/**
 * 
 * description:消息表的操作
 * @author liyanpeng
 * @date 2017年7月30日
 */
public interface PmsMessagesMapper {

	
	/**
	 * description:返回所有个人的消息信息
	 * @author liyanpeng
	 * @date 2017年7月30日
	 */
	List< PmsMessages> listPmsMessages(long userid);

	/**
	 * description:插入一条消息
	 * @author liyanpeng
	 * @date 2017年7月30日
	 */	
	int addPmsMessages(PmsMessages message);
	
   
	
	/**
	 * description:查看本人未读信息的条数
	 * @author liyanpeng
	 * @date 2017年7月28日
	 */
	public int countNotices(long userid);
	
	/**
	 * 
	 * description:查看本人未读信息的集合
	 * @author liyanpeng
	 * @date 2017年7月29日
	 */
	List< PmsMessages> listPmsMessagesNoView(long userid);
	
	/**
	 * 
	 * description:删除此条消息记录
	 * @author liyanpeng
	 * @date 2017年7月29日
	 */
	public int deletePmsMessages(long msgid);
}