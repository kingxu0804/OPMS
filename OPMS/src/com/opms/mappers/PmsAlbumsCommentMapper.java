package com.opms.mappers;

import com.opms.entity.PmsAlbumsComment;
import com.opms.entity.PmsAlbumsCommentAndUsers;

import java.util.List;

public interface PmsAlbumsCommentMapper {
	//根据相片id查询相片评论
	List<PmsAlbumsCommentAndUsers> listCommentByAlbumid(Long albumid);
	//添加评论
	int insertComment(PmsAlbumsComment PmsAlbumsComment);
}