<aside class="left-side sidebar-offcanvas" >
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
                	<li><g:link controller="performanceCbse" action="plusTwo"><i class="fa fa-angle-double-right"></i>Scholastic</g:link></li>-->
                    <!-- 
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
                     <li><g:link controller="studTeachGraphs" action="passPerf"><i class="fa fa-angle-double-right"></i> Student Class Pass Performance</g:link>
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
            <!-- 
             <li class="treeview" id="five">
                <a href="javascript:">
                    <i class="fa fa-pie-chart"></i>
                    <span>Infrastructure</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                     <li><g:link controller="CCE" action="dataMaintanenceOne"><i class="fa fa-angle-double-right"></i>School Facilities</g:link></li>
                </ul>
            </li>
             -->
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
                     <li><g:link controller="studTeachGraphs" action="passPerf"><i class="fa fa-angle-double-right"></i> Student Class Pass Performance</g:link>
                     <li><g:link controller="studTeachGraphs" action="gradeDist"><i class="fa fa-angle-double-right"></i> Student Grade Wise Distribution</g:link>
                     <li><g:link controller="studTeachGraphs" action="studPerf"><i class="fa fa-angle-double-right"></i> Student Performance</g:link>
                     <li><g:link controller="studTeachGraphs" action="gdAvgLowStudPerf"><i class="fa fa-angle-double-right"></i>Good/Avg/Low Students</g:link>
     <!--            <li><g:link controller="studTeachGraphs" action="vocEnrlmnt"><i class="fa fa-angle-double-right"></i> Vocational Enrollment Statistics</g:link>  -->
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
            <!--  
             <li class="treeview" id="five">
                <a href="javascript:">
                    <i class="fa fa-pie-chart"></i>
                    <span>Infrastructure</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                     <li><g:link controller="CCE" action="dataMaintanenceNine"><i class="fa fa-angle-double-right"></i>School Facilities</g:link></li>
                </ul>
            </li>
            -->
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
              <!--    <li><g:link controller="CCE" action="overview"><i class="fa fa-angle-double-right"></i> Overview Performance</g:link></li>    -->  
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
               <!-- <li><g:link controller="CCE" action="studCbseOptReport"><i class="fa fa-angle-double-right"></i> Student Optional Subject</g:link></li>   -->
               <!-- <li><g:link controller="studTeachGraphs" action="studTeachRatio"><i class="fa fa-angle-double-right"></i> Students Teachers Ratio</g:link></li>
                   	<li><g:link controller="studTeachGraphs" action="teachStat"><i class="fa fa-angle-double-right"></i> Trained Teacher Statistics</g:link></li> -->	
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
          
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

 <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
<g:javascript src="egov_js/custom.js" />
