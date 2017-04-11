
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
       	<!-- End of header -->     
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
     <!-- Left side column for sidebar navigation-->
			<g:render template="/templates/navMenuLeft"></g:render>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Dashboard
                    </h1>
                    <ol class="breadcrumb">
                       <li><a href="javascript:"><i class="fa fa-twitch"></i>Students</a></li>
                       <li class="active"> Vocational Enrollment Statistics</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
	                	<sec:ifAnyGranted roles="ROLE_CCEADMIN">
							<div class="col-md-12">
								<div class="callout callout-info" style="margin-bottom: 1em!important;">
							        <h3>Vocational Students Across Nation Urban/Rural/Total regions</h3>
							    </div>
							</div>
						</sec:ifAnyGranted>
						 <sec:ifAnyGranted roles="ROLE_ADMIN">
						 		<div class="callout callout-info" style="margin-bottom: 1em!important;">
							        <h3>Vocational Students Across Nation</h3>
							    </div>
						 </sec:ifAnyGranted>
					</div>
					
					<div class="row">
						<div class="col-md-6">
							<sec:ifAnyGranted roles="ROLE_CCEADMIN">
								<div class="form-group">
					                <label>Select State</label>
					                <select class="form-control select2" style="width: 100%;">
					                  <option selected="selected">Select State</option>
					                  <option>State 1</option>
					                  <option>State 2</option>
					                  <option>State 3</option>
					                  <option>State 4</option>
					                  <option>State 5</option>
					                  <option>State 6</option>
					                </select>
					              </div>
				              
					              <div class="form-group">
					                <label>Select District</label>
					                <select class="form-control select2" style="width: 100%;">
					                  <option selected="selected">Select</option>
					                  <option>District1</option>
					                  <option>District2</option>
					                  <option>District3</option>
					                  <option>District4</option>
					                  <option>District5</option>
					                  <option>District6</option>
					                </select>
					              </div>
					         </sec:ifAnyGranted>
					         
					          <div class="form-group">
				                <label>Select year</label>
				                <select class="form-control select2" name="academicYear" id="academicYear">
				                  <option>2012-2013</option>
				                  <option>2013-2014</option>
				                  <option>2014-2015</option>
				                  <option>2015-2016</option>
				                </select>
				              </div>
				              
				              <div class="form-group">
				                <label>Select religion</label>
				                <select class="form-control select2" style="width: 100%;">
				                  <option selected="selected">All</option>
				                  <option>Hindu</option>
				                  <option>Muslim</option>
				                  <option>Christian</option>
				                  <option>Sikh</option>
				                </select>
				              </div>
				              
				             
				              
				              <div class="form-group">
				                <label>Select Family Income</label>
				                <select class="form-control select2" style="width: 100%;">
				                  <option selected="selected">Select</option>
				                  <option>1Lac-2Lac</option>
				                  <option>2Lac-4Lac</option>
				                  <option>4Lac-8Lac</option>
				                  <option>8Lac-16Lac</option>
				                  <option>Above 16Lac</option>
				                </select>
				              </div>
				              <!-- /.form-group -->
				              
				              <div class="form-group">
				                <label>Select Category</label>
				                <select class="form-control select2" style="width: 100%;">
				                  <option selected="selected">All Category</option>
				                  <option>OBC</option>
				                  <option>SC</option>
				                  <option>ST</option>
				                  <option>General</option>
				                </select>
				              </div>
				              
				              <div class="form-group">
				                <label>Whether Physically Hanicapped</label>
				                <select class="form-control select2" style="width: 100%;">
				                  <option selected="selected">Select</option>
				                  <option>Yes</option>
				                  <option>No</option>
				                </select>
				              </div>
				              
				              <div class="btn-container">
								<button type="button" id="clickBtn" class="btn btn-block btn-success">Show Result</button>
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
									<h3 class="box-title">Vocational Data</h3>
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
			$('document').ready(function(){
				fetchStudentDetails();

				//$(".box").hide();


				 $("#clickBtn").click(function(){
					fetchStudentDetails();
				});
 
				});

			var fetchStudentDetails = function(){
				$(".box").show();
				var acYr = $("#academicYear").find("option:selected").val();
				var p_data = "acYr="+acYr;
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/vocEnrolmentRpt",
					data : p_data,
					success:function(data){
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
					            text: 'Vocational students Distribution '+acYr
					        },
					        xAxis: {
					            categories: ['15-19', '20-24','25-29','30-34','35-59','>60'],
					            title: {
					                text: 'Age groups'
					            }
					        },
					        yAxis: {
					            min: 0,
					            title: {
					                text: 'Number of Students'
					            },
					            stackLabels: {
					                enabled: true,
					                style: {
					                    fontWeight: 'bold',
					                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
					                }
					            }
					        },
					       
					        tooltip: {
					            headerFormat: '<b>{point.x}</b><br/>',
					            pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
					        },
					        plotOptions: {
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
					            name: 'Female',
					            data: data.female
					        }, {
					            name: 'Male',
					            data: data.male
					        }]
					    });				 
					}
				});
			}
		</script>       
        
   </body>
</html>