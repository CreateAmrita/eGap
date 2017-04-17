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
		
		<!-- Gridster -->
		<link href="${resource(dir:'css/egov_css/',file:'gridster.min.css')}" rel="stylesheet" type="text/css" />
		
        <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
        
        <script src="${createLinkTo(dir:'js/egov_js/bootstrap',file:'bootstrap.min.js')}" type="text/javascript"></script>
	
		<script src="${createLinkTo(dir:'js/egov_js/jquery_ui_1.11.1',file:'jquery-ui.min.js')}" type="text/javascript"></script>
        
             
        <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        
        
        
        <style>
        	
        body{
        	/* Prevent rightpadding pushing the body when popup is invoked*/
        	padding-right:0px !important;
        }

		 iframe {
			    display: block;
			    width: 100%;
			    height: 100%;
			    border:none;
		}
		
		.ui-helper-hidden-accessible{
			display:none;
		}
		       
       .chartContainer{
		    min-width: 310px;
		    height: 400px;
		    margin: 0 auto;
		    text-align: center;
		} 
		
		.chartContainer > .loaderImg{
			margin-top:25%;
		}
        
        </style>
 
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
		<g:render template="/templates/header" model="['login':true]"></g:render>
       	<!-- End of header --> 
        
        <!-- Main Section -->
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column for sidebar navigation-->
			
			
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
			            <sec:ifAnyGranted roles="ROLE_ADMIN">
			             <li class="treeview" id="one">
			                <a href="javascript:">
			                    <i class="fa fa-area-chart"></i>
			                    <span>Academics</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                    <li><g:link controller="CCE" action="classSubjAnalysisReport"><i class="fa fa-angle-double-right"></i>Subject Analysis</g:link></li>
			                    <li><g:link controller="CCE" action="classPerformanceReport"><i class="fa fa-angle-double-right"></i> Performance Analysis</g:link></li>
			                    <li><g:link controller="CCE" action="teacherMarkEntryStatusReport"><i class="fa fa-angle-double-right"></i> Mark Entry</g:link></li>
			                    <li><g:link controller="studTeachGraphs" action="cgpaWise"><i class="fa fa-angle-double-right"></i> CGPA Wise Performance</g:link></li>
			                    <li><g:link controller="studTeachGraphs" action="studPerfYrCatGen"><i class="fa fa-angle-double-right"></i> Year Wise Performance</g:link></li>
			            <!--     <li><g:link controller="studTeachGraphs" action="cgpaWise"><i class="fa fa-angle-double-right"></i> CGPA Wise Performance</g:link></li>  --> 
                       <!--      <li><g:link controller="studTeachGraphs" action="studPerfYrCatGen"><i class="fa fa-angle-double-right"></i> Year Wise Performance</g:link></li>  --> 
			                </ul>
			            </li>
			             <li class="treeview" id="two">
			                <a href="javascript:">
			                    <i class="fa fa-line-chart"></i>
			                    <span>Schools</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                    <li><g:link controller="ratings" action="geoTrendAnalysis"><i class="fa fa-angle-double-right"></i> Region Analytics</g:link></li>
                  				<li><g:link controller="performanceCbse" action="psa"><i class="fa fa-angle-double-right"></i>Assessment Comparison</g:link></li>
			                	<!--  <li><g:link controller="performanceCbse" action="cbseCCE"><i class="fa fa-angle-double-right"></i>Co-Scholastic</g:link></li>
			                	<li><g:link controller="performanceCbse" action="plusTwo"><i class="fa fa-angle-double-right"></i>Scholastic</g:link></li>
			               		-->
			                </ul>
			            </li>
			             <li class="treeview" id="three">
			                <a href="javascript:">
			                    <i class="fa fa-twitch"></i>
			                    <span>Students</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                    <li><g:link controller="ratings" action="trendAnalysis"><i class="fa fa-angle-double-right"></i> Student distribution</g:link></li>
			                     <li><g:link controller="CCE" action="studOptionalSubjReport"><i class="fa fa-angle-double-right"></i> Student Optional Subject</g:link></li>
			                     <li><g:link controller="CCE" action="studPositionReport"><i class="fa fa-angle-double-right"></i> Student position Report</g:link></li>
			                     <li><g:link controller="CCE" action="studTransferReport"><i class="fa fa-angle-double-right"></i> Student transfer Report</g:link></li>
			                     <li><g:link controller="studTeachGraphs" action="passPerf"><i class="fa fa-angle-double-right"></i> Student Pass Performance</g:link>
			                     <li><g:link controller="studTeachGraphs" action="gradeDist"><i class="fa fa-angle-double-right"></i> Student Grade Wise Distribution</g:link>
			                     <li><g:link controller="studTeachGraphs" action="studPerf"><i class="fa fa-angle-double-right"></i> Student Performance</g:link>
			                     <li><g:link controller="studTeachGraphs" action="gdAvgLowStudPerf"><i class="fa fa-angle-double-right"></i>Good/Avg/Low Students</g:link>
			       <!--          <li><g:link controller="studTeachGraphs" action="vocEnrlmnt"><i class="fa fa-angle-double-right"></i> Vocational Enrollment Statistics</g:link>  -->
			                </ul>
			            </li>
			             <li class="treeview" id="four">
			                <a href="javascript:">
			                    <i class="fa fa-bar-chart-o"></i>
			                    <span>Teachers</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                     <li><g:link controller="CCE" action="teacherClassPerformanceReport"><i class="fa fa-angle-double-right"></i>Teacher Class Performance</g:link></li>
			                     <li><g:link controller="studTeachGraphs" action="studTeachRatio"><i class="fa fa-angle-double-right"></i> Students Teachers Ratio</g:link></li>
			                     <li><g:link controller="studTeachGraphs" action="teachStat"><i class="fa fa-angle-double-right"></i> Trained Teacher Statistics</g:link></li>
			                     <li><g:link controller="CCE" action="teacherTransferReport"><i class="fa fa-angle-double-right"></i> Teacher transfer</g:link></li>
			                     <li><g:link controller="DataAdmin" action="teachProfile"><i class="fa fa-angle-double-right"></i> Faculty Profile</g:link></li>
			                </ul>
			            </li>
			           
			             <li class="treeview" id="six">
			                <a href="javascript:">
			                    <i class="fa fa-area-chart"></i>
			                    <span>Health</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                     <li><g:link controller="studTeachGraphs" action="healthStat"><i class="fa fa-angle-double-right"></i>Blood, Oral & Vision</g:link></li>
			                 	 <li><g:link controller="studTeachGraphs" action="heightVsWeight"><i class="fa fa-angle-double-right"></i>Height v/s Weight</g:link></li>
			                </ul>
			            </li>
			             <li class="treeview" id="seven">
			                <a href="javascript:">
			                    <i class="fa fa-bar-chart-o"></i>
			                    <span>Sports</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                    <li><g:link controller="studTeachGraphs" action="sports"><i class="fa fa-angle-double-right"></i> Sports Participation Statistics</g:link></li>
			                </ul>
			            </li>			           
			            
			            </sec:ifAnyGranted>
			            
			            <sec:ifAnyGranted roles="ROLE_SCHOOLS_MANAGER">
			               <li class="treeview" id="one">
			                <a href="javascript:">
			                    <i class="fa fa-area-chart"></i>
			                    <span>Academics</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                    <li><g:link controller="CCE" action="classSubjAnalysisReport"><i class="fa fa-angle-double-right"></i>Subject Analysis</g:link></li>
			                     <li><g:link controller="CCE" action="classPerformanceReport"><i class="fa fa-angle-double-right"></i> Performance Analysis</g:link></li>
			                     <li><g:link controller="CCE" action="teacherMarkEntryStatusReport"><i class="fa fa-angle-double-right"></i> Mark Entry</g:link></li>
			                     <li><g:link controller="studTeachGraphs" action="cgpaWise"><i class="fa fa-angle-double-right"></i> CGPA Wise Performance</g:link></li>
			                     <li><g:link controller="studTeachGraphs" action="studPerfYrCatGen"><i class="fa fa-angle-double-right"></i> Year Wise Performance</g:link></li>
			            <!--     <li><g:link controller="studTeachGraphs" action="cgpaWise"><i class="fa fa-angle-double-right"></i> CGPA Wise Performance</g:link></li>  --> 
                       <!--      <li><g:link controller="studTeachGraphs" action="studPerfYrCatGen"><i class="fa fa-angle-double-right"></i> Year Wise Performance</g:link></li>  --> 
			                </ul>
			            </li>
			             <li class="treeview" id="two">
			                <a href="javascript:">
			                    <i class="fa fa-line-chart"></i>
			                    <span>Schools</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                    <li><g:link controller="ratings" action="geoTrendAnalysis"><i class="fa fa-angle-double-right"></i> Region Analytics</g:link></li>
                  				<li><g:link controller="performanceCbse" action="psa"><i class="fa fa-angle-double-right"></i>Assessment Comparison</g:link></li>
  			                    <!-- 
  			                     <li><g:link controller="performanceCbse" action="cbseCCE"><i class="fa fa-angle-double-right"></i>Co-Scholastic</g:link></li>
			                	 <li><g:link controller="performanceCbse" action="plusTwo"><i class="fa fa-angle-double-right"></i>Scholastic</g:link></li>
			                     <li><a href="infrastructure.html"><i class="fa fa-angle-double-right"></i> Infrastructure</a></li>
			                     <li><a href="co-curriculur.html"><i class="fa fa-angle-double-right"></i> Co-Curriculur Education</a></li>
			                     <li><a href="faculty-competence.html"><i class="fa fa-angle-double-right"></i> Faculty Competence</a></li>
			                     <li><a href="parental-involvement.html"><i class="fa fa-angle-double-right"></i> Parental Involvement</a></li>
			                     -->
					             <!-- 
									<li><a href="cumulative.html"><i class="fa fa-angle-double-right"></i> Cumulative Rating</a></li>
					                <li><a href="school-self-rating.html"><i class="fa fa-angle-double-right"></i> School Self-Rating</a></li>
					                <li><a href="parent-rating.html"><i class="fa fa-angle-double-right"></i> Parent Rating</a></li>
					                <li><a href="teacher-rating.html"><i class="fa fa-angle-double-right"></i> Teacher Rating</a></li>
					                <li><a href="student-rating.html"><i class="fa fa-angle-double-right"></i> Student Rating</a></li>
					            -->
			                </ul>
			            </li>
			             <li class="treeview" id="three">
			                <a href="javascript:">
			                    <i class="fa fa-twitch"></i>
			                    <span>Students</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                    <li><g:link controller="ratings" action="trendAnalysis"><i class="fa fa-angle-double-right"></i> Student distribution</g:link></li>
			                     <li><g:link controller="CCE" action="studOptionalSubjReport"><i class="fa fa-angle-double-right"></i> Student Optional Subject</g:link></li>
			                     <li><g:link controller="CCE" action="studPositionReport"><i class="fa fa-angle-double-right"></i> Student position Report</g:link></li>
			                     <li><g:link controller="CCE" action="studTransferReport"><i class="fa fa-angle-double-right"></i> Student transfer Report</g:link></li>
			                     <li><g:link controller="studTeachGraphs" action="passPerf"><i class="fa fa-angle-double-right"></i> Student Pass Performance</g:link>
			                     <li><g:link controller="studTeachGraphs" action="gradeDist"><i class="fa fa-angle-double-right"></i> Student Grade Wise Distribution</g:link>
			                     <li><g:link controller="studTeachGraphs" action="studPerf"><i class="fa fa-angle-double-right"></i> Student Performance</g:link>
			                     <li><g:link controller="studTeachGraphs" action="gdAvgLowStudPerf"><i class="fa fa-angle-double-right"></i>Good/Avg/Low Students</g:link>
			                </ul>
			            </li>
			             <li class="treeview" id="four">
			                <a href="javascript:">
			                    <i class="fa fa-bar-chart-o"></i>
			                    <span>Teachers</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                     <li><g:link controller="CCE" action="teacherClassPerformanceReport"><i class="fa fa-angle-double-right"></i>Teacher Class Performance</g:link></li>
			                     <li><g:link controller="studTeachGraphs" action="studTeachRatio"><i class="fa fa-angle-double-right"></i> Students Teachers Ratio</g:link></li>
			                     <li><g:link controller="studTeachGraphs" action="teachStat"><i class="fa fa-angle-double-right"></i> Trained Teacher Statistics</g:link></li>
			                     <li><g:link controller="CCE" action="teacherTransferReport"><i class="fa fa-angle-double-right"></i> Teacher transfer</g:link></li>
			                     <li><g:link controller="DataAdmin" action="teachProfile"><i class="fa fa-angle-double-right"></i> Faculty Profile</g:link></li>
			                </ul>
			            </li>
			          
			             <li class="treeview" id="six">
			                <a href="javascript:">
			                    <i class="fa fa-area-chart"></i>
			                    <span>Health</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                     <li><g:link controller="studTeachGraphs" action="healthStat"><i class="fa fa-angle-double-right"></i>Blood, Oral & Vision</g:link></li>
			                 	 <li><g:link controller="studTeachGraphs" action="heightVsWeight"><i class="fa fa-angle-double-right"></i>Height v/s Weight</g:link></li>
			                </ul>
			            </li>
			             <li class="treeview" id="seven">
			                <a href="javascript:">
			                    <i class="fa fa-bar-chart-o"></i>
			                    <span>Sports</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                    <li><g:link controller="studTeachGraphs" action="sports"><i class="fa fa-angle-double-right"></i> Sports Participation Statistics</g:link></li>
			                </ul>
			            </li>
			           
			            </sec:ifAnyGranted>
			           
			            
			            <!-- 
			            <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SCHOOLS_MANAGER">
			            <li class="treeview">
			                <a href="javascript:">
			                    <i class="fa fa-bar-chart-o"></i>
			                    <span>CCE</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                 <ul class="treeview-menu">
			                 </ul>
			            </li>
			            </sec:ifAnyGranted>
			             -->
			            
			            <sec:ifAnyGranted roles="ROLE_TEACHER">
			            <li class="treeview" id="nine">
			                <a href="javascript:">
			                    <i class="fa fa-bar-chart-o"></i>
			                    <span>Academics</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                    
			                      <li><g:link controller="CCE" action="classChart"><i class="fa fa-angle-double-right"></i> Class Chart</g:link></li>
			                      <li><g:link controller="CCE" action="trend"><i class="fa fa-angle-double-right"></i>  Trend Analysis</g:link></li>
			                      <li><g:link controller="CCE" action="classOverviewPerf"><i class="fa fa-angle-double-right"></i> Class Overview Performance</g:link></li>
			             <!--     <li><g:link controller="CCE" action="overview"><i class="fa fa-angle-double-right"></i> Overview Performance</g:link></li>    -->  
				          <!--    <li><g:link controller="studTeachGraphs" action="passPerf"><i class="fa fa-angle-double-right"></i> Passing Performance</g:link></li>    --> 
			                </ul>      
			            </li>
			             <li class="treeview" id="three">
			                <a href="javascript:">
			                    <i class="fa fa-twitch"></i>
			                    <span>Students</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                     <li><g:link controller="studTeachGraphs" action="studPerf"><i class="fa fa-angle-double-right"></i> Student Performance</g:link>
			                     <li><g:link controller="studTeachGraphs" action="gdAvgLowStudPerf"><i class="fa fa-angle-double-right"></i>Good/Avg/Low Students</g:link>
			                </ul>
			            </li>
			             <li class="treeview" id="four">
			                <a href="javascript:">
			                    <i class="fa fa-area-chart"></i>
			                    <span>Teachers</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                     <li><g:link controller="studTeachGraphs" action="selfEvaluation"><i class="fa fa-angle-double-right"></i> Teacher Self Evaluation</g:link></li>
			                </ul>
			            </li>
			             <li class="treeview" id="ten">
			                <a href="javascript:">
			                    <i class="fa fa-database"></i>
			                    <span>User Details</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                    <li><g:link controller="DataAdmin" action="teachProfile"><i class="fa fa-angle-double-right"></i> Faculty Profile</g:link></li>
			                </ul>
			            </li>
			            </sec:ifAnyGranted>
			            
			            
			            <sec:ifAnyGranted roles="ROLE_CCEADMIN">
			            <li class="treeview" id="one">
			                <a href="javascript:">
			                    <i class="fa fa-line-chart"></i>
			                    <span>Academics</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                   	<li><g:link controller="CCE" action="subjectClass"><i class="fa fa-angle-double-right"></i> Subjectwise Class Performance</g:link></li>
			                   	<li><g:link controller="studTeachGraphs" action="studPerfYrCatGen"><i class="fa fa-angle-double-right"></i> Year Wise Performance</g:link></li>
			                   	<li><g:link controller="studTeachGraphs" action="cgpaWise"><i class="fa fa-angle-double-right"></i> CGPA Wise Performance</g:link></li>
			               <!-- <li><g:link controller="studTeachGraphs" action="studTeachRatio"><i class="fa fa-angle-double-right"></i> Students Teachers Ratio</g:link></li>
			                   	<li><g:link controller="studTeachGraphs" action="teachStat"><i class="fa fa-angle-double-right"></i> Trained Teacher Statistics</g:link></li> -->	
			                </ul>
			            </li>
			            
			             <li class="treeview" id="eleven">
			                <a href="javascript:">
			                    <i class="fa fa-building"></i> <span>Performance Analysis</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                	<li><g:link controller="performanceCbse" action="classPref"><i class="fa fa-angle-double-right"></i>Class Performance</g:link></li>
			                	<li><g:link controller="performanceCbse" action="teachStd"><i class="fa fa-angle-double-right"></i>Trained Teacher Vs Students</g:link></li>
			                	<li><g:link controller="performanceCbse" action="stdTeachRatio"><i class="fa fa-angle-double-right"></i>Student Teacher Ratio</g:link></li>
			                	<li><g:link controller="performanceCbse" action="coSchoImpact"><i class="fa fa-angle-double-right"></i>Co-Scholastic Impact</g:link></li>
			                	<li><g:link controller="performanceCbse" action="acadAnalysis"><i class="fa fa-angle-double-right"></i>Academic Analysis</g:link></li>
			                	<li><g:link controller="performanceCbse" action="vocInfo"><i class="fa fa-angle-double-right"></i>Vocational Info</g:link></li>
			                	<li><g:link controller="performanceCbse" action="class7Perf"><i class="fa fa-angle-double-right"></i>Class XII Performance</g:link></li>
			                	<li><g:link controller="performanceCbse" action="class9Perf"><i class="fa fa-angle-double-right"></i>Class X Performance</g:link></li>
			                	<li><g:link controller="performanceCbse" action="subjAnalysis"><i class="fa fa-angle-double-right"></i>Subject Analysis</g:link></li>
			                	<li><g:link controller="performanceCbse" action="stdPref"><i class="fa fa-angle-double-right"></i>Student Performance</g:link></li>
			                </ul>
			            </li>
			              
			             <li class="treeview" id="two">
			                <a href="javascript:">
			                    <i class="fa fa-twitch"></i>
			                    <span>Schools</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                	<li><g:link controller="CCE" action="religion"><i class="fa fa-angle-double-right"></i>Religion Analytics</g:link></li>
			                	<li><g:link controller="CCE" action="nationWideSchools"><i class="fa fa-angle-double-right"></i>Nation Wide Schools</g:link></li>
			<!--             	<li><g:link controller="CCE" action="nationWideStudents"><i class="fa fa-angle-double-right"></i>Nation Wide Students</g:link></li>    -->    
                				<li><g:link controller="CCE" action="nationSchoolRating"><i class="fa fa-angle-double-right"></i> Nation Schools Rating</g:link></li>
                				<li><g:link controller="studTeachGraphs" action="schoolTeacherRating"><i class="fa fa-angle-double-right"></i> School Teachers Rating</g:link></li>
			                	<li><g:link controller="ratings" action="acadRept"><i class="fa fa-angle-double-right"></i> School Specifics</g:link></li>
			                	<li><g:link controller="ratings" action="geoTrendAnalysis"><i class="fa fa-angle-double-right"></i> Region Analytics</g:link></li>
			                </ul>
			            </li>
			             <li class="treeview" id="three">
				               <a href="javascript:">
				                   <i class="fa fa-twitch"></i>
				                   <span>Students</span>
				                   <i class="fa fa-angle-left pull-right"></i>
				               </a>
				               <ul class="treeview-menu">
				                    <li><g:link controller="CCE" action="studOptionalSubjReport"><i class="fa fa-angle-double-right"></i> Student Optional Subject</g:link></li>
				                     <li><g:link controller="CCE" action="nationWideStudents"><i class="fa fa-angle-double-right"></i>Nation Wide Students</g:link></li>
				               </ul>
				          </li>
			              <li class="treeview" id="six">
			                <a href="javascript:">
			                    <i class="fa fa-area-chart"></i>
			                    <span>Health</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                     <li><g:link controller="studTeachGraphs" action="healthStat"><i class="fa fa-angle-double-right"></i>Blood, Oral & Vision</g:link></li>
			                </ul>
			            </li>
			             <li class="treeview" id="seven">
			                <a href="javascript:">
			                    <i class="fa fa-bar-chart-o"></i>
			                    <span>Sports</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                    <li><g:link controller="studTeachGraphs" action="sports"><i class="fa fa-angle-double-right"></i> Sports Participation Statistics</g:link></li>
			                </ul>
			            </li>
			             
			          </sec:ifAnyGranted>  
			          
			            
			           <!-- <li class="treeview">
			                <a href="javascript:">
			                    <i class="fa fa-area-chart"></i> <span>CDAC</span>
			                    <i class="fa fa-angle-left pull-right"></i>
			                </a>
			                <ul class="treeview-menu">
			                	  <!--  <li><g:link controller="studTeachGraphs" action="studPerfYrCatGen"><i class="fa fa-angle-double-right"></i> Year Wise Performance</g:link></li>-->
			                     <!--  <li><g:link controller="studTeachGraphs" action="cgpaWise"><i class="fa fa-angle-double-right"></i> CGPA Wise Performance</g:link></li> -->
			                      <!-- <li><g:link controller="studTeachGraphs" action="incomeWisePerf"><i class="fa fa-angle-double-right"></i> Income Wise Performance</g:link></li> -->
			                      <!--  <li><g:link controller="studTeachGraphs" action="passPerf"><i class="fa fa-angle-double-right"></i> Passing Performance</g:link></li>-->
			                      <!-- <li><g:link controller="studTeachGraphs" action="vocEnrlmnt"><i class="fa fa-angle-double-right"></i> Vocational Enrollment Statistics</g:link></li> -->
			                     <!--  <li><g:link controller="studTeachGraphs" action="sports"><i class="fa fa-angle-double-right"></i> Sports Participation Statistics</g:link></li> -->
			                      <!-- <li><g:link controller="studTeachGraphs" action="healthStat"><i class="fa fa-angle-double-right"></i> Health Statistics</g:link></li> -->
			                     <!-- <li><g:link controller="studTeachGraphs" action="studTeachRatio"><i class="fa fa-angle-double-right"></i> Students Teachers Ratio</g:link></li>-->
			                     <!--  <li><g:link controller="studTeachGraphs" action="studRisk"><i class="fa fa-angle-double-right"></i> Risk Prediction</g:link></li> -->
			                     <!-- <li><g:link controller="studTeachGraphs" action="teachStat"><i class="fa fa-angle-double-right"></i> Trained Teacher Statistics</g:link></li>-->
			              <!--   </ul>-->
			            <!-- </li>-->
			            
			           
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
			
			
			
            
            <!-- Right side section -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Dashboard
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                        	<a href="#" data-toggle="modal" data-target="#addNewWidgetModal">
                        		<i class="fa fa-plus fa-4x"></i> Add Widget
                        	</a>
                        </li>
                    </ol>
                </section>
                
				<sec:ifAllGranted roles="ROLE_CCEADMIN">
                	<g:render template="/templates/adminDashboard"></g:render>
                </sec:ifAllGranted>
                
                <sec:ifAllGranted roles="ROLE_SCHOOLS_MANAGER">
	               <g:render template="/templates/schlManagerDashboard"></g:render>
	            </sec:ifAllGranted>
                
                <sec:ifAllGranted roles="ROLE_ADMIN">
                	<g:render template="/templates/schlDashboard"></g:render>
                </sec:ifAllGranted>
                
                <sec:ifAllGranted roles="ROLE_TEACHER">
                	<g:render template="/templates/teachDashboard"></g:render>
                </sec:ifAllGranted>
                
            </aside><!-- /.right-side -->
        </div>
        <!-- End of Main Section -->
        
        
        <!-- Add new widget event modal -->
        <g:render template="/templates/addNewWidget"></g:render>
        
        
        <!--  Footer  -->
		<footer class="footer">
        	<img src="${resource(dir:'egov_img',file:'avvp.png')}" alt="AVVP"> <img src="${resource(dir:'egov_img',file:'cdac-logo.png')}" border="0" alt="CDAC">
        </footer>
        <!--  Footer  -->


        <!-- Morris.js charts -->
		<script src="${createLinkTo(dir:'js/egov_js/raphael_2.1.0',file:'raphael-min.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/plugins/morris/',file:'morris.min.js')}" type="text/javascript"></script>
        
        
		<!-- Sparkline -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/sparkline/',file:'jquery.sparkline.min.js')}" type="text/javascript"></script>
        
        <!-- jvectormap -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/jvectormap/',file:'jquery-jvectormap-1.2.2.min.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/plugins/jvectormap/',file:'jquery-jvectormap-world-mill-en.js')}" type="text/javascript"></script>
       
        <!-- jQuery Knob Chart -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/jqueryKnob/',file:'jquery.knob.js')}" type="text/javascript"></script>
		
				<!-- Google Maps V3 -->
		<script src="https://maps.googleapis.com/maps/api/js" type="text/javascript"></script>
		
		<!-- Google Maps V3 -->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAe45vAXLQqSFQLNeiQbCo9p7r_4lQbjQc&callback=initMap" type="text/javascript"></script>
		
        <!-- Bootstrap WYSIHTML5 -->
		 <!-- <script src="${createLinkTo(dir:'js/egov_js/plugins/bootstrap-wysihtml5/',file:'bootstrap3-wysihtml5.all.min.js')}" type="text/javascript"></script>-->
       
        <!-- iCheck -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/iCheck/',file:'icheck.min.js')}" type="text/javascript"></script>

		<!-- AdminLTE Dashboard -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'dashboard.js')}" type="text/javascript"></script>

        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		 <!-- daterangepicker -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/daterangepicker/',file:'daterangepicker.js')}" type="text/javascript"></script>
		
        <!-- datepicker -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/datepicker/',file:'bootstrap-datepicker.js')}" type="text/javascript"></script>
        
		
		<!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>
		
       
        <script>
      
        <sec:ifAllGranted roles="ROLE_ADMIN">
		  // High Charts 	
		  $('document').ready(function () {
			  $('#container').highcharts({
			        chart: {
			            type: 'column',
			               options3d: {
					                enabled: true,
					                alpha: 15,
					                beta: 25,
					                depth: 50,
					                viewDistance: 25
					            },
			        },
			        title: {
			            text: 'School Performance'
			        },
			        xAxis: {
			        	title: {
			                text: 'Academic Years'
			            },
			        	categories: ['2008-09','2009-10','2010-11','2011-12','2012-13','2013-14','2014-15','2015-16'],
			            crosshair: true
			        },
			        yAxis: {
			            min: 0,
			            title: {
			                text: 'Average CGPA'
			            }
			        },
			        tooltip: {
			            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			                '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
			            footerFormat: '</table>',
			            shared: true,
			            useHTML: true
			        },
			        plotOptions: {
			            column: {
			                pointPadding: 0.2,
			                borderWidth: 0
			            },
			             series: {
			               colorByPoint: true
			           }
			            
			        },
			        series: [{
			            name: 'Average CGPA',
			            data: [7.5, 7.4, 6.4, 7.6, 7.1, 6.8, 7.1,8.0]

			        }]
			    });	

			  
		  });
		</sec:ifAllGranted>
      
      
      
       
      
      
      
       
      <sec:ifAnyGranted roles="ROLE_CCEADMIN,ROLE_SCHOOLS_MANAGER">
		  // High Charts 	
		  $('document').ready(function () {
			    $('#avg').highcharts({
			        chart: {
			            type: 'scatter',
			            zoomType: 'xy'
			        },
			        title: {
			            text: ''
			        },
			        subtitle: {
			            text: ''
			        },
			        xAxis: {
			            title: {
			                enabled: true,
			                text: 'Average score (%)'
			            },
			            startOnTick: true,
			            endOnTick: true,
			            showLastLabel: true
			        },
			        yAxis: {
			            title: {
			                text: 'Pass percentage (%)'
			            }
			        },
			        legend: {
			            layout: 'vertical',
			            align: 'left',
			            verticalAlign: 'top',
			            x: 100,
			            y: 20,
			            floating: true,
			            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
			            borderWidth: 1
			        },
			        plotOptions: {
			            scatter: {
			                marker: {
			                    radius: 5,
			                    states: {
			                        hover: {
			                            enabled: true,
			                            lineColor: 'rgb(100,100,100)'
			                        }
			                    }
			                },
			                states: {
			                    hover: {
			                        marker: {
			                            enabled: false
			                        }
			                    }
			                },
			                tooltip: {
			                    headerFormat: '<b>{series.name} - {point.key}</b><br>',
			                    pointFormat: '{point.x} %, {point.y} %'
			                }
			            }
			        },
			        series: [
			            
			            {
			            name: 'CBSE',
			            color: 'green',
			            data: [
			       
			            {name: 'School 1', x : 48, y:  35}, {name: 'School 2', x : 60, y:  42},
			            {name: 'School 3', x : 40, y:  65}, {name: 'School 4', x : 75, y:  74},
			            {name: 'School 5', x : 76, y:  56}, {name: 'School 6', x : 88, y:  40},
			            {name: 'School 7', x : 68, y:  58}, {name: 'School 7', x : 90, y:  45},
			            {name: 'School 8', x : 80, y:  60}, {name: 'School 9', x : 48, y:  66},
			            {name: 'School 9', x : 72, y:  60}, {name: 'School 10', x : 58, y:  44},
			            {name: 'School 11', x : 51, y:  45},{name: 'School 12', x : 58, y:  56},      
			            {name: 'School 13', x : 40, y:  10},{name: 'School 14', x : 71, y:  45},
			            {name: 'School 15', x : 62, y:  25},{name: 'School 16', x : 55, y:  26},
			            {name: 'School 17', x : 85, y:  50},{name: 'School 18', x : 90, y:  65},   
			            {name: 'School 19', x : 77, y:  65},{name: 'School 20', x : 63, y:  49},
			            {name: 'School 21', x : 56, y: 51}, {name: 'School 22', x : 63, y:  61},      
			            {name: 'School 23', x : 45, y:  15},{name: 'School 24', x : 76, y:  50},
			            {name: 'School 25', x : 67, y:  30},{name: 'School 26', x : 86, y:  31},
			            {name: 'School 27', x : 90, y:  55},{name: 'School 28', x : 85, y:  42}]
			                },
			            { 
			            name: 'Other Boards',
			            color: 'orange',
			            data: [
			            
			            {name: 'School 17', x : 75, y:  40},{name: 'School 18', x : 55, y:  40},
			            {name: 'School 19', x : 45, y:  28},{name: 'School 20', x : 48, y:  49},
			            {name: 'School 21', x : 85, y:  75},{name: 'School 22', x : 95, y:  70},
			            {name: 'School 23', x : 58, y:  25},{name: 'School 24', x : 65, y:  45},
			            {name: 'School 25', x : 90, y:  85},{name: 'School 26', x : 60, y:  62},
			            {name: 'School 27', x : 62, y:  70},{name: 'School 28', x : 50, y:  60},
			            {name: 'School 29', x : 78, y:  70},{name: 'School 30', x : 55, y:  20},
			            {name: 'School 31', x : 68, y:  28},{name: 'School 32', x : 80, y:  38},
			            {name: 'School 33', x : 83, y:  58},{name: 'School 34', x : 71, y:  45},
			            {name: 'School 35', x : 87, y:  62},{name: 'School 36', x : 89, y:  78}
			           
			             ]
			            
			            }              
			        
			    ]
			        });
			        
			      
			    var morrisdata = [
		  		      { y: '2004', a: 50, b: 90},
			  		      { y: '2005', a: 65,  b: 75},
			  		      { y: '2006', a: 50,  b: 50},
			  		      { y: '2007', a: 75,  b: 60},
			  		      { y: '2008', a: 80,  b: 65},
			  		      { y: '2009', a: 90,  b: 70},
			  		      { y: '2010', a: 100, b: 75},
			  		      { y: '2011', a: 115, b: 75},
			  		      { y: '2012', a: 120, b: 85},
			  		      { y: '2013', a: 145, b: 85},
			  		      { y: '2014', a: 160, b: 95}
			  		    ],
			  		    config = {
			  		      data: morrisdata,
			  		      xkey: 'y',
			  		      ykeys: ['a', 'b'],
			  		      labels: ['North Zone', 'South Zone'],
			  		      fillOpacity: 1,
			  		      hideHover: 'auto',
			  		      behaveLikeLine: true,
			  		      resize: true,
			  		      pointFillColors:['#FFF'],
			  		      pointStrokeColors: ['green'],
			  		      lineColors:['gray','orange']
			  		  };
			  	
			  		  config.element = 'line-chart';
			  		  Morris.Line(config);

			  		  Morris.Donut({
			  			  element: 'pie-chart',
			  			  colors:['orange','green','grey'], 
			  			  data: [
			  			    {label: "Female", value: 35},
			  			    {label: "Male", value: 63},
			  			    {label: "Not Specified", value: 2}
			  			  ]
			  			});
				//Google Maps
				
			  		var latLong_Chennai = new google.maps.LatLng(13.0475604,80.2089535);
					var latLong_Ajmer = new google.maps.LatLng(26.4418559,74.6470374);
					var latLong_Guwahati = new google.maps.LatLng(26.1430486,91.7028829);
					var latLong_Panchkula = new google.maps.LatLng(30.6973958,76.8642764);
					var latLong_Allahabad = new google.maps.LatLng(25.4022637,81.8015845);
					var latLong_Bhubaneswar = new google.maps.LatLng(20.3008841,85.8204532);
					var latLong_Trivandrum = new google.maps.LatLng(8.499733,76.9243616);
					var latLong_Patna = new google.maps.LatLng(25.6089598,85.1641572);
					var latLong_Delhi = new google.maps.LatLng(28.6469655,77.0932634);
					var latLong_Dehradun = new google.maps.LatLng(30.3254285,78.0171347);
					var latLong_All = new google.maps.LatLng(22.892282,79.8293912);
			        
			        $( function () {

			        	//Google Maps
						
						var map;
						function initialize() {
							var latLongIndia = new google.maps.LatLng(21.7679,  78.8718);
					 		 var mapOptions = {
								zoom: 4,
								center: latLongIndia
					 		 };
					 		 map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

					 		// To add the marker to the map, use the 'map' property
					 		var marker_all = new google.maps.Marker({
							    position: latLong_All,
							    map : map,
							    title:"All regions"
							});
					 		
					 		
							var marker_chennai = new google.maps.Marker({
							    position: latLong_Chennai,
							    map : map,
							    title:"Chennai region"
							});

							var marker_ajmer = new google.maps.Marker({
							    position: latLong_Ajmer,
							    map : map,
							    title:"Ajmer region"
							});

							var marker_guwahati = new google.maps.Marker({
							    position: latLong_Guwahati,
							    map : map,
							    title:"Guwahati region"
							});

							var marker_panchkula = new google.maps.Marker({
							    position: latLong_Panchkula,
							    map : map,
							    title:"Panchkula region"
							});

							var marker_allahabad = new google.maps.Marker({
							    position: latLong_Allahabad,
							    map : map,
							    title:"Allahabad region"
							});

							var marker_bhubaneswar = new google.maps.Marker({
							    position: latLong_Bhubaneswar,
							    map : map,
							    title:"Bhubaneswar region"
							});

							var marker_tvc = new google.maps.Marker({
							    position: latLong_Trivandrum,
							    map : map,
							    title:"Trivandrum region"
							});

							var marker_patna = new google.maps.Marker({
							    position: latLong_Patna,
							    map : map,
							    title:"Patna region"
							});

							var marker_delhi = new google.maps.Marker({
							    position: latLong_Delhi,
							    map : map,
							    title:"Delhi region"
							});

							var marker_dd = new google.maps.Marker({
							    position: latLong_Dehradun,
							    map : map,
							    title:"Dehradun region"
							});
						}
						google.maps.event.addDomListener(window, 'load', initialize);

			        });
		        
			});

			var addNewWidget = function(){
				var title = $("#widTitle").val();
				var link = encodeURIComponent($("#widLink").val());
				var type = $("input[name='widType']:checked").val();
				var data = $("input[name='widDataType']:checked").val();
				var height = $.trim($("#widHeight").val());
				var queryString = "title="+title+"&link="+link+"&wdata="+data+"&type="+type+"&height="+height;
				
				
				
				$.ajax({
					url:"${grailsApplication.config.grails.serverURL}/dashboard/cwidget",
					data:queryString,
					success:function(data){
						if(($("#sectionLeft").find(".box").size() < $("#sectionRight").find(".box").size()) || ($("#sectionLeft").find(".box").size() == $("#sectionRight").find(".box").size())){
							$("#sectionLeft").append(data);
						}
						else{
							$("#sectionRight").append(data);
						}
						$( ".connectedSortable" ).sortable( "refresh" );
						widgetRemove();
					}
				});
				

				// Clear all selected
				$("#widTitle").val("");
				$("#widLink").val("");
								
			}

			</sec:ifAnyGranted>
       
        </script>
        
     </body>
</html>