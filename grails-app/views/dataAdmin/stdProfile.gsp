<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><g:if test="${session.pgTitle}">${session.pgTitle}</g:if><g:else>e-Governance</g:else></title>
		<link rel="icon" type="image/png" href="${resource(dir:'egov_img',file:'nationEmblem.png')}" style="max-width:50%; max-height:50%;">
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       
        
        <link href="${resource(dir:'css/egov_css/',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css" />
        <link href="${resource(dir:'css/egov_css/',file:'font-awesome.min.css')}" rel="stylesheet" type="text/css" />
        
         <!-- Theme style -->
        <link href="${resource(dir:'css/egov_css/',file:'AdminLTE.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Ionicons -->
        <link href="${resource(dir:'css/egov_css/',file:'ionicons.min.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Morris chart -->
        <link href="${resource(dir:'css/egov_css/morris/',file:'morris.css')}" rel="stylesheet" type="text/css" />
        
        <!-- jvectormap -->
		<link href="${resource(dir:'css/egov_css/jvectormap/',file:'jquery-jvectormap-1.2.2.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Date Picker -->
        <link href="${resource(dir:'css/egov_css/datepicker/',file:'datepicker3.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Daterange picker -->
		<link href="${resource(dir:'css/egov_css/daterangepicker/',file:'daterangepicker-bs3.css')}" rel="stylesheet" type="text/css" />
        
        <!-- bootstrap wysihtml5 - text editor -->
		<link href="${resource(dir:'css/egov_css/bootstrap-wysihtml5/',file:'bootstrap3-wysihtml5.min.css')}" rel="stylesheet" type="text/css" />
        
 
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.html" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
           <img src="${resource(dir:'egov_img',file:'logo.png')}" alt="Logo" width="100%" border="0"> </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="javascript:" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu">
                            <a href="" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope"></i>
                                <span class="label label-success">4</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 4 messages</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><!-- start message -->
                                            <a href="">
                                                <div class="pull-left">
                                                    <img src="${resource(dir:'egov_img',file:'avatar3.png')}" class="img-circle" alt="User Image"/>
                                                </div>
                                                <h4>
                                                    Amrita Vidyalayam Delhi
                                                    <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                                </h4>
                                                <p>Approval for new infrastructure</p>
                                            </a>
                                        </li><!-- end message -->
                                        <li>
                                            <a href="">
                                                <div class="pull-left">
                                                    <img src="${resource(dir:'egov_img',file:'avatar2.png')}" class="img-circle" alt="user image"/>
                                                </div>
                                                <h4>
                                                    Navodaya Public School
                                                    <small><i class="fa fa-clock-o"></i> 2 hours</small>
                                                </h4>
                                                <p>Seeking final assessments guidelines!</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="">See All Messages</a></li>
                            </ul>
                        </li>
                        <!-- Notifications: style can be found in dropdown.less -->
                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-warning"></i>
                                <span class="label label-warning">10</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 10 notifications</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><a href="">
                                                <i class="ion ion-ios7-people info"></i> 5000 new students joined today
                                            </a>
                                        </li>
                                        
                                        <li><a href="javascript:"><i class="fa fa-warning danger"></i> School performance review pending
                                            </a>
                                        </li>
                                        
                                        <li>
                                            <a href="">
                                                <i class="ion ion-checkmark-round success"></i> Kendriya Vidyalam Calicut registration complete
                                            </a>
                                        </li>
                                        
                                        <li>
                                            <a href="">
                                                <i class="ion ion-ios7-person danger"></i> You changed your username
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="">View all</a></li>
                            </ul>
                        </li>
                        <!-- Tasks: style can be found in dropdown.less -->
                        <li class="dropdown tasks-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-tasks"></i>
                                <span class="label label-danger">3</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 3 tasks</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><!-- Task item -->
                                            <a href="">
                                                <h3>
                                                    Profile completion status
                                                    <small class="pull-right">20%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">20% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="">
                                                <h3>
                                                    South zone schools mark entry status
                                                    <small class="pull-right">60%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">60% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="">
                                                <h3>
                                                    CBSE rating yet to be done for 98 schools
                                                    <small class="pull-right">80%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">80% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="">View all tasks</a>
                                </li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>${name}<i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                           
                                <!-- User image 
                               <li class="user-header bg-light-blue">
                                    <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                                    <p>
                                        Jane Doe - Web Developer
                                        <small>Member since Nov. 2012</small>
                                    </p>
                                </li>
                                -->
                                <!-- Menu Body
                              
                                <li class="user-body">
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Followers</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Sales</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Friends</a>
                                    </div>
                                </li>
                                 -->
                                <!-- Menu Footer-->
                                <li class="user-footer">
	                                        <a href="" class="btn btn-default btn-flat"><span class="glyphicon glyphicon-user"></span> Profile</a>
	                                    	<a href="" class="btn btn-default btn-flat"><span class="glyphicon glyphicon-envelope"></span> Message</a>
	                                    	<a href="${createLink(controller:'logout',action:'index')}" class="btn btn-default btn-flat"><span class="glyphicon glyphicon-share"></span> Sign out</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <!--<div class="user-panel">
                        <div class="pull-left image">
                            <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hello, Jane</p>

                            <a href="javascript:"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>-->
                    <!-- search form -->
                    <form action="" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <g:link controller="dashboard" action="index">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </g:link>
                        </li>
                       <li class="treeview">
                            <a href="javascript:">
                                <i class="fa fa-line-chart"></i>
                                <span>School Ratings</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li class="treeview"><a href="javascript:"><i class="fa fa-area-chart"></i> <span>CBSE Rating</span> <i class="fa fa-angle-left pull-right"></i></a>
                                    <ul class="treeview-menu">
 										<li><g:link controller="ratings" action="trendAnalysis"><i class="fa fa-angle-double-right"></i> Student Distribution</g:link></li>
                                        <li><g:link controller="ratings" action="geoTrendAnalysis"><i class="fa fa-angle-double-right"></i> Region analytics</g:link></li>
                                        <li><g:link controller="ratings" action="acadRept"><i class="fa fa-angle-double-right"></i> Academic Reputation</g:link></li>
                                        <!--  
                                        <li><a href="infrastructure.html"><i class="fa fa-angle-double-right"></i> Infrastructure</a></li>
                                        <li><a href="co-curriculur.html"><i class="fa fa-angle-double-right"></i> Co-Curriculur Education</a></li>
                                        <li><a href="faculty-competence.html"><i class="fa fa-angle-double-right"></i> Faculty Competence</a></li>
                                        <li><a href="parental-involvement.html"><i class="fa fa-angle-double-right"></i> Parental Involvement</a></li>
                                        -->
                                    </ul>
                                </li>
                                <!-- 
								<li><a href="cumulative.html"><i class="fa fa-angle-double-right"></i> Cumulative Rating</a></li>
                                <li><a href="school-self-rating.html"><i class="fa fa-angle-double-right"></i> School Self-Rating</a></li>
                                <li><a href="parent-rating.html"><i class="fa fa-angle-double-right"></i> Parent Rating</a></li>
                                <li><a href="teacher-rating.html"><i class="fa fa-angle-double-right"></i> Teacher Rating</a></li>
                                <li><a href="student-rating.html"><i class="fa fa-angle-double-right"></i> Student Rating</a></li>
                                 -->
                            </ul>
                        </li>
                        <li class="treeview active">
                            <a href="javascript:">
                                <i class="fa fa-database"></i>
                                <span>Data Admin</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><g:link controller="DataAdmin" action="teachProfile"><i class="fa fa-angle-double-right"></i> Faculty Profile</g:link></li>
                                <li><g:link controller="DataAdmin" action="studProfile"><i class="fa fa-angle-double-right"></i> Student Profile</g:link></li>
                                <li><g:link controller="DataAdmin" action="assessments"><i class="fa fa-angle-double-right"></i> Assessments</g:link></li>
                                <li><g:link controller="DataAdmin" action="Performance"><i class="fa fa-angle-double-right"></i> Performance</g:link></li>
                                <li><g:link controller="DataAdmin" action="stdreport"><i class="fa fa-angle-double-right"></i>  Student Report</g:link></li>
                                <li><g:link controller="DataAdmin" action="regsub"><i class="fa fa-angle-double-right"></i> Registered Subjects</g:link></li>
                                <li><g:link controller="DataAdmin" action="authoring"><i class="fa fa-angle-double-right"></i> Authoring</g:link></li>
                                <li><g:link controller="DataAdmin" action="qnbank"><i class="fa fa-angle-double-right"></i> Question Bank</g:link></li>
                            </ul>
                        </li>
                        
                        <li class="treeview">
                            <a href="javascript:">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>CCE</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li class="treeview"><a href="javascript:"><i class="fa fa-pie-chart"></i> <span>Class Reports</span> <i class="fa fa-angle-left pull-right"></i></a>
                                    <ul class="treeview-menu">
                                        <li><g:link controller="CCE" action="classSubjAnalysisReport"><i class="fa fa-angle-double-right"></i> Subject Analysis</g:link></li>
                                        <li><g:link controller="CCE" action="classPerformanceReport"><i class="fa fa-angle-double-right"></i> Performance Analysis</g:link></li>
                                    </ul>
                                </li>
                                <li class="treeview"><a href="javascript:"><i class="fa fa-pie-chart"></i> <span>Teacher Reports</span> <i class="fa fa-angle-left pull-right"></i></a>
                                    <ul class="treeview-menu">
                                        <li><g:link controller="CCE" action="teacherClassPerformanceReport"><i class="fa fa-angle-double-right"></i>  Performance</g:link></li>
                                        <li><g:link controller="CCE" action="teacherMarkEntryStatusReport"><i class="fa fa-angle-double-right"></i> Mark Entry</g:link></li>
                                    </ul>
                                </li>
                              <li>
                              <g:link controller="CCE" action="studPositionReport"><i class="fa fa-angle-double-right"></i> Student Report</g:link>
                              </li>
                            </ul>      
                        </li>
                        
                        <li class="treeview">
                            <a href="javascript:">
                                <i class="fa fa-building"></i> <span>School Performance</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                            	<li><g:link controller="performanceCbse" action="psa"><i class="fa fa-angle-double-right"></i>  PSA</g:link></li>
                            	<li><g:link controller="performanceCbse" action="cbseCCE"><i class="fa fa-angle-double-right"></i>Co-Scholastic</g:link></li>
                            	<li><g:link controller="performanceCbse" action="plusTwo"><i class="fa fa-angle-double-right"></i>  Scholastic</g:link></li>
                            </ul>
                        </li>
                        
                        <li class="treeview">
                            <a href="javascript:">
                                <i class="fa fa-twitch"></i> <span>Forums</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                            	<li><g:link controller="forum" action="index"><i class="fa fa-angle-double-right"></i>  View Forum</g:link></li>
                            	<li><g:link controller="forum" action="chat"><i class="fa fa-angle-double-right"></i>  Chat</g:link></li>
                            </ul>
                        </li>
                       <!-- 
                        <li class="treeview">
                            <a href="javascript:">
                                <i class="fa fa-edit"></i> <span>Account</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="messages.html"><i class="fa fa-angle-double-right"></i> Messages</a></li>
                                <li><a href="profile.html"><i class="fa fa-angle-double-right"></i> Profile</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="javascript:">
                                <i class="fa fa-folder"></i> <span>Main Screens</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="pages/examples/login-screen.html"><i class="fa fa-angle-double-right"></i> Login</a></li>
                                <li><a href="pages/examples/register-screen.html"><i class="fa fa-angle-double-right"></i> Register</a></li>
                            </ul>
                        </li>
                        -->
                       
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
           
			  <aside class="right-side"> 
			    <!-- Content Header (Page header) -->
			    <section class="content-header">
			      <h1> 
			      	Student Dashboard 
			      </h1>
			      <ol class="breadcrumb">
			        <li><a href="javascript:"><i class="fa fa-user"></i> Home</a></li>
			        <li class="active">Student Profile</li>
			      </ol>
			    </section>
			    
			    <!-- Main content -->
			    <section class="content"> 
			      
			      <!-- Small boxes (Stat box) -->
			      <div class="row">
			        <div class="col-lg-12">
			          <div class="col-lg-2 col-sm-3 col-xs-12"> 
			            <!-- small box -->
			            <div class="small-box bg-aqua">
			              <div class="inner" style="text-align:center;"> <img src="img/avatar/male.png" width="70%" alt="Avatar">
			                <h4>
			                	 Mr. Prakash Roy
			                </h4>
			              </div>
			            </div>
			          </div>
			          <!-- ./col -->
			          
			          <div class="col-lg-10 col-sm-9 col-xs-12">
			            <div class="col-lg-4 col-sm-6 col-xs-12"> 
			              <!-- small box -->
			              <div class="small-box bg-aqua">
			                <div class="inner">
			                  <h3> 3 times </h3>
			                  <p> Academic Proficiency </p>
			                </div>
			                <div class="icon"> <i class="ion ion-university"></i> </div>
			                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
			            </div>
			            <!-- ./col -->
			            <div class="col-lg-4 col-sm-6 col-xs-12"> 
			              <!-- small box -->
			              <div class="small-box bg-green">
			                <div class="inner">
			                  <h3> 82<sup style="font-size: 20px">%</sup> </h3>
			                  <p> Rated by faculty </p>
			                </div>
			                <div class="icon"> <i class="ion ion-stats-bars"></i> </div>
			                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
			            </div>
			            <!-- ./col -->
			            <div class="col-lg-4 col-sm-6 col-xs-12"> 
			              <!-- small box -->
			              <div class="small-box bg-yellow">
			                <div class="inner">
			                  <h3> #4 </h3>
			                  <p> School prefect </p>
			                </div>
			                <div class="icon"> <i class="ion ion-person-add"></i> </div>
			                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
			            </div>
			            <!-- ./col -->
			            <div class="col-lg-4 col-sm-6 col-xs-12"> 
			              <!-- small box -->
			              <div class="small-box bg-red">
			                <div class="inner">
			                  <h3> 65 </h3>
			                  <p> Unique Visitors </p>
			                </div>
			                <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
			                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
			            </div>
			            <!-- ./col --> 
			             <div class="col-lg-4 col-sm-6 col-xs-12"> 
			              <!-- small box -->
			              <div class="small-box bg-red">
			                <div class="inner">
			                  <h3> 65 </h3>
			                  <p> Unique Visitors </p>
			                </div>
			                <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
			                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
			            </div>
			            <!-- ./col --> 
			             <div class="col-lg-4 col-sm-6 col-xs-12"> 
			              <!-- small box -->
			              <div class="small-box bg-red">
			                <div class="inner">
			                  <h3> 65 </h3>
			                  <p> Unique Visitors </p>
			                </div>
			                <div class="icon"> <i class="ion ion-pie-graph"></i> </div>
			                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
			            </div>
			            <!-- ./col --> 
			          </div>
			        </div>
			      </div>
			      <!-- /.row --> 
			      
			      <!-- Main row -->
			      
			      <div class="row"> 
			        <!-- Left col -->
			        
			        <section class="box col-lg-12">
			          <h3 class="box-title">Course Stats</h3>
			          	<div class="nav-tabs-custom">
			                                <!-- Tabs within a box -->
			                <ul class="nav nav-tabs pull-right">
			                    <li class="active"><a href="#courses" data-toggle="tab">Courses</a></li>
			                    <li><a href="#quiz" data-toggle="tab">Quiz</a></li>
			                    <li><a href="#assignments" data-toggle="tab">Assignments</a></li>
			                    <li class="pull-left header"><i class="fa fa-inbox"></i> Courses</li>
			                </ul>
			                <div class="tab-content no-padding">
			                    <!-- Morris chart - Sales -->
			                    <div class="chart tab-pane active" id="courses" style="position: relative; height: 300px;"></div>
			                    <div class="chart tab-pane" id="quiz" style="position: relative; height: 300px;"></div>
			                    <div class="chart tab-pane" id="assignments" style="position: relative; height: 300px;"></div>
			                </div>
			            </div>
			        </section>
			      </div>
			      
			      <div class="row"> 
			        <!-- Left col -->        
			        <section class="col-lg-12">
			          	<div class="box box-primary">
			                <div class="box-header">
			                    <i class="ion ion-clipboard"></i>
			                    <h3 class="box-title">To Do List</h3>
			                    <div class="box-tools pull-right">
			                        <ul class="pagination pagination-sm inline">
			                            <li><a href="#">&laquo;</a></li>
			                            <li><a href="#">1</a></li>
			                            <li><a href="#">2</a></li>
			                            <li><a href="#">3</a></li>
			                            <li><a href="#">&raquo;</a></li>
			                        </ul>
			                    </div>
			                </div><!-- /.box-header -->
			                <div class="box-body">
			                    <ul class="todo-list">
			                        <li>
			                            <!-- drag handle -->
			                            <span class="handle">
			                                <i class="fa fa-ellipsis-v"></i>
			                                <i class="fa fa-ellipsis-v"></i>
			                            </span>
			                            <!-- checkbox -->
			                            <input type="checkbox" value="" name=""/>
			                            <!-- todo text -->
			                            <span class="text">Assignment Submission</span>
			                            <!-- Emphasis label -->
			                            <small class="label label-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
			                            <!-- General tools such as edit or delete-->
			                            <div class="tools">
			                                <i class="fa fa-edit"></i>
			                                <i class="fa fa-trash-o"></i>
			                            </div>
			                        </li>
			                        <li>
			                            <span class="handle">
			                                <i class="fa fa-ellipsis-v"></i>
			                                <i class="fa fa-ellipsis-v"></i>
			                            </span>
			                            <input type="checkbox" value="" name=""/>
			                            <span class="text">Seminar preperation</span>
			                            <small class="label label-info"><i class="fa fa-clock-o"></i> 3 days</small>
			                            <div class="tools">
			                                <i class="fa fa-edit"></i>
			                                <i class="fa fa-trash-o"></i>
			                            </div>
			                        </li>
			                        <li>
			                            <span class="handle">
			                                <i class="fa fa-ellipsis-v"></i>
			                                <i class="fa fa-ellipsis-v"></i>
			                            </span>
			                            <input type="checkbox" value="" name=""/>
			                            <span class="text">Let theme shine like a star</span>
			                            <small class="label label-warning"><i class="fa fa-clock-o"></i> 1 day</small>
			                            <div class="tools">
			                                <i class="fa fa-edit"></i>
			                                <i class="fa fa-trash-o"></i>
			                            </div>
			                        </li>
			                        <li>
			                            <span class="handle">
			                                <i class="fa fa-ellipsis-v"></i>
			                                <i class="fa fa-ellipsis-v"></i>
			                            </span>
			                            <input type="checkbox" value="" name=""/>
			                            <span class="text">Let theme shine like a star</span>
			                            <small class="label label-success"><i class="fa fa-clock-o"></i> 3 days</small>
			                            <div class="tools">
			                                <i class="fa fa-edit"></i>
			                                <i class="fa fa-trash-o"></i>
			                            </div>
			                        </li>
			                        <li>
			                            <span class="handle">
			                                <i class="fa fa-ellipsis-v"></i>
			                                <i class="fa fa-ellipsis-v"></i>
			                            </span>
			                            <input type="checkbox" value="" name=""/>
			                            <span class="text">Check your messages and notifications</span>
			                            <small class="label label-primary"><i class="fa fa-clock-o"></i> 1 week</small>
			                            <div class="tools">
			                                <i class="fa fa-edit"></i>
			                                <i class="fa fa-trash-o"></i>
			                            </div>
			                        </li>
			                        <li>
			                            <span class="handle">
			                                <i class="fa fa-ellipsis-v"></i>
			                                <i class="fa fa-ellipsis-v"></i>
			                            </span>
			                            <input type="checkbox" value="" name=""/>
			                            <span class="text">Let theme shine like a star</span>
			                            <small class="label label-default"><i class="fa fa-clock-o"></i> 1 month</small>
			                            <div class="tools">
			                                <i class="fa fa-edit"></i>
			                                <i class="fa fa-trash-o"></i>
			                            </div>
			                        </li>
			                    </ul>
			                </div><!-- /.box-body -->
			                <div class="box-footer clearfix no-border">
			                    <button class="btn btn-default pull-right"><i class="fa fa-plus"></i> Add item</button>
			                </div>
			            </div>
			        </section>
			      </div>
			      
			      <div class="row"> 
			        <!-- Left col -->        
			        <section class="col-lg-12">
			          	<div class="box box-info">
			                <div class="box-header">
			                    <i class="fa fa-envelope"></i>
			                    <h3 class="box-title">Quick Email</h3>
			                    <!-- tools box -->
			                    <div class="pull-right box-tools">
			                        <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
			                    </div><!-- /. tools -->
			                </div>
			                <div class="box-body">
			                    <form action="#" method="post">
			                        <div class="form-group">
			                            <input type="email" class="form-control" name="emailto" placeholder="Email to:"/>
			                        </div>
			                        <div class="form-group">
			                            <input type="text" class="form-control" name="subject" placeholder="Subject"/>
			                        </div>
			                        <div>
			                            <textarea class="textarea" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
			                        </div>
			                    </form>
			                </div>
			                <div class="box-footer clearfix">
			                    <button class="pull-right btn btn-default" id="sendEmail">Send <i class="fa fa-arrow-circle-right"></i></button>
			                </div>
			            </div>
			        </section>
			      </div>
			      
			      <div class="row">
			      	<div class="col-lg-12">
			            <div class="box box-solid">
			                <div class="box-header">
			                    <h3 class="box-title">Course Progress</h3>
			                </div><!-- /.box-header -->
			                <div class="box-body">
			                    GIT and Deployment: <code class="pull-right">50%</code>
			                    <div class="progress sm progress-striped active">
			                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
			                            <span class="sr-only">50% Complete</span>
			                        </div>
			                    </div>
			                    Frontend UI: <code class="pull-right">30%</code>
			                    <div class="progress sm progress-striped active">
			                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
			                            <span class="sr-only">30% Complete</span>
			                        </div>
			                    </div>
			                </div><!-- /.box-body -->
			            </div><!-- /.box -->
			        </div>
			      </div>
			      <!-- /.row (main row) --> 
			      
			    </section>
			    <!-- /.content --> 
			  </aside>
  <!-- /.right-side --> <!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->
        
        <!--  Footer  -->
		<footer class="footer">
        	<img src="${resource(dir:'egov_img',file:'avvp.png')}" alt="AVVP"> <img src="${resource(dir:'egov_img',file:'cdac-logo.png')}" border="0" alt="CDAC">
        </footer>
        <!--  Footer  -->

		
        <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/bootstrap',file:'bootstrap.min.js')}" type="text/javascript"></script>
	
		<script src="${createLinkTo(dir:'js/egov_js/jquery_ui_1.11.1',file:'jquery-ui.min.js')}" type="text/javascript"></script>
        
        <!-- Morris.js charts -->
		<script src="${createLinkTo(dir:'js/egov_js/raphael_2.1.0',file:'raphael-min.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/plugins/morris/',file:'morris.min.js')}" type="text/javascript"></script>
        
        
		
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>

        
        <script type="text/javascript">
            $(function() {
                "use strict";
				
				$('.box ul.nav a').on('shown.bs.tab', function(e) {
					area.redraw();
				});
				
				 // Sales chart
				var area = new Morris.Area({
					element: 'courses',
					resize: true,
					data: [
						{y: '2011 Q1', item1: 2666, item2: 2666},
						{y: '2011 Q2', item1: 2778, item2: 2294},
						{y: '2011 Q3', item1: 4912, item2: 1969},
						{y: '2011 Q4', item1: 3767, item2: 3597},
						{y: '2012 Q1', item1: 6810, item2: 1914},
						{y: '2012 Q2', item1: 5670, item2: 4293},
						{y: '2012 Q3', item1: 4820, item2: 3795},
						{y: '2012 Q4', item1: 15073, item2: 5967},
						{y: '2013 Q1', item1: 10687, item2: 4460},
						{y: '2013 Q2', item1: 8432, item2: 5713}
					],
					xkey: 'y',
					ykeys: ['item1', 'item2'],
					labels: ['Item 1', 'Item 2'],
					lineColors: ['#a0d0e0', '#3c8dbc'],
					hideHover: 'auto'
				});
				
				 // Sales chart
				var area = new Morris.Area({
					element: 'quiz',
					resize: true,
					data: [
						{y: '2011 Q1', item1: 2666, item2: 2666},
						{y: '2011 Q2', item1: 2778, item2: 2294},
						{y: '2011 Q3', item1: 4912, item2: 1969},
						{y: '2011 Q4', item1: 3767, item2: 3597},
						{y: '2012 Q1', item1: 6810, item2: 1914},
						{y: '2012 Q2', item1: 5670, item2: 4293},
						{y: '2012 Q3', item1: 4820, item2: 3795},
						{y: '2012 Q4', item1: 15073, item2: 5967},
						{y: '2013 Q1', item1: 10687, item2: 4460},
						{y: '2013 Q2', item1: 8432, item2: 5713}
					],
					xkey: 'y',
					ykeys: ['item1', 'item2'],
					labels: ['Item 1', 'Item 2'],
					lineColors: ['#a0d0e0', '#3c8dbc'],
					hideHover: 'auto'
				});
				
				 // Sales chart
				var area = new Morris.Area({
					element: 'assignments',
					resize: true,
					data: [
						{y: '2011 Q1', item1: 2666, item2: 2666},
						{y: '2011 Q2', item1: 2778, item2: 2294},
						{y: '2011 Q3', item1: 4912, item2: 1969},
						{y: '2011 Q4', item1: 3767, item2: 3597},
						{y: '2012 Q1', item1: 6810, item2: 1914},
						{y: '2012 Q2', item1: 5670, item2: 4293},
						{y: '2012 Q3', item1: 4820, item2: 3795},
						{y: '2012 Q4', item1: 15073, item2: 5967},
						{y: '2013 Q1', item1: 10687, item2: 4460},
						{y: '2013 Q2', item1: 8432, item2: 5713}
					],
					xkey: 'y',
					ykeys: ['item1', 'item2'],
					labels: ['Item 1', 'Item 2'],
					lineColors: ['#a0d0e0', '#3c8dbc'],
					hideHover: 'auto'
				});
            });
        </script>
        
   </body>
</html>