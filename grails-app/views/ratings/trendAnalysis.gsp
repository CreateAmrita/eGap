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
            
			 <!-- Main content -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                       Students 
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-twitch"></i> Students</a></li>
                        <li class="active">Student Distribution</li>
                    </ol>
                </section>

                <!-- Main content -->
                
                 <section class="content">
                 	
                 	<div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Gender Based Subject Distribution of Students</h3>
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
								<option value="${currentAcYr.id}">${currentAcYr.sYear} - ${currentAcYr.eYear}</option>
							</select>
						</div>
					</sec:ifAllGranted>
					</div>
					
					 <section class="col-md-6">
                            <div class="box ">
                                <div class="box-header">
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                                    </div><!-- /. tools -->
                                    <i class="fa fa-line-chart"></i>
                                    <div id="headline" >
                                    	<h3 class="box-title">Student Distribution Report</h3>
                                    </div>
                                </div>
                                <div class="box-body chart-responsive">
                                	<input type="text" id="subj" name="subj" class="hide" value=""/>
                                    <input type="text" id="gender" name="gender" class="hide" value=""/>
                                    <div id="chart" class="chart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                                    <div id="chart_footer" class="chart" style="padding-left: 50px;">test data</div>
                                </div><!-- /.box-body -->
                                <button id="back" class="btn btn-primary" type="button" style="float: right; margin-top: 10px; margin-right: 10px;" onclick="fetchStudentDetails();">Back to Student Distribution</button>
								
                            </div>
                        </section>
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
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'drilldown.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>
		
		<!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		    	

 <script>
 $(document).ready(function(){
	 fetchStudentDetails();
	 $("#back").hide();
	 $("#chart_footer").hide();
	 $("#academicYear").change(function(){
			fetchStudentDetails();
		});
		$("#SchlId").change(function(){
			fetchStudentDetails();
		});
 });

 var fetchStudentDetails = function(){
	 $('#chart').html("");
	 $("#back").hide();
	 var p_data = "acYrId="+$("#academicYear").val()+"&schoolId="+$("#SchlId").val();
		$.ajax({
			url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/schlStdGenSubDistribution",
			data : p_data,
			beforeSend: function(){
				$('#chart').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				$("#chart_footer").hide()
			},
			success:function(data){	
				if(data.message){
					$('#chart').addClass("nodataContainer")
					$('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px','height': '360px'});
					$("#back").show();
					$("#chart_footer").hide()
				}
				else{
					$("#headline").html("<h3 style='font-size: 20px; font-weight: 400; margin: 0; padding: 10px 10px 10px 10px;'>Student Distribution Report</h3>")
					var compSub="",noDataSubj="", footer_data=""
					if(data.noDataSubjs.length!=0){
						for (var g = 0; g < data.noDataSubjs.length; g++) {
							noDataSubj = noDataSubj+data.noDataSubjs[g]+", "
						}
						noDataSubj = noDataSubj.slice(0,compSub.length-2)
						footer_data+="<p style='font-size: small;font-weight: bold;'>No students have been registered for the following Optional Subjects: <p/><p style='margin-top: -11px;'>"+noDataSubj+"</p>"					 
					}	
					if(data.compSubjs.length!=0){
						for (var f = 0; f < data.compSubjs.length; f++) {
							 compSub = compSub+data.compSubjs[f]+", "
						}
					 	compSub = compSub.slice(0,compSub.length-2)
					 	footer_data+="<p style='font-size: small;font-weight: bold;'>Compulsory Subjects Students Count:<p/><p style='margin-top: -11px;'>"+compSub+" - <b>Male: "+data.totMale+", </b><b>Female: "+data.totFemale+"</b></p>"
					}	
					$("#chart_footer").html(footer_data)
					$("#chart_footer").show()
					$('#chart').removeClass("nodataContainer").removeAttr("style");
				     var colors = Highcharts.getOptions().colors,
				     categories = data.categories,
				     name = 'Gender',
				    
				     data =  [{
				                     y: data.totFemale,
				                     color: '#A9A9A9',
				                     drilldown: {
				                         name: 'Female Subject Count',
				                         categories: data.dataSubjs,
				                         data: data.subjCountFemale,
				                         gender:"Female",
				                         color: '#A9A9A9'
				                     }
				                 }, {
				                     y: data.totMale,
				                     color: '#CD853F',
				                     drilldown: {
				                         name: 'Male Subject Count',
				                         categories: data.dataSubjs,
				                         data: data.subjCountMale,
				                         gender:"Male",
				                         color: '#CD853F'
				                     }
				                 
				                 }];
										
				
					    // Build the data arrays
					    var GenderData = [];
					    var SubjectData = [];
					    for (var i = 0; i < data.length; i++) {
					
					        // add gender data
					        GenderData.push({
					            name: categories[i],
					            y: data[i].y,
					            color: data[i].color
					        });
					
					        // add subject data
					        for (var j = 0; j < data[i].drilldown.data.length; j++) {
					            var brightness = 0.2 - (j / data[i].drilldown.data.length) / 5 ;
					            SubjectData.push({
					                name: data[i].drilldown.categories[j],
					                y: data[i].drilldown.data[j],
					                genderName: data[i].drilldown.gender[0],
					                color: Highcharts.Color(data[i].color).brighten(brightness).get()
					            });
					        }
					    }
	
					  
					    // Create the chart
					    $('#chart').highcharts({
					        chart: {
					            type: 'pie'
					        },
					        title: {
					            text: 'Gender wise Subject Distribution'
					        },

					        plotOptions: {
					            pie: {
					                shadow: false,
					                center: ['50%', '50%']
					            }
					        },
					        tooltip: {
					          valueSuffix: ''
					        },
					        
					        series: [{
					            name: 'Students',
					            data: GenderData,
					            size: '60%',
					            dataLabels: {
					                formatter: function() {
					                    return this.y > 4 ? this.point.name : null;
					                },
					                color: 'black',
					                distance: -50
					            }
					        }, {
					            name: 'Subject',
					            data: SubjectData,
					            size: '80%',
					            innerSize: '60%',
					            dataLabels: {
					                formatter: function() {
					                    // display only if larger than 1
					                    return this.y > 1 ? '<b>'+ this.point.name +':</b> '+ this.y +''  : null;
					                }
					            },
					            cursor: 'pointer',
					            point: {
					                events: {
					                 click: function() { //alert ('Category: '+ this.name +', Gender: '+ this.genderName);
					                 	console.log(this)
					                     draw_subj_pie_chart(this.name,this.genderName);
					                 }
					                }
					              }
					        }],
				 		});
				}
			}
		});
    }
    		function draw_subj_pie_chart(subj,gender){
			$("#chart_footer").hide()
			 $('#chart').html("");
			 $("#back").show();
			 var p_data = "acYrId="+$("#academicYear").val()+"&schoolId="+$("#SchlId").val()+"&gender="+gender+"&subject="+subj;
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/schlSubGenClsDistribution",
					data : p_data,
					beforeSend: function(){
						$('#chart').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
					},
					success:function(data){	
						if(data.message){
							 $('#chart').addClass("nodataContainer")
							 $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px','height': '360px'});
						}
						else{
							if(gender=="M"){ 
						       gender="Male"
						    } 
						    else{
						       gender="Female"
						    }
							$('#chart').removeClass("nodataContainer").removeAttr("style");
							 $('#chart').highcharts({
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: 'Class Wise Student Distribution'
						        },
						        subtitle: {
						            text: subj+' - ' + gender
						        },
						        xAxis: {
						            categories: data.categories,
						            crosshair: true
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'No of students'
						            }
						        },
						        tooltip: {
						            headerFormat: '<span style="font-size:10px">Class {point.key}</span><table>',
						            pointFormat: '<tr><td style="color:{series.color};padding:0">: </td>' +
						                '<td style="padding:0"><b>{point.y}</b></td></tr>',
						            footerFormat: '</table>',
						            shared: true,
						            useHTML: true
						        },
						        plotOptions: {
							        	series: {
							                cursor: 'pointer',
							                point: {
							                    events: {
							                        click: function () {
							                        	//alert ('Category: '+ this.category +', value: '+ this.y);
							                        	//var subjName = this.category
							                        	var subjName = subj
							                        	var data = "academicYrId="+$("#academicYear").val()+"&className="+this.category+"&schoolId="+$("#SchlId").val()+"&subject="+subjName+"&gender="+gender;
							                			$.ajax({
							                				url: "${grailsApplication.config.grails.serverURL}/CCE/OptionalSubjStdList",
							                				data : data,
							                				beforeSend: function(){
																$('#chart').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
															},
							                				success:function(data){
							                					if(data.message){
																	 $('#chart').addClass("nodataContainer")
																	 $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
							           							 
							                					}
							                					else{
							                						document.getElementById('subj').value = subjName
							                						document.getElementById('gender').value = gender
								                					$("#chart").removeClass("nodataContainer").removeAttr("style").css({'overflow-y':'hidden'});
								                					$("#chart").html(data);
								                					$("#headline").html("<h3 style='font-size: 20px; font-weight: 400; margin: 0; padding: 10px 10px 10px 10px;'>Students list for the Optional Subject:  "+subjName+"</h3>")
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
						            },
						            column: {
						                pointPadding: 0.2,
						                colorByPoint: true,
						                borderWidth: 0
						            }
						        },
						        series: [{
						            name: 'Classes',
						            data: data.data

						        }]
							});	
						}
					}
				});
		}
    var goBack = function(){
		draw_subj_pie_chart($("#subj").val(),$("#gender").val());
	}
</script>
        
   </body>
</html>