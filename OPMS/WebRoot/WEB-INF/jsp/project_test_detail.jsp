<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="overflow: hidden;" lang="en">
<head>
    <meta charset="UTF-8">
    <title>OPMS管理系统</title>
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
                            libai
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
        <div class="page-heading">
            <h3> 测试管理 </h3>
            <ul class="breadcrumb pull-left">
                <li> <a href="user_index.html">OPMS</a> </li>
                <li> <a href="project_manage.html">testkin1</a> </li>
                <li class="active"> Bug </li>
            </ul>
            <div class="pull-right">
                <a href="project_team.html" class="btn btn-success">团队</a>
                <a href="project_need.html" class="btn btn-success">需求</a>
                <a href="project_task.html" class="btn btn-success">任务</a>
                <a href="project_test.html" class="btn btn-success">Bug</a>
                <a href="" class="btn btn-success">文档</a>
                <a href="" class="btn btn-success">版本</a>
                <a href="" class="btn btn-warning">报表</a>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="wrapper">
            <div class="row">
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="profile-desk">
                                        <h1>测试描述</h1>
                                        <div class="content"> ${bug.bugdesc} </div>
                                        <h1>关联需求</h1>
                                        <div class="content">  ${bug.getNeedname()} </div>
                                        <h1>关联项目</h1>
                                        <div class="content">  ${projectName} </div>
                                        <a class="btn p-follow-btn" href="edit_project_test.html"> <i class="fa fa-check"></i> 编辑</a>&nbsp;
                                        <a href="javascript:;" class="btn p-follow-btn js-test-delete" data-id="${bug.testid}"> <i class="fa fa-times"></i> 删除</a>&nbsp;
                                        <c:if test="${bug.status==1}">
                                            <a href="javascript:;" class="btn p-follow-btn js-test-status active" data-id="${bug.testid}" data-status="1" data-oldstatus="${bug.status}">设计如此</a>&nbsp;
                                        </c:if>
                                        <c:if test="${bug.status!=1}">
                                            <a href="javascript:;" class="btn p-follow-btn js-test-status" data-id="${bug.testid}" data-status="1" data-oldstatus="${bug.status}">设计如此</a>&nbsp;
                                        </c:if>
                                        
                                        <c:if test="${bug.status==2}">
                                              <a href="javascript:;" class="btn p-follow-btn js-test-status active" data-id="${bug.testid}" data-status="2" data-oldstatus="${bug.status}">重复Bug</a>&nbsp;
                                        </c:if>
                                        <c:if test="${bug.status!=2}">
                                              <a href="javascript:;" class="btn p-follow-btn js-test-status " data-id="${bug.testid}" data-status="2" data-oldstatus="${bug.status}">重复Bug</a>&nbsp;
                                        </c:if>
                                        
                                        <c:if test="${bug.status==3}">
                                             <a href="javascript:;" class="btn p-follow-btn js-test-status active" data-id="${bug.testid}" data-status="3" data-oldstatus="${bug.status}">外部原因</a>&nbsp;
                                        </c:if>
                                        <c:if test="${bug.status!=3}">
                                             <a href="javascript:;" class="btn p-follow-btn js-test-status " data-id="${bug.testid}" data-status="3" data-oldstatus="${bug.status}">外部原因</a>&nbsp;
                                        </c:if>
                                        
                                        <c:if test="${bug.status==4}">
                                             <a href="javascript:;" class="btn p-follow-btn js-test-status active" data-id="${bug.testid}" data-status="4" data-oldstatus="${bug.status}">已解决</a>&nbsp;
                                        </c:if>
                                        <c:if test="${bug.status!=4}">
                                             <a href="javascript:;" class="btn p-follow-btn js-test-status " data-id="${bug.testid}" data-status="4" data-oldstatus="${bug.status}">已解决</a>&nbsp;
                                        </c:if>
                                        
                                        <c:if test="${bug.status==5}">
                                             <a href="javascript:;" class="btn p-follow-btn js-test-status active" data-id="${bug.testid}" data-status="5" data-oldstatus="${bug.status}">无法重现</a>&nbsp;
                                        </c:if>
                                        <c:if test="${bug.status!=5}">
                                             <a href="javascript:;" class="btn p-follow-btn js-test-status " data-id="${bug.testid}" data-status="5" data-oldstatus="${bug.status}">无法重现</a>&nbsp;
                                        </c:if>
                                        
                                        <c:if test="${bug.status==6}">
                                             <a href="javascript:;" class="btn p-follow-btn js-test-status active" data-id="${bug.testid}" data-status="6" data-oldstatus="${bug.status}">延期处理</a>&nbsp;
                                        </c:if>
                                        <c:if test="${bug.status!=6}">
                                             <a href="javascript:;" class="btn p-follow-btn js-test-status " data-id="${bug.testid}" data-status="6" data-oldstatus="${bug.status}">延期处理</a>&nbsp;
                                        </c:if>
                                        
                                        <c:if test="${bug.status==7}">
                                             <a href="javascript:;" class="btn p-follow-btn js-test-status active" data-id="${bug.testid}" data-status="7" data-oldstatus="${bug.status}">不予解决</a>&nbsp;
                                        </c:if>
                                        <c:if test="${bug.status!=7}">
                                             <a href="javascript:;" class="btn p-follow-btn js-test-status " data-id="${bug.testid}" data-status="7" data-oldstatus="${bug.status}">不予解决</a>&nbsp;
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="profile-desk">

                                        <h1>历史记录</h1>

                                        <ul>
                                            <li>2017-07-12 22:55 李白创建了测试</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel">
                        <div class="panel-body">
                            <ul class="p-info">
                                <li>
                                    <div class="title">Bug标题</div>
                                    <div class="desk">${bug.name}</div>
                                </li>
                                <li>
                                    <div class="title">优先级</div>
                                    <div class="desk">${bug.level}</div>
                                </li>
                                <li>
                                    <div class="title">状态</div>
                                    <div class="desk">${bug.getState()}</div>
                                </li>
                                <li>
                                    <div class="title">创建人</div>
                                    <div class="desk">${bug.getCreateUser()}</div>
                                </li>
                                <li>
                                    <div class="title">指派人</div>
                                    <div class="desk">${bug.getAcceptPeople()}</div>
                                </li>
                                <li>
                                    <div class="title">完成者</div>
                                    <div class="desk">${bug.getCompletePeople()}</div>
                                </li>
                                <li>
                                    <div class="title">操作系统</div>
                                    <div class="desk">${bug.getOs()}</div>
                                </li>
                                <li>
                                    <div class="title">浏览器</div>
                                    <div class="desk">${bug.getBrowser()}</div>
                                </li>
                            </ul>
                        </div>
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
    <div style="position: relative; top: 0px; float: right; width: 6px; height: 404px; background-color: rgb(101, 206, 167); border: 0px none; background-clip: padding-box; border-radius: 0px;"></div>
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


</body>
</html>
