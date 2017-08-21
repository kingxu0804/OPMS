<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="overflow: hidden;" lang="en">
<head>
    <meta charset="UTF-8">
    <title>OPMS管理系统</title>
    <link href="css/clndr.css" rel="stylesheet">
    <link href="css/table-responsive.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="author" content="lock">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/png">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">
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
                            <a href="">${user.username}</a>
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
                        <a href="">
                            <i class="fa fa-sign-out"></i>
                            <span>退出</span></a>
                    </li>
                </ul>
            </div>

            <ul class="nav nav-pills nav-stacked custom-nav js-left-nav">
                <li class="">
                    <a href="user_index.html">
                        <i class="fa fa-home"></i>
                        <span>我的主页</span>
                    </a>
                </li>
                <li class="">
                    <a href="project_manage.html">
                        <i class="fa fa-book"></i>
                        <span>项目管理</span>
                    </a>
                </li>
                <li>
                    <a href="checkwork_index.html">
                        <i class="fa fa-tasks"></i>
                        <span>考勤管理</span>
                    </a>
                </li>
                <li>
                    <a href="approval_index.html">
                        <i class="fa fa-suitcase"></i>
                        <span>审批管理</span>
                    </a>
                </li>
                <li>
                    <a href="knowledge_manage.html">
                        <i class="fa fa-tasks"></i>
                        <span>知识分享</span>
                    </a>
                </li>
                <li>
                    <a href="album_manage.html">
                        <i class="fa fa-plane"></i>
                        <span>员工相册</span>
                    </a>
                </li>
                <li>
                    <a href="resume_manage.html">
                        <i class="fa fa-laptop"></i>
                        <span>简历管理</span>
                    </a>
                </li>
                <li>
                    <a href="user_manage.html">
                        <i class="fa fa-user"></i>
                        <span>组织管理</span>
                    </a>
                </li>
            </ul>

        </div>
    </div>
    <div class="main-content">
        <div class="header-section">
            <a class="toggle-btn">
                <i class="fa fa-bars"></i>
            </a>
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
                            ${user.username}
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
                                <a href="profile_pwd.html">
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
                                <a href="login.html">
                                    <i class="fa fa-sign-out"></i>
                                    退出
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="wrapper">
            <div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="profile-pic text-center">
                                        <img alt="李白" src="img/96d7546cbe9cbe9e36ce11ffd9afcc95-cropper.jpg">
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                   <ul class="p-info" id="info">
                                   
                                   
                                   </ul> 
                                    
                                    
                                    
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body p-states">
                                    <h4 class="title">公告</h4>
                                    <ul class="dropdown-list normal-list">
                                        <li class="new">
                                            <a href="#noticeModal" data-toggle="modal" data-content="222">
                                                <span class="label label-danger">
                                                    <i class="fa fa-bolt"></i>
                                                </span>
                                                <span class="name">122 </span>
                                                <em class="small">2017-07-07 19:01</em>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="calendar-block ">
                                        <div class="cal1">
                                            <div class="clndr">
                                                <div class="clndr-controls">
                                                    <div class="clndr-control-button">
                                                        <span class="clndr-previous-button">
                                                            <i class="fa fa-chevron-left"></i>
                                                        </span>
                                                    </div>
                                                    <div class="month">
                                                        <span>July</span> 2017
                                                    </div>
                                                    <div class="clndr-control-button leftalign">
                                                        <span class="clndr-next-button">
                                                            <i class="fa fa-chevron-right"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                <table class="clndr-table" cellspacing="0" cellpadding="0" border="0">
                                                    <thead>
                                                    <tr class="header-days">
                                                        <td class="header-day">S</td>
                                                        <td class="header-day">M</td>
                                                        <td class="header-day">T</td>
                                                        <td class="header-day">W</td>
                                                        <td class="header-day">T</td>
                                                        <td class="header-day">F</td>
                                                        <td class="header-day">S</td>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td class="day past adjacent-month last-month calendar-day-2017-06-25">
                                                            <div class="day-contents">25</div>
                                                        </td>
                                                        <td class="day past adjacent-month last-month calendar-day-2017-06-26">
                                                            <div class="day-contents">26</div>
                                                        </td>
                                                        <td class="day past adjacent-month last-month calendar-day-2017-06-27">
                                                            <div class="day-contents">27</div>
                                                        </td>
                                                        <td class="day past adjacent-month last-month calendar-day-2017-06-28">
                                                            <div class="day-contents">28</div>
                                                        </td>
                                                        <td class="day past adjacent-month last-month calendar-day-2017-06-29">
                                                            <div class="day-contents">29</div>
                                                        </td>
                                                        <td class="day past adjacent-month last-month calendar-day-2017-06-30">
                                                            <div class="day-contents">30</div>
                                                        </td>
                                                        <td class="day past calendar-day-2017-07-01">
                                                            <div class="day-contents">1</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="day past calendar-day-2017-07-02">
                                                            <div class="day-contents">2</div>
                                                        </td>
                                                        <td class="day past calendar-day-2017-07-03">
                                                            <div class="day-contents">3</div>
                                                        </td>
                                                        <td class="day past calendar-day-2017-07-04">
                                                            <div class="day-contents">4</div>
                                                        </td>
                                                        <td class="day past calendar-day-2017-07-05">
                                                            <div class="day-contents">5</div>
                                                        </td>
                                                        <td class="day past calendar-day-2017-07-06">
                                                            <div class="day-contents">6</div>
                                                        </td>
                                                        <td class="day past calendar-day-2017-07-07">
                                                            <div class="day-contents">7</div>
                                                        </td>
                                                        <td class="day today calendar-day-2017-07-08">
                                                            <div class="day-contents">8</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="day calendar-day-2017-07-09">
                                                            <div class="day-contents">9</div>
                                                        </td>
                                                        <td class="day event calendar-day-2017-07-10">
                                                            <div class="day-contents">10</div>
                                                        </td>
                                                        <td class="day event calendar-day-2017-07-11">
                                                            <div class="day-contents">11</div>
                                                        </td>
                                                        <td class="day event calendar-day-2017-07-12">
                                                            <div class="day-contents">12</div>
                                                        </td>
                                                        <td class="day event calendar-day-2017-07-13">
                                                            <div class="day-contents">13</div>
                                                        </td>
                                                        <td class="day event calendar-day-2017-07-14">
                                                            <div class="day-contents">14</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-15">
                                                            <div class="day-contents">15</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="day calendar-day-2017-07-16">
                                                            <div class="day-contents">16</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-17">
                                                            <div class="day-contents">17</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-18">
                                                            <div class="day-contents">18</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-19">
                                                            <div class="day-contents">19</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-20">
                                                            <div class="day-contents">20</div>
                                                        </td>
                                                        <td class="day event calendar-day-2017-07-21">
                                                            <div class="day-contents">21</div>
                                                        </td>
                                                        <td class="day event calendar-day-2017-07-22">
                                                            <div class="day-contents">22</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="day event calendar-day-2017-07-23">
                                                            <div class="day-contents">23</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-24">
                                                            <div class="day-contents">24</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-25">
                                                            <div class="day-contents">25</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-26">
                                                            <div class="day-contents">26</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-27">
                                                            <div class="day-contents">27</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-28">
                                                            <div class="day-contents">28</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-29">
                                                            <div class="day-contents">29</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="day calendar-day-2017-07-30">
                                                            <div class="day-contents">30</div>
                                                        </td>
                                                        <td class="day calendar-day-2017-07-31">
                                                            <div class="day-contents">31</div>
                                                        </td>
                                                        <td class="day adjacent-month next-month calendar-day-2017-08-01">
                                                            <div class="day-contents">1</div>
                                                        </td>
                                                        <td class="day adjacent-month next-month calendar-day-2017-08-02">
                                                            <div class="day-contents">2</div>
                                                        </td>
                                                        <td class="day adjacent-month next-month calendar-day-2017-08-03">
                                                            <div class="day-contents">3</div>
                                                        </td>
                                                        <td class="day adjacent-month next-month calendar-day-2017-08-04">
                                                            <div class="day-contents">4</div>
                                                        </td>
                                                        <td class="day adjacent-month next-month calendar-day-2017-08-05">
                                                            <div class="day-contents">5</div>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="profile-desk">
                                        <h1>项目<a class="pull-right" style="font-size: 16px;" href="project.html">更多</a></h1>
                                        <table class="table table-bordered table-striped table-condensed cf">
                                            <thead class="cf">
                                            <tr>
                                                <th>项目名称</th>
                                                <th>结束日期</th>
                                                <th class="numeric">状态</th>
                                                <th class="numeric">项目负责人</th>
                                            </tr>
                                            </thead>
                                            <tbody id="myproject">
                                           <!--  <tr>
                                                <td>
                                                    <a href="project_detail.html">测试项目</a>
                                                </td>
                                                <td>2017-06-28</td>
                                                <td>进行</td>
                                                <td><a href="user_index.html">李白</a></td>
                                            </tr> -->
                                            
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="profile-desk">
                                        <h1>任务<a class="pull-right" style="font-size: 16px;" href="task.html">更多</a></h1>
                                        <table class="table table-bordered table-striped table-condensed cf">
                                            <thead class="cf">
                                            <tr>
                                                <th>任务名称</th>
                                                <th>结束日期</th>
                                                <th class="numeric">状态</th>
                                                <th class="numeric">预计工时</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><a href="project_task_detail.html">UI - 用户登录</a></td>
                                                <td></td>
                                                <td>进行中</td>
                                                <td>5</td>
                                            </tr>
                                            <tr>
                                                <td><a href="project_task_detail.html">UI - 用户注册222222</a></td>
                                                <td></td>
                                                <td>已完成</td>
                                                <td>3</td>
                                            </tr>
                                            <tr>
                                                <td><a href="project_task_detail.html">UI - 用户忘记密码</a></td>
                                                <td></td>
                                                <td>进行中</td>
                                                <td>3</td>
                                            </tr>
                                            <tr>
                                                <td><a href="project_task_detail.html">任务1</a></td>
                                                <td>2017-06-28</td>
                                                <td>未开始</td>
                                                <td>0</td>
                                            </tr>
                                            <tr>
                                                <td><a href="project_task_detail.html">32432423423423423</a></td>
                                                <td>2017-06-30</td>
                                                <td>进行中</td>
                                                <td>0</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="profile-desk">
                                        <h1>Bug<a class="pull-right" style="font-size: 16px;" href="test.html">更多</a></h1>
                                        <table class="table table-bordered table-striped table-condensed cf">
                                            <thead class="cf">
                                            <tr>
                                                <th>Bug标题</th>
                                                <th>创建日期</th>
                                                <th class="numeric">状态</th>
                                                <th>创建人</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><a href="project_test_detail.html">发布项目出错，提示手机必填</a></td>
                                                <td>2017-03-28</td>
                                                <td>不予解决</td>
                                                <td><a href="#">李白</a></td>
                                            </tr>

                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <header class="panel-heading"> 知识 <span class="pull-right"> <a href="knowledge_manage?userid=${user.userid}">更多</a></span> </header>
                                <div class="panel-body">
                                    <ul class="activity-list" id="knowledge_avatar">
                                       
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <header class="panel-heading"> 相册 <span class="pull-right"> <a href="listAlbumsByUserid">更多</a></span> </header>
                                <div class="panel-body">
                                <div id="gallery" class="media-gal">

                                   
                               </div>
                              </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div aria-hidden="true" aria-labelledby="noticeModalLabel" role="dialog" tabindex="-1" id="noticeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">公告详情</h4>
                    </div>
                    <div class="modal-body">
                        <p id="notice-box"></p>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-primary" type="button">关闭</button>
                    </div>
                </div>
            </div>
        </div>
        <footer> 2016 © Admin by Lock &nbsp;&nbsp;<a href="">OPMS官网</a> · <a href="">OPMS手册</a></footer>
    </div>
