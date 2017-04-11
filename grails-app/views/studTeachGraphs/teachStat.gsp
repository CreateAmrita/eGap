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
                         Teachers
                    </h1>
                    <ol class="breadcrumb">
                       <li><a href="javascript:"><i class="fa fa-bar-chart-o"></i> Teacher</a></li>
                        <li class="active">Trained Teacher Statistics>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Trained Teacher Statistics</h3>
						    </div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6">
							  <sec:ifAllGranted roles="ROLE_CCEADMIN">
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
												<option value="${acyrId}" data-index=${i} selected="selected">${acyrStart}-${acyrEnd}</option>
										
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
						                  	<g:each in="${regionList.regions}" var="i" status="ik">
												<option value="${i.value.regionId}" data-id="${i.value.regionId}" <g:if test="${selRegion.toInteger() == i.value.regionId.toInteger()}">selected="selected"</g:if>>${i.value.regionName}</option>
											</g:each>
						                </select>
						              </div>
						              
						               <div class="form-group">
						                <h4>Cluster</h4>
						                <select class="selectpicker form-control" name="Cluster" id="Cluster">
						                 	<g:each in="${clusterList.clusters}" var="i" status="ik">
												<option value="${i.value.clusterId}" data-id="${i.value.clusterId}" <g:if test="${selCluster.toInteger() == i.value.clusterId.toInteger()}">selected="selected"</g:if>>${i.value.clusterName}</option>
											</g:each>
						                </select>
						              </div>
						             
						             
									<div class="form-group">
						                <h4>School</h4>
						                <select class="selectpicker form-control" name="schList" id="schList">
						                  	
						                </select>
						           </div>
						           
					          </sec:ifAllGranted>
					          
					          <sec:ifAllGranted roles="ROLE_SCHOOLS_MANAGER">
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
												<option value="${acyrId}" data-index=${i} selected="selected">${acyrStart}-${acyrEnd}</option>
										
											<% 
												}
											%>		
										</select>
						            </div>
					          		  <div class="form-group">
						                <h4>School Group</h4>
						                <select class="selectpicker form-control" name="SchoolGroup" id="SchoolGroup" disabled="disabled">
						                  	<option value="${schoolGp.Grpid}">${schoolGp.groupName}</option>
										</select>
										<input type="text" id="SgId" name="SgId" value="${schoolGp.Grpid}" class="hide"/>
						           </div>
						           
						             <div class="form-group">
						                <h4>School</h4>
						                <select class="selectpicker form-control" name="schList" id="schList" style="text-transform: capitalize;">
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
						               <h4>Academic Year</h4>
										<select class="selectpicker form-control" name="academicYear" id="academicYear" >
							                <% 
												for(def i=1;i<=acyrTerms.totAcyr;i++){
												def acyrId = acyrTerms.acYrTerm."acYrTrm$i".academicYrId
												def acyrStart = acyrTerms.acYrTerm."acYrTrm$i".academicYrStart
												def acyrEnd = acyrTerms.acYrTerm."acYrTrm$i".academicYrEnd
												def current = acyrTerms.acYrTerm."acYrTrm$i".current
											%>
												<option value="${acyrId}" data-index=${i} selected="selected">${acyrStart}-${acyrEnd}</option>
										
											<% 
												}
											%>		
										</select>
						            </div>
						            
						            <div class="form-group">
						                <h4>School Group</h4>
						                <select class="selectpicker form-control" name="SchoolGroup" id="SchoolGroup" disabled="disabled">
						                  	<option value="${userSG.Grpid}">${userSG.groupName}</option>
										</select>
										<input type="text" id="SgId" name="SgId" value="${userSG.Grpid}" class="hide"/>	
						           </div>
						           
						           <div class="form-group">
						                <h4>School</h4>
						                <select class="selectpicker form-control" name="School" id="School" disabled="disabled" style="text-transform: capitalize;">
						                  		<option value="${userS.Schoolid}">${userS.schoolName}</option>
										</select>
										<input type="text" name="schList" id="schList" value="${userS.Schoolid}" class="hide"/>		
						           </div>
								</sec:ifAllGranted>
								
				                         
						</div>
						<div class="col-md-6">
							
							<div class="box ">
								<div class="box-header">
								<!-- tools box -->
									<div class="pull-right box-tools">
										<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
									</div><!-- /. tools -->
									<i class="fa fa-line-chart"></i>
									<h3 class="box-title">Trained Teacher Statistics</h3>
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

	<script language="javascript">		
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
						var schools = data.schools;
						$("#schList").html("");
						for(var i=1;i<=len;i++){
							var x = "School" + i;
							$("#schList").append("<option value='"+schools[x].SchoolId +"'>"+schools[x].schoolName+"</option>");
						}
						$("#schList").change();
					}
				});
			});

			$("#schList").change(function() {
				fetchStudentDetails();
			});

			
             /*
			$("#sGroup").change(function() {
				$("#schList").html("");
				var id="sId="+$(this).val();
				
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rSchoolsForCbseAdminUnderGroup",
					data : id,
					success:function(data){
						var len = data.totSchools;
						$("#schList").html("");
						for(var i=1;i<=len;i++){
							var x = "School" + i;
							$("#schList").append("<option value='"+data[x].SchoolId +"'>"+data[x].schoolName+"</option>");
						}
						$("#schList").change();
					}
				});	
			});
			*/

			
	
		</sec:ifAllGranted>   
		<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SCHOOLS_MANAGER">
				$(document).ready(function(){
					fetchStudentDetails();
				});
		</sec:ifAnyGranted>  

		$("#academicYear").change(function() {
			fetchStudentDetails();
		});

		$("#schList").change(function() {
			fetchStudentDetails();
		});
		
	var fetchStudentDetails = function(){
		$(".box").show();
		var p_data = "academicYrId="+$("#academicYear").find("option:selected").val()+"&schoolId="+$("#schList").val();
		$.ajax({
			url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/teacherTrainingRpt",
			data : p_data,
			beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
					},
			success:function(data){
				if(data.keys){
					$('#container').removeClass("nodataContainer").removeAttr("style");
					$('#container').highcharts({
						chart: {
				            type: 'bar'
				        },
				        title: {
				            text: 'Teacher Statistics'
				        },
				        subtitle: {
				            text: 'Male and Female trained teacher counts'
				        },
				        xAxis: {
				            categories: data.keys,
				            title: {
				                text: null
				            }
				        },
				        yAxis: {
				            min: 0,
				            title: {
				                text: 'Number of Teachers',
				                align: 'high'
				            },
				            labels: {
				                overflow: 'justify'
				            }
				        },
				        tooltip: {
				            valueSuffix: 'Teachers'
				        },
				        plotOptions: {
				            bar: {
				                dataLabels: {
				                    enabled: true
				                }
				            }
				        },
				        legend: {
				            layout: 'vertical',
				            align: 'right',
				            verticalAlign: 'top',
				            x: -40,
				            y: 80,
				            floating: true,
				            borderWidth: 1,
				            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
				            shadow: true
				        },
				        credits: {
				            enabled: false
				        },
				        series: [{
				            name: 'Trained',
				            data: data.Trained
				        }, 
				        {
				            name: 'Total',
				            data: data.All
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