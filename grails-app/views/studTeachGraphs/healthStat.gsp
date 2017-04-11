
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
  		<link href="${resource(dir:'plugins/select2/',file:'select2.min.css')}" rel="stylesheet">
  		
		
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
                        <li class="active">Blood, Oral & Vision</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Health Statistics of Students</h3>
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
							 <sec:ifAllGranted roles="ROLE_CCEADMIN">
									<input type="text" name="role" id="role" value="ROLE_CCEADMIN" class="hide"/>
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
						                <h4>School</h4>
						                <select class="selectpicker form-control" name="SchlId" id="SchlId" style="text-transform: capitalize;">
						                </select>
						           </div>
					          </sec:ifAllGranted>		
					          <sec:ifAllGranted roles="ROLE_SCHOOLS_MANAGER">
				          		  <div class="form-group">
					                <h4>School Group</h4>
					                <select class="selectpicker form-control" name="SchoolGroup" id="SchoolGroup" disabled="disabled">
					                  	<option value="${schoolGp.Grpid}">${schoolGp.groupName}</option>
									</select>
									<input type="text" id="SgId" name="SgId" value="${schoolGp.Grpid}" class="hide"/>
					           </div>
					           
					             <div class="form-group">
					                <h4>School</h4>
					                <select class="selectpicker form-control" name="SchlId" id="SchlId" style="text-transform: capitalize;">
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
					                <h4>School Group</h4>
					                <select class="selectpicker form-control" name="SchoolGroup" id="SchoolGroup" disabled="disabled">
					                  	<option value="${userSG.Grpid}">${userSG.groupName}</option>
									</select>
									<input type="text" id="SgId" name="SgId" value="${userSG.Grpid}" class="hide"/>	
					           </div>
					           
					           <div class="form-group">
					                <h4>School</h4>
					                <select class="selectpicker form-control" name="SchlId" id="SchlId" disabled="disabled">
					                  		<option value="${userS.Schoolid}" style="text-transform: capitalize;">${userS.schoolName}</option>
									</select>
					           </div>
						  </sec:ifAllGranted>
						   <div class="form-group">
				               <h4>Health Parameter</h4>
								<select class="selectpicker form-control" name="hParameter" id="hParameter" >
									<option>Oral Hygiene</option>
									<option>Blood Group</option>
					                <option>Vision</option>
								</select>
				   		</div>
				   		
				   		<div class="form-group">
			 		   		<div class="hide" id="bg" name="bg">
				               <h4>Blood Group</h4>
								<select class="selectpicker form-control " name="bloodGroup" id="bloodGroup">
									<option value="0" data-id="All">All</option>
									<g:each in="${bloodGroups}" var="i" status="ik">
									<option value="${i.id}" data-id="${i.bloodGrp}">${i.bloodGrp}</option>
								</g:each>
								</select>
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
									<div id="headline"><h3 class="box-title">Health Statistics for Students</h3></div>
								</div>
								<div class="box-body chart-responsive">
									<div id="container" class="scrollProp" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
									<!--<div id="loading">
										<h4><img class="arrowTip" src="${resource(dir:'images',file:'spinner.gif')}" /></h4>
									</div>-->
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
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-more.src.js')}" type="text/javascript"></script>
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		<!-- Scroll  -->
        <script src="${createLinkTo(dir:'js/egov_js/',file:'nicescroll.js')}" type="text/javascript"></script>
		
		<!-- Select 2 Plugin -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/select2/select2.full.min.js')}" type="text/javascript"></script> 
		<script type="text/javascript">
		<sec:ifAllGranted roles="ROLE_CCEADMIN">
		
		$('document').ready(function(){
			$('#Zone').change();
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
			var data = "zoneId="+$('#Zone').find("option:selected").val()+"&regionId="+$('#Region').find("option:selected").val()+"&clusterId="+$(this).find("option:selected").val();
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rSchoolsUnderCluster",
				data : data,
				success:function(data){
					var len = data.totSchools;
					$("#SchlId").html("");
					if(len){
						var schools = data.schools;
						for(var i=1;i<=len;i++){
							var x = "School" + i;
							if(i==1)
								$('#SchlId').value =schools[x].SchoolId;
							$("#SchlId").append("<option value='"+schools[x].SchoolId +"'>"+schools[x].schoolName+"</option>");
						}
					}
					else{
						$("#SchlId").append("<option value=''>No Schools</option>");
					}
					$("#SchlId").change();
				}
			});
		});

		
		</sec:ifAllGranted>
		<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_SCHOOLS_MANAGER">
			$(document).ready(function(){
				fetchStudentDetails();
			});
		</sec:ifAnyGranted>

		$("#academicYear").change(function() {
			var sId = $("#SchlId").find("option:selected").val();
			if(sId)
				fetchStudentDetails();
			else{
				$('#container').addClass("nodataContainer")
				$('.nodataContainer').text("No schools registered under the selected criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
			}
		});
		$("#SchlId").change(function() {
			var sId = $("#SchlId").find("option:selected").val();
			if(sId)
				fetchStudentDetails();
			else{
				$('#container').addClass("nodataContainer")
				$('.nodataContainer').text("No schools registered under the selected criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
			}
		});
		$("#hParameter").change(function() {
			if($("#hParameter").val() == "Blood Group"){
				$('#bg').removeClass("hide");
				$("#bloodGroup").change();
			}
			else{
				$('#bg').addClass("hide");
				var sId = $("#SchlId").find("option:selected").val();
				if(sId)
					fetchStudentDetails();
				else{
					$('#container').addClass("nodataContainer")
					$('.nodataContainer').text("No schools registered under the selected criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
				}
			}
		});
		$("#bloodGroup").change(function() {
				var sId = $("#SchlId").find("option:selected").val();
				if(sId)
					fetchStudentDetails();
				else{
					$('#container').addClass("nodataContainer")
					$('.nodataContainer').text("No schools registered under the selected criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
				}
		});
		
		var goBack = function(){
			$("#headline").html("<h4>Blood Group Statistics of Students</h4>");
			fetchStudentDetails();
		}
		
		var fetchStudentDetails = function(){
				$(".box").show();
				if($("#hParameter").val() == "Blood Group")
					var p_data = "academicYrId="+$("#academicYear").find("option:selected").val()+"&schoolId="+$("#SchlId").val()+"&hParameter="+$("#hParameter").find("option:selected").val()+"&bloodGroupId="+$("#bloodGroup").find("option:selected").val();
				else	
					var p_data = "academicYrId="+$("#academicYear").find("option:selected").val()+"&schoolId="+$("#SchlId").val()+"&hParameter="+$("#hParameter").find("option:selected").val();
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/healthStatusRpt",
					data : p_data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					},
					success:function(data){
						if(data != "No Students"){
							 $('#container').removeClass("nodataContainer").removeAttr("style");
						
							if($("#hParameter").val() == "Blood Group"){
									 $("#headline").html("<h4>Blood Group Statistics of Students</h4>");
									 $('#container').highcharts({
									        chart: {
									            type: 'column'
									        },
									        title: {
									            text: 'Health statistics for Blood group'
									        },
									       
									        xAxis: {
									            categories: data.keys,
									            crosshair: true
									        },
									        yAxis: {
									            min: 0,
									            title: {
									                text: 'No of students'
									            }
									        },
									        tooltip: {
									            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
									            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
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
									                        	var bg = document.getElementById("bloodGroup");
																var bloodGroup = bg.options[bg.selectedIndex].text;
																var bloodGroupId=$("#bloodGroup").find("option:selected").val();
										                    	if(bloodGroupId!=0){
										                        	var data = "academicYrId="+$("#academicYear").find("option:selected").val()+"&schoolId="+$("#SchlId").val()+"&hParameter="+$("#hParameter").find("option:selected").val()+"&bloodGroupId="+$("#bloodGroup").find("option:selected").val();
										                			$.ajax({
										                				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/bloodGroupStudentsList",
										                				data : data,
										                				beforeSend: function(){
																			$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
																		},
										                				success:function(data){
										                					if(data.message){
																				 $('#container').addClass("nodataContainer")
																				 $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
										           							 
										                					}
										                					else{
											                					$('#container').removeClass("nodataContainer").removeAttr("style").css({'overflow-y':'hidden'});
											                					$("#container").html(data);
											                					$("#headline").html("<h4> Students list for the Blood Group: "+bloodGroup+"</h4>");
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
									            column: {
									                pointPadding: 0.2,
									                colorByPoint: true,
									                borderWidth: 0
									            }
									        },
									        series: [{
									            name: 'Blood Group',
									            data: data.val
			
									        }]
									    });
								
								}	
								else if($("#hParameter").val() == "Vision"){
									$("#headline").html("<h4>Vision Statistics of Students</h4>");	
									 $('#container').highcharts({
									        chart: {
									            type: 'column'
									        },
									        title: {
									            text: 'Health statistics for Vision'
									        },
									       
									        xAxis: {
									            categories: [
									                'Poor',
									                'Normal'
									               
									            ],
									            crosshair: true
									        },
									        yAxis: {
									            min: 0,
									            title: {
									                text: 'No of students'
									            }
									        },
									        tooltip: {
									            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
									            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
									                '<td style="padding:0"><b>{point.y}</b></td></tr>',
									            footerFormat: '</table>',
									            shared: true,
									            useHTML: true
									        },
									        plotOptions: {
									            column: {
									                pointPadding: 0.2,
									                colorByPoint: true,
									                borderWidth: 0
									            }
									        },
									        series: [{
									            name: 'Vision',
									            data: data
			
									        }]
									    });	
								}
								else{
								 	$("#headline").html("<h4>Oral Hygeine Statistics of Students</h4>");
									 $('#container').highcharts({
									        chart: {
									            type: 'column'
									        },
									        title: {
									            text: 'Health statistics for Oral Hygeine'
									        },
									       
									        xAxis: {
									            categories: [
									                'Poor',
									                'Bad',
									                'Normal',
									                'Good',
									                'Very Good'
									               
									            ],
									            crosshair: true
									        },
									        yAxis: {
									            min: 0,
									            title: {
									                text: 'No of students'
									            }
									        },
									        tooltip: {
									            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
									            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
									                '<td style="padding:0"><b>{point.y}</b></td></tr>',
									            footerFormat: '</table>',
									            shared: true,
									            useHTML: true
									        },
									        plotOptions: {
									            column: {
									                pointPadding: 0.2,
									                colorByPoint: true,
									                borderWidth: 0
									            }
									        },
									        series: [{
									            name: 'Oral Hygeine',
									            data: data
			
									        }]
									    });	
								} 
						}
						else{
							 $('#container').addClass("nodataContainer")
							 $('.nodataContainer').text("No Data available for the selected criterias.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
						}
					}
				});
			}
		</script>  
	</body>
</html>     
