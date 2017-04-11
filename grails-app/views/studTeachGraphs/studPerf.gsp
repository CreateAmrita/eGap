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
        
          <!-- AutoComplete -->
        <link href="${resource(dir:'css/egov_css/',file:'easy-autocomplete.min.css')}" rel="stylesheet" type="text/css" />
        
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
                        Students                     </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-twitch"></i>Students</a></li>
                        <li class="active">Student Performance</li>
                    </ol>
                </section>

                <!-- Main content -->
                
                 <section class="content">
                 
                  	<div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Student Performance</h3>
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
					
					<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_TEACHER">
						<div class="form-group"><h4>School</h4>
					  		<select name="School" id="School" class="inputSelect form-control" disabled="disabled" style="text-transform: capitalize;"> 
								<option value="${school.Schoolid}">${school.schoolName}</option>
							</select>
							<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>
						</div>
					</sec:ifAnyGranted>
					
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
						
					</sec:ifAllGranted>
					
					<div class="form-group"><h4>Current Academic Year</h4>
						<select name="academicYear" id="academicYear" class="inputSelect form-control" disabled="disabled">
							<option value="${currentAcYr.id}">${currentAcYr.sYear} - ${currentAcYr.eYear}</option>
						</select>	
					</div>
					
					<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SCHOOLS_MANAGER">
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
					</sec:ifAnyGranted>
					
					<sec:ifAllGranted roles="ROLE_TEACHER">
						<div class="form-group"><h4>Class</h4>
							<select name="className" id="className" class="inputSelect form-control">
								<g:each in="${classDiv.classes}" var="i" status="ik">
									<option value="${i.value.schoolClassId}" data-classMasterId="${i.value.classId}">
										${i.value.className} - ${i.value.division}
									</option>
								</g:each>	
							</select>
						</div> 
					</sec:ifAllGranted>
					
					<div class="form-group" id="studentId"><h4>Student Id</h4>
						<text name="studId" id="studId" class="inputSelect form-control" disabled="disabled">
						</text>	
					</div>
					
					<div class="form-group" id="studentName"><h4>Student Name</h4>
						<text name="studName" id="studName" class="inputSelect form-control" disabled="disabled">
						</text>	
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
                                    <h3 class="box-title">Student List</h3>
                                </div>
                                <!-- 
                                <div class="box-body chart-responsive">
										<div class="input-group " id="autoSelect">
											<span class="input-group-addon"><i class="fa fa-search"></i></span>
							            	<input type="text" placeholder="Search by student name" id="searchSchool" style="width:100%; padding-left: 10px;">
							            </div>
								</div>
								 -->
                                <div class="box-body chart-responsive">
                                    <div id="container" class="scrollProp" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                                </div><!-- /.box-body -->
                                <button id="back" class="btn btn-primary" type="button" style="float: right; margin-top: 10px; margin-right: 10px;" onclick="fetchStudentDetails();">Back to Class</button>
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
		
		 <!-- AutoComplete -->
		<script src="${createLinkTo(dir:'js/egov_js/',file:'jquery.easy-autocomplete.min.js')}" type="text/javascript"></script>
        
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
		$("#studentId").hide();
		$("#studentName").hide();
		$("#back").hide();
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
			$("#studentId").hide();
			$("#studentName").hide();
			 $("#back").hide();
			$("#container").html("");
			var academicYrId = $("#academicYear").val();
			var classMasterId = $("#className").find("option:selected").data("classmasterid");
			var schoolId = $("#SchlId").val();
			var p_data = "academicYrId="+$("#academicYear").val()+"&classMasterId="+$("#className").find("option:selected").data("classmasterid")+"&schoolId="+$("#SchlId").val();
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/stdPerformanceRpt",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				},
				success:function(data){
					$('#container').removeClass("nodataContainer").removeAttr("style");
					$("#container").html(data);
					$(".scrollProp").niceScroll({
				    	 cursorwidth: "10px",
				    	 hidecursordelay: 1000,
				    });
				}
			});
			
