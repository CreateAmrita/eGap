
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
                        <li><a href="javascript:"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Subject-Wise Performance of Students</h3>
						    </div>
						</div>
					</div>
					
					<div class="row" style="margin-top: 2em;margin-bottom: 2em;">
						<div class="col-md-3">
							<div class="form-group">
				                <label>Class</label>
				                <select class="form-control select2" style="width: 100%;">
				                  <option selected="selected">All Class</option>
				                  <option>IX</option>
				                  <option>X</option>
				                  <option>XI</option>
				                  <option>XII</option>
				                </select>
				              </div>
				        </div>
				        <div class="col-md-3">      
				            <div class="form-group">
				                <label>Subject Category</label>
				                <select class="form-control select2" style="width: 100%;">
				                  <option selected="selected">All Category</option>
				                  <option>Scolastic</option>
				                  <option>Co-Scolastic</option>
				                </select>
				              </div>
				        </div>
				        <div class="col-md-3">  
				            <div class="form-group">
				                <label>Academic Year</label>
				                <select class="form-control select2" style="width: 100%;">
				                  <option selected="selected">All Academic Year</option>
				                 <option>2012-2013</option>
				                  <option>2013-2014</option>
				                  <option>2014-2015</option>
				                  <option>2015-2016</option>
				                </select>
				            </div>
				        </div>
				              <!-- /.form-group -->
			            <div class="col-md-3">
			            	<div class="btn-container1">
								<button type="button" onclick="showResult()" class="btn btn-block btn-success">Show Result</button>
							</div>
						</div>		              
					</div>
					<div class="col-md-12">
						<div class="box ">
							<div class="box-header">
							<!-- tools box -->
								<div class="pull-right box-tools">
									<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
								</div><!-- /. tools -->
								<i class="fa fa-line-chart"></i>
								<h3 class="box-title">Students Performance (Subject-Wise)</h3>
							</div>
							<div class="box-body chart-responsive">
								<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
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

		
		<!-- Select 2 Plugin -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/select2/select2.full.min.js')}" type="text/javascript"></script> 
		
		<script language="javascript">
			$('document').ready(function(){

				 $(".select2").select2();

				 var chart = $('#container').highcharts({
				        title: {
				            text: 'Performance of Scholastic Subject for Class',
				            x: -2 //center
				        },

				        xAxis: {
				            categories: ['ENGLISH COMMM', 'HINDI COURSE A', 'MATHEMATICS', 'SCIENCE', 'SOCIAL SCIENCE', 'FRENCH',
				                 'FOUNDATION OF IT', 'HOME SCIENCE', 'PAINTING', 'GUJARATHI']
				        },
				        yAxis: {
				            title: {
				                text: 'No of Students'
				            },
				            plotLines: [{
				                value: 0,
				                width: 1,
				                color: '#808080'
				            }]
				        },
				        tooltip: {
				            valueSuffix: 'students'
				        },
				        legend: {
				            layout: 'vertical',
				            align: 'right',
				            verticalAlign: 'middle',
				            borderWidth: 0
				        },
				        series: [{
				            name: 'Grade A',
				            data: [7.0, 6, 9, 14, 18, 21, 25, 26, 23, 18]
				        }, {
				            name: 'Grade B',
				            data: [2, 8, 7, 11, 17, 2, 24, 4, 20, 14]
				        }, {
				            name: 'Grade C',
				            data: [9, 0, 3, 8, 3, 17, 18, 9, 3, 9]
				        }, {
				            name: 'Grade D',
				            data: [3, 4, 7, 8, 19, 15, 17, 6, 14, 10]
				        }]
				    });				 
				});
		</script>       
        
   </body>
</html>