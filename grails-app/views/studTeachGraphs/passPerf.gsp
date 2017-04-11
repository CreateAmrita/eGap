
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
       	<!-- End of header -->     
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
             <!-- Left side column for sidebar navigation-->
			<g:render template="/templates/navMenuLeft"></g:render>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                         Students 
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-twitch"></i> Students</a></li>
                        <li class="active">Student Class Pass Performance</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Passing Performance of Students</h3>
						    </div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6">
				              <div class="form-group"><h4>School Group</h4>
								<select name="SchoolGroup" class="form-control" id="SchoolGroup" disabled="disabled">
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
									<select class="selectpicker form-control" name="SchlId" id="SchlId" class="inputSelect" style="text-transform: capitalize;">
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
									<select  class="selectpicker form-control" name="academicYear" id="academicYear" class="inputSelect">
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
							
							
							<div class="form-group"><h4>Division</h4>
						  		<select name="divName" id="divName" class="inputSelect form-control">
									<g:each in="${division.divisions}" var="i" status="ik">
										<option value="${i.value.ClassDivId}" data-id="${ik+1}" data-ClassDivId="${i.value.ClassDivId}">${i.value.division}</option>
									</g:each>
								</select>
								<input type="text" name="gradeVal" id="gradeVal" value="" class="hide"/>
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
									<div id="chartHeadline" >
										<h3 class="box-title">Student Performance Drilling</h3>
									</div>
								</div>
								<div class="box-body chart-responsive">
									<div id="container" class="scrollProp"  style="min-width: 310px; height: 400px; margin: 0 auto"></div>
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
        
             
        <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>
   

        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>

		
		
		<script language="javascript">
				$('document').ready(function(){
					fetchStudentDetails();
				});

				$("#academicYear").change(function(){
					var classVal =$("#className").val()
					var divVal =$("#divName").val()
					if(classVal && divVal)
						fetchStudentDetails();
					else{
						$('#container').addClass("nodataContainer")
						$('.nodataContainer').text("No classes registered under the selected criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
					}
				});

				$("#SchlId").change(function(){
					selectClass();
				});

				$("#className").change(function(){
					$("#divName").html("");
					var id = "schoolClassId="+$("#className").val();
					$.ajax({
						url: "${grailsApplication.config.grails.serverURL}/CCE/rSchoolClassDivisions",
						data : id,
						success:function(data){
							for(j=1;j<=data.totDivision;j++){
								$("#divName").append("<option value='"+data.divisions["div"+j].ClassDivId+"' data-id='div"+j+"' data-ClassDivId='"+data.divisions["div"+j].ClassDivId+"'>"+data.divisions["div"+j].division+"</option>");
							}
							if($("#divName").find("option").size() >= 1){
								$('#divName').change();
							}
						}
					});
				});
	
				$("#divName").change(function(){
					fetchStudentDetails();
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
								if($("#className").find("option").size() >= 1){
									$("#className").change();
								}
							}
							else{
								$("#className").append("<option data-classMasterId='' value=''>No Classes</option>");
								$("#divName").html("")
								$("#divName").append("<option value='' data-id='' data-ClassDivId=''>No Divisions</option>");
								$('#container').addClass("nodataContainer")
								$('.nodataContainer').text("No classes registered under the selected criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
							}
						}
					});
				}

				var goBack = function(){
					var headline =  "<h3 class='box-title'>Student Performance Drilling </h3>"
					$("#chartHeadline").html(headline);
					fetchStudentDetails();
				}

				var fetchStudentDetails = function(){
					var p_data = "acYr="+$("#academicYear").find("option:selected").val()+"&classMasterId="+$("#className").find("option:selected").data("classmasterid")+"&schoolId="+$("#SchlId").val()+"&divId="+$("#divName").val();
					$.ajax({
						url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/passPerformanceRpt",
						data : p_data,
						beforeSend: function(){
							$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
						},
						success:function(data){
							if(data.keys){
								$('#container').removeClass("nodataContainer").removeAttr("style"); 
								$('#container').highcharts({
								        chart: {
								            type: 'column',
								             options3d: {
									                enabled: true,
									                alpha: 20,
									                beta: 20,
									                viewDistance: 25,
									                depth: 40
									            }
								        },
								        title: {
								            text: 'Pass Performance'
								        },
								        xAxis: {
								            categories: data.keys
								        },
								        yAxis: {
								            min: 0,
								            title: {
								                text: 'Number of Students'
								            }
								        },
								        plotOptions: {
								        	series: {
								        		colorByPoint: true,
								                cursor: 'pointer',
								                point: {
								                    events: {
								                        click: function () {
								                        	var data = "acYr="+$("#academicYear").find("option:selected").val()+"&classMasterId="+$("#className").find("option:selected").data("classmasterid")+"&schoolId="+$("#SchlId").val()+"&divId="+$("#divName").val()+"&grade="+this.category;
								                        	document.getElementById("gradeVal").value = this.category
								                			$.ajax({
								                				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/passPerformanceStudentRpt",
								                				data : data,
								                				success:function(data){
								                					if(data.message){
																		 $('#container').addClass("nodataContainer")
																		 $('.nodataContainer').text(data.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
								           							 
								                					}
								                					else{
									                					$('#container').removeClass("nodataContainer").removeAttr("style");
									                					var headline =  "<h3 class='box-title'>Students With Grade "+ document.getElementById("gradeVal").value +"</h3>"
									                					$("#chartHeadline").html(headline);
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
								                stacking: 'normal',
								                dataLabels: {
								                    enabled: true,
								                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
								                    style: {
								                        textShadow: '0 0 3px black'
								                    }
								                }
								            }
								        },
								        series: [{
								            name: 'Total Students',
								            data: data.noOfStudents
								       
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