
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
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
			<g:render template="/templates/navMenuLeft"></g:render>
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Schools 
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-area-chart"></i> School</a></li>
                        <li class="active">School Teachers Rating</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>School Rating of Teachers</h3>
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
												<option value="${acyrId}" data-index=${i} selected="selected">${acyrStart}-${acyrEnd}</option>
										
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
						                	<option value="0" data-id="0" selected="selected">All Zones</option>
						                 	<g:each in="${zoneList.zones}" var="i" status="ik">
												<option value="${i.value.zoneId}" data-id="${i.value.zoneId}">${i.value.zoneName}</option>
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
						                <input type="text" name="SchlId" id="SchlId" value="" class="hide"/>
						                <select class="selectpicker form-control" name="schList" id="schList" style="text-transform: capitalize;">
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
						                <select class="selectpicker form-control" name="SchlId" id="SchlId">
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
						                <select class="selectpicker form-control" name="School" id="School" disabled="disabled">
						                  		<option value="${userS.Schoolid}">${userS.schoolName}</option>
										</select>
										<input type="text" name="SchlId" id="SchlId" value="${userS.Schoolid}" class="hide"/>		
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
									<h3 class="box-title">School Wise Teacher Rating</h3>
								</div>
								<div class="box-body chart-responsive">
									<div id="container" class="scrollProp" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
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
		<!-- Select 2 Plugin-->
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
					$("#Region").append("<option value='0' selected='selected'>All Regions</option>");
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
					$("#Cluster").append("<option value='0' selected='selected'>All Clusters</option>");
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
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rSchoolsUnderCluster",
				data : data,
				success:function(data){
					var len = data.totSchools;
					$("#schList").html("");
						$("#schList").append("<option value='0'selected='selected'>All Schools</option>");
						var schools = data.schools;
						//if(zoneId!=0)
							//$("#schList").append("<option value='0'selected='selected'>All Schools</option>");
						for(var i=1;i<=len;i++){
							var x = "School" + i;
							if(i==1)
								document.getElementById('SchlId').value =schools[x].SchoolId;
							$("#schList").append("<option value='"+schools[x].SchoolId +"'>"+schools[x].schoolName+"</option>");
						}
					$("#schList").change();
				}
			});
		});
		$("#schList").change(function() {
			document.getElementById('SchlId').value = $("#schList").find("option:selected").val();
			var schoolId = document.getElementById('SchlId').value;
			if(schoolId){
				if(schoolId!=0)
					fetchSchoolTeacherDetails();
				else
					fetchTeacherDetails();
			}else{
				$('#container').addClass("nodataContainer")
				$('.nodataContainer').text("No schools registered under the selected criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
			}
		});
		</sec:ifAllGranted>
		<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_SCHOOLS_MANAGER">
			$(document).ready(function(){
				fetchTeacherDetails();
			});
		</sec:ifAnyGranted>
		$("#academicYear").change(function() {
			var schoolId = document.getElementById('SchlId').value;
			if(schoolId){
				fetchTeacherDetails();
			}else{
				$('#container').addClass("nodataContainer")
				$('.nodataContainer').text("No schools registered under the selected criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
			}

		});
		$("#SchlId").change(function() {
			var schoolId = document.getElementById('SchlId').value;
			if(schoolId){
				if(schoolId!=0)
					fetchSchoolTeacherDetails();
				else
					fetchTeacherDetails();
			}else{
				$('#container').addClass("nodataContainer")
				$('.nodataContainer').text("No schools registered under the selected criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
			}
		});

		var goBack = function(){
			fetchSchoolTeacherDetails();
		}
		var fetchTeacherDetails = function(){
			$(".box").show();
			var p_data = "academicYrId="+$("#academicYear").find("option:selected").val()+"&schoolId="+$("#SchlId").val()+"&zoneId="+$('#Zone').find("option:selected").val()+"&regionId="+$('#Region').find("option:selected").val()+"&clusterId="+$('#Cluster').find("option:selected").val();
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/teacherRating",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				},
				success:function(data){
					if(data.keys){
						$('#container').removeClass("nodataContainer").removeAttr("style");
						$('#container').highcharts({
					        chart: {
					            type: 'column'
					        },
					        title: {
					            text: 'School Rating of Teachers'
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
					            column: {
					                pointPadding: 0.2,
					                colorByPoint: true,
					                borderWidth: 0
					            }
					        },
								series: [{
											name: 'Outstanding',
											data: data.one
										}, {
											name: 'Excellent',
											data: data.two
										},{
											name: 'Good',
											data: data.three
									    }, {
											name: 'Bad',
									        data: data.four
									    },{
									        name: 'Poor',
									        data: data.five
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
		var fetchSchoolTeacherDetails = function(){
			$(".box").show();
			var p_data = "academicYrId="+$("#academicYear").find("option:selected").val()+"&schoolId="+$("#SchlId").val()+"&zoneId="+$('#Zone').find("option:selected").val()+"&regionId="+$('#Region').find("option:selected").val()+"&clusterId="+$('#Cluster').find("option:selected").val();
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/teacherRating",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
				},
				success:function(data){
					if(data.keys){
						$('#container').removeClass("nodataContainer").removeAttr("style");
						$('#container').highcharts({
					        chart: {
					            type: 'column'
					        },
					        title: {
					            text: 'School Rating of Teachers'
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
					                        	var data = "academicYrId="+$("#academicYear").find("option:selected").val()+"&schoolId="+$("#SchlId").val()+"&zoneId="+$('#Zone').find("option:selected").val()+"&regionId="+$('#Region').find("option:selected").val()+"&clusterId="+$('#Cluster').find("option:selected").val();
					                			$.ajax({
					                				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/teacherRatingList",
					                				data : data,
					                				success:function(data){
					                					if(data.message){
															 $('#container').addClass("nodataContainer")
															 $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
					           							 
					                					}
					                					else{
						                					$('#container').removeClass("nodataContainer").removeAttr("style");
						                					$("#container").html(data);
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
					                borderWidth: 0,
					                colorByPoint: true
					            }
					        },
								series: [{
											name: 'Outstanding',
											data: data.one
										}, {
											name: 'Excellent',
											data: data.two
										},{
											name: 'Good',
											data: data.three
									    }, {
											name: 'Bad',
									        data: data.four
									    },{
									        name: 'Poor',
									        data: data.five
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