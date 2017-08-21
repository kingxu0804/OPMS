package com.opms.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.opms.entity.PmsAlbums;
import com.opms.entity.PmsKnowledgesUser;
import com.opms.entity.PmsUserPms;
import com.opms.entity.PmsUsers;
import com.opms.entity.PmsUsersProfileDepartPostion;
import com.opms.service.AlbumsService;
import com.opms.service.HomePageService;
import com.opms.service.KnowledgeService;
/**
 * 
 * @author lizhen
 * @data 2017年8月8日下午5:10:22
 * @tags  我的主页
 */
@Controller
public class MyHomePageControl {
@Autowired	
private HomePageService homePageService;
private AlbumsService albumsService;
private List<PmsKnowledgesUser>  listPmsKnowledgesUser=new ArrayList<PmsKnowledgesUser>();
/**
 * 
 * description:我的主页
 */
@RequestMapping("user_index")
public String user_index()
{
	return "user_index";
}
/**
 * 
 * description:查看我的个人信息
 */
@RequestMapping("myInfo")
public void myInfo(HttpServletRequest Request,HttpSession session,HttpServletResponse resp)
{
	PmsUsers user=(PmsUsers) session.getAttribute("user");
	Long userid=user.getUserid();
	
	PmsUsersProfileDepartPostion pmsUsersProfileDepartPostion=
			new PmsUsersProfileDepartPostion();
	pmsUsersProfileDepartPostion=homePageService.selectUsersProfileDepartPostion(userid);
    System.out.println("pmsUsersProfileDepartPostion="+pmsUsersProfileDepartPostion);
	PrintWriter pw=null;
	try {
		 Request.setCharacterEncoding("utf-8");
		 resp.setCharacterEncoding("utf-8");
		 pw=resp.getWriter();
		 pw.write(JSONArray.toJSONString(pmsUsersProfileDepartPostion));
	} catch (IOException e) {
		
		e.printStackTrace();
	}
	finally{
		if(pw!=null)
		{
			pw.close();
		}
	}
}
/**
 * 
 * description:我的相册
 */
@RequestMapping("mygallery")
public void mygallery(HttpServletRequest req,HttpServletResponse resp,HttpSession session)
{
	PmsUsers user=(PmsUsers) session.getAttribute("user");
	long userid=user.getUserid();
	
	List<PmsAlbums> list = homePageService.listAlbumsByUserid(user.getUserid());
	System.err.println("list="+list.size());
	resp.setCharacterEncoding("utf-8");
	PrintWriter pw=null;
	try {
		pw=resp.getWriter();
		System.out.println(JSONArray.toJSONString(list));
		pw.write(JSONArray.toJSONString(list));
	} catch (IOException e) {
		
		e.printStackTrace();
	}
	finally{
		if(pw!=null)
		{
			pw.close();
		}
	}
	
}
/**
 * 
 * description:相册详细信息
 */
/*@RequestMapping("getAlbums")
public void getAlbums(HttpServletRequest request,HttpServletResponse resp)
{
	PmsAlbums pmsAlbums = albumsService.getAlbums(albumid);
    int viewnum=pmsAlbums.getViewnum()+1;
    pmsAlbums.setViewnum(viewnum);
    int flag=albumsService.updateViewnum(pmsAlbums);
	if(flag != 0){
		model.addAttribute("pmsAlbums", pmsAlbums);
		return "album_detail";
	}else{
		return "404";
	}
	

	
	
}
	*/

	

}
