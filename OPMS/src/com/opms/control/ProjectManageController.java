package com.opms.control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.opms.entity.NeedSearch;
import com.opms.entity.PmsProjects;
import com.opms.entity.PmsProjectsDoc;
import com.opms.entity.PmsProjectsNeeds;
import com.opms.entity.PmsProjectsTask;
import com.opms.entity.PmsProjectsTaskLog;
import com.opms.entity.PmsProjectsTeam;
import com.opms.entity.PmsProjectsTest;
import com.opms.entity.PmsProjectsVersion;
import com.opms.entity.PmsUsers;
import com.opms.entity.TaskSearch;
import com.opms.mappers.PmsUsersMapper;
import com.opms.service.ProjectService;
import com.opms.service.impl.ProjectServiceImpl;
import com.opms.unti.IntDate;
import com.opms.unti.ProjectNeed;
import com.opms.unti.ProjectState;
import com.opms.unti.ProjectTask;
import com.opms.unti.TimeDate;

@Controller
public class ProjectManageController {
	@Autowired
	private ProjectService projectService;
	@Autowired
	private PmsUsersMapper pmsUsersMapper;

	private static Long projectId;
	/**
	 * description 
	 * 
	 *  检查项目名称是否重命名
	 * @author xukang
	 * @throws UnsupportedEncodingException 
	 * @time 2017年8月7日
	 */
	@RequestMapping("/CheckedProjectname")
	public void CheckedProjectname(String projectname,HttpServletResponse resp) throws UnsupportedEncodingException{
		projectname=new String(projectname.getBytes("ISO-8859-1"),"utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter writer=null;
		String str=null;
		try {
			writer = resp.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		if(projectService.checkedProjectname(projectname)==1){
			str="1";
		 }else{
			 str="0";
		 }
		 String string = JSON.toJSONString(str);
		 writer.write(string);
	}
	/**
	 * <p>Description:
	 *   检索项目
	 * </p>
	 * @author quanhuan
	 * @time  2017年8月5日下午9:05:06
	 */
	@RequestMapping("/searchProject")
	public String searchProject(Model model,PmsProjects pmsProjects){
		List<PmsProjects> list = projectService.searchProject(pmsProjects);
		model.addAttribute("listProject", list);
		model.addAttribute("count", list.size());
		return "project_manage";
	}
	
	
	/**
	 * <p>
	 * Description:  获取所有的项目信息
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年8月5日下午9:05:06
	 */
	@RequestMapping("/listProjectInfo")
	public String listProjectInfo(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		PmsUsers user = (PmsUsers) session.getAttribute("user");
		List<PmsProjects> list = projectService.listPmsProjects(user.getUserid());
		model.addAttribute("listProject", list);
		model.addAttribute("count", list.size());
		return "project_manage";
	}

	/**
	 * <p>
	 * Description: 获取一条编辑项目的信息
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年7月28日上午10:44:08
	 */
	@RequestMapping("/getEditProjectInfo")
	public String getEditProjectInfo(Model model, Long projectid) {
		model.addAttribute("project", projectService.getPmsProjects(projectid));
		List<PmsProjectsTeam> teamMesg = projectService.listTeamMesg(projectid);
		model.addAttribute("teamMesg", teamMesg);
		return "edit_project_manage";
	}
	
	/**
	 * <p>
	 * Description: 获取一条项目的信息
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年7月30日下午4:05:10
	 */
	@RequestMapping("/getProjectInfo")
	public String getProjectInfo(Model model, Long projectid) {
		model.addAttribute("project", projectService.getPmsProjects(projectid));
		return "project_detail";
	}

	/**
	 * description:获取团队成员
	 *
	 * @author hulingtao
	 * @time 2017年7月28日
	 */
	@RequestMapping("/listTeamMesg")
	public String ListTeamMesg(Long projectid, HttpServletRequest req) {
		projectId = projectid;
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectid);
		req.setAttribute("listTeamMesg", listTeamMesg);
		req.setAttribute("projectid", projectid);
		return "project_team";
	}

	/**
	 * description:删除团队成员
	 *
	 * @author hulingtao
	 * @time 2017年7月28日
	 */
	@RequestMapping("deleteMember{userid}")
	public String deleteMember(@PathVariable Long userid, HttpServletRequest req) {
		projectService.deleteMember(userid);
		Long projectid = projectId;
		req.setAttribute("projectid", projectid);
		return "redirect:/listTeamMesg?projectid=" + projectid;
	}

	/**
	 * description:验证是否有权限添加成员
	 *
	 * @author hulingtao
	 * @throws Exception 
	 * @throws ServletException 
	 * @time 2017年7月28日
	 */
	@RequestMapping("/addTeamAjax")
	public void toAddTeam(Long id,HttpSession session,HttpServletResponse resp,HttpServletRequest req) throws ServletException, Exception {
		Long projectid = projectId;
		PmsProjects pmsProjects = projectService.getPmsProjects(projectid);
		String jsonData = "";
		PmsUsers user = (PmsUsers)session.getAttribute("user");
		if(user.getUserid().equals(pmsProjects.getUserid())){
			jsonData = "{\"code\":1}";
		}else{
			jsonData = "{\"message\":\"你没有该权限！！！\",\"code\":0}";
		}
		resp.setContentType("text/html;charset=utf8");
		resp.getWriter().write(jsonData);
	}
	/**
	 *description:跳转到添加成员页面
	 *@author hulingtao
	 *@time 2017年8月9日 
	 */
	@RequestMapping("/toAddTeam")
	public String toAddTeam(HttpServletRequest req){
		req.setAttribute("projectid", projectId);
		return "add_project_team";
	}

	/**
	 *description:添加时验证是否存在该用户
	 *@author hulingtao
	 *@time 2017年8月9日 
	 */
	@RequestMapping("/teamAjax")
	public void teamAjax(PmsProjectsTeam team,HttpServletResponse resp){
		String jsondata = "";
		team.setProjectid(projectId);
		int flag=projectService.addTeamMember(team,projectId);
		switch (flag) {
		case 1:
			jsondata="{\"message\":\"添加成员成功\",\"code\":1}";
			break;
		case 0:
			jsondata="{\"message\":\"添加成员失败\",\"code\":0}";
			break;
		case -1:
			jsondata="{\"message\":\"此员工不存在，请检查后提交\",\"code\":0}";
			break;
		case -2:
			jsondata="{\"message\":\"此员工已是团队成员,不能重复提交\",\"code\":0}";
			break;
		}
		resp.setContentType("text/html;charset=utf8");
		try {
			resp.getWriter().write(jsondata);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 *description:添加团队成员
	 *@author hulingtao
	 *@time 2017年8月9日 
	 *//*
	@RequestMapping("/addTeamMember")
	public String addTeamMember(String username){
		Long projectid = projectId;
		PmsProjectsTeam team = new PmsProjectsTeam();
		team.setUsername(username);
		team.setProjectid(projectid);
		projectService.addTeamMember(team);
		return "redirect:/listTeamMesg?projectid=" + projectid;
	}*/
	
	/**
	 * description:跳转到团队需求页面
	 *
	 * @author hulingtao
	 * @time 2017年7月28日
	 */
	@RequestMapping("/toProjectNeed")
	public String toProjectNeed(Long projectid, HttpServletRequest req) {
		projectId = projectid;
		List<PmsProjectsNeeds> listProjectNeed = projectService
				.listProjectNeed(projectid);
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectid);
		req.setAttribute("listProjectNeed", listProjectNeed);
		req.setAttribute("listTeamMesg", listTeamMesg);
		req.setAttribute("projectid", projectid);
		return "project_need";
	}

	/**
	 * description:跳转到修改需求页面
	 *
	 * @author hulingtao
	 * @time 2017年7月28日
	 */
	@RequestMapping("/toChangeNeed{needsid}")
	public String toChangeNeed(@PathVariable Long needsid,
			HttpServletRequest req) {
		PmsProjectsNeeds projectNeed = projectService.getProjectNeed(needsid);
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectId);
		req.setAttribute("projectNeed", projectNeed);
		req.setAttribute("listTeamMesg", listTeamMesg);
		req.setAttribute("projectid", projectId);
		return "edit_project_need";
	}

	/**
	 *description:修改需求
	 *@author hulingtao
	 *@time 2017年8月12日 
	 */
	@RequestMapping("/editNeedAjax")
	public void editNeedAjax(PmsProjectsNeeds need,HttpServletResponse resp,HttpServletRequest request){
		String jsonData = "";
		if(projectService.getProjectNeed(need.getNeedsid()).getStatus() == 5){
			jsonData="{\"message\":\"该需求已关闭，不能修改！！！\",\"code\":0}";
		}else{
			jsonData="{\"code\":1}";
			// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
					request.getServletContext());
			// 检查form中是否有enctype="multipart/form-data"
			if (multipartResolver.isMultipart(request)) {
				// 将request变成多部分request
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				// 获取multiRequest 中所有的文件名
				Iterator iter = multiRequest.getFileNames();
				while (iter.hasNext()) {
					// 一次遍历所有文件
					MultipartFile file = multiRequest.getFile(iter.next()
							.toString());
					if (file != null) {
						String path = request.getServletContext().getRealPath("\\uploadFile")+"\\"+new Random().nextInt(100)+file.getOriginalFilename();
						need.setAttachment(path);
						// 上传
						try {
							file.transferTo(new File(path));
						} catch (Exception e) {
							e.printStackTrace();
						}
					}

				}
			}
			need.setChanged(new Date());
			projectService.updateNeed(need);
		}
		resp.setContentType("text/html;charset=utf8");
		try {
			resp.getWriter().write(jsonData);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * description:更新项目需求
	 *
	 * @author hulingtao
	 * @time 2017年7月30日
	 */
	@RequestMapping("/updateNeed")
	public String updateNeed(PmsProjectsNeeds needs, HttpServletRequest request) {
		Long projectid = needs.getProjectid();
		if (projectid == null) {
			return "error.jsp";
		}
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getServletContext());
		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 获取multiRequest 中所有的文件名
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 一次遍历所有文件
				MultipartFile file = multiRequest.getFile(iter.next()
						.toString());
				if (file != null) {
					String path = request.getServletContext().getRealPath("\\uploadFile")+"\\"+new Random().nextInt(100)+file.getOriginalFilename();
					needs.setAttachment(path);
					// 上传
					try {
						file.transferTo(new File(path));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

			}
		}
		needs.setChanged(new Date());
		projectService.updateNeed(needs);
		return "redirect:/toProjectNeed?projectid=" + projectid;
	}
	/**
	 *description:跳转添加需求界面
	 *@author hulingtao
	 *@time 2017年7月30日 
	 */
	@RequestMapping("/toAddNeed")
	public String toAddNeed(HttpServletRequest req){
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectId);
		req.setAttribute("listTeamMesg", listTeamMesg);
		return "add_project_need";
	}
	/**
	 *description:添加需求
	 *@author hulingtao
	 *@time 2017年7月30日 
	 */
	@RequestMapping("/insertNeed")
	public String insertNeed(PmsProjectsNeeds needs,HttpServletRequest request){
		Long projectid = projectId;
		if (projectid == null) {
			return "error";
		}
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next()
						.toString());
				if (file != null) {
					String path = request.getServletContext().getRealPath("\\uploadFile")+"\\"+new Random().nextInt(100)+file.getOriginalFilename();
					try {
						file.transferTo(new File(path));
						needs.setAttachment(path);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

			}
		}
		needs.setStatus(1);
		needs.setProjectid(projectid);
		needs.setNeedsid(new TimeDate().getTimeStampLongDate());
		PmsUsers user = (PmsUsers)request.getSession().getAttribute("user");
		needs.setUserid(user.getUserid());
		needs.setCreated(new Date());
		needs.setChanged(new Date());
		
