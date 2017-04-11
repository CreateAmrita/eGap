
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
		
    </head>
    <style>
    .sidebar{ height: 750px;}
    </style>
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
                        Academics
                    </h1>
                    <ol class="breadcrumb">
                         <li><a href="javascript:"><i class="fa fa-line-chart"></i> Academics</a></li>
                        <li class="active">CGPA Wise Performance</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>CGPA wise Performance of Students</h3>
						    </div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6">
				        	<sec:ifAllGranted roles="ROLE_CCEADMIN">
									<input type="text" name="role" id="role" value="ROLE_CCEADMIN" class="hide"/>
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
						                <h4>School</h4>
						                <select class="selectpicker form-control" name="SchlId" id="SchlId" style="text-transform: capitalize;">
						                </select>
						           </div>
							</sec:ifAllGranted>
							
							<sec:ifAllGranted roles="ROLE_SCHOOLS_MANAGER">
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
								<div class="form-group"><h4>School Group</h4>
									<select name="SchoolGroup" id="SchoolGroup" disabled="disabled" class="form-control">
										<option value="${schoolGp.Grpid}">${schoolGp.groupName}</option>
									</select>
									<input type="text" id="SgId" name="SgId" class="hide" value="${schoolGp.Grpid}"/>
								</div>
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
								<div class="form-group"><h4>School Group</h4>
									<select name="SchoolGroup" id="SchoolGroup" disabled="disabled" class="form-control">
										 <option value="${schoolGp.Grpid}">${schoolGp.groupName}</option>
									</select>
									<input type="text" id="SgId" name="SgId" class="hide" value="${schoolGp.Grpid}"/>
								</div>
								<div class="form-group"><h4>School</h4>
										<select name="School" id="School" class="inputSelect form-control" disabled="disabled" style="text-transform: capitalize;">
											<option value="${school.Schoolid}">${school.schoolName}</option>
										</select>
										<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>
								</div>
							</sec:ifAllGranted>
								<div class="form-group"><h4>Class</h4>
									  	<select name="className" id="className" class="selectpicker form-control">
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
						</div>
						<div class="col-md-6">
							<div class="box ">
								<div class="box-header">
								<!-- tools box -->
									<div class="pull-right box-tools">
										<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
									</div><!-- /. tools -->
									<i class="fa fa-line-chart"></i>
									<h3 class="box-title">Students Performance (CGPA-wise Distribtion)</h3>
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

        
        <!--  Footer  -->
		<g:render template="/templates/footer"></g:render>
        <!--  Footer  -->

		
        <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/bootstrap',file:'bootstrap.min.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/jquery_ui_1.11.1',file:'jquery-ui.min.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/jquery_ui_1.11.1',file:'jquery-ui.min.js')}" type="text/javascript"></script>
		<!-- Select 2 Plugin -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/select2/select2.full.min.js')}" type="text/javascript"></script> 
        <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
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
			$('document').ready(function(){
				selectClass();
				//$(".box").hide();	 
			});
		</sec:ifAnyGranted>
			$("#SchlId").change(function(){
				selectClass();
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

			$("#academicYear").change(function(){
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
				$(".box").show();
				var p_data = "schoolId="+$('#SchlId').val()+"&acYr="+$('#academicYear').find('option:selected').val()+"&classMasterId="+$('#className').find('option:selected').data("classmasterid");
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/cgpawiseCategoryRpt",
					data : p_data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					},
					success:function(data){
						if(data.message){
							 $('#container').addClass("nodataContainer")
							 $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
						}
						else{
							$('#container').removeClass("nodataContainer").removeAttr("style");
							$('#container').highcharts({
							        chart: {
							            renderTo: 'container',
							            type: 'column',
							            options3d: {
							                enabled: true,
							                alpha: 15,
							                beta: 25,
							                depth: 50,
							                viewDistance: 25
							            }
							        },
							        title: {
							            text: 'Student Performance '
							        },
							        xAxis: {
							        	title: {
							                text: 'CGPA Range'
							            },
							            categories: data.keys
							        },
							        plotOptions: {
							            column: {
							                depth: 25
							            }
							        },
	
							        credits: {
							            enabled: false
							     	},
							        series: [{
								        name: 'No of Students',
							            data: data.noOfStudents
							        }]
							    });	
						}
					}
				});
			}
		</script>       
        
   </body>
</html>