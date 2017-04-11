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
        
    </head>
    <body class="skin-blue">
        
         <!-- header logo: style can be found in header.less -->
		<g:render template="/templates/header" model="['login':true]"></g:render>
       	<!-- End of header -->        
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column for sidebar navigation-->
			<g:render template="/templates/navMenuLeft"></g:render>
            
            
			 <!-- Right side column. Contains the navbar and content of the page -->
			 
			 <!-- Main content -->
           	<aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Schools
                    </h1>
                    <ol class="breadcrumb">
                         <li><a href="javascript:"><i class="fa fa-line-chart"></i> Schools</a></li>
                        <li class="active">Assessments Comparison</li>
                    </ol>
                </section>
               <!-- Main content -->
                <section class="content">
                	 <div class="row" >
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Assessments Comparison</h3>
						    </div>
						</div>
					</div>
					
					<div class="row" style="margin: 2em 0em 2em 1em;">
	               		<sec:ifAllGranted roles="ROLE_SCHOOLS_MANAGER">
								<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School Group</h4>
									<select name="SchoolGroup" id="SchoolGroup" class="inputSelect form-control" disabled="disabled">
										<option value="${schoolGp.Grpid}">${schoolGp.groupName}</option>
									</select>	
									<input type="text" id="SgId" name="SgId" class="hide" value="${schoolGp.Grpid}"/>
								</section>
							
								<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School</h4>
									<select name="School" id="School" class="inputSelect form-control" style="text-transform: capitalize;">
										<option value="${school.Schoolid}">${school.schoolName}</option>
									</select>
									<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>
								</section> 
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_ADMIN">
								<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School Group</h4>
									<select name="SchoolGroup" id="SchoolGroup" class="inputSelect form-control" disabled="disabled">
										<option value="${schoolGp.Grpid}">${schoolGp.groupName}</option>
									</select>	
									<input type="text" id="SgId" name="SgId" class="hide" value="${schoolGp.Grpid}"/>
								</section>
							
								<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>School</h4>
									<select name="School" id="School" class="inputSelect form-control" disabled="disabled" style="text-transform: capitalize;">
										<option value="${school.Schoolid}">${school.schoolName}</option>
									</select>
									<input type="text" name="SchlId" id="SchlId" value="${school.Schoolid}" class="hide"/>
								</section> 
						</sec:ifAllGranted>
								<section class="col-xs-12 col-sm-3 col-md-3 col-lg-4 "><h4>Assesment Type</h4>
									<select name="AsmtType" id="AsmtType" class="inputSelect form-control" style="text-transform: capitalize;">
										<option value="Formative" selected="selected">Formative</option>
										<option value="Summative">Summative</option>
										<option value="Final">Final</option>
									</select>
								</section> 
					</div>
                    <div class="row">
            		   <div class="col-lg-12 " >
            		   		<div class="row">
            		   			<div class="col-lg-6 " >
            		   				<div class="box">                         
		                                <div class="box-body chart-responsive">
		                                    <div id="container1" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		                                </div><!-- /.box-body -->
		                            </div>
            		   			</div>
            		   			<div class="col-lg-6 " >
            		   				<div class="box">                         
		                                <div class="box-body chart-responsive">
		                                    <div id="container2" class="chart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		                                </div><!-- /.box-body -->
		                            </div>    
		            		   	</div>
            		   		</div>	
							<div class="row">
            		   			<div class="col-lg-6 " >
            		   				<div class="box">                         
		                                <div class="box-body chart-responsive">
		                                    <div id="container3" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		                                </div><!-- /.box-body -->
		                            </div>
            		   			</div>
            		   			<div class="col-lg-6 " >
            		   				<div class="box">                         
		                                <div class="box-body chart-responsive">
		                                    <div id="container4" class="chart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		                                </div><!-- /.box-body -->
		                            </div>    
		            		   	</div>
            		   		</div>
            		   </div>
                       
               
                       
                    </div><!-- /.row (main row) -->
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
       
        <!-- iCheck -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/iCheck/',file:'icheck.min.js')}" type="text/javascript"></script>
        
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		 <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'drilldown.js')}" type="text/javascript"></script>

      
        
    <script>
	$('document').ready(function(){
		$("#StdDetails").hide();
		
		<sec:ifAnyGranted roles="ROLE_SCHOOLS_MANAGER">
		$("#SchoolGroup").change()
		</sec:ifAnyGranted>
		<sec:ifAnyGranted roles="ROLE_ADMIN">
			$("#School").change();
		</sec:ifAnyGranted>
		
	});
	$("#SchoolGroup").change(function(){
		var schoolGrpId = $('#SchoolGroup').find("option:selected").val();
		if(schoolGrpId!=-1){
			var p_data = "schoolGrpId="+schoolGrpId
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rAllSchoolGroupSchools",
				data : p_data,
				beforeSend: function(){
					$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
				},
				success:function(data){
					$("#School").html("");
					for(i=1;i<=data.totSchools;i++){
						var schoolId = data["School"+(i)].SchoolId
						if(schoolId!=0){
							var schoolName = data["School"+(i)].schoolName
							$("#School").append("<option value='"+schoolId+"'>"+schoolName+"</option>");
						}
					}
					//console.log($("#School").find("option").size());
					if($("#School").find("option").size() >= 1){
						$("#School").change();
					}
				}
			});
		}
		else{
			$("#School").html("");
			if($("#School").find("option").size() >= 1){
				$("#School").change();
			}
		}
	});
	$("#School").change(function(){
		fetchAssessmentDetails()
	});
	$("#AsmtType").change(function(){
		fetchAssessmentDetails()
	});


		
	var fetchAssessmentDetails = function(){
		var schoolId = $('#School').find("option:selected").val();
		var AsmtType = $('#AsmtType').find("option:selected").val();
		var p_data = "schoolId="+schoolId+"&asmtType="+AsmtType
		$.ajax({
			url: "${grailsApplication.config.grails.serverURL}/PerformanceCbse/retSchoolAssessmentsComparisons",
			data : p_data,
			beforeSend: function(){
				$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				$('#container2').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				$('#container3').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
				$('#container4').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
			},
			success:function(data){
				$('#container1').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
				$('#container2').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
				$('#container3').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
				$('#container4').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})				
				$('#container1').highcharts({
			    
			    	 colors: [
                         '#B8B800',
                         '#FF9933'
                     ],
			    
			        chart: {
			            type: 'column'
			        },
			        title: {
			            text: 'School Vs CBSE'
			        },
			        subtitle: {
			            text: 'School Class IX & X ' +AsmtType +' Assessments Comparison'
			        },
			        xAxis: {
			            categories: data.categories
			        },
			        yAxis: {
			            min: 0,
			            title: {
			                text: 'count()'
			            }
			        },
			        tooltip: {
			            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			                '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
			            footerFormat: '</table>',
			            shared: true,
			            useHTML: true
			        },
			        plotOptions: {
			            column: {
			                pointPadding: 0.2,
			                borderWidth: 0
			            }
			        },
			        series: data.CBSEseries
			    });
				<!-- Line chart-->
	            $('#container2').highcharts({

	                colors: [
	                         '#ff0000',
	                         '#00ff00',
	                     ],
	                
	                title: {
	                    text: 'School Vs Zone',
	                    x: -20 //center
	                },
			        subtitle: {
			            text: 'School Class IX & X ' +AsmtType +' Assessments Comparison'
			        },	               
	                xAxis: {
	                    categories: data.categories
	                },
	                yAxis: {
	                    title: {
	                        text: 'Count'
	                    },
	                    plotLines: [{
	                        value: 0,
	                        width: 1,
	                        color: '#808080'
	                    }]
	                },
	                tooltip: {
	                    valueSuffix: ''
	                },
	                legend: {
	                    layout: 'vertical',
	                    align: 'right',
	                    verticalAlign: 'middle',
	                    borderWidth: 0
	                },
	                series: data.Zonalseries
	            });
				<!-- Line chart-->
	            $('#container3').highcharts({	                
	                title: {
	                    text: 'School Vs Region',
	                    x: -20 //center
	                },
			        subtitle: {
			            text: 'School Class IX & X ' +AsmtType +' Assessments Comparison'
			        },	               
	                xAxis: {
	                    categories: data.categories
	                },
	                yAxis: {
	                    title: {
	                        text: 'Count'
	                    },
	                    plotLines: [{
	                        value: 0,
	                        width: 1,
	                        color: '#808080'
	                    }]
	                },
	                tooltip: {
	                    valueSuffix: ''
	                },
	                legend: {
	                    layout: 'vertical',
	                    align: 'right',
	                    verticalAlign: 'middle',
	                    borderWidth: 0
	                },
	                series: data.Regionalseries
	            });
				$('#container4').highcharts({
		            
	            	colors: [
	                         '#FF6666',
	                         '#0033CC',
	                     ],
	            
	                title: {
	                    text: 'School Vs Cluster',
	                    x: -20 //center
	                },
			        subtitle: {
			            text: 'School Class IX & X ' +AsmtType +' Assessments Comparison'
			        },	               
	                xAxis: {
	                    categories: data.categories
	                },
	                yAxis: {
	                    title: {
	                        text: 'Count'
	                    },
	                    plotLines: [{
	                        value: 0,
	                        width: 1,
	                        color: '#808080'
	                    }]
	                },
	                tooltip: {
	                    valueSuffix: ''
	                },
	                legend: {
	                    layout: 'vertical',
	                    align: 'right',
	                    verticalAlign: 'middle',
	                    borderWidth: 0
	                },
	                series: data.Clusteralseries
	            });
			}
		});
	}

    </script>
        
   </body>
</html>