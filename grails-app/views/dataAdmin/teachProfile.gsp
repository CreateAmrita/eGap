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
    
    <style>
	.scrollProp{
	  overflow: hidden; 
	  outline: none;
	}
	
   </style>
       
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
		<g:render template="/templates/header" model="['login':true]"></g:render>
       	<!-- End of header -->        
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column for sidebar navigation-->
			<g:render template="/templates/navMenuLeft"></g:render>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Teachers
                    </h1>
                    <ol class="breadcrumb">
                        <li class="active">Faculty Profile</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
					<div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Teacher Profile</h3>
						    </div>
						</div>
					</div>
                    <!-- Main row -->
                    <div class="row">
                        <!-- Left col -->
                        <section class="col-lg-12">
							<div class="col-xs-12">
                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Find Faculty</h3>
                                    </div>                                
                                    
                                    
                                    <div class="box-header">
                                        <div class="box-body">
                                        	<sec:ifAllGranted roles="ROLE_SCHOOLS_MANAGER">
                                            <div class="col-xs-12 col-lg-5 col-sm-6">
                                                <strong>School</strong> :
                                                <select name="SchlId" id="SchlId" class="inputSelect form-control" style="text-transform: capitalize;">
													<% 
													for(def i=1;i<=school.totSchools;i++){
													def SchoolId = school."School$i".SchoolId
													def schoolName = school."School$i".schoolName
													%>
													<option value="${SchoolId}" data-schoolId="${SchoolId}">${schoolName}</option>
													<% 
													}
												%>		
												</select>
                                            </div>
                                            </sec:ifAllGranted>
                                            <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TEACHER">
                                            <div class="col-xs-12 col-lg-5 col-sm-6">
                                                <strong>School</strong> :
                                                <select name="School" id="School" class="inputSelect form-control" disabled="disabled" style="text-transform: capitalize;">
													<option value="${school.Schoolid}">${school.schoolName}</option>
												</select>
												<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>
                                            </div>
                                            </sec:ifAnyGranted>
                                         	<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_SCHOOLS_MANAGER">
                                            <div class="col-xs-12 col-lg-5 col-sm-6">
                                                <strong>Faculty</strong> :
                                                <select name="Faculty" id="Faculty" class="inputSelect form-control" style="text-transform: capitalize;">
													<% 
													for(def i=1;i<=faculty.totTeachers;i++){
													def TeacherId = faculty."teacher$i".TeacherId
													def TeacherName = faculty."teacher$i".TeacherName
													%>
													<option value="${TeacherId}" data-TeacherId="${TeacherId}">${TeacherName}</option>
													<% 
													}
												%>		
												</select>
                                            </div>
                                            </sec:ifAnyGranted>
                                            <sec:ifAllGranted roles="ROLE_TEACHER">
                                            <div class="col-xs-12 col-lg-5 col-sm-6">
                                                <strong>Faculty</strong> :
                                                <select name="Faculty" id="Faculty" class="inputSelect form-control" disabled="disabled" style="text-transform: capitalize;">
													<option value="${faculty.TeacherId}" data-TeacherId="${faculty.TeacherId}">${faculty.TeacherName}</option>
												</select>
												<input type="text" name="TeacherId" id="TeacherId" value="${faculty.TeacherId}" class="hide"/>
                                            </div>
                                            </sec:ifAllGranted>

                                        </div><!-- /.box-body -->
                                    </div><!-- /.box-header -->
                                   <br/>
                                </div><!-- /.box -->
                            </div>
                        </section><!-- /.Left col -->
                        
                        
                        
                        
                        <!-- right col (We are only adding the ID to make the widgets sortable)-->
                        <section class="col-lg-12">

                          <div class="col-lg-2 col-sm-3 col-xs-12"> 
				            <!-- small box -->
				            <div class="small-box bg-aqua">
				              <div class="inner" style="text-align:center;">  <i class="fa fa-user" style="font-size:15em !important" aria-hidden="true"></i>
				                <h4 class="teacherName"> </h4>
				              </div>
				            </div>
				          </div>
				          <!-- ./col -->
				          
				          <div class="col-lg-10 col-sm-9 col-xs-12">
				          
					            <div class="col-lg-4 col-sm-6 col-xs-12"> 
					              <!-- small box -->
					              <div class="small-box bg-aqua">
					                <div class="inner">
					                  <h3>Courses</h3>
					                  <p class="courses"></p>
					                </div>
					                <div class="icon"> 
					                	<i class="ion ion-clipboard"></i> </div>
					                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
					            </div>
					            <!-- ./col -->
					            
					            
					            <div class="col-lg-4 col-sm-6 col-xs-12"> 
					              <!-- small box -->
					              <div class="small-box bg-green">
					                <div class="inner">
					                  <h3>Best Teacher<sup style="font-size: 20px"></sup> </h3>
					                  <p class="awardYears"></p>
					                </div>
					                <div class="icon"> <i class="ion ion-ribbon-b"></i> </div>
					                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
					            </div>
					            <!-- ./col -->
					            
					            
					            <div class="col-lg-4 col-sm-6 col-xs-12"> 
					              <!-- small box -->
					              <div class="small-box bg-yellow">
					                <div class="inner">
					                  <h3>Total Experience</h3>
					                  <p class="yrsOfExp"></p>
					                </div>
					                <div class="icon"> <i class="ion ion-paper-airplane"></i> </div>
					                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
					            </div>
					            <!-- ./col -->
					            
					            
					            <div class="col-lg-4 col-sm-6 col-xs-12"> 
					              <!-- small box -->
					              <div class="small-box bg-red">
					                <div class="inner">
					                  <h3>Current Rating</h3>
					                  <p class="currentYrRating"></p>
					                </div>
					                <div class="icon"> <i class="ion ion-flag"></i> </div>
					                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
					            </div>
				            	<!-- ./col --> 
				            
				             <div class="col-lg-4 col-sm-6 col-xs-12"> 
					              <!-- small box -->
					              <div class="small-box bg-aqua">
					                <div class="inner">
					                  <h3>Specialization</h3>
					                  <p class="spec"></p>
					                </div>
					                <div class="icon"> 
					                	<i class="ion ion-university"></i> </div>
					                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
					            </div>
					            <!-- ./col -->
					            
					            
					            <div class="col-lg-4 col-sm-6 col-xs-12"> 
					              <!-- small box -->
					              <div class="small-box bg-green">
					                <div class="inner">
					                  <h3>Tet Qualified</h3>
					                  <p class="tetQualified"> </p>
					                </div>
					                <div class="icon"> <i class="ion ion-ribbon-a"></i> </div>
					                <a href="javascript:" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a> </div>
					            </div>
					            <!-- ./col -->
								
								<div class="row">
									<div class="col-lg-12 col-sm-12 col-xs-12">
										<!-- Performance box -->
										<div class="box ">
											<div class="box-header">
												<!-- tools box -->
												<div class="pull-right box-tools">
													<button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
												</div><!-- /. tools -->
												<i class="fa fa-line-chart"></i>
												<h3 class="box-title">Performance Status</h3>
											</div>
											<div class="box-body chart-responsive">
												<div class="chart" id="line-chart" style="height: 250px;"></div>
											</div><!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
								</div>
								
								<!-- Row 2 -->								
								<div class="row">
									<div class="col-lg-6 col-sm-6 col-xs-12">
										<!-- Performance box -->
										<div id="perfBox" class="box ">
											<div class="box-header">
												<!-- tools box -->
												<div class="pull-right box-tools">
												</div><!-- /. tools -->
												<i class="fa fa-line-chart"></i>
												<h3 class="box-title">Course Statistics</h3>
											</div>
											<div id="CourseStat" class="box-body table-responsive no-padding" style="min-width: 310px; height: 400px; margin: 0 auto">
		                                    </div><!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									
									<div class="col-lg-6 col-sm-6 col-xs-12">
										<!-- Performance box -->
										<div class="box " style="height:463px;">
											<div class="box-header">
												<!-- tools box -->
												<div class="pull-right box-tools">
												</div><!-- /. tools -->
												<i class="fa fa-line-chart"></i>
												<h3 class="box-title">Course - Good/Avg/Low Performing Students</h3>
											</div>
											<div class="box-body chart-responsive">
												<div id="container" class="scrollProp" style="min-width: 310px; margin: 0 auto;">
                                    			</div>
											</div><!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
								</div><!-- End of Row 2 -->
								
								
                                <!-- Row 3 -->
								<div class="row">
									<div class="col-lg-12 col-sm-12 col-xs-12">
										<!-- Performance box -->
										<div class="box" >
											<div class="box-header">
												<!-- tools box -->
												<div class="pull-right box-tools">
												</div><!-- /. tools -->
												<i class="fa fa-align-left"></i>
												<h3 class="box-title">Mark Entry Status</h3>
											</div>
											<div id="markEntryStat" class="box-body table-responsive no-padding">
		                                        <table class="table table-hover table-striped">
		                                            <tr>
		                                                <th>Course</th>
		                                                <th>Class</th>
		                                                <th>Status %</th>
		                                            </tr>
		                                            <tr>
		                                                <td>Mathematics</td>
		                                                <td>9</td>
		                                                <td>
		                                                	<div class="progress sm">
			                                                	<div class="progress-bar progress-bar-green" style="width: 76%" role="progressbar" aria-valuenow="76" aria-valuemin="0" aria-valuemax="100">
								                                    <span class="sr-only">76% Complete</span>
								                                </div>
							                                </div>
		                                                </td>
		                                            </tr>
		                                            <tr>
		                                                <td>Geometry</td>
		                                                <td>9</td>
		                                                <td>
		                                                	<div class="progress sm">
			                                                	<div class="progress-bar progress-bar-red" style="width: 23%" role="progressbar" aria-valuenow="23" aria-valuemin="0" aria-valuemax="100">
								                                    <span class="sr-only">23% Complete</span>
								                                </div>
							                                </div>
														</td>
		                                            </tr>
		                                            <tr>
		                                                <td>Calculus</td>
		                                                <td>10</td>
		                                                <td>
															<div class="progress sm">
			                                                	<div class="progress-bar progress-bar-yellow" style="width: 45%" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
								                                    <span class="sr-only">45% Complete</span>
								                                </div>
							                                </div>		
														</td>
		                                            </tr>
		                                            <tr>
		                                                <td>Set Theory</td>
		                                                <td>10</td>
		                                                <td>
		                                                	<div class="progress sm">
			                                                	<div class="progress-bar progress-bar-green" style="width: 96%" role="progressbar" aria-valuenow="96" aria-valuemin="0" aria-valuemax="100">
								                                    <span class="sr-only">96% Complete</span>
								                                </div>
							                                </div>	
														</td>
		                                            </tr>
		                                        </table>
		                                    </div><!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
								</div><!-- End of Row 3 -->
								
								
				            	
				          </div>  
						  
                        </section><!-- right col -->
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
        
        <!-- Scroll  -->
        <script src="${createLinkTo(dir:'js/egov_js/',file:'nicescroll.js')}" type="text/javascript"></script>
		
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		<!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>

        <script>
        $(document).ready(function(){
        	$("#SchlId").change();
		});
		$("#SchlId").change(function(){
			var p_data="schoolId="+$("#SchlId").val();
			$.ajax({
				url:"${grailsApplication.config.grails.serverURL}/DataAdmin/retSchoolTeachers",
				data: p_data,
				success:function(data){
					$("#Faculty").html("");
					for(i=1;i<=data.totTeachers;i++){
						$("#Faculty").append("<option data-TeacherId='"+data["teacher"+(i)].TeacherId+"' value='"+data["teacher"+(i)].TeacherId+"'>"+data["teacher"+(i)].TeacherName+"</option>");
					}
					if($("#Faculty").find("option").size() >= 1){
						$("#Faculty").change();
					}
				}
			});
		});
		$("#Faculty").change(function(){
			$('h4.teacherName').text($('#Faculty').find(":selected").text());
			var schoolId = $("#SchlId").val()
			var teacherId =$("#Faculty").val();
			var p_data="schoolId="+schoolId+"&teacherId="+teacherId;
			$.ajax({
				url:"${grailsApplication.config.grails.serverURL}/DataAdmin/retTeacherDetails",
				data: p_data,
				success:function(data){
					$('p.courses').text(data.totSubjects);
					$('p.yrsOfExp').text("Have "+ data.totExp + " Years of Teaching Experience");
					$('p.tetQualified').text(data.tetQualified);
					$('p.currentYrRating').text(data.rating);
					$('p.spec').text(data.spec);
					$('p.awardYears').text(data.awardYears);
					$('#line-chart').html("");
					/*
			    	Morris.Area({
			        	  element: 'line-chart',
			        	  data: data.perfStat,
			        	  xkey: ['y'],
			        	  ykeys: ['a'],
			        	  labels: ['Rating']
			        });
			        */
			    	$('#line-chart').highcharts({
			    	        chart: {
			    	            type: 'line'
			    	        },
			    	        title: {
			    	            text: 'Year Wise Teacher Performance'
			    	        },
			    	        subtitle: {
			    	            text: 'Rating obtained by the teacher'
			    	        },
			    	        xAxis: {
			    	            categories: data.perfStat.y
			    	        },
			    	        yAxis: {
			    	            title: {
			    	                text: 'Rating Value'
			    	            }
			    	        },
			    	        plotOptions: {
			    	            line: {
			    	                dataLabels: {
			    	                    enabled: true
			    	                },
			    	                enableMouseTracking: false
			    	            }
			    	        },
			    	        series: [{
			    	            name: 'Ratings',
			    	            data: data.perfStat.a
			    	        }]
			    	    });
			    	if(data.teacherSubjects.totSubjects == 0){
			    		$('#perfBox').attr('style', 'height: 420px;');
			    		$('#CourseStat').addClass("nodataContainer")
						$('.nodataContainer').text(data.totSubjects).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
				    }
			    	else{
			    		$('#perfBox').attr('style', 'height: 420px;');
			    		$('#CourseStat').removeClass("nodataContainer").addClass("scrollProp").css({'font-size': 'initial', 'margin-left': '0px', 'margin-top': '0px','height': '420px'});
			    		$("#CourseStat").html("");
			    		var content = "<table class='table table-striped table-hover responsive'><tr><th>Course</th><th>Class</th><th>Pass Percentage</th></tr>";
						for(i=1;i<=data.teacherSubjects.totSubjects;i++){
							var subjectName=data.teacherSubjects["Subject"+(i)].SubjectName;
							var className=data.teacherSubjects["Subject"+(i)].className+" - "+data.teacherSubjects["Subject"+(i)].division;
							var passPercentage = data.teacherSubjects["Subject"+(i)].pass;
							var subjId = data.teacherSubjects["Subject"+(i)].SubjectId;
							var classMasterId = data.teacherSubjects["Subject"+(i)].classMasterId;
							var acYrId = data.teacherSubjects.acYrId;
							content += "<tr style='color:black; cursor: pointer;' onmouseover='ChangeColor(this, true);' onmouseout='ChangeColor(this, false);' onclick='fetchStudentDetails("+subjId+","+classMasterId+","+schoolId+","+acYrId+")'><td>"+subjectName+"</td><td>"+className+"</td><td>"+passPercentage+"</td></tr>";
						}
						content += "</table>";
						$("#CourseStat").html(content);
    					$(".scrollProp").niceScroll({
					    	 cursorwidth: "10px",
					    	 hidecursordelay: 1000,
					    });
					    console.log(data.teacherSubjects)
					    if(data.teacherSubjects.Subject1.pass!="Student Final Scores Not Available.")
    						fetchStudentDetails(data.teacherSubjects.Subject1.SubjectId,data.teacherSubjects.Subject1.classMasterId,data.teacherSubjects.SchoolId,data.teacherSubjects.acYrId)
    					else{
    					    $('#container').addClass("nodataContainer")
						    $('.nodataContainer').text("Please select a subject from course statistics.").css({'font-size': 'large', 'margin-left': '80px', 'margin-top': '40px'});
    					}
					    
		  			}
			    	if(data.markEntryStat.totSubjects != 0){
			    		$("#box").attr('style', 'height: 200px;');
			    		$('#markEntryStat').removeClass("nodataContainer").addClass("scrollProp").css({'font-size': 'initial', 'margin-left': '0px', 'margin-top': '0px','height': '200px'});
			    		$("#markEntryStat").html("");
			    		var markEntryStatContent = "<table class='table table-striped table-hover responsive'><tr><th>Course</th><th>Class</th><th>Term 1 Completion Status (%)</th> <th>Term 2 Completion Status (%)</th></tr>";
						for(i=1;i<=data.markEntryStat.totSubjects;i++){
							var subjectName=data.markEntryStat["Subject"+(i)].SubjectName;
							var className=data.markEntryStat["Subject"+(i)].className+" - "+data.markEntryStat["Subject"+(i)].division;
							var term1entryStat = data.markEntryStat["Subject"+(i)].Term1;
							var term2entryStat = data.markEntryStat["Subject"+(i)].Term2;
							var term1stat = "<td><div class='progress sm'><div class='progress-bar progress-bar-green' style='width:"+term1entryStat+"%' role='progressbar' aria-valuenow='"+term1entryStat+"' aria-valuemin='0' aria-valuemax='100'><span class='sr-only'>"+term1entryStat+"% Complete</span></div></div></td>"
							var term2stat = "<td><div class='progress sm'><div class='progress-bar progress-bar-green' style='width:"+term2entryStat+"%' role='progressbar' aria-valuenow='"+term2entryStat+"' aria-valuemin='0' aria-valuemax='100'><span class='sr-only'>"+term2entryStat+"% Complete</span></div></div></td>"
							markEntryStatContent+= "<tr><td>"+subjectName+"</td><td>"+className+"</td>"+term1stat+term2stat+"</tr>";
						}
						markEntryStatContent+="</table>";
						$("#markEntryStat").html(markEntryStatContent);
						$(".scrollProp").niceScroll({
					    	 cursorwidth: "10px",
					    	 hidecursordelay: 1000,
					    
					    });
		  			}
			    	else{
				    	$("#box").attr('style', 'height: 200px;');
			    		$('#markEntryStat').addClass("nodataContainer")
						$('.nodataContainer').text(data.totSubjects).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px', 'height': '50px'});
				    }
				}
			});
		});

		var fetchStudentDetails = function(subjId,classMasterId,schoolId,acYrId){
			$("#container").html("");
			if(classMasterId!=0){
				var p_data = "acYr="+acYrId+"&classMasterId="+classMasterId+"&schoolId="+schoolId+"&subjectId="+subjId;
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/DataAdmin/gdAvgLowStudList",
					data : p_data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					},
					success:function(data){
						if(data){
							$('#container').removeClass("nodataContainer").removeAttr("style");
							$("#container").html(data);
							$(".scrollProp").niceScroll({
						    	 cursorwidth: "10px",
						    	 hidecursordelay: 1000,
						    
						    });
						}
						else{
							 $('#container').addClass("nodataContainer")
							 $('.nodataContainer').text("Please select a subject from course statistics.").css({'font-size': 'large', 'margin-left': '80px', 'margin-top': '40px'});
						}
					}
				});
			}
			else{
				 $('#container').addClass("nodataContainer")
				 $('.nodataContainer').text("Please select another subject from course statistics.").css({'font-size': 'large', 'margin-left': '80px', 'margin-top': '40px'});
			}

		}
		function ChangeColor(tableRow, highLight){
		    if (highLight){
		      //tableRow.style.backgroundColor = '#dcfac9';
		      tableRow.style.fontSize = 'large';
		      tableRow.style.fontStyle = 'italic';
		      tableRow.style.color = 'red';
		    }
		    else{
		      //tableRow.style.backgroundColor = 'white';
		      tableRow.style.fontSize = 'initial';
		      tableRow.style.fontStyle = 'normal';
		      tableRow.style.color = 'black';
		    }
	    }
        </script>
        
   </body>
</html>