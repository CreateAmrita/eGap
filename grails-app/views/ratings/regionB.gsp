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
                        <li class="treeview active">
                            <a href="javascript:">
                                <i class="fa fa-line-chart"></i>
                                <span>School Ratings</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li class="treeview active"><a href="javascript:"><i class="fa fa-area-chart"></i> <span>CBSE Rating</span> <i class="fa fa-angle-left pull-right"></i></a>
                                    <ul class="treeview-menu">
                                        <li><g:link controller="ratings" action="acadRept"><i class="fa fa-angle-double-right"></i> Academic Reputation</g:link></li>
                                        <li><g:link controller="ratings" action="trendAnalysis"><i class="fa fa-angle-double-right"></i> Predictive analytics</g:link></li>
                                        <li><a href="infrastructure.html"><i class="fa fa-angle-double-right"></i> Infrastructure</a></li>
                                        <li><a href="co-curriculur.html"><i class="fa fa-angle-double-right"></i> Co-Curriculur Education</a></li>
                                        <li><a href="faculty-competence.html"><i class="fa fa-angle-double-right"></i> Faculty Competence</a></li>
                                        <li><a href="parental-involvement.html"><i class="fa fa-angle-double-right"></i> Parental Involvement</a></li>
                                    </ul>
                                </li>
								<li><a href="cumulative.html"><i class="fa fa-angle-double-right"></i> Cumulative Rating</a></li>
                                <li><a href="school-self-rating.html"><i class="fa fa-angle-double-right"></i> School Self-Rating</a></li>
                                <li><a href="parent-rating.html"><i class="fa fa-angle-double-right"></i> Parent Rating</a></li>
                                <li><a href="teacher-rating.html"><i class="fa fa-angle-double-right"></i> Teacher Rating</a></li>
                                <li><a href="student-rating.html"><i class="fa fa-angle-double-right"></i> Student Rating</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="javascript:">
                                <i class="fa fa-database"></i>
                                <span>Data Admin</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><g:link controller="DataAdmin" action="teachProfile"><i class="fa fa-angle-double-right"></i> Faculty Profile</g:link></li>
                                <!-- <li><g:link controller="DataAdmin" action="stdProfile"><i class="fa fa-angle-double-right"></i> Student Profile</g:link></li> -->
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
                                <i class="fa fa-book"></i> <span>Performance</span>
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
                       
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Predictive analytics
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-line-chart"></i> School Ratings</a></li>
                        <li><a href="javascript:"><i class="fa fa-area-chart"></i> CBSE Rating</a></li>
                        <li class="active">Predictive analytics</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                
                	      <!-- Dropdown-->
                	<section class="col-lg-12">
					<section class="col-lg-4 connectedSortable active"><h4>Select Region</h4>
						<div class="dropdown">
						  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
						    Region B
						    <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
						  
						   <li><g:link controller="ratings" action="regionA">Region "A"</g:link></li>
						   <li><g:link controller="ratings" action="regionB">Region "B"</g:link></li>
						   <li><g:link controller="ratings" action="regionC">Region "C"</g:link></li>
						   <li><g:link controller="ratings" action="regionD">Region "D"</g:link></li>
						   <li><g:link controller="ratings" action="regionG">Region "G"</g:link></li>
						   <li><g:link controller="ratings" action="regionM">Region "M"</g:link></li> 
						   <li><g:link controller="ratings" action="regionP">Region "P"</g:link></li>
						   <li><g:link controller="ratings" action="regionR">Region "R"</g:link></li>
						   <li><g:link controller="ratings" action="regionT">Region "T"</g:link></li>
						   <li><g:link controller="ratings" action="regionU">Region "U"</g:link></li>
						    
						  </ul>
						</div>
					</section>
					
					<section class="col-lg-4 connectedSortable active"><h4>Select Gender</h4>
						<div class="dropdown">
						  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
						   Select
						    <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
						  
						    
						    <li><g:link controller="ratings" action="male">Male</g:link></li>
						    <li><g:link controller="ratings" action="female">Female</g:link></li>
						    
						    
						  </ul>
						</div>
					</section>
					
					
				<!--	<section class="col-lg-4 connectedSortable active"><h4>Select Subject</h4>
						<div class="dropdown">
						  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
						   Select
						    <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
						  
						    <li><g:link controller="ratings" action="science">Science</g:link></li>
						    <li><g:link controller="ratings" action="commerce">Commerce</g:link></li>
						    <li><g:link controller="ratings" action="arts">Arts</g:link></li>
						    
						  </ul>
						</div>
					</section>-->
					
				</section>
				<!-- Dropdown-->

                    <!-- Main row -->
                    <div class="row">
                     	
                        <!-- Prediction box -->
                       <section class="col-lg-12 connectedSortable">
                            <div class="box ">
                                <div class="box-header">
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                                    </div><!-- /. tools -->
                                    <i class="fa fa-line-chart"></i>
                                    <h3 class="box-title">Prediction for stream selection</h3>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                                </div><!-- /.box-body -->
                            </div>
                        </section>
                      <!-- /.box -->
                     
                       
                    </div><!-- /.row (main row) -->

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
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
		
		
		 <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>

        
        <script>
        $(function () {
            $('#container').highcharts({
                title: {
                    text: 'Prediction for stream selection - Region "B"',
                    x: -20 //center
                },
               
                xAxis: {
                    categories: ['2015', '2016', '2017', '2018', '2019', '2020']//,'2021', '2022', '2023', '2024', '2025']
                },
                yAxis: {
                    title: {
                        text: 'Count'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: ''
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [{
                    name: 'Arts',
                    data: [248.4234726,245.3757832,242.5505016,240.0143862,237.7592769,235.7562364]//,233.9729444,232.3793239812,230.9490844,229.6598151,228.4925994]
                }, {
                    name: 'Commerce',
                    data: [367.7609876,365.7486798,364.2141892,363.0026512,362.0205668758,361.2080133]//,366.6787761,365.8157711,365.0517402,364.3706114,363.7596818]
                }, {
                    name: 'Science',
                    data: [497.0720632,493.1323823,489.3378538,485.6818631,482.1612687,478.7745321405]//,493.704043,491.8890298,490.1023749,488.3452724,486.6187898]
                }]
            });
        });
			
        </script>
        
   </body>
</html>