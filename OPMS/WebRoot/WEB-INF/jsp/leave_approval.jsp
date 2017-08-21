<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="overflow: hidden;" lang="en">
<head>
    <meta charset="UTF-8">
    <title>OPMS管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="author" content="lock">
    <meta name="keywords" content="OPMS,管理系统">
    <meta name="description" content="OPMS管理系统,由Lock开发;联系方式：903561702@qq.com,QQ讨论群：451420312">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/png">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">
    <style>
        /* Code tidied up by ScrapBook */
        .panel-body .table tbody > tr > td { text-align: left; padding: 12px; }
    </style>
    <style type="text/css">
    html{overflow-y:hidden;}
        textarea{
            width: 756px;
            height: 200px;
            border: 1px solid #DDDDDD;
            border-radius: 10px;
            margin-top: -20px;
            margin-bottom: 10px;
            padding: 10px;
        }
        .result{
            padding-right: 20px;
        }
        .input-box{text-align:center;padding-bottom:10px;}
		.input-box .input-submit:first-child{margin-right:30px;}
		.input-submit{width:80px;height:30px;line-height:30px;border:0;border-radius:6px;}
    </style>
</head>
<body class="sticky-header">
<section>
    <div class="left-side sticky-left-side" style="overflow: hidden;" tabindex="5000">
        <div class="logo">
            <a href="#">
                <img src="img/logo-left.png" alt="OPMS管理系统">
            </a>
        </div>
        <div class="logo-icon text-center">
            <a href="#">
                <img src="img/logo_icon.png" style="width: 40px;" alt="OPMS管理系统">
            </a>
        </div>
        <div class="left-side-inner">
            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="libai" src="img/96d7546cbe9cbe9e36ce11ffd9afcc95-cropper.jpg" class="media-object">
                    <div class="media-body">
                        <h4>
                            <a href="">libai</a>
                        </h4>
                        <span>OPMS系统</span>
                    </div>
                </div>
                <h5 class="left-nav-title">控制台</h5>
                <ul class="nav nav-pills nav-stacked custom-nav">
                    <li>
                        <a href="">
                            <i class="fa fa-user"></i>
                            <span>个人设置</span>
                        </a>
                    </li>
                    <li>
                        <a href="tologout">
                            <i class="fa fa-sign-out"></i>
                            <span>退出</span></a>
                    </li>
                </ul>
            </div>

            <ul class="nav nav-pills nav-stacked custom-nav js-left-nav">
                <li class="">
                    <a href="#">
                        <i class="fa fa-home"></i>
                        <span>我的主页</span>
                    </a>
                </li>
                <li class="">
                    <a href="listProjectInfo">
                        <i class="fa fa-book"></i>
                        <span>项目管理</span>
                    </a>
                </li>
                <li>
                    <a href="listCheckworkbyuserid">
                        <i class="fa fa-tasks"></i>
                        <span>考勤管理</span>
                    </a>
                </li>
                <li>
                    <a href="approvalindex">
                        <i class="fa fa-suitcase"></i>
                        <span>审批管理</span>
                    </a>
                </li>
                <li>
                    <a href="all_knowledge_manage">
                        <i class="fa fa-tasks"></i>
                        <span>知识分享</span>
                    </a>
                </li>
                <li>
                    <a href="listAlbums">
                        <i class="fa fa-plane"></i>
                        <span>员工相册</span>
                    </a>
                </li>
                <li>
                    <a href="listResumes">
                        <i class="fa fa-laptop"></i>
                        <span>简历管理</span>
                    </a>
                </li>
                <li>
                    <a href="listPmsUsersProfile">
                        <i class="fa fa-user"></i>
                        <span>组织管理</span>
                    </a>
                </li>
            </ul>

        </div>
    </div>
    <div class="main-content">
        <div class="header-section">
            <a class="toggle-btn"><i class="fa fa-bars"></i></a>
            <div class="menu-right">
                <ul class="notification-menu">
                    <li>
                        <a href="#" class="btn btn-default dropdown-toggle info-number" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-head pull-right">
                            <h5 class="title">你有 0 最新信息</h5>
                            <ul class="dropdown-list normal-list">
                                <li class="text-center">目前还没有最新消息</li>
                                <li class="new">
                                    <a href="message_manage.html">查看更多</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:;" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <img src="img/96d7546cbe9cbe9e36ce11ffd9afcc95-cropper.jpg" alt="libai">
                            ${user.username }
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                            <li>
                                <a href="user_index.html">
                                    <i class="fa fa-user"></i>
                                    个人主页
                                </a>
                            </li>
                            <li>
                                <a href="user_form.html">
                                    <i class="fa fa-cog"></i>
                                    基本资料
                                </a>
                            </li>
                            <li>
                                <a href="avatar.html">
                                    <i class="fa fa-camera"></i>
                                    更换头像
                                </a>
                            </li>
                            <li>
                                <a href="profilePwd">
                                    <i class="fa fa-cog"></i>
                                    更换密码
                                </a>
                            </li>
                            <li>
                                <a href="task.html">
                                    <i class="fa fa-th-list"></i>
                                    我的任务</a>
                            </li>
                            <li>
                                <a href="tologout">
                                    <i class="fa fa-sign-out"></i>
                                    退出
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="page-heading">
            <h3> 审批管理
                <span>
          <a href="leavemanage">请假</a>
          <a href="overtimemanage">加班</a>
          <a href="expensemanage">报销</a>
          <a href="businesstripmanage">出差</a>
          <a href="gooutmanage">外出</a>
          <a href="oagood_manage">物品</a>
        </span>
            </h3>
            <ul class="breadcrumb pull-left">
                <li> <a href="user_index.html">OPMS</a> </li>
                <li> <a href="leavemanage">请假</a> </li>
                <li class="active"> 请假单详情 </li>
            </ul>
            <div class="pull-right"> <a href="javascript:history.back();" class="btn btn-default">返回</a> <a href="approval_leave.html" class="hidden-xs btn btn-default" style="padding: 4px;">待审批</a> <a href="leave_add.html" class="btn btn-success">+我要请假</a> </div>
        </div>
        <div class="clearfix"></div>


        <div class="wrapper">
            <div class="row">
                <div class="col-md-8">
                    <div class="blog">
                        <div class="single-blog">
                        <form id="approvalleave-form" action="updateLeaveApprovalInfo" method="post" >
                            <div class="panel">
                                <div class="panel-body">
                                    <h1 class="text-center mtop35"><a href="#">请假单</a></h1>
                                    <p class="text-center auth-row"> By <a href="user_index.html">${userDetail.realname }</a> | <fmt:formatDate
												value="${unappLeave.created}"  pattern="yyyy-MM-dd HH:mm" /></p>
                                    <div id="print">
                                        <table class="table table-bordered" border="1">
                                            <tbody><tr class="hide">
                                                <th colspan="6" class="text-center">请假单</th>
                                            </tr>
                                            <tr>
                                                <td width="72">姓名</td>
                                                <td width="62">${userDetail.realname }</td>
                                                <td width="70">部门</td>
                                                <td width="77">${userDetail.name2}</td>
                                                <td width="80">职位</td>
                                                <td width="93">${userDetail.name1}</td>
                                            </tr>
                                            <tr>
                                                <td>类型</td>
                                                <td colspan="5"><c:if test="${unappLeave.type==1}">事假</c:if> 
												<c:if test="${unappLeave.type==2}">病假</c:if> <c:if
												test="${unappLeave.type==3}">年假</c:if> <c:if
												test="${unappLeave.type==4}">调休</c:if> <c:if
												test="${unappLeave.type==5}">婚假</c:if> <c:if
												test="${unappLeave.type==6}">产假</c:if> <c:if
												test="${unappLeave.type==7}">陪产假</c:if> <c:if
												test="${unappLeave.type==8}">路途假</c:if> <c:if
												test="${unappLeave.type==9}">其他</c:if></td>
                                            </tr>
                                            <tr>
                                                <td>事由</td>
                                                <td colspan="5">${unappLeave.reason }</td>
                                            </tr>
                                            <tr>
                                                <td>日期</td>
                                                <td colspan="5"><fmt:formatDate
												value="${unappLeave.started}"  pattern="yyyy-MM-dd" />至<fmt:formatDate
												value="${unappLeave.ended }"  pattern="yyyy-MM-dd" /></td>
                                            </tr>
                                            <tr>
                                                <td>天数</td>
                                                <td colspan="5"><fmt:formatNumber value="${unappLeave.days }" pattern="0" />天</td>
                                            </tr>
                                            <tr class="hidden">
                                                <td>审核人</td>
                                                <td colspan="5"></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <p>审批意见：</p>
                                    <textarea name="summary"></textarea>
                                    <p>
                                        <span class="result">审批结果：</span>
                                        <input type="radio" name="status" value="1" >通过
                                        <input type="radio" name="status" value="2">未通过
                                    </p>
                                    <a class="btn btn-xs btn-warning" style="margin-bottom: 6px;">审批人进度</a>
                                    <div class="js-selectuserbox"> 
                                      <c:forEach items="${listAppInfo}" var="appinfo" varStatus="st">
                                    <a href="javascript:;" title="${appinfo.realname}"><img <c:if test="${appinfo.status!=1}"> class="gray" </c:if> src="/OPMS/${appinfo.avatar}" alt="${appinfo.realname}"><c:if
													test="${appinfo.status==1}">同意</c:if>
												<c:if test="${appinfo.status==2}">拒绝</c:if> <c:if
													test="${appinfo.status==''}">未处</c:if></a><c:if test="${listAppInfo.size()>=(st.count+1) }">		
													<span>..........</span>
											</c:if> 	</c:forEach>	</div>
                                </div>
                                <input type="hidden" name="leaveid" value="${unappLeave.leaveid }">
                                <input type="hidden" name="approverid" value="${SPID.approverid }" >
								<div class="input-box">
									<input type="submit" class="btn-success input-submit" value="提交">
									<input type="reset" class="btn-success input-submit" value="取消">
								</div>
                            </div>
                            </form>
                            <div class="panel">
