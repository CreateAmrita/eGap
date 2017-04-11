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
        
         <!-- Pace Loader style
        <link href="${resource(dir:'css/egov_css/pace',file:'paceBlueHor.css')}" rel="stylesheet" type="text/css" /> -->
 
    </head>
    <body class="skin-blue">
         <!-- header logo: style can be found in header.less -->
		<g:render template="/templates/header" model="['login':true]"></g:render>
       	<!-- End of header -->        
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column for sidebar navigation-->
			<g:render template="/templates/navMenuLeft"></g:render>
            
			 <!-- Main content -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                       Academics
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-area-chart"></i> Academics</a></li>
                        <li class="active">Performance Analysis</li>
                    </ol>
                </section>

                <!-- Main content -->
                
                 <section class="content">
                 	
                 	<div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Class Performance</h3>
						    </div>
						</div>
					</div>
                 
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
										<option value="${SchoolId}" data-schoolId="${SchoolId}">${schoolName}</option>
									<% 
										}
									%>		
								</select>
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
					</div>
                        <!-- Prediction box -->
                       <div class="col-md-6">
                            <div class="box ">
                                <div class="box-header">
                                    <!-- tools box -->
                                    <i class="fa fa-line-chart"></i>
                                    <h3 class="box-title">Class Performance Report</h3>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                                    <div class="buttonControls">
										<input id="Close" type="button" class="tileButton gray"  value="Back to Class" style="float: right;" onclick="fetchStudentDetails();"/>
									</div>
                                </div><!-- /.box-body -->
                            </div>
                        </div>
                      <!-- /.box -->
                    </div><!-- /.row (main row) -->
                </div>
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
	
        		
		 <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/egov_js/highcharts', file: 'highcharts-more.src.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'drilldown.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        
		<!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		  <!-- Pace Loader
		<script src="${createLinkTo(dir:'js/egov_js/pace',file:'pace.min.js')}" type="text/javascript"></script>   -->   	

 <script>
	$(document).ready(function(){
		fetchStudentDetails();
		$("#academicYear").change(function(){
			fetchStudentDetails();
		});
		$("#SchlId").change(function(){
			fetchStudentDetails();
		});
	});
	
	var fetchStudentDetails = function(){
			 $('#container').html("");
			 $("#Close").hide();
			var p_data = "academicYrId="+$("#academicYear").val()+"&schoolId="+$("#SchlId").val();
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/CCE/classPerformanceGraph",
				data : p_data,
				beforeSend: function(){
					   $('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				},
				success:function(data){	
					if(data.data){
					$('#container').removeClass("nodataContainer").removeAttr("style");	
						$(function () {
						    $('#container').highcharts({
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: 'Class Average'
						        },
						        xAxis: {
						            categories: data.categories					            
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'Marks'
						            }
						        },
						        tooltip: {
						            headerFormat: '<span style="font-size:12px">{point.key}</span><table>',
						            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
						                '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
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
						                     draw_div_chart(this.category);
						                 }
						                }
						              }
						           }
						        },
						         series: [{
						            name: 'Classes',
						            colorByPoint: true,
						            data: data.data					            
						        }],
						    });
						});
					}
					else{
						 $('#container').addClass("nodataContainer")
						 $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
						
					}	
				}
			});
					// calling function to draw new chart onclick.(division wise)
					function draw_div_chart(className)
					{
						var p_data = "academicYrId="+$("#academicYear").val()+"&schoolId="+$("#SchlId").val()+"&classVal="+className;
						$.ajax({
							url: "${grailsApplication.config.grails.serverURL}/CCE/classDivPerformRpt",
							data : p_data,
							beforeSend: function(){
								$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
							},
							success:function(data){	
							 $("#Close").show();	
							 $('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
							 $('#container').highcharts({
							        chart: {
							            type: 'column',
							        },
							        title: {
							            text: 'Division Average'
							        },
							        subtitle: {
							            text: data.name
							        },
							        xAxis: {
							            categories: data.divs
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
							                name: 'Divisions',
							                data: data.avgScores,
		                                     cursor: 'pointer',
							              point: {
							                events: {
							                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
							                     draw_subj_chart(className,this.category);
							                 }
							                }
							              }
							            }],  
						            lang: {
						                some_key: 'Click to go back'
						            },
							         exporting: {
						                buttons: {
						                    customButton: {
						                    	  x: -62,
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
						});
					

					// calling function to draw new chart onclick.(subject wise)
					function draw_subj_chart(className,divName)
					{
						var p_data = "academicYrId="+$("#academicYear").val()+"&schoolId="+$("#SchlId").val()+"&classVal="+className+"&divisionVal="+divName;
						$.ajax({
							url: "${grailsApplication.config.grails.serverURL}/CCE/classDivSubjPerformRpt",
							data : p_data,
							beforeSend: function(){
								$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
							},							
							success:function(data){		
								  $("#Close").show();
								  $('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
								 $('#container').highcharts({
								        chart: {
								            type: 'column',
								        },
								        title: {
								            text: 'Subject Average'
								        },
								        subtitle: {
								            text: data.name
								        },
								        xAxis: {
								            categories: data.subjects
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
								                name: 'Subjects',
								                data: data.avgScores,
			                                     cursor: 'pointer',
								              point: {
								                events: {
								                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
								                     draw_assess_chart(className,divName,this.category);
								                 }
								                }
								              }
								            }],
							            lang: {
							                some_key: 'Click to go back'
							            },
							            exporting: {
							                buttons: {
							                    customButton: {
							                        text: 'Back',
							                         _titleKey: 'some_key',
							                        onclick: function () {
							                        	draw_div_chart(className);
							                        },
							                    }
							                }
							            }
								    });
							}
						});
					}
				
			
			

			// calling function to draw new chart onclick.
			function draw_assess_chart(className,divName,subjName)
			{
				var p_data = "academicYrId="+$("#academicYear").val()+"&schoolId="+$("#SchlId").val()+"&classVal="+className+"&divisionVal="+divName+"&subject="+subjName;
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/CCE/clsDivSubAssessRpt",
					data : p_data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					},					
					success:function(data){	
					 $("#Close").show();	
					 $('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
					 $('#container').highcharts({
					        chart: {
					            type: 'column',
					        },
					        title: {
					            text: 'Assessment Average'
					        },
					        subtitle: {
					            text: data.name
					        },
					        xAxis: {
					            categories: data.assmntTypes
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
					                 name: 'Assessments',
					                 data: data.avgScores,
		                             cursor: 'pointer',
					              point: {
					                events: {
					                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
					                     draw_indiAssess_chart(className,divName,subjName,this.category);
					                 }
					                }
					              }
					            }],
				            lang: {
				                some_key: 'Click to go back'
				            },
				            exporting: {
				                buttons: {
				                    customButton: {
				                        x: -62,
				                        text: 'Back',
				                         _titleKey: 'some_key',
				                        onclick: function () {
				                        	draw_subj_chart(className,divName);
				                        },
				                    }
				                }
				            }
					    });
					}
				});
			}

			// calling function to draw new chart onclick.
			function draw_indiAssess_chart(className,divName,subjName,assessment)
			{
				var p_data = "academicYrId="+$("#academicYear").val()+"&schoolId="+$("#SchlId").val()+"&classVal="+className+"&divisionVal="+divName+"&subject="+subjName+"&assessment="+assessment;
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/CCE/clsDivSubjAssessments",
					data : p_data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					},
					success:function(data){	
					 $("#Close").show();
					 $('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})						    
					 $('#container').highcharts({
					        chart: {
					            type: 'column',
					        },
					        title: {
					            text: 'Assessment Type Average'
					        },
					        subtitle: {
					            text: data.name
					        },
					        xAxis: {
					            categories: data.assessments
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
					        lang: {
				                some_key: 'Click to go back'
				            },
					        series: [{
					                name:'Assessment Types',
					                data: data.avgScores,
		                             cursor: 'pointer',
					              point: {
					                events: {
					                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
					                     if(assessment == "Formative Assessment"){
					                     	draw_activity_chart(className,divName,subjName,assessment,this.category);
					                     }
					                     else{
					                          draw_sa_activity_chart(className,divName,subjName,assessment,this.category);
					                     }
					                 }
					                }
					              }
					            }],
				            exporting: {
				                buttons: {
				                    customButton: {
				                        text: 'Back',
				                         _titleKey: 'some_key',
				                        onclick: function () {
				                        	draw_assess_chart(className,divName,subjName);
				                        },
				                    }
				                }
				            }
					    });
					}
				});
			}			
			
			
			
			// calling function to draw new chart onclick.(student wise)
			function draw_sa_stud_chart(className,divName,subjName,assessment,assessmentName,activity){
				var p_data = "academicYrId="+$("#academicYear").val()+"&schoolId="+$("#SchlId").val()+"&classVal="+className+"&divisionVal="+divName+"&subject="+subjName+"&assessment="+assessment+"&assessmentName="+assessmentName+"&activity="+activity;
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/CCE/studSubjSaActivities",
					data : p_data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					},
					success:function(data){	
						 $("#Close").show();	
						 $('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
						 $('#container').highcharts({
						        chart: {
						            type: 'column',
						        },
						        title: {
						            text: 'Student Average'
						        },
						        subtitle: {
						            text: data.name
						        },
						        xAxis: {
						            categories: data.students,
						            labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
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
						                name: 'Students',
						                data: data.marks,
						              	point: {
						               
						              }
						            }],
					            lang: {
					                some_key: 'Click to go back'
					            },
					            exporting: {
					                buttons: {
					                    customButton: {
					                        x: -62,
					                        text: 'Back',
					                        _titleKey: 'some_key',
					                        onclick: function () {
					                        	draw_sa_activity_chart(className,divName,subjName,assessment,assessmentName);
					                        },
					                    }
					                }
					            }
						    });
					}
				});
			}
			
			
			function draw_sa_activity_chart(className,divName,subjName,assessment,assessmentName){
					var p_data = "academicYrId="+$("#academicYear").val()+"&schoolId="+$("#SchlId").val()+"&classVal="+className+"&divisionVal="+divName+"&subject="+subjName+"&assessment="+assessment+"&assessmentName="+assessmentName;
					$.ajax({
						url: "${grailsApplication.config.grails.serverURL}/CCE/clsDivSubjSaActivities",
						data : p_data,
						beforeSend: function(){
							$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
						},
						success:function(data){	
							 $("#Close").show();
							 $('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
							 $('#container').highcharts({
						        chart: {
						            type: 'column',
						        },
						        title: {
						            text: 'Assessment Type Average'
						        },
						        subtitle: {
						            text: data.name
						        },
						        xAxis: {
						            categories: data.activities,
						             labels: {
						                rotation: -45,
						                style: {
						                    fontSize: '13px',
						                    fontFamily: 'Verdana, sans-serif'
						                }
						            }
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
						        lang: {
					                some_key: 'Click to go back'
					            },
						        series: [{
						                name: 'Assessment Types',
						                data: data.avgScores,
			                             cursor: 'pointer',
						              point: {
						                events: {
						                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
						                     	draw_sa_stud_chart(className,divName,subjName,assessment,assessmentName,this.category);
						                    
						                 }
						                }
						              }
						            }],
					            exporting: {
					                buttons: {
					                    customButton: {
					                        x: -62,
					                        text: 'Back',
					                         _titleKey: 'some_key',
					                        onclick: function () {
					                        	draw_assess_chart(className,divName,subjName);
					                        },
					                    }
					                }
					            }
						    });
						}
					});
			
			}
			
			// calling function to draw new chart onclick in FA.
			function draw_activity_chart(className,divName,subjName,assessment,catagory)
			{
				var p_data = "academicYrId="+$("#academicYear").val()+"&schoolId="+$("#SchlId").val()+"&classVal="+className+"&divisionVal="+divName+"&subject="+subjName+"&assessment="+assessment+"&assessmentName="+catagory;
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/CCE/clsDivSubjFaActivities",
					data : p_data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					},
					success:function(data){	
					 $("#Close").show();
					 $('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})	
					 $('#container').highcharts({
					        chart: {
					            type: 'column',
					        },
					        title: {
					            text: 'Activity Average'
					        },
					        subtitle: {
					            text: data.name
					        },
					        xAxis: {
					            categories: data.activities
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
					                name: 'Activities',
					                data: data.avgScores,
					              	point: {
					                events: {
					                	click: function() {
							                     draw_stud_chart(className,divName,subjName,assessment,catagory,this.category);
							            }
					                }
					              }
					            }],
				            lang: {
				                some_key: 'Click to go back'
				            },
				            exporting: {
				                buttons: {
				                    customButton: {
				                        text: 'Back',
				                        _titleKey: 'some_key',
				                        onclick: function () {
				                        	draw_indiAssess_chart(className,divName,subjName,assessment);
				                        },
				                    }
				                }
				            }
					    });
					}
				});
			}
			
			// calling function to draw new chart onclick.(student wise in FA)
			function draw_stud_chart(className,divName,subjName,assessment,assessmentName,activity){
					var p_data = "academicYrId="+$("#academicYear").val()+"&schoolId="+$("#SchlId").val()+"&classVal="+className+"&divisionVal="+divName+"&subject="+subjName+"&assessment="+assessment+"&assessmentName="+assessmentName+"&activity="+activity;
					$.ajax({
						url: "${grailsApplication.config.grails.serverURL}/CCE/studSubjFaActivities",
						data : p_data,
						beforeSend: function(){
							$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
						},						
						success:function(data){	
							 $("#Close").show();
							 $('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
							 $('#container').highcharts({
							        chart: {
							            type: 'column',
							        },
							        title: {
							            text: 'Student Average'
							        },
							        subtitle: {
							            text: data.name
							        },
							        xAxis: {
							            categories: data.students,
							            labels: {
							                rotation: -45,
							                style: {
							                    fontSize: '13px',
							                    fontFamily: 'Verdana, sans-serif'
							                }
							            }
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
							                name: 'Students',
							                data: data.marks,
							              	point: {
							               
							              }
							            }],
						            lang: {
						                some_key: 'Click to go back'
						            },
						            exporting: {
						                buttons: {
						                    customButton: {
						                        x: -62,
						                        text: 'Back',
						                        _titleKey: 'some_key',
						                        onclick: function () {
						                        	draw_activity_chart(className,divName,subjName,assessment,assessmentName);
						                        },
						                    }
						                }
						            }
							    });
							}
					});
					
			
			}
					
		}
	}

</script>
        
   </body>
</html>