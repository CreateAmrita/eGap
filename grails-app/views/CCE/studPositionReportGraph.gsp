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
                        Students Reports
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-twitch"></i>Students</a></li>
                        <li class="active">Student Position Report</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content"><!-- Dropdown-->
                	<div class="row">
					<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>Student id</h4>
					   	<select name="studentId" id="studentId" class="inputSelect form-control" disabled="disabled">
							<option value="${studentId}">${studentId}</option>
						</select>
						
					</section>
					
					<section class="col-xs-6 col-sm-3 col-md-3 col-lg-4 "><h4> Student Name</h4>
				  		<select name="studentId" id="studentId" class="inputSelect form-control" disabled="disabled"> 
							<option>${studentName}</option>
						</select>
						
					</section>
					
					<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School Group</h4>
						<select name="SchoolGroup" id="SchoolGroup" class="inputSelect form-control" disabled="disabled">
							<option value="${schoolGp.Grpid}">${schoolGp.groupName}</option>
						</select>	
						<input type="text" id="SgId" name="SgId" class="hide" value="${schoolGp.Grpid}"/>
					</section>
					
					<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School</h4>
						<select name="School" id="School" class="inputSelect form-control"disabled="disabled">
							<option value="${school.Schoolid}">${school.schoolName}</option>
						</select>
						<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>
					</section> 
					<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4> Academic Year</h4>
					   	<select name="academicYear" id="academicYear" class="inputSelect form-control" disabled="disabled">
							<option value="${acdYrId}">${acYrName}</option>
						</select>
						
					</section>
					<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>Class</h4>
					   	<select name="className" id="className" class="inputSelect form-control" disabled="disabled">
							<option value="${classId}">${className}</option>
						</select>
						
					</section>
                 	</div>
                 </section>
               
					    <!-- Main row -->
	                    <div class="row">
	                       <section class="col-lg-12 connectedSortable active">
	                            <div class="box">
	                                <div class="box-header">
	                                    <!-- tools box -->
	                                    <div class="pull-right box-tools">
	                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
	                                    </div><!-- /. tools -->
	                                    <i class="fa fa-line-chart"></i>
	                                    <h3 class="box-title">Student Position Report</h3>
	                                </div>
	                                <div class="box-body chart-responsive">
	                                    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	                                </div><!-- /.box-body -->
	                            </div>
	                        </section>
	                      <!-- /.box -->
	                    </div><!-- /.row (main row) -->

     					<div class="row">
	                       <section class="col-lg-12 connectedSortable active">
	                            <div class="box">
	                                <div class="box-header">
	                                    <!-- tools box -->
	                                    <div class="pull-right box-tools">
	                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
	                                    </div><!-- /. tools -->
	                                    <i class="fa fa-line-chart"></i>
	                                    <h3 class="box-title">Student Position Report</h3>
	                                </div>
	                                <div class="box-body chart-responsive">
 
										<table id="StudentPosiList reportTable" class="table table-striped table-bordered table-hover responsive reportTable " width="100%" border="0"cellspacing="0">
											
											<g:if test="${studentPosition}">
												<tr>
													<th></th>
													<th>Subject Name</th>
													<th>Marks</th>
													<th>Above</th>
													<th>Equal</th>
													<th>Below</th>
												</tr>
													<g:each in="${studentPosition}" var="i" status="ik">
														<tr>
															<td>
																${ik+1}
															</td>
															<td>
																${i.key}
															</td>
															<td>
																${i.value.subjScore}
															</td>
															<td>
																${i.value.above}
															</td>
															<td>
																${i.value.equal}
															</td>
															<td>
																${i.value.below}
															</td>
													</g:each>
											</g:if>
										<g:else>
											<tr class="dataTable_rows" id="">
												<td width="100%" class="centerFields">No Students in the Class.</td>
											</tr>
										</g:else>
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
			/****  Subject List ***/
			$("#academicYear").change(function(){
//				$("#className").change();
				fetchStudentDetails();
			});
	});
	var fetchStudentDetails = function(){
			var p_data = "academicYrId="+$("#academicYear").val()+"&classMasterId="+$("#className").val()+"&schoolId="+$("#SchlId").val()+"&studentId="+$("#studentId").val();
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/CCE/stdSubjsAvgScores",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
				},
				success:function(data){
					console.log(data.subjName);
					$('#container').highcharts({
				        chart: {
				            type: 'line'
				        },
				        title: {
				            text: 'Student Subject Details'
				        },
				        xAxis: {
				            categories: data.subjName
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
				            data: data.subjMark

				        }]
				    });
				}
			});
	}
</script>

        
   </body>
</html>