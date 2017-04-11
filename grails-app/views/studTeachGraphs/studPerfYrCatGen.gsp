
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
        
        <!-- Custom styles -->
        <link href="${resource(dir:'css/egov_css/',file:'custom.css')}" rel="stylesheet" type="text/css" />
        
        <!-- bootstrap wysihtml5 - text editor -->
		<link href="${resource(dir:'css/egov_css/bootstrap-wysihtml5/',file:'bootstrap3-wysihtml5.min.css')}" rel="stylesheet" type="text/css" />
		
		 <!-- Select2 -->
  		<link href="${resource(dir:'js/egov_js/plugins/select2/',file:'select2.min.css')}" rel="stylesheet">
		<style>
		.scrollProp{
		    height: 400px;
    		overflow-y: hidden;
		}
		
		</style>
		
    </head>
    <body class="skin-blue">
   <!-- header logo: style can be found in header.less -->
		<g:render template="/templates/header" model="['login':true]"></g:render>
       	<!-- End of header --> 
        
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
			<g:render template="/templates/navMenuLeft"></g:render>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Academics
                    </h1>
                    <ol class="breadcrumb">
                         <li><a href="javascript:"><i class="fa fa-line-chart"></i> Academics</a></li>
                        <li class="active">Year Wise Performance</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Students Performance - Year Wise</h3>
						    </div>
						</div>
					</div>
					
					<div class="row" style="margin: 2em 0em 2em 1em;">
						<sec:ifAllGranted roles="ROLE_CCEADMIN">
							<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School Group</h4>
								<select name="SchoolGroup" id="SchoolGroup" class="inputSelect form-control">
									<option value="-1" data-groupName="All School Groups" data-SchoolGrpId="0" selected="selected">All School Group</option>
									<option value="0" data-groupName="No School Group" data-SchoolGrpId="0" selected="selected">No School Group</option>
									<% 
									for(def i=1;i<=schoolGp.totSG;i++){
										def SchoolGrpId = schoolGp."groups"."SG$i".id
										def groupName = schoolGp."groups"."SG$i".groupName
									%>
										<option value="${SchoolGrpId}">${groupName}</option>
									<% 
									}
									%>
								</select>	
								<input type="text" id="SgId" name="SgId" class="hide" value=""/>
							</section>
						
							<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School</h4>
								<select name="School" id="School" class="inputSelect form-control" style="text-transform: capitalize;">
								</select>
								<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>
							</section> 
							<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4> Academic Year</h4>
							   	<select name="academicYear" id="academicYear" class="inputSelect form-control">
								</select>
							</section>	
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_SCHOOLS_MANAGER">
							<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School Group</h4>
								<select name="SchoolGroup" id="SchoolGroup" class="inputSelect form-control" disabled="disabled">
									<option value="${schoolGp.Grpid}">${schoolGp.groupName}</option>
								</select>	
								<input type="text" id="SgId" name="SgId" class="hide" value="${schoolGp.Grpid}"/>
							</section>
						
							<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School</h4>
								<select name="School" id="School" class="inputSelect form-control" style="text-transform: capitalize;">
									<option value="${school.Schoolid}">${school.schoolName}</option>
								</select>
								<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>
							</section> 
							<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4> Academic Year</h4>
							   	<select name="academicYear" id="academicYear" class="inputSelect form-control">
									<option value="${acdYrId}">${acYrName}</option>
								</select>
							</section>	
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School Group</h4>
								<select name="SchoolGroup" id="SchoolGroup" class="inputSelect form-control" disabled="disabled">
									<option value="${schoolGp.Grpid}">${schoolGp.groupName}</option>
								</select>	
								<input type="text" id="SgId" name="SgId" class="hide" value="${schoolGp.Grpid}"/>
							</section>
						
							<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School</h4>
								<select name="School" id="School" class="inputSelect form-control" disabled="disabled" style="text-transform: capitalize;">
									<option value="${school.Schoolid}">${school.schoolName}</option>
								</select>
								<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>
							</section> 
							<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4> Academic Year</h4>
							   	<select name="academicYear" id="academicYear" class="inputSelect form-control">
									<option value="${acdYrId}">${acYrName}</option>
								</select>
							</section>
						</sec:ifAllGranted>
					</div>

					<div id="StdDetails" class="row" style="margin: 2em 0em 2em 1em;">
						<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "
							id="studentId">
							<h4>Student Id</h4>
							<text name="studId" id="studId" class="inputSelect form-control" disabled="disabled"> </text>
						</section>
	
						<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "
							id="studentName">
							<h4>Student Name</h4>
							<text name="studName" id="studName" class="inputSelect form-control" disabled="disabled"> </text>
						</section>
					</div>
				<div class="col-md-6">
						<div class="box ">
							<div class="box-header">
							<!-- tools box -->
								<div class="pull-right box-tools">
									<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
								</div><!-- /. tools -->
								<i class="fa fa-line-chart"></i>
								<h3 class="box-title">Class 10 Students Performance (Year-Wise)</h3>
							</div>
							<div class="box-body chart-responsive">
								<div id="container1" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
								<button id="back" class="btn btn-primary" type="button" style="float: right; margin-top: 10px; margin-right: 10px;" onclick="fetchStudentDetails();">Back</button>
								
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="box ">
							<div class="box-header">
							<!-- tools box -->
								<div class="pull-right box-tools">
									<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
								</div><!-- /. tools -->
								<i class="fa fa-line-chart"></i>
								<h3 class="box-title">Class 10 Category of Students</h3>
							</div>
							<div class="box-body chart-responsive">
								<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
							</div>
						</div>
					</div>
					
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
        <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>
      	<script src="${createLinkTo(dir:'js/egov_js/highcharts/modules',file:'funnel.js')}" type="text/javascript"></script>
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		<!-- Scroll  -->
        <script src="${createLinkTo(dir:'js/egov_js/',file:'nicescroll.js')}" type="text/javascript"></script>
		<!-- Select 2 Plugin -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/select2/select2.full.min.js')}" type="text/javascript"></script> 
		<script language="javascript">
			$('document').ready(function(){
				$("#StdDetails").hide();
				
				<sec:ifAnyGranted roles="ROLE_SCHOOLS_MANAGER, ROLE_CCEADMIN">
				$("#SchoolGroup").change()
				</sec:ifAnyGranted>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					$("#School").change();
				</sec:ifAnyGranted>
				
			});
			$("#SchoolGroup").change(function(){
				var schoolGrpId = $('#SchoolGroup').find("option:selected").val();
				if(schoolGrpId!=-1){
					var p_data = "schoolGrpId="+schoolGrpId
					$.ajax({
						url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rAllSchoolGroupSchools",
						data : p_data,
						beforeSend: function(){
							$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
						},
						success:function(data){
							$("#School").html("");
							<sec:ifAnyGranted roles="ROLE_SCHOOLS_MANAGER, ROLE_CCEADMIN">
								$("#School").append("<option value='-1' selected='selected'>All Schools</option>");
							</sec:ifAnyGranted>
							for(i=1;i<=data.totSchools;i++){
								var schoolId = data["School"+(i)].SchoolId
								if(schoolId!=0){
									var schoolName = data["School"+(i)].schoolName
									$("#School").append("<option value='"+schoolId+"'>"+schoolName+"</option>");
								}
							}
							//console.log($("#School").find("option").size());
							if($("#School").find("option").size() >= 1){
								$("#School").change();
							}
						}
					});
				}
				else{
					$("#School").html("");
					<sec:ifAnyGranted roles="ROLE_SCHOOLS_MANAGER, ROLE_CCEADMIN">
						$("#School").append("<option value='-1' selected='selected'>All Schools</option>");
					</sec:ifAnyGranted>
					if($("#School").find("option").size() >= 1){
						$("#School").change();
					}
				}
			});
			$("#School").change(function(){
				var schoolId = $('#School').find("option:selected").val();
				var p_data = "schoolId="+schoolId
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/retSchoolAcYrs",
					data : p_data,
					success:function(data){
						$("#academicYear").html("");
						var acYrs = data.acYrTerm
						
						for(i=1;i<=data.totAcyr;i++){
							var academicYrId = acYrs["acYrTrm"+(i)].academicYrId
							var academicYr = acYrs["acYrTrm"+(i)].academicYrStart + " - " + acYrs["acYrTrm"+(i)].academicYrEnd 
							var current = acYrs["acYrTrm"+(i)].current
							if(current==true){
								$("#academicYear").append("<option value='"+academicYrId+"' selected='selected'>"+academicYr+"</option>");	
							}
							else{
								$("#academicYear").append("<option value='"+academicYrId+"'>"+academicYr+"</option>");
							}
						}
						if($("#academicYear").find("option").size() >= 1){
							$("#academicYear").change();
						}
					}
				});
			});
			$("#academicYear").change(function(){
				fetchStudentDetails();
			});
			var fetchStudentDetails = function(){
				var acYr = $("#academicYear").find("option:selected").val();
				var schoolId = $('#School').find("option:selected").val();
				var schoolGroupId = $('#SchoolGroup').find("option:selected").val();
				var p_data = "acYr="+acYr+"&schoolId="+schoolId+"&schoolGrpId="+schoolGroupId;
				$("#back").hide();
				$("#StdDetails").hide();
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/yearwiseCategoryRpt",
					data : p_data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '20%', 'margin-top': '40px'});
						$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					},
					success:function(data){
					    if(data.studCategory.message){
							$('#container').addClass("nodataContainer")
							$('#container1').addClass("nodataContainer")
							$('.nodataContainer').text(data.studCategory.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px', 'height': '400px'});
						}
					    else{
					    	$('#container1').removeClass("scrollProp")
							$('#container1').removeClass("nodataContainer").removeAttr("style");
					    	$('#container1').highcharts({
					    		chart: {
					                type: 'column',
					                options3d: {
					                    enabled: true,
					                    alpha: 10,
					                    beta: 25,
					                    depth: 70
					                }
					            },
					            title: {
					                text: 'Year Wise Class 10 Students Performance'
					            },
					            subtitle: {
					                text: 'Apperared to Pass Comparison'
					            },
					            plotOptions: {
						        	series: {
						                cursor: 'pointer',
						                point: {
						                    events: {
						                        click: function () {
						                        	$("#back").show();
							           				$("#StdDetails").hide();
							           				$("#container1").html("");
							           				//alert (this.series.name)
							           				var p_data = "academicYrId="+$("#academicYear").find("option:selected").val()+"&classMasterId=5"+"&schoolId="+$('#School').find("option:selected").val()+"&studType="+this.series.name+"&schoolGrpId="+schoolGroupId+"&rptType=studPerfYrCat";
							           				$.ajax({
							           					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/stdPerformanceRpt",
							           					data : p_data,
														beforeSend: function(){
															$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
														},
							           					success:function(data){
							           						if(data.message){
																$('#container1').addClass("nodataContainer")
																$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px', 'height': '400px'});
							           							$('#container1').removeClass("scrollProp")
							           						}
							           						else{
								           						$('#container1').addClass("scrollProp")
								           						$('#container1').removeClass("nodataContainer").removeAttr("style");
								           						$("#container1").html(data);
								           						$(".scrollProp").niceScroll({
								           					    	 cursorwidth: "10px",
								           					    	 hidecursordelay: 1000,
								           					    });
							           					    }
							           					}
							           				});
						                        }
						                    }
						                }
						        	}
					            },
					            xAxis: {
					                categories: data.students.keys,
					                title: {
						                text: 'Academic Year'
						            }
					            },
					            yAxis: {
					                title: {
					                    text: 'Number of students'
					                }
					            },
					            series: [{
					                name: 'Appeared Students',
					                data: [data.students.appearedStudents]
					            },
					            {
					                name: 'Passed Students',
					                data: [data.students.passedStudents]
					            }]
						    });
							$('#container').removeClass("nodataContainer").removeAttr("style");
					    	$('#container').highcharts({
						        chart: {
						            type: 'pyramid',
						            marginRight: 100
						        },
						        title: {
						            text: 'Category Wise Class 10 Students Appeared for Board Exams',
						            x: -50
						        },
						        plotOptions: {
						            series: {
						                dataLabels: {
						                    enabled: true,
						                    format: '<b>{point.name}</b> ({point.y:,.0f})',
						                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
						                    softConnector: true
						                }
						            }
						        },
						        credits:{
									enabled:false
						        },
						        legend: {
						            enabled: false
						        },
						        series: [{
						            name: 'Students',
						            data: [
						                ['OBC',data.studCategory.OBC],
						                ['SC', data.studCategory.SC],
						                ['ST', data.studCategory.ST],
						                ['General', data.studCategory.General]
						            ]
						        }]
						    });
						}
						
					}
				});
			}
			var fetchStudentList = function(){
				 $("#back").hide();
				 $("#StdDetails").hide();
				$("#container1").html("");
				var p_data = "academicYrId="+$("#academicYear").find("option:selected").val()+"&classMasterId=5"+"&schoolId="+$('#School').find("option:selected").val()+"&schoolGrpId="+$('#SchoolGroup').find("option:selected").val();
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/stdPerformanceRpt",
					data : p_data,
					beforeSend: function(){
						$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					},
					success:function(data){
						$('#container1').removeClass("nodataContainer").removeAttr("style");
						$("#container1").html(data);
						$(".scrollProp").niceScroll({
					    	 cursorwidth: "10px",
					    	 hidecursordelay: 1000,
					    });
					}
				});
			}
	var showGraph = function(id,name){
		$("#studId").html(id);
		$("#studName").html(name);
		$("#StdDetails").show();
		var p_data = "schoolId="+$("#School").find("option:selected").val()+"&studentId="+id;
		$.ajax({
			url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/stdAcYrAvgScores",
			data : p_data,
			beforeSend: function(){
				$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
			},
			success:function(data){
				if(data.message){
					$('#container1').addClass("nodataContainer")
					$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px', 'height': '400px'});
					$("#back").show();
				}
				else{
					$('#container1').removeClass("nodataContainer").removeAttr("style");
					$("#back").hide();
					$('#container1').highcharts({
				        chart: {
				        	 type: 'column'
				        },
				        title: {
				            text: 'Student Year Wise Performance'
				        },
				        xAxis: {
				            categories: data.categories,
				            crosshair: true
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
	                            colorByPoint: true,
				                pointPadding: 0.2,
				                borderWidth: 0
				            },
				            series: {
				              cursor: 'pointer',
				              point: {
				                events: {
				                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
				                	 draw_subj_chart(this.category);
				                 }
				                }
				              }
				           }
				        },
				        series: [{
				        	name: 'Academic Year',
				            data: data.data
	
				        }],
				         lang: {
			                some_key: 'Click to go back To Student List'
			             },
				         exporting: {
			                buttons: {
			                    customButton: {
			                    	  x: -40,
			                    	  text: 'Back',
			                          _titleKey: 'some_key',
			                          onclick: function() {
			                        	  fetchStudentDetails();
			                          }
			                    }
			                }
			            }
				    });
				 }
			}
			
		});
		// calling function to draw subject wise chart onclick.
		function draw_subj_chart(acYr){
			var p_data = "schoolId="+$("#School").find("option:selected").val()+"&studentId="+id+"&academicYrId="+acYr;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classSubjWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				},
				success:function(data){	
					 if(data.message){
						$('#container1').addClass("nodataContainer")
						$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px', 'height': '400px'});
						$("#back").show();
					}
					else{
						 $('#container1').removeClass("nodataContainer").removeAttr("style");
						 $("#back").hide();
						 $('#container1').highcharts({
						        chart: {
						            type: 'column',
						        },
						        title: {
						            text: 'Subject wise Total'
						        },
						    	subtitle: {
				            		text: data.name
				        		},
						        xAxis: {
						            categories:data.categories,
						            crosshair: true
						        },
						        yAxis: { 
						            min: 0,
						            title: {
						                text: '',
						            }
						        },
						        tooltip: {
						            headerFormat: '<span style="font-size:12px">{point.key}</span><table>',
						            pointFormat: '<tr style="border:none;"><td style="color:{series.color};padding:0;border:none;">{series.name}: </td>' +
						                '<td style="padding:0;border:none;"><b>{point.y:1f} </b></td></tr>',
						            footerFormat: '</table>',
						            shared: false,
						            useHTML: true
						        },
						        plotOptions: {
						            column: {
	                                    colorByPoint: true,
						                pointPadding: 0,
						                borderWidth: 0
						            },
						        },
						        series: [{
						        		 name: 'Subject Total',
						           		 data: data.data,
	                                     cursor: 'pointer',
						              point: {
						                events: {
						                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
						                     draw_assessment_chart(acYr,this.category);
						                 }
						                }
						              }
						            }],  
					            lang: {
					                some_key: 'Click to go back To Academic Year'
					            },
						         exporting: {
					                buttons: {
					                    customButton: {
					                    	  x: -40,
					                    	  text: 'Back',
					                          _titleKey: 'some_key',
					                          onclick: function() {
					                        	  showGraph(id,name);
					                          }
					                    }
					                }
					            }
						    });	
						}
				}
			});
		}

		// calling function to draw assessment wise chart onclick.(FA and SA)
		function draw_assessment_chart(acYr,subjName){
			var p_data = "schoolId="+$("#School").find("option:selected").val()+"&studentId="+id+"&acYrVal="+acYr+"&subject="+subjName;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classAssessWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				},
				success:function(data){	
					if(data.message){
						$('#container1').addClass("nodataContainer")
						$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px', 'height': '400px'});
						$("#back").show();
					}
					else{
						 $('#container1').removeClass("nodataContainer").removeAttr("style");
						 $("#back").hide();
						 $('#container1').highcharts({
						        chart: {
						            type: 'column',
						        },
						        title: {
						            text: 'Assessment Wise Total'
						        },
						    	subtitle: {
				            		text: data.name
				        		},
						        xAxis: {
						            categories:data.categories,
						            crosshair: true
						        },
						        yAxis: { 
						            min: 0,
						            title: {
						                text: '',
						            }
						        },
						        tooltip: {
						            headerFormat: '<span style="font-size:12px">{point.key}</span><table>',
						            pointFormat: '<tr style="border:none;"><td style="color:{series.color};padding:0;border:none;">{series.name}: </td>' +
						                '<td style="padding:0;border:none;"><b>{point.y:1f} </b></td></tr>',
						            footerFormat: '</table>',
						            shared: false,
						            useHTML: true
						        },
						        plotOptions: {
						            column: {
	                                    colorByPoint: true,
						                pointPadding: 0,
						                borderWidth: 0
						            },
						        },
						        series: [{
						        		 name: 'Assessment Types Total',
						           		 data: data.data,
	                                     cursor: 'pointer',
						              point: {
						                events: {
						                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
						                 var assessment = this.category
						                 	if(assessment == "Formative Assessment"){
						                     	draw_fa_activity_chart(acYr,subjName,this.category);
						                     }
						                     else{
						                          draw_sa_activity_chart(acYr,subjName,this.category);
						                     }
						                 }
						                }
						              }
						            }],  
					            lang: {
					                some_key: 'Click to go back To Subjects'
					            },
						         exporting: {
					                buttons: {
					                    customButton: {
					                    	  x: -40,
					                    	  text: 'Back',
					                          _titleKey: 'some_key',
					                          onclick: function() {
					                        	  draw_subj_chart(acYr);
					                          }
					                    }
					                }
					            }
						    });	
						}
				}
			});
		}

		// calling function to draw FA assessments wise chart onclick.
		function draw_fa_activity_chart(acYr,subjName,assessType){
			var p_data = "schoolId="+$("#School").find("option:selected").val()+"&studentId="+id+"&acYrVal="+acYr+"&subject="+subjName+"&assessType="+assessType;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classFaAssessWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				},
				success:function(data){	
					if(data.message){
						$('#container1').addClass("nodataContainer")
						$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px', 'height': '400px'});
						$("#back").show();
					}
					else{
						 $('#container1').removeClass("nodataContainer").removeAttr("style");
						 $("#back").hide();
						 $('#container1').highcharts({
						        chart: {
						            type: 'column',
						        },
						        title: {
						            text: 'Formative Assessments Total'
						        },
						    	subtitle: {
				            		text: data.name
				        		},
						        xAxis: {
						            categories: data.categories,
						            crosshair: true
						        },
						        yAxis: { 
						            min: 0,
						            title: {
						                text: '',
						            }
						        },
						        tooltip: {
						            headerFormat: '<span style="font-size:12px">{point.key}</span><table>',
						            pointFormat: '<tr style="border:none;"><td style="color:{series.color};padding:0;border:none;">{series.name}: </td>' +
						                '<td style="padding:0;border:none;"><b>{point.y:1f} </b></td></tr>',
						            footerFormat: '</table>',
						            shared: false,
						            useHTML: true
						        },
						        plotOptions: {
						            column: {
	                                    colorByPoint: true,
						                pointPadding: 0,
						                borderWidth: 0
						            },
						        },
						        series: [{
						        		 name: 'Assessment Total',
						           		 data: data.data,
	                                     cursor: 'pointer',
						              point: {
						                events: {
						                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
						                     	draw_fa_tool_chart(acYr,subjName,assessType,this.category);
						                 }
						                }
						              }
						            }],  
					            lang: {
					                some_key: 'Click to go back To Assessments'
					            },
						         exporting: {
					                buttons: {
					                    customButton: {
					                    	  x: -40,
					                    	  text: 'Back',
					                          _titleKey: 'some_key',
					                          onclick: function() {
					                        	  draw_assessment_chart(acYr,subjName);
					                          }
					                    }
					                }
					            }
						    });	
						}
				}
			});
		}
		
		// calling function to draw SA assessments wise chart onclick.
		function draw_sa_activity_chart(acYr,subjName,assessType){
			var p_data = "schoolId="+$("#School").find("option:selected").val()+"&studentId="+id+"&acYrVal="+acYr+"&subject="+subjName+"&assessType="+assessType;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classSaAssessWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				},
				success:function(data){	
					if(data.message){
					     $('#container1').addClass("nodataContainer")
					     $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px', 'height': '400px'});
					     $("#back").show();
					}
					else{
						 $('#container1').removeClass("nodataContainer").removeAttr("style");
						 $("#back").hide();
						 $('#container1').highcharts({
						        chart: {
						            type: 'column',
						        },
						        title: {
						            text: 'Summative Assessments Total'
						        },
						    	subtitle: {
				            		text: data.name
				        		},
						        xAxis: {
						            categories: data.categories,
						            crosshair: true
						        },
						        yAxis: { 
						            min: 0,
						            title: {
						                text: '',
						            }
						        },
						        tooltip: {
						            headerFormat: '<span style="font-size:12px">{point.key}</span><table>',
						            pointFormat: '<tr style="border:none;"><td style="color:{series.color};padding:0;border:none;">{series.name}: </td>' +
						                '<td style="padding:0;border:none;"><b>{point.y:1f} </b></td></tr>',
						            footerFormat: '</table>',
						            shared: false,
						            useHTML: true
						        },
						        plotOptions: {
						            column: {
	                                    colorByPoint: true,
						                pointPadding: 0,
						                borderWidth: 0
						            },
						        },
						        series: [{
						        		 name: 'Assessment Total',
						           		 data: data.data,
	                                     cursor: 'pointer',
						              point: {
						                events: {
						                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
						                     	draw_sa_tool_chart(acYr,subjName,assessType,this.category);
						                 }
						                }
						              }
						            }],  
					            lang: {
					                some_key: 'Click to go back To Assessments'
					            },
						         exporting: {
					                buttons: {
					                    customButton: {
					                    	  x: -40,
					                    	  text: 'Back',
					                          _titleKey: 'some_key',
					                          onclick: function() {
					                        	  draw_assessment_chart(acYr,subjName);
					                          }
					                    }
					                }
					            }
						    });	
					}
				}
			});
		}
		
		// calling function to draw FA activity wise chart onclick.
		function draw_fa_tool_chart(acYr,subjName,assessType,activity){
			var p_data = "schoolId="+$("#School").find("option:selected").val()+"&studentId="+id+"&acYrVal="+acYr+"&subject="+subjName+"&assessType="+assessType+"&activity="+activity;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classFaActWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				},
				success:function(data){	
					if(data.message){
						 $('#container1').addClass("nodataContainer")
						 $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px', 'height': '400px'});
						 $("#back").show();
					}
					else{
						 $('#container1').removeClass("nodataContainer").removeAttr("style");
						 $("#back").show();
						 $('#container1').highcharts({
						        chart: {
						            type: 'column',
						        },
						        title: {
						            text: 'FA Activity Total'
						        },
						    	subtitle: {
				            		text: data.name
				        		},
						        xAxis: {
						            categories: data.categories,
						            crosshair: true
						        },
						        yAxis: { 
						            min: 0,
						            title: {
						                text: '',
						            }
						        },
						        tooltip: {
						            headerFormat: '<span style="font-size:12px">{point.key}</span><table>',
						            pointFormat: '<tr style="border:none;"><td style="color:{series.color};padding:0;border:none;">{series.name}: </td>' +
						                '<td style="padding:0;border:none;"><b>{point.y:1f} </b></td></tr>',
						            footerFormat: '</table>',
						            shared: false,
						            useHTML: true
						        },
						        plotOptions: {
						            column: {
	                                    colorByPoint: true,
						                pointPadding: 0,
						                borderWidth: 0
						            },
						        },
						        series: [{
						        		 name: 'Assessment Activity Total',
						           		 data: data.data
						            }],  
					            lang: {
					                some_key: 'Click to go back To FA Activities'
					            },
						         exporting: {
					                buttons: {
					                    customButton: {
					                    	  x: -40,
					                    	  text: 'Back',
					                          _titleKey: 'some_key',
					                          onclick: function() {
					                        	 draw_fa_activity_chart(acYr,subjName,assessType);
					                          }
					                    }
					                }
					            }
						    });	
						}
				}
			});
		}
		
		// calling function to draw SA activity wise chart onclick.
		function draw_sa_tool_chart(acYr,subjName,assessType,activity){
			var p_data = "schoolId="+$("#School").find("option:selected").val()+"&studentId="+id+"&acYrVal="+acYr+"&subject="+subjName+"&assessType="+assessType+"&activity="+activity;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classSaActWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				},
				success:function(data){	
					if(data.message){
						$('#container1').addClass("nodataContainer")
						$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px', 'height': '400px'});
						$("#back").show();
					}
					else{
						$('#container1').removeClass("nodataContainer").removeAttr("style");
						$("#back").show();
						 $('#container1').highcharts({
						        chart: {
						            type: 'column',
						        },
						        title: {
						            text: 'SA Activity Total'
						        },
						    	subtitle: {
				            		text: data.name
				        		},
						        xAxis: {
						            categories: data.categories,
						            crosshair: true
						        },
						        yAxis: { 
						            min: 0,
						            title: {
						                text: '',
						            }
						        },
						        tooltip: {
						            headerFormat: '<span style="font-size:12px">{point.key}</span><table>',
						            pointFormat: '<tr style="border:none;"><td style="color:{series.color};padding:0;border:none;">{series.name}: </td>' +
						                '<td style="padding:0;border:none;"><b>{point.y:1f} </b></td></tr>',
						            footerFormat: '</table>',
						            shared: false,
						            useHTML: true
						        },
						        plotOptions: {
						            column: {
	                                    colorByPoint: true,
						                pointPadding: 0,
						                borderWidth: 0
						            },
						        },
						        series: [{
						        		 name: 'Assessment Activity Total',
						           		 data: data.data
						            }],  
					            lang: {
					                some_key: 'Click to go back To SA Activities'
					            },
						         exporting: {
					                buttons: {
					                    customButton: {
					                    	  x: -40,
					                    	  text: 'Back',
					                          _titleKey: 'some_key',
					                          onclick: function() {
					                        	  draw_sa_activity_chart(acYr,subjName,assessType);
					                          }
					                    }
					                }
					            }
						    });	
					}
				}
			});
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