<!--                                 <div class="panel-body"> -->
<!--                                     <h1 class="text-center cmnt-head">审批人</h1> -->


<!--                                     <p class="text-center fade-txt">第 -->
<!--                                         <script>document.write( 0 +1)</script>1 -->
<!--                                             位审批人还没有审批此请假条!</p> -->

<!--                                 </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <footer> 2016 © Admin by Lock &nbsp;&nbsp;<a href="index.html">OPMS官网</a> · <a href="#">OPMS手册</a></footer>

    </div>

</section>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script><div id="ascrail2000" class="nicescroll-rails" style="width: 6px; z-index: 1000; background: rgb(66, 79, 99) none repeat scroll 0% 0%; cursor: default; position: fixed; top: 0px; height: 100%; right: 0px; opacity: 0;"><div style="position: relative; top: 0px; float: right; width: 6px; height: 404px; background-color: rgb(101, 206, 167); border: 0px none; background-clip: padding-box; border-radius: 0px;"></div></div><div id="ascrail2000-hr" class="nicescroll-rails" style="height: 6px; z-index: 1000; background: rgb(66, 79, 99) none repeat scroll 0% 0%; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; display: none; opacity: 0;"><div style="position: relative; top: 0px; height: 6px; width: 1366px; background-color: rgb(101, 206, 167); border: 0px none; background-clip: padding-box; border-radius: 0px;"></div></div><div id="ascrail2001" class="nicescroll-rails" style="width: 3px; z-index: 100; background: rgb(66, 79, 99) none repeat scroll 0% 0%; cursor: default; position: fixed; top: 0px; left: 137px; height: 636px; display: none;"><div style="position: relative; top: 0px; float: right; width: 3px; height: 0px; background-color: rgb(101, 206, 167); border: 0px none; background-clip: padding-box; border-radius: 0px;"></div></div><div id="ascrail2001-hr" class="nicescroll-rails" style="height: 3px; z-index: 100; background: rgb(66, 79, 99) none repeat scroll 0% 0%; top: 633px; left: 0px; position: fixed; cursor: default; display: none;"><div style="position: relative; top: 0px; height: 3px; width: 0px; background-color: rgb(101, 206, 167); border: 0px none; background-clip: padding-box; border-radius: 0px;"></div></div>
<script src="js/jquery.validate.js"></script>
<script src="js/opms.js"></script>
<script type="text/javascript">

	 $('#approvalleave-form').validate({
           ignore:'',		    
   		 rules : {
   			'summary':{required:true},
   			'status':{required:true},
           },
           messages : {
   			'summary':{required:'请填写审批说明'},
   			'status':{required:'请选择审批结果'},
           }
	 });
</script>
</body>
</html>
