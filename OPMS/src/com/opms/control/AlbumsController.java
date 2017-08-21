package com.opms.control;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.opms.entity.PmsAlbums;
import com.opms.entity.PmsAlbumsComment;
import com.opms.entity.PmsAlbumsCommentAndUsers;
import com.opms.entity.PmsAlbumsLaud;
import com.opms.entity.PmsMessages;
import com.opms.entity.PmsUserPms;
import com.opms.entity.PmsUsers;
import com.opms.service.AlbumsService;
import com.opms.service.OrganizationService;
import com.opms.unti.IntDate;
import com.opms.unti.MessageType;
/**
 * @author mengyongfei
 * @date 2017年7月30日 下午4:44:05
 * 控制层
 */
@Controller
public class AlbumsController {
	
	
	@Autowired
	private AlbumsService albumsService;
	@Autowired
	private OrganizationService organizationService;
	
	//查询所有相册信息
	@RequestMapping("/listAlbums{pageNum}")
	public String listAlbums(Model model,@RequestParam(required=true,defaultValue="1") Integer pageNum,@RequestParam(required=false,defaultValue="12") Integer pageSize,HttpSession session){
		PageHelper.startPage(pageNum, pageSize);
		PmsUsers user=(PmsUsers) session.getAttribute("user");	
		List<PmsAlbums> list = albumsService.listAlbums(user.getUserid());//查询出不包括自己的未屏蔽的相片信息
		List<PmsAlbums> useridlist = albumsService.listAlbumsByUserid(user.getUserid());//查询自己的相片信息
		for(PmsAlbums pmsAlbums:useridlist){
			list.add(pmsAlbums);
		}
		PageInfo<PmsAlbums> pageInfo = new PageInfo<PmsAlbums>(list);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		return "album_manage";
	}
	
	//根据userid查询所有相册信息
	@RequestMapping("/listAlbumsByUserid")
	public String listAlbumsByUserid(Model model, @RequestParam(required=true,defaultValue="1") Integer pageNum,@RequestParam(required=false,defaultValue="12") Integer pageSize,HttpSession session){
		PageHelper.startPage(pageNum, pageSize);		
		PmsUsers user=(PmsUsers) session.getAttribute("user");	
		List<PmsAlbums> list = albumsService.listAlbumsByUserid(user.getUserid());
		PageInfo<PmsAlbums> pageInfo = new PageInfo<PmsAlbums>(list);
		model.addAttribute("list", list);
		model.addAttribute("message", "me");
		model.addAttribute("pageInfo", pageInfo);
		return "album_manage";
	}
	
	//图片上传的JSP跳转
	@RequestMapping("/toUpload")
	public String toUpload(){
		return "upload_photo";
	}
	