//			options(academicYrId,classMasterId,schoolId);

			/*
			$.ajax({
				data : p_data,
		        type: "GET",
		        url: "${grailsApplication.config.grails.serverURL}/school/autoStudComplete",
		        dataType: "json",
		        success : function(response) {
		            //Create a map.
		            var data =
		                $.map(response, function(item){
		                  console.log("id: " + item.id);
		                  console.log("name: " + item.Name);
		                    return{
		                        id: item.id,
		                        value: item.Name
		                    }
		                });
		            $("#searchSchool").autocomplete({
		                source: data,
		                messages: {
		                    noResults: '',
		                    results: function() {
		                        $("ul.ui-autocomplete li").css({'list-style-type':'none','font-size': 'large','background': '#ddd'});

		                    }
		                },
		                autoFocus: true
		            });
		            

		        }
		    });
		    */
			
		
	}

	/*
	 var options = function(academicYrId,classMasterId,schoolId){
		 var p_data = "academicYrId="+academicYrId+"&classMasterId="+classMasterId+"&schoolId="+schoolId
		 $.ajax({
				data : p_data,
		        url: "${grailsApplication.config.grails.serverURL}/school/autoStudComplete",
		        success : function(response) {
			        console.log(response)
		            //Create a map.
		            var data =
		                $.map(response, function(item){
		                    return{
		                        id: item.id,
		                        value: item.Name
		                    }
		                });
		            console.log(data)
		            $("#searchSchool").easyAutocomplete(response);
		        }
		 });
	}
	*/


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

	var showGraph = function(id,name){
		$("#studentId").show();
		$("#studId").html(id);
		$("#studentName").show();
		$("#studName").html(name);

		var p_data = "schoolId="+$("#SchlId").val()+"&studentId="+id;
		$.ajax({
			url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/stdAcYrAvgScores",
			data : p_data,
			beforeSend: function(){
				$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
			},
			success:function(data){
				if(data.message){
					$('#container').addClass("nodataContainer")
					$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
					$("#back").show();
				}
				else{
					$('#container').removeClass("nodataContainer").removeAttr("style");
					$("#back").hide();
					$('#container').highcharts({
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
			var p_data = "schoolId="+$("#SchlId").val()+"&studentId="+id+"&academicYrId="+acYr;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classSubjWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
				},
				success:function(data){	
					 if(data.message){
						$('#container').addClass("nodataContainer")
						$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
						$("#back").show();
					}
					else{
						 $('#container').removeClass("nodataContainer").removeAttr("style");
						 $("#back").hide();
						 $('#container').highcharts({
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
			var p_data = "schoolId="+$("#SchlId").val()+"&studentId="+id+"&acYrVal="+acYr+"&subject="+subjName;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classAssessWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
				},
				success:function(data){	
					if(data.message){
						$('#container').addClass("nodataContainer")
						$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
						$("#back").show();
					}
					else{
						 $('#container').removeClass("nodataContainer").removeAttr("style");
						 $("#back").hide();
						 $('#container').highcharts({
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
			var p_data = "schoolId="+$("#SchlId").val()+"&studentId="+id+"&acYrVal="+acYr+"&subject="+subjName+"&assessType="+assessType;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classFaAssessWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
				},
				success:function(data){	
					if(data.message){
						$('#container').addClass("nodataContainer")
						$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
						$("#back").show();
					}
					else{
						 $('#container').removeClass("nodataContainer").removeAttr("style");
						 $("#back").hide();
						 $('#container').highcharts({
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
			var p_data = "schoolId="+$("#SchlId").val()+"&studentId="+id+"&acYrVal="+acYr+"&subject="+subjName+"&assessType="+assessType;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classSaAssessWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
				},
				success:function(data){	
					if(data.message){
					     $('#container').addClass("nodataContainer")
					     $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
					     $("#back").show();
					}
					else{
						 $('#container').removeClass("nodataContainer").removeAttr("style");
						 $("#back").hide();
						 $('#container').highcharts({
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
			var p_data = "schoolId="+$("#SchlId").val()+"&studentId="+id+"&acYrVal="+acYr+"&subject="+subjName+"&assessType="+assessType+"&activity="+activity;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classFaActWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
				},
				success:function(data){	
					if(data.message){
						 $('#container').addClass("nodataContainer")
						 $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
						 $("#back").show();
					}
					else{
						 $('#container').removeClass("nodataContainer").removeAttr("style");
						 $("#back").show();
						 $('#container').highcharts({
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
			var p_data = "schoolId="+$("#SchlId").val()+"&studentId="+id+"&acYrVal="+acYr+"&subject="+subjName+"&assessType="+assessType+"&activity="+activity;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/classSaActWisePerformRpt",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
				},
				success:function(data){	
					if(data.message){
						$('#container').addClass("nodataContainer")
						$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
						$("#back").show();
					}
					else{
						$('#container').removeClass("nodataContainer").removeAttr("style");
						$("#back").show();
						 $('#container').highcharts({
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