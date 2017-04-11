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
                       Academics
                    </h1>
                    <ol class="breadcrumb">
                         <li><a href="javascript:"><i class="fa fa-line-chart"></i> Academics</a></li>
                        <li class="active">Subject Wise Class Performance</li>
                    </ol>
                </section>

                <!-- Main content -->
                
                 <section class="content">
                 
                 	<div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Subject Wise Class Performance</h3>
						    </div>
						</div>
					</div>
                 
                 			 <!-- Dropdown-->
                	<div class="row">
	                	<div class="col-md-6">
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
						 <div class="form-group">
				                <h4>Zone</h4>
				                <select class="selectpicker form-control" name="Zone" id="Zone">
				                 	<g:each in="${zoneList.zones}" var="i" status="ik">
										<option value="${i.value.zoneId}" data-id="${i.value.zoneId}" <g:if test="${selZone.toInteger() == i.value.zoneId.toInteger()}">selected="selected"</g:if>>${i.value.zoneName}</option>
									</g:each>	
				                </select>
			              </div> 
			               <div class="form-group">
				                <h4>Region</h4>
				                <select class="selectpicker form-control" name="Region" id="Region">
				                	
				                </select>
			              </div>
			               <div class="form-group">
				                <h4>Cluster</h4>
				                <select class="selectpicker form-control" name="Cluster" id="Cluster">
				                	
				                </select>
			              </div>
				          <div class="form-group">
				               <h4>State</h4>
							   <select id="state" name="state" class="form-control">
							   		
							   </select>
				          </div>
						<div class="form-group">
			                <h4>School</h4>
			                <select class="selectpicker form-control" name="SchlId" id="SchlId" style="text-transform: capitalize;">
			                </select>
			           </div>
			           <div class="form-group"><h4>Class</h4>
						  	<select name="className" id="className" class="selectpicker form-control">
							   
							</select>
					</div> 
					
						</div>
					
                     	
                        <!-- Prediction box -->
                       <section class="col-lg-6 connectedSortable" style="margin-top: 3em;">
                            <div class="box ">
                                <div class="box-header">
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                                    </div><!-- /. tools -->
                                    <i class="fa fa-line-chart"></i>
                                    <h3 class="box-title">Subject Wise Class Performance Chart</h3>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
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
        
 
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		
		 <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-more.src.js')}" type="text/javascript"></script>

    <script type="text/javascript">
	 $('document').ready(function(){
			$('#Zone').change();
			//fetchStudentDetails();
		});

		$('#Zone').change(function() {
			var data = "zoneId="+$('#Zone').find("option:selected").val();
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rZoneRegion",
				data : data,
				success:function(data){
					var len = data.totRegions;
					var regions = data.regions;
					$("#Region").html("");
					for(var i=0;i<len;i++){
						var x = "region" + (i+1);
						$("#Region").append("<option value='"+regions[x].regionId +"'>"+regions[x].regionName+"</option>");
					}
					$("#Region").change();
				}
			});
		});

		$('#Region').change(function() {
			var data = "zoneId="+$('#Zone').find("option:selected").val()+"&regionId="+$(this).find("option:selected").val();
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rZoneRegionClusters",
				data : data,
				success:function(data){
					var len = data.totClusters;
					var clusters = data.clusters;
					$("#Cluster").html("");
					for(var i=1;i<=len;i++){
						var x = "cluster" + i;
						$("#Cluster").append("<option value='"+clusters[x].clusterId +"'>"+clusters[x].clusterName+"</option>");
					}
					$("#Cluster").change();
				}
			});
		});

		$('#Cluster').change(function() {
			var zoneId = $('#Zone').find("option:selected").val()
			var regionId = $('#Region').find("option:selected").val()
			var clusterId = $(this).find("option:selected").val()
			var data = "zoneId="+zoneId+"&regionId="+regionId+"&clusterId="+clusterId;
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rStatesUnderCluster",
				data : data,
				success:function(data){
					var len = data.totStates;
					var states = data.states;
					$("#state").html("");
					for(var i=1;i<=len;i++){
						var x = "state" + i;
						$("#state").append("<option data-csId='"+states[x].csId+"' value='"+states[x].stateId +"'>"+states[x].stateName+"</option>");
					}
					$("#state").change();
				}
			});
		});

		$("#state").bind("change",function(){
			var zoneId = $('#Zone').find("option:selected").val()
			var regionId = $('#Region').find("option:selected").val()
			var clusterId = $("#Cluster").find("option:selected").val()
			var stateId = $(this).find("option:selected").data("csid");
			var data = "zoneId="+zoneId+"&regionId="+regionId+"&clusterId="+clusterId+"&clusterStateId="+stateId;
			$.ajax({
				url:"${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rSchoolsUnderClusterState",
				data : data,
				success:function(data){
					var len = data.totSchools;
					var schools = data.schools;
					$("#SchlId").html("");
					if(data.totSchools){
						for(var i=1;i<=len;i++){
							var x = "School" + i;
							$("#SchlId").append("<option value='"+schools[x].SchoolId +"'>"+schools[x].schoolName+"</option>");
						}
					}
					else{
						$("#SchlId").append("<option value='0' value='0'>No School</option>");
					}
					if($("#SchlId").find("option").size() >= 1){
						$("#SchlId").change();
					}
				}	
			});
		});

		$("#SchlId").change(function() {
			var SchlId = $("#SchlId").val();
			if(SchlId){
				selectClass();
			}
			else{
				$("#className").html("");
				$('#container').addClass("nodataContainer")
				$('.nodataContainer').text("No Schools Registered for this State").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
			}
		});

		$("#className").change(function(){
			var classId = $("#className").find("option:selected").data("classmasterid")
			if(classId){
				fetchStudentDetails();
			}
			else{
				$('#container').addClass("nodataContainer")
				$('.nodataContainer').text("No Classes Registered for this School").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
			}
		});

		$("#academicYear").change(function() {
			selectClass();
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
					if(data.totClass){
						for(i=1;i<=data.totClass;i++){
							$("#className").append("<option data-classMasterId='"+data["class"+(i)].classMasterId+"' value='"+data["class"+(i)].schlClassId+"'>"+data["class"+(i)].className+"</option>");
						}
					}
					else{
						$("#className").append("<option data-classMasterId='0' value='0'>No Class</option>");
					}

					if($("#className").find("option").size() >= 1){
						$("#className").change();
					}
				}
			});
		}

		var fetchStudentDetails = function(){
			var zoneId = $('#Zone').find("option:selected").val()
			var regionId = $('#Region').find("option:selected").val()
			var clusterId = $("#Cluster").find("option:selected").val()
			var stateId = $("#state").find("option:selected").data("csid");
			var p_data = "academicYrId="+$("#academicYear").val()+"&classNameId="+$("#className").find("option:selected").data("classmasterid")+"&zoneId="+zoneId+"&regionId="+regionId+"&clusterId="+clusterId+"&clusterStateId="+stateId+"&schoolId="+$("#SchlId").val();
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/CCE/subjClassWisePerfGraph",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
				},
				success:function(data){
					if(data.Categories){
						$('#container').removeClass("nodataContainer").removeAttr("style");
						$('#container').highcharts({
							 title: {
						            text: 'Subject Wise Class Performance',
						            x: -20 //center
						        },
						        subtitle: {
						            text: 'average marks of each class subjects',
						            x: -20
						        },
						        xAxis: {
						            categories: data.Categories
						        },
						        yAxis: {
						            title: {
						                text: 'Avg Marks (%)'
						            },
						            plotLines: [{
						                value: 0,
						                width: 1,
						                color: '#808080'
						            }]
						        },
						        tooltip: {
						            valueSuffix: '%'
						        },
						        legend: {
						            layout: 'vertical',
						            align: 'right',
						            verticalAlign: 'middle',
						            borderWidth: 0
						        },
						        series: data.divisionScores
						    });
					}
					else{
						 $('#container').addClass("nodataContainer")
						 $('.nodataContainer').text("No Data Available for the Selected Criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
					}
				}
			});
		}
     </script>    