</section>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<div id="ascrail2000" class="nicescroll-rails" style="width: 6px; z-index: 1000; background: rgb(66, 79, 99) none repeat scroll 0% 0%; cursor: default; position: fixed; top: 0px; height: 100%; right: 0px; opacity: 0;">
    <div style="position: relative; top: 0px; float: right; width: 6px; height: 188px; background-color: rgb(101, 206, 167); border: 0px none; background-clip: padding-box; border-radius: 0px;"></div>
</div>
<div id="ascrail2000-hr" class="nicescroll-rails" style="height: 6px; z-index: 1000; background: rgb(66, 79, 99) none repeat scroll 0% 0%; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; display: none; opacity: 0;">
    <div style="position: relative; top: 0px; height: 6px; width: 1366px; background-color: rgb(101, 206, 167); border: 0px none; background-clip: padding-box; border-radius: 0px;"></div>
</div>
<div id="ascrail2001" class="nicescroll-rails" style="width: 3px; z-index: 100; background: rgb(66, 79, 99) none repeat scroll 0% 0%; cursor: default; position: fixed; top: 0px; left: 137px; height: 636px; display: none; opacity: 0;">
    <div style="position: relative; top: 0px; float: right; width: 3px; height: 0px; background-color: rgb(101, 206, 167); border: 0px none; background-clip: padding-box; border-radius: 0px;"></div>
