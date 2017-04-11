
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
                        <li class="active">Student Teacher Ratio</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Students Teachers Ratio</h3>
						    </div>
						</div>
					</div>

					<sec:ifAllGranted roles="ROLE_SCHOOLS_MANAGER">
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
					<div class="row">
						<div class="col-md-6">
						<!--  
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
						 -->
			              	<div class="form-group"><h4>School</h4>
								<select name="School" id="School" class="inputSelect form-control" disabled="disabled" style="text-transform: capitalize;">
									<option value="${school.Schoolid}">${school.schoolName}</option>
								</select>
								<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>
							</div>
						</div>
				</sec:ifAllGranted>
					
						<div class="col-md-12">
							<div class="box ">
								<div class="box-header">
								<!-- tools box -->
									<div class="pull-right box-tools">
										<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
									</div><!-- /. tools -->
									<i class="fa fa-line-chart"></i>
									<h3 class="box-title"> Student Teacher Ratio</h3>
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
			
			$("#academicYear").change(function() {
				fetchStudentDetails();
			});
			
			$("#SchlId").change(function() {
				fetchStudentDetails();
			});

			var fetchStudentDetails = function(){
				//"academicYrId="+$("#academicYear").find("option:selected").val()+
				var p_data = "schoolId="+$("#SchlId").val();
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/studTeacherRpt",
					data : p_data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
					},
					success:function(data){
						if(data.teacherStudRatio.acYrs && data.teacherStudRatio.ratio){
							$('#container').removeClass("nodataContainer").removeAttr("style");
								
							$('#container').highcharts({
						        title: {
						            text: 'Students Teachers Ratio',
						            x: -20 
						        },
						        subtitle: {
						            text: 'Academic Year-wise',
						            x: -20
						        },
						        xAxis: {
						            categories: data.teacherStudRatio.acYrs
						        },
						        yAxis: {
						            title: {
						                text: 'Ratio (Student vs Teachers)'
						            },
						        	plotLines: [{
						                value: 0,
						                width: 1,
						                color: '#808080'
						            }]
						        },
						        tooltip: {
						            valueSuffix: ':1'
						        },
						        legend: {
						            layout: 'vertical',
						            align: 'right',
						            verticalAlign: 'middle',
						            borderWidth: 0
						        },
						        series: [{
						            name: 'Ratio',
						            data: data.teacherStudRatio.ratio
						        }]
						    });	
						}
						else{
							 $('#container').addClass("nodataContainer")
							 $('.nodataContainer').text(data.teacherStudRatio.message).css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
							
						}			 
					}
				});
			}			 
		</script>       
        
   </body>
</html>