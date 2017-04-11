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
			
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Teachers
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-area-chart"></i>Teachers</a></li>
                        <li class="active">Teacher Self Evaluation</li>
                    </ol>
                </section>

                <!-- Main content -->
                
                 <section class="content">
                 
                  	<div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Self Evaluation</h3>
						    </div>
						</div>
					</div>
                 
                 <!-- Dropdown-->
                	<div class="row">
                	<div class="col-md-6">
                	<div class="form-group"><h4>Academic Year</h4>
						<select name="academicYear" id="academicYear" class="inputSelect form-control">
							<% 
									for(def i=1;i<=TeacherAcYrs.totYrs;i++){
									def acyrId = TeacherAcYrs.acYrs."acYr$i".acYrId
									def acYrName = TeacherAcYrs.acYrs."acYr$i".acYrName
								%>
									<option value="${acyrId}">${acYrName}</option>
								<% 
									}
							%>
						</select>	
					</div>
					<div class="form-group"><h4>School Group</h4>
					   	<select name="SchoolGroup" id="SchoolGroup" class="inputSelect form-control" disabled="disabled">
							<option value="${schoolGp?.Grpid}">${schoolGp?.groupName}</option>
						</select>
					</div>
					
					<div class="form-group"><h4>School</h4>
				  		<select name="School" id="School" class="inputSelect form-control" disabled="disabled" style="text-transform: capitalize;"> 
							<option value="${school?.Schoolid}">${school?.schoolName}</option>
						</select>
					</div>
			
				
					<div class="form-group"><h4>Class</h4>
						<select name="className" id="className" class="inputSelect form-control">
							   
						</select>
						
					</div> 
					
					<div class="form-group"><h4>Subject</h4>
						<select name="subj" id="subj" class="inputSelect form-control">
							
						</select>
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
                                    <h3 class="box-title">Teacher Self Evaluation</h3>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div id="container" class="scrollProp" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                                </div><!-- /.box-body -->
                            </div>
                        </section>
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
        
        <!-- Morris.js charts -->
		<script src="${createLinkTo(dir:'js/egov_js/raphael_2.1.0',file:'raphael-min.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/plugins/morris/',file:'morris.min.js')}" type="text/javascript"></script>
        
         <!-- Pace Loader 
		<script src="${createLinkTo(dir:'js/egov_js/pace',file:'pace.min.js')}" type="text/javascript"></script>-->
		
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
	$("#academicYear").change();
});

$("#academicYear").change(function(){
	var p_data = "academicYrId="+$('#academicYear').find("option:selected").val()+"&schoolId="+$("#School").val();
	$.ajax({
		url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rTeacherClasses",
		data : p_data,
		success:function(data){
			$("#className").html("");
			for(i=1;i<=data.totClass;i++){
				$("#className").append("<option value='"+data.classes["class"+(i)].classId+"'>"+data.classes["class"+(i)].className+"</option>");
			}
			$("#className").change();
		}
	});
});

$("#className").change(function(){
	var p_data = "acYr="+$('#academicYear').find("option:selected").val()+"&schoolId="+$("#School").val()+"&classId="+$("#className").find("option:selected").val();
	$.ajax({
		url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/teacherClassSubjects",
		data : p_data,
		success:function(data){
			$("#container").html("");
			$("#subj").html("");
			for(i=1;i<=data.totSub;i++){
				$("#subj").append("<option value='"+data.subjects["subj"+(i)].subjectId+"'>"+data.subjects["subj"+(i)].subject+"</option>");
			}
			$("#subj").change();
		}
	});
});

$("#subj").change(function(){
	fetchStudentDetails();
});

var fetchStudentDetails = function(){
	$("#container").html("");
	var p_data = "classMasterId="+$("#className").find("option:selected").val()+"&schoolId="+$("#School").val()+"&subjectId="+$("#subj").find("option:selected").val();
	$.ajax({
		url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/teacherAcYrClsSubjPerf",
		data : p_data,
		beforeSend: function(){
			$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
		},
		success:function(data){
			$('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
			if(data.message){
				 $('#container').addClass("nodataContainer")
				 $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
			}
			else{
				$('#container').removeClass("nodataContainer").removeAttr("style");
					$('#container').highcharts({
						chart: {
				            type: 'column'
				        },
				        title: {
				            text: 'Self Evaluation Status'
				        },
				        xAxis: {
				            categories: data.categories,
				            crosshair: true
				        },
				        yAxis: {
				            min: 0,
				            title: {
				                text: 'Average Marks'
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
					              cursor: 'pointer',
					              point: {
					                events: {
					                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
					                	 draw_div_wise_chart(this.category);
					                 }
					                }
					              }
					        }
				        },
				        series: [{
				            name: 'Academic Year',
				            data: data.data
				        }]
				  });	
			}
		}
	});

	function draw_div_wise_chart(acYr){
		var p_data = "classMasterId="+$("#className").find("option:selected").val()+"&schoolId="+$("#School").val()+"&subjectId="+$("#subj").find("option:selected").val()+"&acYrVal="+acYr;
		$.ajax({
			url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/teacherAcYrClsDivSubjPerf",
			data : p_data,
			beforeSend: function(){
				$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
			},
			success:function(data){
				$('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
				$('#container').highcharts({
					chart: {
			            type: 'column'
			        },
			        title: {
			            text: 'Division Wise Self Evaluation'
			        },
			        xAxis: {
			            categories: data.categories,
			            crosshair: true
			        },
			        yAxis: {
			            min: 0,
			            title: {
			                text: 'Average Marks'
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
			            name: 'Division',
			            data: data.data,
                        cursor: 'pointer',
			              point: {
			                events: {
			                 click: function() {//alert ('Category: '+ this.category +', value: '+ this.y);
			                     	draw_max_min_chart(acYr,this.category);
			                 }
			                }
			              }
			        }],  
		            lang: {
		                some_key: 'Click to go back To Academic Year Graph'
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
		});
	}

	function draw_max_min_chart(acYr,div){
		var p_data = "classMasterId="+$("#className").find("option:selected").val()+"&schoolId="+$("#School").val()+"&subjectId="+$("#subj").find("option:selected").val()+"&acYrVal="+acYr+"&divVal="+div;
		$.ajax({
			url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/clsDivSubjMinMaxPerf",
			data : p_data,
			beforeSend: function(){
				$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
			},
			success:function(data){
				$('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
				 $('#container').highcharts({
				        chart: {
				            type: 'column',
				        },
				        title: {
				            text: 'Students with Maximum and Minimun Values'
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
				        		 name: "Student List",
				           		 data: data.data
				            }],  
			            lang: {
			                some_key: 'Click to go back To Division Wise Graph'
			            },
				         exporting: {
			                buttons: {
			                    customButton: {
			                    	  x: -40,
			                    	  text: 'Back',
			                          _titleKey: 'some_key',
			                          onclick: function() {
			                        	  draw_div_wise_chart(acYr);
			                          }
			                    }
			                }
			            }
				    });	
			}
		});
	}
}
</script>

        
   </body>
</html>