</div>
<div id="ascrail2001-hr" class="nicescroll-rails" style="height: 3px; z-index: 100; background: rgb(66, 79, 99) none repeat scroll 0% 0%; top: 633px; left: 0px; position: fixed; cursor: default; display: none; opacity: 0;">
    <div style="position: relative; top: 0px; height: 3px; width: 0px; background-color: rgb(101, 206, 167); border: 0px none; background-clip: padding-box; border-radius: 0px; left: 0px;"></div>
</div>
<script src="js/jquery.validate.js"></script>
<script src="js/opms.js"></script>
<script src="js/clndr.js"></script>
<script src="js/evnt.calendar.init.js"></script>
<script src="js/moment-2.2.1.js"></script>
<script src="js/underscore-min.js"></script>
<script>
    $(function(){
        $('#noticeModal').on('show.bs.modal', function (e) {
            $('#notice-box').html($(e.relatedTarget).attr('data-content'))
        });
         var Url="/OPMS/knowledge_manage01";
        $.ajax({
        	url:Url,
        	dataType:"json",
        	type:"post",
        	success:function(data){
            	alert(data);
        		var html="";
        		for(var i=0;i<2;i++)
        			{
        			   html+="<li>"
        			       +"<div class='avatar'>"
        			       +"<img src='img/96d7546cbe9cbe9e36ce11ffd9afcc95-cropper.jpg' alt='${user.username}'>"
        			       +"</div>"
        			       +"<div class='activity-desk'>"
        			       +"<h5>"
        			       +"<a href='#'>"+data[i].username+"</a>"
        			       +"<span>:"
        			       +"<a href='knowledge_detail?knowid="+data[i].knowid+"' style='color: rgb(42, 50, 63);'>"+data[i].title+"</a>"
        			       +"</span>"
        			       +"</h5>"
        			       +"<p class='text-muted'>"+data[i].summary+"</p>"
        			       +"<p class='pull-right text-muted'>"
        			       +"<i class='fa fa-eye'>"+data[i].viewnum+"&nbsp;&nbsp;&nbsp;</i>"
        			       +"<i class='fa fa-heart'>"+data[i].laudnum+"&nbsp;&nbsp;&nbsp;</i>"
        			       +"<i class='fa fa-envelope-o'>"+data[i].comtnum+"&nbsp;&nbsp;&nbsp;"+data[i].created+"</i>"
        			       +"</div></p>"
        			       +"</li>";
        			}
        		$('#knowledge_avatar').append(html);
        	}
        });
        var Url="/OPMS/myInfo";
        $.ajax({
        	dataType:'json',
        	type:'post',
        	url:Url,
        	success:function(data){
        		var html="";
        		html+="<li>"
        		        +"<div class='title'>姓名</div>"
        		        +"<div class='desk'>${user.username}</div>"
        		        +"</li>"
        		        +"<li>"
        		        +"<div class='title'>性别</div>"
        		        +"<div class='desk'>"+data.sex+"</div>"
        		        +"</li>"
        		        +"<li>"
        		        +"<div class='title'>生日</div>"
        		        +"<div class='desk'>"+data.birth+"</div>"
        		        +"</li>"
        		        +"<li>"
        		        +"<div class='title'>电话</div>"
        		        +"<div class='desk'>"+data.phone+"</div>"
        		        +"</li>"
        		        +"<li>"
        		        +"<div class='title'>部门</div>"
        		        +"<div class='desk'>"+data.name2+"</div>"
        		        +"</li>"
        		        +"<li>"
        		        +"<div class='title'>职称</div>"
        		        +" <div class='desk'>"+data.name1+"</div>"
        		        +"</li>";
        		  $('#info').append(html);
        	}
        	
        });
        var Url="/OPMS/mygallery";
        $.ajax({
        	dataType:'json',
             type:'post',
             url:Url,
             success:function(data){
            	 var html="";
            	 for(var i=0;i<data.length;i++)
            		 {
            		     html+="<div class='images item'>"
            		     +"<a href='uploadImg/"+data[i].picture+"' title="+data[i].summary+">"
            		     +"<img src='uploadImg/"+data[i].picture+"' alt="+data[i].albumid+">"
            		     +"</a>"
            		     +"<p><a href='getAlbums"+data[i].albumid+"'>"+data[i].keywords+"</a> </p>"
            		     +"<p>"+data[i].summary+"</p>" 
            		     +"</div>";
            		 }
            	 $('#gallery').append(html);
            	 
             }
        	
        });
       /*  var Url="OPMS/"
        $.ajax({
        	dataType:'json',
            type:'post',
            url:Url,
            success:function(data)
            {
            	alert(data);
            	var html="";
            	for(var i=0;data.length;i++)
            		{
            		    html+="<tr>";
            		        +"<td>";
            		        +"<a href="project_detail.html">测试项目</a>"
            		        +"</td>";
            		        +"<td>2017-06-28</td>";
            		        +"<td>进行</td>";
            		        +"<td><a href="user_index.html">李白</a></td>"
            		        +" </tr>";
            		}
            }
        }) */
        
        
        
        
    });
</script>
</body>
</html>
