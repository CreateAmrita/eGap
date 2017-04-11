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
		
		 <!-- Pace Loader style
        <link href="${resource(dir:'css/egov_css/pace',file:'paceBlueHor.css')}" rel="stylesheet" type="text/css" /> -->
        
 		<style>
		.scrollProp{
		    height: 550px;
    		overflow-y: scroll;
  		    overflow: auto;
		
		}
		.scrollProp img {
			display: block;
		    margin-left: 40%;
		    margin-right: auto;
		    position: absolute;
		    top: 40%;
		    bottom: 0px;
		}
		</style>
		
    </head>
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
                        Students 
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-twitch"></i>Students</a></li>
                        <li class="active">Student Position Report</li>
                    </ol>
                </section>

                <!-- Main content -->
                
                 <section class="content">
                 
                  	<div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Student Position Report</h3>
						    </div>
						</div>
					</div>
                 
                 <!-- Dropdown-->
                	<div class="row">
                	<div class="col-md-6">
					<div class="form-group"><h4>School Group</h4>
					   	<select name="SchoolGroup" id="SchoolGroup" class="inputSelect form-control" disabled="disabled">
							<option value="${schoolGp.Grpid}">${schoolGp.groupName}</option>
						</select>
						<input type="text" id="SgId" name="SgId" class="hide" value="${schoolGp.Grpid}"/>
					</div>
					
					<sec:ifAllGranted roles="ROLE_ADMIN">
						<div class="form-group"><h4>School</h4>
					  		<select name="School" id="School" class="inputSelect form-control" disabled="disabled" style="text-transform: capitalize;"> 
								<option value="${school.Schoolid}">${school.schoolName}</option>
							</select>
							<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>
						</div>
						
						<div class="form-group"><h4>Academic Year</h4>
							<select name="academicYear" id="academicYear" class="inputSelect form-control">
								<% 
									for(def i=1;i<=acyrTerms.totAcyr;i++){
									def acyrId = acyrTerms.acYrTerm."acYrTrm$i".academicYrId
									def acyrStart = acyrTerms.acYrTerm."acYrTrm$i".academicYrStart
									def acyrEnd = acyrTerms.acYrTerm."acYrTrm$i".academicYrEnd
									def current = acyrTerms.acYrTerm."acYrTrm$i".current
								%>
								<g:if test="${current==true}">	
									<option value="${acyrId}" data-index=${i} selected="selected">${acyrStart} - ${acyrEnd}</option>
								</g:if>
								<g:else>
									<option value="${acyrId}" data-index=${i}>${acyrStart} - ${acyrEnd}</option>
								</g:else>
								<% 
									}
								%>
							</select>	
						</div>
					</sec:ifAllGranted>
					
					<sec:ifAllGranted roles="ROLE_SCHOOLS_MANAGER">
						<div class="form-group"><h4>School</h4>
					  		<select name="SchlId" id="SchlId" class="inputSelect form-control" style="text-transform: capitalize;"> 
								<% 
									for(def i=1;i<=school.totSchools;i++){
									def SchoolId = school."School$i".SchoolId
									def schoolName = school."School$i".schoolName
								%>
									<option value="${SchoolId}" data-schoolName="${schoolName}" data-schoolId="${SchoolId}">${schoolName}</option>
								<% 
									}
								%>
							</select>
						</div>
						
						<div class="form-group"><h4>Academic Year</h4>
							<select name="academicYear" id="academicYear" class="inputSelect form-control">
								<option value="${currentAcYr.id}">${currentAcYr.sYear} - ${currentAcYr.eYear}</option>
							</select>	
						</div>
					</sec:ifAllGranted>
					
					<div class="form-group"><h4>Class</h4>
						<select name="className" id="className" class="inputSelect form-control">
							<% 
								for(def i=1;i<=classes.totClass;i++){
								def schlClassId = classes."class$i".schlClassId
								def className = classes."class$i".className
								def classMasterId = classes."class$i".classMasterId
							%>
								<option value="${schlClassId}" data-classMasterId="${classMasterId}">${className}</option>
							<% 
								}
							%>
						</select>
					</div> 
					<div id="stdDet" class="hide">
						<div class="form-group"><h4>Student ID</h4>
						<select name="studentId" id="studentId" class="inputSelect form-control" disabled="disabled">
						</select>
						</div>
						 
						<div class="form-group"><h4>Student Name</h4>
						<select name="studentName" id="studentName" class="inputSelect form-control" disabled="disabled">
						</select>
						</div> 
					</div>
                 	</div>
                 
                       <section class="col-md-6">
                            <div class="box ">
                                <div class="box-header">
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                                    </div>
                                    <i class="fa fa-line-chart"></i>
                                    <h3 class="box-title">Student Position Report</h3>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div id="container" class="scrollProp" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                                    <div id="backButton" class="hide">
                                    	<button class="btn btn-primary" type="button" style="float: right; margin-top: 10px; margin-right: 10px;" onclick="fetchStudentDetails()">Back to Students List</button>
                                    </div>
                                </div>
                                
                                <!-- /.box-body -->
                            </div>
                        </section>
                    </div>
                </section><!-- /.content -->
                   <div id="stdPos" class="row hide">
	                       <section class="col-lg-12 connectedSortable active">
	                            <div class="box">
	                                <div class="box-header">
	                                    <!-- tools box -->
	                                    <div class="pull-right box-tools">
	                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
	                                    </div><!-- /. tools -->
	                                    <i class="fa fa-line-chart"></i>
	                                    <h3 class="box-title">Student Position Comparison Report</h3>
	                                </div>
	                                <div id="StdPosiList" class="box-body chart-responsive">
										<table id="StudentPosiList reportTable" class="table table-striped table-bordered table-hover responsive reportTable " width="100%" border="0"cellspacing="0">
										</table>
									</div>
								</div>
							</section>
            		</div>
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
        
         <!-- Pace Loader
		<script src="${createLinkTo(dir:'js/egov_js/pace',file:'pace.min.js')}" type="text/javascript"></script> -->
		
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		<!-- Scroll  -->
        <script src="${createLinkTo(dir:'js/egov_js/',file:'nicescroll.js')}" type="text/javascript"></script>
		
		 <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>

