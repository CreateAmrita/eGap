
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
                        <li><a href="javascript:"><i class="fa fa-twitch"></i> Non-Academics</a></li>
                        <li>IncomeWise</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Income-Wise Performance of Students (Drilldown)</h3>
						    </div>
						</div>
					</div>
					
					<div class="row" style="margin-top: 2em;margin-bottom: 2em;">
						<div class="col-md-4">
							<div class="form-group">
				                <section class="col-xs-12 col-sm-4 col-md-4 col-lg-4 "><h4>Academic Year</h4>
									<select class="selectpicker form-control" name="academicYear" id="academicYear" >
										<option>2012-2013</option>
						                 <option>2013-2014</option>
						                 <option>2014-2015</option>
						                 <option>2015-2016</option>
									</select>
								</section>
				            </div>
				        </div>
						<div class="col-md-8"></div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="box" id="container1">
								<div class="box-header">
								<!-- tools box -->
									<div class="pull-right box-tools">
										<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
									</div><!-- /. tools -->
									<i class="fa fa-line-chart"></i>
									<h3 class="box-title">Income wise Performance Distribution</h3>
								</div>
								<div class="box-body chart-responsive">
									<div id="container1" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<div class="box" id="container2">
								<div class="box-header">
								<!-- tools box -->
									<div class="pull-right box-tools">
										<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
									</div><!-- /. tools -->
									<i class="fa fa-line-chart"></i>
									<h3 class="box-title">Income wise Performance Distribution in various Categories</h3>
								</div>
								<div class="box-body chart-responsive">
									<div id="container2" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">	
						<div class="col-md-12">
							<div class="box" id="container3">
								<div class="box-header">
								<!-- tools box -->
									<div class="pull-right box-tools">
										<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
									</div><!-- /. tools -->
									<i class="fa fa-line-chart"></i>
									<h3 class="box-title">Income wise Performance Distribution in a Category across different Gender</h3>
								</div>
								<div class="box-body chart-responsive">
									<div id="container3" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
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

		
		<!-- Select 2 Plugin -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/select2/select2.full.min.js')}" type="text/javascript"></script> 
		
		<script language="javascript">
			$('document').ready(function(){
				fetchStudentDetails();

				$("#academicYear").change(function(){
						fetchStudentDetails();
				});
				
				 $("#container2").hide();
				 $("#container3").hide();
			
				 

				});

			var fetchStudentDetails = function(){
				 $("#container2").hide();
				 $("#container3").hide();
				var acYr = $("#academicYear").find("option:selected").val();
				var p_data = "acYr="+acYr;
				
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/incomeWiseRpt",
					data : p_data,
					beforeSend: function(){
						$('#container1').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
						$('#container2').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
						$('#container3').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
					},
					success:function(data){
						//console.log(data.incRange.appearedStudents);
						$('#container1').highcharts({
					        chart: {
					            type: 'column',
					             options3d: {
					                enabled: true,
					                alpha: 10,
					                beta: 25,
					                depth: 70
					            }
					        },

					        title: {
					            text: 'Year Wise Students Performance'
					        },
					        credits: {
					            enabled: false
					     	},

					        xAxis: {
					            categories: ['0-50000', '50000-100000','100000-450000','450000-1000000','1000000-'],
						        
					        },

					        yAxis: {
					            allowDecimals: false,
					            min: 0,
					            title: {
					                text: 'Number of students'
					            }
					        },

					        tooltip: {
					            formatter: function () {
					                return '<b>Income range: ' + this.x + '</b><br/>' +
					                    this.series.name + ': ' + this.y + '<br/>';
					            }
					        },
					        
					         plotOptions: {
					            series: {
					                cursor: 'pointer',
					                point: {
					                    events: {
					                        click: function () {
					                            $("#container2").show();
					                            $("#container3").hide();
					                        }
					                    }
					                }
					            }
					        },

					        series: [{
					            name: 'Appeared Students',
					            //data: data.students.appearedStudents,
					            data:[10, 62, 0, 5, 1],
					            //stack: 'male'
					        }, {
					            name: 'Passed Students',
					            //data: data.students.passedStudents,
					            data:[7, 58, 0, 2, 1],
					            //stack: 'male'
					        }]
					    });

						$('#container2').highcharts({
					        chart: {
					            type: 'pie',
					            options3d: {
					                enabled: true,
					                alpha: 45,
					                beta: 0
					            }
					        },
					        title: {
					            text: 'Income wise Performance Distribution in various Categories'
					        },
					        credits: {
					            enabled: false
					     	},
					        tooltip: {
					            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
					        },
					        plotOptions: {
					            pie: {
					                allowPointSelect: true,
					                cursor: 'pointer',
					                depth: 35,
					                dataLabels: {
					                    enabled: true,
					                    format: '{point.name}'
					                }
					            },
					            series: {
					                cursor: 'pointer',
					                point: {
					                    events: {
					                        click: function () {
					                            $("#container3").show();
					                        }
					                    }
					                }
					            },
					        	showInLegend: true
					        },
					        
					        series: [{
					            type: 'pie',
					            name: 'Student distribution',
					            data: [
					                ['SC', data.incCat.SC],
					                ['ST', data.incCat.ST],
					                ['OBC', data.incCat.OBC],
					                ['General', data.incCat.GENERAL],
					          
					            ]
					        }]
					    });

						$('#container3').highcharts({
					        chart: {
					            plotBackgroundColor: null,
					            plotBorderWidth: 0,
					            plotShadow: false
					        },
					        title:{
								text:'Genderwise Comparison'
						    },
					        tooltip: {
					            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
					        },
					        credits: {
					            enabled: false
					     	},
					        plotOptions: {
					            pie: {
					                dataLabels: {
					                    enabled: true,
					                    distance: -50,
					                    style: {
					                        fontWeight: 'bold',
					                        color: 'white',
					                        textShadow: '0px 1px 2px black'
					                    }
					                },
					                startAngle: -90,
					                endAngle: 90,
					                center: ['50%', '75%']
					            }
					        },
					        series: [{
					            type: 'pie',
					            name: 'Performance percentage',
					            innerSize: '50%',
					            data: [
					                ['Female',   data.incGend.Female],
					                ['Male',    data.incGend.Male],
					            ]
					        }]
					    });
						
					}
				})
			}
		</script>  
		
		     
        
   </body>
</html>