	//测试多文件上传  添加相片信息
	@RequestMapping("/insertAlbums")
	public void insertAlbums(PmsAlbums pmsAlbums,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		int flag = 0;
		PmsUsers user = (PmsUsers)session.getAttribute("user");
		IntDate id = new IntDate();
		Long albumid = id.getTimeStampLongDate();
		pmsAlbums.setAlbumid(albumid);
		pmsAlbums.setUserid(user.getUserid());//这里先和相册ID设置一样,本应该获取session用户的ID的
		pmsAlbums.setTitle("OPMS");
		pmsAlbums.setKeywords("测试");
		pmsAlbums.setSummary("测试用例");
		pmsAlbums.setViewnum(0);
		pmsAlbums.setComtnum(0);
		pmsAlbums.setLaudnum(0);
		java.util.Date date = new java.util.Date();
		Timestamp created = new Timestamp(date.getTime());
		pmsAlbums.setCreated(created);
		pmsAlbums.setStatus(1);
		//创建一个通用的多部分解析器 
		CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getServletContext());
		//判断 request 是否有文件上传,即多部分请求
		if(resolver.isMultipart(request)){
			//转换成多部分request
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
			//取出一个list的multipartfile
			List<MultipartFile> list = multipartRequest.getFiles("files");
			for (MultipartFile file : list) {
				if(file!=null){
					//取得当前上传文件的文件名称
					String originalFilename = file.getOriginalFilename();
					//如果名称不为“”,说明该文件存在，否则说明该文件不存在
					if(originalFilename.trim()!=""){
						//图片的原始名称（不含路径）  
						String random = UUID.randomUUID().toString().replace("-", "");
						String newFileName = random+file.getOriginalFilename().substring(originalFilename.lastIndexOf("."));  
						//定义上传路径
						String path = request.getServletContext().getRealPath("\\uploadImg")+"\\"+newFileName;
						File localFile = new File(path);
						file.transferTo(localFile);
						pmsAlbums.setPicture(newFileName);
					}
				}
			}
		}
		flag = albumsService.insertAlbums(pmsAlbums);
		Map<String, Object> map = new HashMap<>();
		map.put("message", flag);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(JSONArray.toJSONString(map));
		/*if(flag>0){
			return "404";
		}else{
			return "404";
		}*/
	}
	
	//获得一个相片的全部信息
		@RequestMapping("/getAlbums{albumid}")
		public String getAlbumes(@PathVariable Long albumid,Model model){
			PmsAlbums pmsAlbums = albumsService.getAlbums(albumid);
		    int viewnum=pmsAlbums.getViewnum()+1;
		    pmsAlbums.setViewnum(viewnum);
		    int flag=albumsService.updateViewnum(pmsAlbums);
		    List<PmsAlbumsCommentAndUsers> Commentlist = albumsService.listCommentByAlbumid(albumid);			
		    if(flag != 0){
				model.addAttribute("pmsAlbums", pmsAlbums);
				if(Commentlist.size()!=0){
					model.addAttribute("Commentlist", Commentlist);
				}				
				return "album_detail";
			}else{
				return "404";
			}
		}
	@RequestMapping("deleteAlbums")
	public void deleteAlbums(@RequestParam Long albumid,HttpServletResponse response) throws Exception{
		int flag = albumsService.deleteByPrimaryKey(albumid);
		Map<String, Object> map = new HashMap<>();
		map.put("flag", flag);
		map.put("message", "删除成功");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(JSONArray.toJSONString(map));
	}
	//根据相片id修改标题，说明，状态
		@RequestMapping("updateAlbums")
		public void updateAlbums(PmsAlbums pmsAlbums,HttpServletResponse response) throws IOException{
			System.out.println(pmsAlbums);
			int flag=albumsService.updateAlbums(pmsAlbums);
			//System.out.println(flag);
			Map<String, Object> map = new HashMap<>();
			map.put("code", flag);
			map.put("message", "修改成功");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(JSONArray.toJSONString(map));
		}
		//点赞
		@RequestMapping("laudAlbums")
		public void laudAlbumid(@RequestParam Long albumid,HttpSession session,HttpServletResponse resp){
			Map<String,Object> map=new HashMap<String,Object>();
			PmsUsers user=(PmsUsers) session.getAttribute("user");
			PmsAlbums pmsAlbums = albumsService.getAlbums(albumid);
			PmsAlbumsLaud pmsAlbumslaud=new PmsAlbumsLaud();
			pmsAlbumslaud.setAlbumid(albumid);
			pmsAlbumslaud.setStatus(pmsAlbums.getStatus());
			pmsAlbumslaud.setUserid(user.getUserid());
			IntDate id = new IntDate();
			Long laudid = id.getTimeStampLongDate();
			java.util.Date date = new java.util.Date();
			Timestamp created = new Timestamp(date.getTime());
			pmsAlbumslaud.setLaudid(laudid);
			pmsAlbumslaud.setCreated(created);
			System.out.println(pmsAlbumslaud);
			int coda=albumsService.countLaud(pmsAlbumslaud);
			if(coda==0){
				int flag=albumsService.laudAlbums(pmsAlbumslaud);
				if(flag!=0){
					pmsAlbums.setLaudnum(pmsAlbums.getLaudnum()+1);
					int f=albumsService.updateLaudnum(pmsAlbums);
					if(f!=0){
						map.put("message", "点赞成功");
						map.put("laudnum", pmsAlbums.getLaudnum());
					}
				}
			}else{
				map.put("message","已经点过赞了");
			}
			try {
				resp.setCharacterEncoding("utf-8");
				resp.getWriter().print(JSONArray.toJSONString(map));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			PmsMessages message=new PmsMessages(user.getUserid(), MessageType.PRAISE, MessageType.PHOTO_PRAISE, pmsAlbums.getTitle(), "getAlbums?albumid="+pmsAlbums.getAlbumid());
			PmsUserPms user1=new PmsUserPms();
			PmsUsers us = new PmsUsers();
			us.setUserid(pmsAlbums.getUserid());
			user1.setPmsUsers(us);
			List<PmsUserPms> userlist=new ArrayList<PmsUserPms>();
			userlist.add(user1);
			organizationService.addPmsMessages(message, userlist);
			
		}
		//根据相片id添加评论
		@RequestMapping("insertComment")
		public void insertComment(PmsAlbumsComment PmsAlbumsComment,HttpSession session,HttpServletResponse resp){
			System.out.println(PmsAlbumsComment);
			Map<String,Object> map=new HashMap<String,Object>();
			PmsAlbums pmsAlbums =null;
			IntDate id = new IntDate();
			Long comtid = id.getTimeStampLongDate();
			PmsAlbumsComment.setComtid(comtid);
			java.util.Date date = new java.util.Date();
			Timestamp created = new Timestamp(date.getTime());//获取当前时间
			PmsAlbumsComment.setCreated(created);
			PmsUsers user=(PmsUsers) session.getAttribute("user");
			PmsAlbumsComment.setUserid(user.getUserid());
			int flag=albumsService.insertComment(PmsAlbumsComment);
			if(flag!=0){
				pmsAlbums = albumsService.getAlbums(PmsAlbumsComment.getAlbumid());
				pmsAlbums.setComtnum(pmsAlbums.getComtnum()+1);
				int f=albumsService.updateComtnum(pmsAlbums);
				if(f!=0){
					List<PmsAlbumsCommentAndUsers> Commentlist = albumsService.listCommentByAlbumid(PmsAlbumsComment.getAlbumid());
					map.put("message", "评论成功");
					map.put("Commentlist", Commentlist);
					map.put("comtnum", pmsAlbums.getComtnum());
				}
			}else{
				map.put("message", "评论失败");
			}
			try {
				resp.setCharacterEncoding("utf-8");
				resp.getWriter().print(JSONArray.toJSONString(map));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			PmsMessages message=new PmsMessages(user.getUserid(), MessageType.COMMENT, MessageType.PHOTO_COMMENT, pmsAlbums.getTitle(), "getAlbums?albumid="+pmsAlbums.getAlbumid());
			PmsUserPms user1=new PmsUserPms();
			PmsUsers us = new PmsUsers();
			us.setUserid(pmsAlbums.getUserid());
			user1.setPmsUsers(us);
			List<PmsUserPms> userlist=new ArrayList<PmsUserPms>();
			userlist.add(user1);
			organizationService.addPmsMessages(message, userlist);			
		}
	
}
