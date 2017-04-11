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
        <link href="${resource(dir:'css/egov_css/pace',file:'paceBlueHor.css')}" rel="stylesheet" type="text/css" />-->
        
 
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
		<g:render template="/templates/header" model="['login':true]"></g:render>
       	<!-- End of header -->        
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column for sidebar navigation-->
			<g:render template="/templates/navMenuLeft"></g:render>
			
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                       Students 
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-twitch"></i>Student</a></li>
                        <li class="active">Student Grade Wise Distribution</li>
                    </ol>
                </section>

                <!-- Main content -->
                
                 <section class="content">
                 
                 	<div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Student Grade Distribution</h3>
						    </div>
						</div>
					</div>
                 
                 			 <!-- Dropdown-->
                	<div class="row">
                	<div class="col-md-6">
					<div class="form-group"><h4>School Group</h4>
						<select name="SchoolGroup" id="SchoolGroup" disabled="disabled" class="form-control">
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
							<select class="selectpicker form-control" name="academicYear" id="academicYear" >
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
							<select class="selectpicker form-control" name="academicYear" id="academicYear" >
								<option value="${currentAcYr.id}">${currentAcYr.sYear} - ${currentAcYr.eYear}</option>
							</select>
						</div>
					</sec:ifAllGranted>
					
					<div class="form-group"><h4>Class</h4>
					  	<select name="className" id="className" class="selectpicker form-control">
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
					
					<div class="form-group"><h4>Subject Category</h4>
					  	<select name="subjectCat" id="subjectCat" class="selectpicker form-control">
						   <option value="1">Scholastic</option>
						   <option value="2">Co-Scholastic</option>
						</select>
					</div> 
					
					</div>
                        <!-- Prediction box -->
                       <section class="col-md-6 connectedSortable">
                            <div class="box ">
                                <div class="box-header">
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                                    </div><!-- /. tools -->
                                    <i class="fa fa-line-chart"></i>
                                    <h3 class="box-title">Student Grade Wise Distribution Report</h3>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div id="studentList" style="min-width: 310px; height: 400px; margin: 0 auto">
                                    	
                                    </div>
                                </div><!-- /.box-body -->
                            </div>
                        </section>
                      <!-- /.box -->
                     
                       
                    </div><!-- /.row (main row) -->
                 	
                 	
                 </section>
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
		<script src="${createLinkTo(dir:'js/egov_js/pace',file:'pace.min.js')}" type="text/javascript"></script>-->
		
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		
		 <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-more.src.js')}" type="text/javascript"></script>
    
	<script>
	$(document).ready(function(){
		$("#className").change();
	});

	$("#SchlId").change(function(){
		selectClass();
	});


	$("#academicYear").change(function(){
		selectClass();
	});

	$("#subjectCat").change(function(){
		fetchStudentDetails();
	});

	/***** Fetch corresponding class of the selected school in school manager. *****/
	var selectClass = function(){
		$("#className").html("");
		var p_data="school_Id="+$("#SchlId").val()+"&acYrId="+$("#academicYear").val();
		$.ajax({
			url:"${grailsApplication.config.grails.serverURL}/StudTeachGraphs/listAllSchoolClasses",
			data: p_data,
			success:function(data){
				$("#studentList").html("");
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

	$("#className").change(function(){
		fetchStudentDetails();
	});

	

	var fetchStudentDetails = function(){
		var p_data = "academicYrId="+$("#academicYear").val()+"&classMasterId="+$("#className").find("option:selected").data("classmasterid")+"&schoolId="+$("#SchlId").val()+"&subjectCategoryId="+$("#subjectCat").find("option:selected").val();
		$.ajax({
			url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/stdGradeDist",
			data : p_data,
			beforeSend: function(){
				$('#studentList').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
			},
			success:function(data){
				$('#studentList').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
				$('#studentList').highcharts({
					 chart: {
				            type: 'column'
				        },
				        title: {
				        	 text: 'Grade Distribution',
				        },
				       
				        xAxis: {
				        	 categories: data.keys,
				            crosshair: true
				        },
				        yAxis: {
				            min: 0,
				            title: {
				            	 text: 'No of Students'
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
				            }
				        },
				        series: [{
				            name: 'A1',
				            data: data.A1
				        }, {
				            name: 'A2',
				            data: data.A2
				        }, {
				            name: 'B1',
				            data: data.B1
				        }, {
				            name: 'B2',
				            data: data.B2
				        }, {
				            name: 'C1',
				            data: data.C1
				        }, {
				            name: 'C2',
				            data: data.C2
				        }, {
				            name: 'D',
				            data: data.D
				        }, {
				            name: 'E1',
				            data: data.E1
				        }, {
				            name: 'E2',
				            data: data.E2
				        }]
				});
			}
		});
}
	</script>
</body>
</html>