		projectService.insertNeed(needs);
		return "redirect:/toProjectNeed?projectid=" + projectid;
	}
	/**
	 *description:根据条件查询需求列表
	 *@author hulingtao
	 *@time 2017年7月30日 
	 */
	@RequestMapping("/searchNeed")
	public String searchNeed(NeedSearch search,HttpServletRequest req){
		Long projectid = projectId;
		/*if(search.getAcceptid()==null&&search.getKeywords()==null
				&&search.getStage()==null&&search.getStatus()==null){
			System.out.println("123");
			return "redirect:/toProjectNeed?projectid="+projectid;
		}*/
		if(search.getKeywords().equals("")){
			search.setKeywords(null);
		}
		search.setProjectid(projectid);
		List<PmsProjectsNeeds> searchNeed = projectService.searchNeed(search);
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectid);
		req.setAttribute("listTeamMesg", listTeamMesg);
		req.setAttribute("listProjectNeed", searchNeed);
		req.setAttribute("projectid", projectid);
		return "project_need";
	}
	/**
	 *description:跳转到需求详情
	 *@author hulingtao
	 *@time 2017年7月31日 
	 */
	@RequestMapping("/toNeedDetail{needsid}")
	public String toNeedDetail(@PathVariable Long needsid,HttpServletRequest req){
		PmsProjectsNeeds projectNeed = projectService.getProjectNeed(needsid);
		Map<Integer, String> statusMap  = new HashMap<Integer,String>();
		for(int i = 0;i<5;i++){
			statusMap.put(i+1, new ProjectNeed().getStatus(i+1));
		}
		req.setAttribute("projectNeed", projectNeed);
		req.setAttribute("statusMap", statusMap);
		return "project_need_detail";
	}
	/**
	 *description:更新项目需求状态
	 *@author hulingtao
	 *@time 2017年8月2日 
	 */
	@RequestMapping("/updateNeedStatus")
	public void updateNeedStatus(int status,long id,HttpServletResponse resp){
		PmsProjectsNeeds need = new PmsProjectsNeeds();
		need.setNeedsid(id);
		need.setStatus(status);
		String jsonData = "";
		PmsProjectsNeeds projectNeed = projectService.getProjectNeed(id);
		if(projectNeed.getStatus() == 5){
			jsonData = "{\"message\":\"该需求已关闭，无法更改\",\"code\":0}"; 
		}else{
			int updateStatus = projectService.updateStatus(need);
			if(updateStatus == 1){
				jsonData = "{\"message\":\"更新状态成功\",\"code\":1}";
			}else{
				jsonData = "{\"message\":\"更新状态失败\",\"code\":0}";
			}
		}
		resp.setContentType("text/html;charset=utf-8");
		try {
			resp.getWriter().write(jsonData);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 *description:跳转到任务界面
	 *@author hulingtao
	 *@time 2017年8月2日 
	 */
	@RequestMapping("/toProjectTask")
	public String toProjectTask(Long projectid,HttpServletRequest req){
		projectId = projectid;
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectid);
		req.setAttribute("listTeamMesg", listTeamMesg);
		List<PmsProjectsTask> listProjectTask = projectService.listProjectTask(projectid);
		req.setAttribute("listProjectTask", listProjectTask);
		List<PmsProjectsNeeds> listProjectNeed = projectService.listProjectNeed(projectid);
		req.setAttribute("listProjectNeed", listProjectNeed);
		req.setAttribute("projectid", projectid);
		return "project_task";
	}
	/**
	 *description:跳转到任务详情界面
	 *@author hulingtao
	 *@time 2017年8月2日 
	 */
	@RequestMapping("/toTaskDetail{taskid}")
	public String toTaskDetail(@PathVariable Long taskid,HttpServletRequest req){
		PmsProjectsTask task = projectService.getTask(taskid);
		Map<Integer, String> statusMap  = new HashMap<Integer,String>();
		for(int i = 0;i<6;i++){
			statusMap.put(i+1, ProjectTask.getStatus(i+1));
		}
		List<PmsProjectsTaskLog> listTaskLog = projectService.listTaskLog(taskid);
		req.setAttribute("listTaskLog", listTaskLog);
		req.setAttribute("statusMap", statusMap);
		req.setAttribute("task", task);
		return "project_task_detail";
	}
	/**
	 *description:更新任务状态
	 *@author hulingtao
	 *@time 2017年8月11日 
	 */
	@RequestMapping("/updateTaskStatus")
	public void updateTaskStatus(int status,long id,HttpServletResponse resp,HttpSession session){
		PmsUsers user = (PmsUsers) session.getAttribute("user");
		PmsProjectsTask task = new PmsProjectsTask();
		task.setTaskid(id);
		task.setStatus(status);
		String jsonData = "";
		PmsProjectsTask task2 = projectService.getTask(id);
		if(task2.getStatus() == 6 || task2.getStatus() == 5){
			jsonData = "{\"message\":\"该任务已关闭或已取消，无法更改\",\"code\":0}"; 
		}else{
			PmsProjectsTaskLog log = new PmsProjectsTaskLog();
			String note = "更改任务状态为"+ProjectTask.getStatus(status);
			log.setTaskid(id);
			log.setNote(note);
			log.setUserid(user.getUserid());
			
			if(status == 6){
				task.setCloseid(user.getUserid());
			}
			if(status == 5){
				task.setCancelid(user.getUserid());
			}
			int updateStatus = projectService.updateTaskStatus(task);
			projectService.insertLog(log);
			if(updateStatus == 1){
				jsonData = "{\"message\":\"更新状态成功\",\"code\":1}";
			}else{
				jsonData = "{\"message\":\"更新状态失败\",\"code\":0}";
			}
		}
		resp.setContentType("text/html;charset=utf-8");
		try {
			resp.getWriter().write(jsonData);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 *description:跳转到修改任务页面
	 *@author hulingtao
	 *@time 2017年8月4日 
	 */
	@RequestMapping("/toEditTask{taskid}")
	public String toEditTask(@PathVariable Long taskid,HttpServletRequest req){
		List<PmsProjectsNeeds> listProjectNeed = projectService.listProjectNeed2(projectId);
		PmsProjectsTask task = projectService.getTask(taskid);
		List<PmsProjectsTeam> listTeamMesg = projectService.listTeamMesg(projectId);
		req.setAttribute("listProjectNeed", listProjectNeed);
		req.setAttribute("task", task);
		req.setAttribute("listTeamMesg", listTeamMesg);
		return "edit_project_task";
	}
	
	/**
	 *description:修改任务
	 *@author hulingtao
	 *@time 2017年8月12日 
	 */
	@RequestMapping("/editTaskAjax")
	public void editTaskAjax(PmsProjectsTask task,HttpServletResponse resp,HttpServletRequest request,HttpSession session){
		PmsUsers user = (PmsUsers) session.getAttribute("user");
		String jsonData = "";
		if(projectService.getTask(task.getTaskid()).getStatus() == 6 || projectService.getTask(task.getTaskid()).getStatus() == 5){
			jsonData="{\"message\":\"该需求已关闭或已取消，不能修改！！！\",\"code\":0}";
		}else{
			jsonData="{\"code\":1}";
			// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
					request.getServletContext());
			if (multipartResolver.isMultipart(request)) {
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				Iterator iter = multiRequest.getFileNames();
				while (iter.hasNext()) {
					MultipartFile file = multiRequest.getFile(iter.next()
							.toString());
					if (file != null) {
						String path = request.getServletContext().getRealPath("\\uploadFile")+"\\"+new Random().nextInt(100)+file.getOriginalFilename();
						try {
							file.transferTo(new File(path));
							task.setAttachment(path);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
			task.setTaskid(new TimeDate().getTimeStampLongDate() + new Random().nextInt(100));
			task.setChanged(new Date());
			projectService.updateTask(task);
			PmsProjectsTaskLog log = new PmsProjectsTaskLog();
			String note = "修改了任务";
			log.setTaskid(task.getTaskid());
			log.setNote(note);
			log.setUserid(user.getUserid());
			projectService.insertLog(log);
			if(task.getCcid() != null){
				String[] split = task.getCcid().split(",");
				for (String string : split) {
					Long ccid = new Long(string);
					task.setAcceptid(ccid);
					task.setCcid(null);
					task.setTaskid(new TimeDate().getTimeStampLongDate() + new Random().nextInt(100));
					projectService.insertTask(task);
					log.setTaskid(task.getTaskid());
					log.setNote(note);
					log.setUserid(user.getUserid());
					projectService.insertLog(log);
				}
			}
		}
		resp.setContentType("text/html;charset=utf8");
		try {
			resp.getWriter().write(jsonData);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 *description:跳转到克隆任务页面
	 *@author hulingtao
	 *@time 2017年8月12日 
	 */
	@RequestMapping("/toCloneTask{taskid}")
	public String toCloneTask(@PathVariable Long taskid,HttpServletRequest req){
		List<PmsProjectsNeeds> listProjectNeed = projectService.listProjectNeed2(projectId);
		PmsProjectsTask task = projectService.getTask(taskid);
		List<PmsProjectsTeam> listTeamMesg = projectService.listTeamMesg(projectId);
		req.setAttribute("listProjectNeed", listProjectNeed);
		req.setAttribute("task", task);
		req.setAttribute("listTeamMesg", listTeamMesg);
		return "project_task_clone";
	}
	
	/**
	 *description:克隆任务
	 *@author hulingtao
	 *@time 2017年8月12日 
	 */
	@RequestMapping("/cloneTask")
	public String cloneTask(PmsProjectsTask task,HttpServletRequest request,HttpSession session){
		PmsUsers user = (PmsUsers) session.getAttribute("user");
		Long projectid = projectId;
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next()
						.toString());
				if (file != null) {
					String path = request.getServletContext().getRealPath("\\uploadFile")+"\\"+new Random().nextInt(100)+file.getOriginalFilename();
					try {
						file.transferTo(new File(path));
						task.setAttachment(path);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		task.setTaskid(new TimeDate().getTimeStampLongDate() + new Random().nextInt(100));
		task.setChanged(new Date());
		projectService.updateTask(task);
		PmsProjectsTaskLog log = new PmsProjectsTaskLog();
		String note = "创建了任务";
		log.setTaskid(task.getTaskid());
		log.setNote(note);
		log.setUserid(user.getUserid());
		projectService.insertLog(log);
		if(task.getCcid() != null){
			String[] split = task.getCcid().split(",");
			for (String string : split) {
				Long ccid = new Long(string);
				task.setAcceptid(ccid);
				task.setCcid(null);
				task.setTaskid(new TimeDate().getTimeStampLongDate() + new Random().nextInt(100));
				projectService.insertTask(task);
				log.setTaskid(task.getTaskid());
				log.setNote(note);
				log.setUserid(user.getUserid());
				projectService.insertLog(log);
			}
		}
		return "redirect:/toProjectTask?projectid="+projectid;
	}
	
	/**
	 *description:跳转到添加任务界面
	 *@author hulingtao
	 *@time 2017年8月4日 
	 */
	@RequestMapping("/toInsertTask")
	public String toInsertTask(HttpServletRequest req){
		Long projectid = projectId;
		List<PmsProjectsNeeds> listProjectNeed = projectService.listProjectNeed2(projectid);
		List<PmsProjectsTeam> listTeamMesg = projectService.listTeamMesg(projectid);
		req.setAttribute("listProjectNeed", listProjectNeed);
		req.setAttribute("listTeamMesg", listTeamMesg);
		req.setAttribute("projectid", projectid);
		return "add_project_task";
	}
	/**
	 *description:检验任务名称是否存在
	 *@author hulingtao
	 *@time 2017年8月10日 
	 */
	@RequestMapping("/isExistTaskname")
	public void isExistTaskname(String name,HttpServletResponse resp){
		int flag = projectService.countTaskByName(name);
		String jsonData = "";
		if(flag == 1){
			jsonData = "{\"message\":\"该任务名称已存在,请重新输入\",\"code\":1}";
		}else{
			jsonData = "{\"code\":0}";
		}
		resp.setContentType("text/html;charset=utf8");
		try {
			resp.getWriter().write(jsonData);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 *description:添加任务
	 *@author hulingtao
	 *@time 2017年8月7日 
	 */
	@RequestMapping("/insertTask")
	public String insertTask(PmsProjectsTask task,HttpServletRequest request,HttpSession session){
		PmsUsers user = (PmsUsers) session.getAttribute("user");
		Long projectid = projectId;
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next()
						.toString());
				if (file != null) {
					String path = request.getServletContext().getRealPath("\\uploadFile")+"\\"+new Random().nextInt(100)+file.getOriginalFilename();
					try {
						file.transferTo(new File(path));
						task.setAttachment(path);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		task.setTaskid(new TimeDate().getTimeStampLongDate() + new Random().nextInt(100));
		projectService.insertTask(task);
		PmsProjectsTaskLog log = new PmsProjectsTaskLog();
		String note = "创建了任务";
		log.setTaskid(task.getTaskid());
		log.setNote(note);
		log.setUserid(user.getUserid());
		projectService.insertLog(log);
		if(task.getCcid() != null && !task.getCcid().equals("")){
			String[] split = task.getCcid().split(",");
			for (String string : split) {
				Long ccid = new Long(string);
				task.setAcceptid(ccid);
				task.setCcid(null);
				task.setTaskid(new TimeDate().getTimeStampLongDate() + new Random().nextInt(100));
				projectService.insertTask(task);
				log.setTaskid(task.getTaskid());
				log.setNote(note);
				log.setUserid(user.getUserid());
				projectService.insertLog(log);
			}
		}
		return "redirect:/toProjectTask?projectid="+projectid;
	}
	/**
	 *description:跳转到批量添加页面
	 *@author hulingtao
	 *@time 2017年8月4日 
	 */
	@RequestMapping("/toInsertTaskbatch")
	public String toInsertTaskbatch(HttpServletRequest req){
		List<PmsProjectsNeeds> listProjectNeed = projectService.listProjectNeed2(projectId);
		List<PmsProjectsTeam> listTeamMesg = projectService.listTeamMesg(projectId);
		req.setAttribute("listProjectNeed", listProjectNeed);
		req.setAttribute("listTeamMesg", listTeamMesg);
		return "add_project_taskbatch";
	}
	/*@RequestMapping("/insertTaskbatch")
	public String insertTaskbatch(List<PmsProjectsTask> listTask){
		for (PmsProjectsTask pmsProjectsTask : listTask) {
			System.out.println(pmsProjectsTask);
		}
		return "redirect:/toProjectTask?projectid="+projectId;
	}*/
	/**
	 *description:查询指派给我
	 *@author hulingtao
	 *@time 2017年8月4日 
	 */
	@RequestMapping("/acceptTome")
	public String acceptTome(HttpServletRequest req){
		Long projectid = projectId;
		HttpSession session = req.getSession();
		PmsUsers user = (PmsUsers)session.getAttribute("user");
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectid);
		req.setAttribute("listTeamMesg", listTeamMesg);
		List<PmsProjectsTask> listProjectTask = projectService.listProjectTaskByUserid(user.getUserid());
		req.setAttribute("listProjectTask", listProjectTask);
		List<PmsProjectsNeeds> listProjectNeed = projectService.listProjectNeed(projectid);
		req.setAttribute("listProjectNeed", listProjectNeed);
		req.setAttribute("projectid", projectid);
		return "project_task";
	}
	/**
	 *description:查询由我创建
	 *@author hulingtao
	 *@time 2017年8月4日 
	 */
	@RequestMapping("/createByme")
	public String createByme(HttpServletRequest req){
		Long projectid = projectId;
		HttpSession session = req.getSession();
		PmsUsers user = (PmsUsers)session.getAttribute("user");
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectid);
		req.setAttribute("listTeamMesg", listTeamMesg);
		List<PmsProjectsTask> listProjectTask = projectService.listProjectTaskByUserid2(user.getUserid());
		req.setAttribute("listProjectTask", listProjectTask);
		List<PmsProjectsNeeds> listProjectNeed = projectService.listProjectNeed(projectid);
		req.setAttribute("listProjectNeed", listProjectNeed);
		req.setAttribute("projectid", projectid);
		return "project_task";
	}
	/**
	 *description:查询由我解决
	 *@author hulingtao
	 *@time 2017年8月4日 
	 */
	@RequestMapping("/solveByme")
	public String solveByme(HttpServletRequest req){
		Long projectid = projectId;
		HttpSession session = req.getSession();
		PmsUsers user = (PmsUsers)session.getAttribute("user");
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectid);
		req.setAttribute("listTeamMesg", listTeamMesg);
		List<PmsProjectsTask> listProjectTask = projectService.listProjectTaskBySolve(user.getUserid());
		req.setAttribute("listProjectTask", listProjectTask);
		List<PmsProjectsNeeds> listProjectNeed = projectService.listProjectNeed(projectid);
		req.setAttribute("listProjectNeed", listProjectNeed);
		req.setAttribute("projectid", projectid);
		return "project_task";
	}
	/**
	 *description:查询由我关闭
	 *@author hulingtao
	 *@time 2017年8月4日 
	 */
	@RequestMapping("/closeByme")
	public String closeByme(HttpServletRequest req){
		Long projectid = projectId;
		HttpSession session = req.getSession();
		PmsUsers user = (PmsUsers)session.getAttribute("user");
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectid);
		req.setAttribute("listTeamMesg", listTeamMesg);
		List<PmsProjectsTask> listProjectTask = projectService.listProjectTaskByClose(user.getUserid());
		req.setAttribute("listProjectTask", listProjectTask);
		List<PmsProjectsNeeds> listProjectNeed = projectService.listProjectNeed(projectid);
		req.setAttribute("listProjectNeed", listProjectNeed);
		req.setAttribute("projectid", projectid);
		return "project_task";
	}
	/**
	 *description:查询由我取消
	 *@author hulingtao
	 *@time 2017年8月4日 
	 */
	@RequestMapping("/displayByme")
	public String displayByme(HttpServletRequest req){
		Long projectid = projectId;
		HttpSession session = req.getSession();
		PmsUsers user = (PmsUsers)session.getAttribute("user");
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectid);
		req.setAttribute("listTeamMesg", listTeamMesg);
		List<PmsProjectsTask> listProjectTask = projectService.listProjectTaskByDisplay(user.getUserid());
		req.setAttribute("listProjectTask", listProjectTask);
		List<PmsProjectsNeeds> listProjectNeed = projectService.listProjectNeed(projectid);
		req.setAttribute("listProjectNeed", listProjectNeed);
		req.setAttribute("projectid", projectid);
		return "project_task";
	}
	/**
	 *description:根据条件查询
	 *@author hulingtao
	 *@time 2017年8月4日 
	 */
	@RequestMapping("/listTaskBySearch")
	public String listTaskBySearch(TaskSearch search,HttpServletRequest req){
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Long projectid = projectId;
		List<PmsProjectsTeam> listTeamMesg = projectService
				.listTeamMesg(projectid);
		req.setAttribute("listTeamMesg", listTeamMesg);
		search.setProjectid(projectid);
		List<PmsProjectsNeeds> listProjectNeed = projectService.listProjectNeed(projectid);
		req.setAttribute("listProjectNeed", listProjectNeed);
		List<PmsProjectsTask> listProjectTask = projectService.listTaskBySearch(search);
		req.setAttribute("listProjectTask", listProjectTask);
		req.setAttribute("projectid", projectid);
		return "project_task";
	}
	
	/**
	 *description:更新任务状态
	 *@author hulingtao
	 *@time 2017年8月4日 
	 */
	@RequestMapping("/beginTask")
	public void beginTask(long taskid,int status,HttpServletResponse resp,HttpSession session){
		PmsUsers user = (PmsUsers)session.getAttribute("user");
		String jsonData = "";
		PmsProjectsTask task2 = projectService.getTask(taskid);
		if(task2.getStatus() == 6 || task2.getStatus() == 5){
			jsonData = "{\"message\":\"该任务已关闭或已取消，不可修改\",\"code\":0}";
		}else{
			if(task2.getStatus() > 1 && status == 2){
				jsonData = "{\"message\":\"该任务已开始\",\"code\":0}";
			}else{
				PmsProjectsTask task = new PmsProjectsTask();
				task.setTaskid(taskid);
				task.setStatus(status);
				if(status == 3){
					task.setCompleteid(user.getUserid());
				}
				int flag = projectService.updateTaskStatus(task);
				PmsProjectsTaskLog log = new PmsProjectsTaskLog();
				String note = "更改任务状态为"+ProjectTask.getStatus(status);
				log.setTaskid(taskid);
				log.setNote(note);
				log.setUserid(user.getUserid());
				projectService.insertLog(log);
				if(flag == 1){
					jsonData = "{\"message\":\"更新状态成功\",\"code\":1}";
				}else{
					jsonData = "{\"message\":\"更新状态失败\",\"code\":0}";
				}
			}
		}
		
		resp.setContentType("text/html;charset=utf-8");
		try {
			resp.getWriter().write(jsonData);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/deleteTask")
	public void deleteTask(long id,HttpServletResponse resp){
		String jsonData = "";
		int flag = projectService.deleteTask(id);
		if(flag == 1){
			jsonData = "{\"message\":\"删除任务成功\",\"code\":1}";
		}else{
			jsonData = "{\"message\":\"删除任务失败\",\"code\":0}";
		}
		resp.setContentType("text/html;charset=utf-8");
		try {
			resp.getWriter().write(jsonData);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 *description:更新指派人
	 *@author hulingtao
	 *@time 2017年8月5日 
	 */
	@RequestMapping("/updateAcceptid")
	public void updateAcceptid(long taskid,long acceptid,String note,HttpServletResponse resp){
		PmsProjectsTask task = new PmsProjectsTask();
		task.setTaskid(taskid);
		task.setAcceptid(acceptid);
		task.setNote(note);
		int flag = projectService.updateAcceptid(task);
		String jsonData = "";
		if(flag == 1){
			jsonData  = "{\"message\":\"指派人成功\";\"code\":1}";
		}else{
			jsonData  = "{\"message\":\"指派人失败\";\"code\":0}";
		}
		resp.setContentType("text/html;charset=utf-8");
		try {
			resp.getWriter().write(jsonData);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 *description:跳转到项目图表界面
	 *@author hulingtao
	 *@time 2017年8月5日 
	 */
	@RequestMapping("/toProjectChart")
	public String toProjectChart(Long projectid,HttpServletRequest req){
		projectId = projectid;
		Map<String, String> userPosition = null;
		List<Map<String, String>> listPosition = new ArrayList<Map<String, String>>();
		List<PmsProjectsTeam> listTeamMesg = projectService.listTeamMesg(projectid);
		for (PmsProjectsTeam pmsProjectsTeam : listTeamMesg) {
			userPosition = new HashMap<String,String>();
			String position = projectService.getPosition(pmsProjectsTeam.getUserid());
			userPosition.put("name", pmsProjectsTeam.getUsername());
			userPosition.put("value", position);
			listPosition.add(userPosition);
		}
		String jsonString = JSON.toJSONString(listPosition);
		req.setAttribute("jsonString", jsonString);
		return "project_chart";
	}
	
	/**
	 * <p>
	 * Description: 修改一条项目记录
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年7月28日上午10:45:38
	 */
	@RequestMapping("/updatePmsProjects")
	public String updatePmsProjects(PmsProjects pmsProjects) {
		projectService.updatePmsProjects(pmsProjects);
		return "redirect:/listProjectInfo";
	}

	/**
	 * <p>
	 * Description:修改状态
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年7月28日下午4:03:03
	 */
	@RequestMapping("/updatePmsProjectsState")
	public String updatePmsProjectsState(long projectid, int status) {
		projectService.updatePmsProjectsState(projectid,status);
		return "redirect:/listProjectInfo";
	}

	/**
	 * <p>
	 * Description: 异步请求修改状态
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年7月31日上午10:31:07
	 */
	@RequestMapping("/updatePmsProjectsState1")
	public void updatePmsProjectsState1(long projectid, int status, int oldstatus, HttpServletResponse resp) {
		PmsProjects pmsProjects = new PmsProjects();
		pmsProjects.setProduserid(projectid);
		pmsProjects.setStatus(status);
		resp.setContentType("text/html;charset=utf-8");
		String str = "";
		try {
			if (oldstatus == ProjectState.END) {
				str = "{\"message\":\"状态无法修改\",\"code\":\"0\"}";
			} else {
				projectService.updatePmsProjectsState(projectid,status);
				str = "{\"message\":\"状态修改成功\",\"code\":\"1\"}";
			}
			PrintWriter writer = resp.getWriter();
			writer.write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * <p>Description:
	 *     跳转页面
	 * </p>
	 * @author quanhuan
	 * @time  2017年8月5日下午9:05:34
	 */
	@RequestMapping("/dispatchPage")
	public String dispatchPage() {
		return "add_project_manage";
	}

	/**
	 * <p>
	 * Description: 增加新项目
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年7月31日上午10:52:04
	 */
	@RequestMapping("/addPmsProjects")
	public String addPmsProjects(PmsProjects pmsProjects,HttpServletRequest req) {
	    HttpSession session = req.getSession();
	    PmsUsers user = (PmsUsers)session.getAttribute("user");
	    pmsProjects.setUserid(user.getUserid());
	    projectService.insertPmsProjects(pmsProjects);
	    
		return "redirect:/listProjectInfo";
	}

	// bug
	/**
	 * <p>
	 * Description: 获取所有Bug
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年7月31日下午3:25:13
	 */
	@RequestMapping("/listPmsProjectsBug")
	public String listPmsProjectsBug(Model m,long projectid) {
		List<PmsProjectsTest> test = projectService.listPmsProjectsTest(projectid);
		m.addAttribute("listbug", test);
		m.addAttribute("acceptUser", ProjectServiceImpl.accpetUser);
		m.addAttribute("id", projectid);
		m.addAttribute("count", test.size());
		return "project_test";
	}

	/**
	 * <p>
	 * Description: 获取一条bug
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年7月31日下午4:17:25
	 */
	@RequestMapping("/getPmsProjectsBug")
	public String getPmsProjectsBug(Model m, long testid) {
		PmsProjectsTest bug = projectService.getPmsProjectsTest(testid);
		m.addAttribute("bug", bug);
		return "edit_project_test";
	}

	/**
	 * <p>
	 * Description: 检索bug
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年8月2日下午4:21:55
	 */
	@RequestMapping("/searchBug")
	public String searchBug(Model m, PmsProjectsTest pmsProjectsTest) {
		List<PmsProjectsTest> bug = projectService.searchBug(pmsProjectsTest);
		m.addAttribute("listbug", bug);
		m.addAttribute("acceptUser", ProjectServiceImpl.accpetUser);
		m.addAttribute("count", bug.size());
		return "project_test";
	}
	
    /**
     * <p>Description:
     *    查询指派给我的bug
     * </p>
     * @author quanhuan
     * @time  2017年8月5日下午3:39:53
     */
    @RequestMapping("/searchByAppoint")
	public String searchByAppoint(Model m,long acceptid,long projectid){
    	List<PmsProjectsTest> appoint = projectService.searchByAppoint(acceptid, projectid);
    	m.addAttribute("listbug", appoint);
    	m.addAttribute("id", projectid);
    	m.addAttribute("count", appoint.size());
		return "project_test";
	}
    
    /**
     * <p>Description:
     *    查询由我创建的bug
     * </p>
     * @author quanhuan
     * @time  2017年8月5日下午3:42:32
     */
    @RequestMapping("/serachByMyCreate")
    public String serachByMyCreate(Model m,long userid,long projectid){
    	List<PmsProjectsTest> create = projectService.searchByMyCreate(userid, projectid);
    	m.addAttribute("listbug", create);
    	m.addAttribute("id", projectid);
    	m.addAttribute("count", create.size());
    	return "project_test";
    }
	
    /**
     * <p>Description:
     *    查询由我解决的的bug
     * </p>
     * @author quanhuan
     * @time  2017年8月5日下午3:42:32
     */
    @RequestMapping("/serachByMySolve")
    public String serachByMySolve(Model m,long completeid,long projectid){
    	List<PmsProjectsTest> solve = projectService.searchByMySolve(completeid, projectid);
    	m.addAttribute("id", projectid);
    	m.addAttribute("listbug", solve);
    	m.addAttribute("count", solve.size());
    	return "project_test";
    }
    
	
	/**
	 * <p>
	 * Description: ajax获取bug修复人
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年7月31日下午4:23:38
	 */
	@RequestMapping("/getdispatchPeople")
	public void getdispatchPeople(HttpServletResponse resp, long projectid) {
		try {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter pw = resp.getWriter();
			List<PmsProjectsTeam> teamMesg = projectService.listTeamMesg(projectid);
			String str = JSON.toJSONString(teamMesg);
			pw.write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * <p>
	 * Description: 给bug指定派遣人
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年7月31日下午9:39:01
	 */
	@RequestMapping("/dispatchPeople")
	public String dispatchPeople(PmsProjectsTest pmsProjectsTest) {
		projectService.dispatchPeople(pmsProjectsTest);
		return "redirect:/listPmsProjectsBug?projectid="+pmsProjectsTest.getProjectid();
	}

	/**
	 * <p>
	 * Description: bug解决方案
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年8月2日下午3:48:01
	 */
	@RequestMapping("/resolvent")
	public String resolvent(PmsProjectsTest pmsProjectsTest) {
		projectService.resolvent(pmsProjectsTest);
		return "redirect:/listPmsProjectsBug?projectid="+pmsProjectsTest.getProjectid();
	}

	/**
	 * <p>
	 * Description: 编辑bug
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年8月4日上午10:27:46
	 */
	@RequestMapping("/updateBug")
	public String updateBug(PmsProjectsTest pmsProjectsTest, MultipartFile filename) {
		projectService.updateBug(pmsProjectsTest, filename);
		return "redirect:/listPmsProjectsBug?projectid="+pmsProjectsTest.getProjectid();
	}

	/**
	 * <p>
	 * Description: 查找所有需求跳转到增加bug页面
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年8月4日下午3:22:39
	 */
	@RequestMapping("/skip")
	public String skip(Model m,long projectid) {
		List<PmsProjectsNeeds> needs = projectService.listPmsProjectsNeeds(projectid);
		m.addAttribute("listneeds", needs);
		List<PmsProjectsTeam> list = projectService.listTeamMesg(projectid);
		m.addAttribute("listTeam", list);
		m.addAttribute("id",projectid);
		return "add_project_test";
	}
	
	/**
	 * <p>Description:
	 *    AJAX获取所有的需求
	 * </p>
	 * @author quanhuan
	 * @time  2017年8月4日下午4:05:56
	 */
	@RequestMapping("/listProjectsTask")
	public void listProjectsTask(long needsid,HttpServletResponse resp){
		List<PmsProjectsTask> task = projectService.listPmsProjectsTask(needsid);
		String string = JSON.toJSONString(task);
	    resp.setContentType("text/html;charset=utf-8");
	    try {
			PrintWriter writer = resp.getWriter();
			writer.write(string);
		} catch (IOException e) {
			e.printStackTrace();
		}
	    
	}

	/**
	 * <p>
	 * Description: 增加新的bug
	 * </p>
	 * 
	 * @author quanhuan
	 * @time 2017年8月4日下午3:11:50
	 */
	@RequestMapping("/addBug")
	public String addBug(PmsProjectsTest pmsProjectsTest, MultipartFile filename,HttpServletRequest req) {
		pmsProjectsTest.setTestid(new TimeDate().getTimeStampLongDate());
		HttpSession session = req.getSession();
		PmsUsers user = (PmsUsers)session.getAttribute("user");
		pmsProjectsTest.setUserid(user.getUserid());
		projectService.insertPmsProjectsTest(pmsProjectsTest,filename);
		return "redirect:/listPmsProjectsBug?projectid="+pmsProjectsTest.getProjectid();
	}
	
	/**
	 *description:判断需求名是否已经存在
	 *@author hulingtao
	 *@time 2017年8月12日 
	 */
	@RequestMapping("/isExistNeedname")
	public void isExistNeedname(String name,HttpServletResponse resp){
		int flag = projectService.getPmsNeedByName(name);
		String jsonData = "";
		if(flag == 1){
			jsonData = "{\"message\":\"该需求名称已存在,请重新输入\",\"code\":1}";
		}else{
			jsonData = "{\"code\":0}";
		}
		resp.setContentType("text/html;charset=utf8");
		try {
			resp.getWriter().write(jsonData);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	//mengyongfei
	//查询项目中的所有版本信息
		@RequestMapping("/listPmsProjectsVersion{pageNum}")
		public String listPmsProjectsVersion(Model model,@RequestParam(required=true,defaultValue="1") Integer pageNum,@RequestParam(required=false,defaultValue="10") Integer pageSize){
			PageHelper.startPage(pageNum, pageSize);
			List<PmsProjectsVersion> list = projectService.selectAllPmsProjectsVersion(projectId);
			PageInfo<PmsProjectsVersion> pageInfo = new PageInfo<PmsProjectsVersion>(list);
			if(list.size()>0){
				model.addAttribute("pageInfo",pageInfo);
				model.addAttribute("list",list);
				model.addAttribute("count", list.size());
				return "project_version";
			}else{
				return "404";
			}
		}
		
		//根据版本ID查看对应的详细信息
		@RequestMapping("/getPmsProjectsVersion{versionid}")
		public String getPmsProjectsVersion(@PathVariable Long versionid ,Model model){
			List<PmsProjectsVersion> list = projectService.getPmsProjectsVersion(versionid);
			if(list.size()>0){
				model.addAttribute("list",list);
				return "project_version_detail";
			}else{
				return "404";
			}
		}
		
		//根据版本ID获取版本进行修改
		@RequestMapping("/getPmsProjectsVersionToModify{versionid}")
		public String getPmsProjectsVersionToModify(@PathVariable Long versionid ,Model model){
			List<PmsProjectsVersion> list = projectService.getPmsProjectsVersion(versionid);
			if(list.size()>0){
				model.addAttribute("list",list);
				return "edit_project_version";
			}else{
				return "404";
			}
		}
		
		//根据版本ID删除对应的版本信息
		@RequestMapping("/deleteByVersionId{versionid}")
		public void deleteByVersionId(@RequestParam Long versionid,HttpServletResponse response) throws IOException{
			int flag = projectService.deleteByPrimaryKey(versionid);
			Map<String, Object> map = new HashMap<>();
			map.put("message", "删除成功");
			map.put("code", flag);
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(JSONArray.toJSONString(map));
		}
		
		//只是为了添加版本信息的跳转
		@RequestMapping("/toAddPmsProjectsVersion")
		public String toAddPmsProjectsVersion(){
			return "add_project_version";
		}
		
		//新增版本信息
		@RequestMapping("/insertPmsProjectsVersion")
		public String insertPmsProjectsVersion(PmsProjectsVersion pmsProjectsVersion,HttpServletRequest request,HttpSession session,HttpServletResponse response) throws Exception{
			int flag = 0;
			IntDate id = new IntDate();
			Long verisonid = id.getTimeStampLongDate();
			java.util.Date date = new java.util.Date();
			Timestamp created = new Timestamp(date.getTime());
			//时间戳生成verisonid
			pmsProjectsVersion.setVersionid(verisonid);
			//时间戳生成创建时间
			pmsProjectsVersion.setCreated(created);
			pmsProjectsVersion.setChanged(created);//这里先和创建时间设置一样,因为不知道created的意思
			//设置项目ID
			pmsProjectsVersion.setProjectid((Long)session.getAttribute("projectid"));
			//设置userID
			PmsUsers user = (PmsUsers)session.getAttribute("user");
			pmsProjectsVersion.setUserid(user.getUserid());
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
							String path = request.getServletContext().getRealPath("\\uploadFile")+"\\"+newFileName;
							File localFile = new File(path);
							file.transferTo(localFile);
							pmsProjectsVersion.setAttachment(newFileName);
						}
					}
				}
			}
			flag = projectService.insertPmsProjectsVersion(pmsProjectsVersion);
			if(flag>0){
				return "redirect:/listPmsProjectsVersion";
			}else{
				return "404";
			}
		}
		
		//根据版本id更新版本内容
		@RequestMapping("/updatePmsProjectsVersion")
		public String updatePmsProjectsVersion(PmsProjectsVersion pmsProjectsVersion,HttpServletRequest request,HttpSession session) throws Exception{
			int flag = 0;
			java.util.Date date = new java.util.Date();
			Timestamp time = new Timestamp(date.getTime());
			//时间戳生成创建时间
			pmsProjectsVersion.setChanged(time);//创建时间设置一样,最后一次更新的时间
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
							String path = request.getServletContext().getRealPath("\\uploadFile")+"\\"+newFileName;
							File localFile = new File(path);
							file.transferTo(localFile);
							pmsProjectsVersion.setAttachment(newFileName);
						}
					}
				}
			}
			flag = projectService.updateByPrimaryKey(pmsProjectsVersion);
			if(flag>0){
				return "redirect:/listPmsProjectsVersion";
			}else{
				return "404";
			}
		}
		
		//模糊查询版本信息
		@RequestMapping("/searchPmsProjectsVersion")
		public String searchPmsProjectsVersion(HttpServletRequest req,HttpSession session){
			List<PmsProjectsVersion> listPmsProjectsVersion = new ArrayList<PmsProjectsVersion>();
			String title =  req.getParameter("title");
			Long projectid = (Long)session.getAttribute("projectid");
			if(title.equals("")){
				return "redirect:/listPmsProjectsVersion";
			}
			listPmsProjectsVersion = projectService.searchPmsProjectsVersion(title,projectid);
			req.setAttribute("count", listPmsProjectsVersion.size());
			req.setAttribute("list", listPmsProjectsVersion);
			return "searchPmsProjectsVersion";
		}
		
		//查询项目中的所有文档信息
		@RequestMapping("/listPmsProjectsDoc{pageNum}")
		public String listPmsProjectsDoc(Model model,@RequestParam(required=true,defaultValue="1") Integer pageNum,@RequestParam(required=false,defaultValue="10") Integer pageSize){
			PageHelper.startPage(pageNum, pageSize);
			List<PmsProjectsDoc> list = projectService.selectAllPmsProjectsDoc(projectId);
			PageInfo<PmsProjectsDoc> pageInfo = new PageInfo<PmsProjectsDoc>(list);
			if(list.size()>0){
				model.addAttribute("list",list);
				model.addAttribute("count", list.size());
				model.addAttribute("pageInfo", pageInfo);
				return "project_doc";
			}else{
				return "404";
			}
		}
		//根据文档ID查看对应文档的详细信息
		@RequestMapping("/getPmsProjectsDoc{docid}")
		public String getPmsProjectsDoc(@PathVariable Long docid ,Model model){
			List<PmsProjectsDoc> list = projectService.getPmsProjectsDoc(docid);
			if(list.size()>0){
				model.addAttribute("list",list);
				return "project_doc_detail";
			}else{
				return "404";
			}
		}
		
		//根据文档ID获取文档进行修改
		@RequestMapping("/getPmsProjectsDocToModify{docid}")
		public String getPmsProjectsDocToModify(@PathVariable Long docid ,Model model){
			List<PmsProjectsDoc> list = projectService.getPmsProjectsDoc(docid);
			if(list.size()>0){
				model.addAttribute("list",list);
				return "edit_project_doc";
			}else{
				return "404";
			}
		}
		
		//根据文档ID删除对应的文档信息
		@RequestMapping("/deleteByDocid{docid}")
		public void deleteByDocid(@RequestParam Long docid,HttpServletResponse response) throws IOException{
			int flag = projectService.deleteDocByPrimaryKey(docid);
			Map<String, Object> map = new HashMap<>();
			map.put("message", "删除成功");
			map.put("code", flag);
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(JSONArray.toJSONString(map));
		}
		
		//只是为了添加版本信息的跳转
		@RequestMapping("/toAddPmsProjectsDoc")
		public String toAddPmsProjectsDoc(){
			return "add_project_doc";
		}
		
		//添加文档信息
		@RequestMapping("/insertPmsProjectsDoc")
		public String insertPmsProjectsDoc(PmsProjectsDoc pmsProjectsDoc,HttpServletRequest request,HttpSession session,HttpServletResponse response) throws Exception{
			int flag = 0;
			IntDate id = new IntDate();
			Long docid = id.getTimeStampLongDate();
			java.util.Date date = new java.util.Date();
			Timestamp created = new Timestamp(date.getTime());
			//时间戳生成verisonid
			pmsProjectsDoc.setDocid(docid);
			//时间戳生成创建时间
			pmsProjectsDoc.setCreated(created);
			pmsProjectsDoc.setChanged(created);//这里先和创建时间设置一样,因为不知道created的意思
			//设置项目ID
			pmsProjectsDoc.setProjectid((Long)session.getAttribute("projectid"));
			//设置userID
			PmsUsers user = (PmsUsers)session.getAttribute("user");
			pmsProjectsDoc.setUserid(user.getUserid());
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
							String path = request.getServletContext().getRealPath("\\uploadFile")+"\\"+newFileName;
							File localFile = new File(path);
							file.transferTo(localFile);
							pmsProjectsDoc.setAttachment(newFileName);
						}
					}
				}
			}
			flag = projectService.insertPmsProjectsDoc(pmsProjectsDoc);
			if(flag>0){
				return "redirect:/listPmsProjectsDoc";
			}else{
				return "404";
			}
		}
		
		//根据版本id更新版本内容
		@RequestMapping("/updatePmsProjectsDoc")
		public String updatePmsProjectsDoc(PmsProjectsDoc pmsProjectsDoc,HttpServletRequest request,HttpSession session) throws Exception{
			int flag = 0;
			java.util.Date date = new java.util.Date();
			Timestamp time = new Timestamp(date.getTime());
			//时间戳生成创建时间
			pmsProjectsDoc.setChanged(time);//创建时间设置一样,最后一次更新的时间
			PmsUsers user = (PmsUsers)session.getAttribute("user");
			pmsProjectsDoc.setUserid(user.getUserid());
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
							String path = request.getServletContext().getRealPath("\\uploadFile")+"\\"+newFileName;
							File localFile = new File(path);
							file.transferTo(localFile);
							pmsProjectsDoc.setAttachment(newFileName);
						}
					}
				}
			}
			flag = projectService.updateDocByPrimaryKey(pmsProjectsDoc);
			if(flag>0){
				return "redirect:/listPmsProjectsDoc";
			}else{
				return "404";
			}
		}
		
		//模糊查询文档信息
		@RequestMapping("/searchPmsProjectsDoc")
		public String searchPmsProjectsDoc(HttpServletRequest req,HttpSession session){
			List<PmsProjectsDoc> listPmsProjectsDoc = new ArrayList<>();
			String sort =  req.getParameter("sort");
			String title =  req.getParameter("title");
			Long projectid = (Long)session.getAttribute("projectid");
			if(sort.equals("0") && title.equals("")){
				return "redirect:/listPmsProjectsDoc";
			}
			int statues = Integer.parseInt(sort);//1 2
			if(title.equals("")){
				listPmsProjectsDoc = projectService.searchPmsProjectsDoc(statues,null,projectid);
				req.setAttribute("count", listPmsProjectsDoc.size());
				req.setAttribute("list", listPmsProjectsDoc);
				return "searchPmsProjectsDoc";
			}else{
				listPmsProjectsDoc = projectService.searchPmsProjectsDoc(statues,title,projectid);
				req.setAttribute("count", listPmsProjectsDoc.size());
				req.setAttribute("list", listPmsProjectsDoc);
				return "searchPmsProjectsDoc";
			}
		}
}