<script>
	$(document).ready(function(){
		fetchStudentDetails();
		$( "#accordion" ).accordion({
			collapsible: true,
      		heightStyle: "content"
      	});
	

			$("#className").change(function(){
				fetchStudentDetails();
			});
			$("#academicYear").change(function(){
				fetchStudentDetails();
			});

			$("#SchlId").change(function(){
				selectClass();
			});

	});
	
	var fetchStudentDetails = function(){
			$('#stdPos').addClass("hide")
			$('#stdDet').addClass("hide")
			$('#backButton').addClass("hide")
			$("#container").html("");
			var p_data = "academicYrId="+$("#academicYear").val()+"&classMasterId="+$("#className").find("option:selected").data("classmasterid")+"&schoolId="+$("#SchlId").val();
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/CCE/stdFinalPositionRpt",
				data : p_data,
				success:function(data){
					$("#container").html(data);
					$(".scrollProp").niceScroll({
				    	 cursorwidth: "10px",
				    	 hidecursordelay: 1000,
				    });
				}
			});
	}

	/***** Fetch corresponding class of the selected school in school manager. *****/
	var selectClass = function(){
		$("#className").html("");
		var p_data="school_Id="+$("#SchlId").val()+"&acYrId="+$("#academicYear").val();
		$.ajax({
			url:"${grailsApplication.config.grails.serverURL}/StudTeachGraphs/listAllSchoolClasses",
			data: p_data,
			success:function(data){
				$("#container").html("");
				$("#className").html("");
				for(i=1;i<=data.totClass;i++){
					$("#className").append("<option data-classMasterId='"+data["class"+(i)].classMasterId+"' value='"+data["class"+(i)].schlClassId+"'>"+data["class"+(i)].className+"</option>");
				}
				if($("#className").find("option").size() >= 1){
					$("#className").change();
				}
			}
		});
	}

	//var setValues = function(thisObj,id,name){
	var setValues = function(id,name){
		var schoolId=$("#SchlId").val();
		var academicYrId=$("#academicYear").val();
		var classMasterId=$("#className").find("option:selected").data("classmasterid");
	//	href = $(thisObj).attr("data-href").split("?");
	//	var p_data="?schoolId="+schoolId+"&academicYrId="+academicYrId+"&classMasterId="+classMasterId+"&studentId="+id+"&studentName="+name;
		var p_data = "academicYrId="+academicYrId+"&classMasterId="+classMasterId+"&schoolId="+schoolId+"&studentId="+id;
		//window.open(href[0]+p_data, "_blank", "");
		fetchStudentPositionDetails(p_data, name, id)
		//$(thisObj).attr("href",href[0]+p_data);
	}
	
	var fetchStudentPositionDetails = function(p_data, std_name, id){
			//var p_data = "academicYrId="+$("#academicYear").val()+"&classMasterId="+$("#className").val()+"&schoolId="+$("#SchlId").val()+"&studentId="+$("#studentId").val();
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/CCE/stdSubjsAvgScores",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					$('#StdPosiList').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				},				
				success:function(data){
					//console.log(data.studentArray.subjName);
					$('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
					$('#container').highcharts({
				        chart: {
				            type: 'line'
				        },
				        title: {
				            text: 'Student Subject Details'
				        },
				        xAxis: {
				            categories: data.studentArray.subjName
				        },
				        yAxis: {
				            min: 0,
				            title: {
				                text: 'Marks (100)'
				            }
				        },
				        tooltip: {
				            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				            pointFormat: '<tr><td style="color:{series.color};padding:0"></td>' +
				                '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
				            footerFormat: '</table>',
				            shared: true,
				            useHTML: true
				        },
				        plotOptions: {
				            column: {
				                pointPadding: 0.2,
				                borderWidth: 0
				            }
				        },
				        series: [{
				            name: 'Subject',
				            data: data.studentArray.subjMark

				        }]
				    });
					$('#stdPos').removeClass("hide")
					$('#stdDet').removeClass("hide")
					$('#backButton').removeClass("hide")
					$("#studentId").append("<option value='"+id+"'>"+id+"</option>");
					$("#studentName").append("<option value='"+id+"'>"+std_name+"</option>");
					if(data.studPosition.totSubjects != 0){
					
			    		$('#StdPosiList').removeClass("nodataContainer")
			    		$("#StdPosiList").html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
			    		var StdPosiListContent = "<table id='StudentPosiList reportTable' class='table table-striped table-bordered table-hover responsive reportTable ' width='100%' border='0' cellspacing='0'><tr><th></th><th>Subject Name</th><th>Marks</th><th>Above</th><th>Equal</th><th>Below</th></tr>";
						for(i=1;i<=data.studPosition.totSubjects;i++){
							var subjectName=data.studPosition["Subject"+(i)].SubjectName;
							var subjScore=data.studPosition["Subject"+(i)].subjScore;
							var above = data.studPosition["Subject"+(i)].above;
							var equal = data.studPosition["Subject"+(i)].equal;
							var below = data.studPosition["Subject"+(i)].below;
							StdPosiListContent+= "<tr><td>"+i+"</td><td>"+subjectName+"</td><td>"+subjScore+"</td><td>"+above+"</td><td>"+equal+"</td><td>"+below+"</td></tr>";
						}
						StdPosiListContent+="</table>";
						$("#StdPosiList").html(StdPosiListContent);
		  			}
				}
			});
	}

	function ChangeColor(tableRow, highLight){
	    if (highLight){
	      tableRow.style.fontSize = 'large';
	      tableRow.style.fontStyle = 'italic';
	      tableRow.style.color = 'red';
	    }
	    else{
	      tableRow.style.fontSize = 'initial';
	      tableRow.style.fontStyle = 'normal';
	      tableRow.style.color = 'black';
	    }
    }
</script>
</body>
</html>