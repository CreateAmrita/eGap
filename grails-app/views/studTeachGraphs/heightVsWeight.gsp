
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
		
		
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
     <g:render template="/templates/header" model="['login':true]"></g:render>
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
			<g:render template="/templates/navMenuLeft"></g:render>


            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                         Health
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-area-chart"></i> Health</a></li>
                        <li class="active">Height v/s Weight</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Gender Wise Height to Weight Comparison</h3>
						    </div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
				               <h4>Academic Year</h4>
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
				              <div class="form-group">
					                <h4>School Group</h4>
					                <select class="selectpicker form-control" name="SchoolGroup" id="SchoolGroup" disabled="disabled">
					                  	<option value="${schoolGp?.Grpid}">${schoolGp?.groupName}</option>
									</select>
					           </div>
			            	<sec:ifAllGranted roles="ROLE_SCHOOLS_MANAGER">
					             <div class="form-group">
					                <h4>School</h4>
					                <select class="selectpicker form-control" name="SchlId" id="SchlId"  style="text-transform: capitalize;">
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
						<sec:ifAllGranted roles="ROLE_ADMIN">
					           <div class="form-group">
					                <h4>School</h4>
					                <select class="selectpicker form-control" name="School" id="School" disabled="disabled" style="text-transform: capitalize;">
					                  		<option value="${school.Schoolid}">${school.schoolName}</option>
									</select>
									<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>		
					           </div>
						</sec:ifAllGranted>
						  <div class="form-group">
			                <h4>Class</h4>
			                <select class="selectpicker form-control" name="className" id="className">
			                 	<% 
									for(def i=1;i<=classes.totClass;i++){
									def schlClassId = classes."class$i".schlClassId
									def className = classes."class$i".className
									def classMasterId = classes."class$i".classMasterId
								%>
									<option data-index=${i} value="${classMasterId}" data-schoolclassid="${schlClassId}">${className}</option>
								<% 
									}
								%>
			                </select>
			              </div>
			              
			               <div class="form-group">
			                <h4>Division</h4>
			                <select class="selectpicker form-control" name="division" id="division">
				                  <g:each in="${division.divisions}" var="i" status="ik">
									<option value="${i.value.ClassDivId}" data-id="${ik+1}" data-ClassDivId="${i.value.ClassDivId}">${i.value.division}</option>
								</g:each>
			                </select>
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
									<h3 class="box-title">Height Versus Weight of Individuals by Gender</h3>
								</div>
								<div class="box-body chart-responsive">
									<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
								</div>
							</div>
						</div>
					</div>
					
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->
        
        <!--  Footer  -->
		<g:render template="/templates/footer"></g:render>
        <!--  Footer  -->
        <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/bootstrap',file:'bootstrap.min.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/jquery_ui_1.11.1',file:'jquery-ui.min.js')}" type="text/javascript"></script>
        <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>  
		
		<script type="text/javascript">
		
		$(document).ready(function(){
			fetchStudentDetails();
		});
		
		$("#SchlId").change(function(){
			selectClass();
		});
		
		$("#academicYear").change(function() {
			selectClass();
		});

		$("#className").change(function(){
			$("#division").html("");
			var id = "schoolClassId="+$("#className").find("option:selected").data("schoolclassid");
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rSchoolClassDivisions",
				data : id,
				success:function(data){
					for(j=1;j<=data.totDivision;j++){
						$("#division").append("<option value='"+data.divisions["div"+j].ClassDivId+"' data-id='div"+j+"' data-ClassDivId='"+data.divisions["div"+j].ClassDivId+"'>"+data.divisions["div"+j].division+"</option>");
					}
					if($("#division").find("option").size() >= 1){
						$('#division').change();
					}
				}
			});
		});

		
		var selectClass = function(){
			$("#className").html("");
			var p_data="school_Id="+$("#SchlId").val()+"&acYrId="+$("#academicYear").val();
			$.ajax({
				url:"${grailsApplication.config.grails.serverURL}/StudTeachGraphs/listAllSchoolClasses",
				data: p_data,
				success:function(data){
					$("#className").html("");
					for(i=1;i<=data.totClass;i++){
						$("#className").append("<option data-index='"+i+"' data-schoolclassid='"+data["class"+(i)].schlClassId+"' value='"+data["class"+(i)].classMasterId+"'>"+data["class"+(i)].className+"</option>");
					}
					if($("#className").find("option").size() >= 1){
						$("#className").change();
					}
				}
			});
		}
		

		$('#division').change(function() {
			fetchStudentDetails();
		});

		
		var fetchStudentDetails = function(){
			var p_data = "academicYrId="+$("#academicYear").find("option:selected").val()+"&schoolId="+$("#SchlId").val()+"&schoolClassId="+$("#className").find("option:selected").data("schoolclassid")+"&divisionId="+$("#division").find("option:selected").val();
				$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/heightToWeight",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				},
				success:function(data){
					if(data.Male && data.Female){
						$('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
						$('#container').removeClass("nodataContainer").removeAttr("style");
						$('#container').highcharts({
							chart: {
					            type: 'scatter',
					            zoomType: 'xy'
					        },
					        title: {
					            text: 'Height Versus Weight of Individuals by Gender'
					        },
					        subtitle: {
					            text: 'Source: Heinz  2003'
					        },
					        xAxis: {
					            title: {
					                enabled: true,
					                text: 'Height (cm)'
					            },
					            startOnTick: true,
					            endOnTick: true,
					            showLastLabel: true
					        },
					        yAxis: {
					            title: {
					                text: 'Weight (kg)'
					            }
					        },
					        legend: {
					            layout: 'vertical',
					            align: 'left',
					            verticalAlign: 'top',
					            x: 100,
					            y: 70,
					            floating: true,
					            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
					            borderWidth: 1
					        },
					        plotOptions: {
					            scatter: {
					                marker: {
					                    radius: 5,
					                    states: {
					                        hover: {
					                            enabled: true,
					                            lineColor: 'rgb(100,100,100)'
					                        }
					                    }
					                },
					                states: {
					                    hover: {
					                        marker: {
					                            enabled: false
					                        }
					                    }
					                },
					                tooltip: {
					                    headerFormat: '<b>{series.name}</b><br>',
					                    pointFormat: '{point.x} cm, {point.y} kg'
					                }
					            }
					        },
					        series: [{
					            name: 'Female',
					            color: 'rgba(223, 83, 83, .5)',
					            data: data.Female
	
					        }, {
					            name: 'Male',
					            color: 'rgba(119, 152, 191, .5)',
					            data: data.Male
					        }]
					    });	
					}
					else{
						 $('#container').addClass("nodataContainer")
						 $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
						
					}			 
				}
			});
		}

</script>    
		
   </body>
</html>