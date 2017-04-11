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
            
			 <!-- Main content -->
           	<aside class="right-side">
            	<section class="content-header">
                   <h1>
                       Scholastic
                   </h1>
                   <ol class="breadcrumb">
                       <li><a href="javascript:"><i class="fa fa-area-chart"></i> Performance analysis</a></li>
                       <li class="active">Scholastic</li>
                   </ol>
               </section>
               
               <section class="content">
                    <div class="row">
            		   <div class="col-lg-12 " >
            		   		<div class="dropdown">
							  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
							   Subject <span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								<li class="active"><g:link controller="performanceCbse" action="physics">Physics</g:link></li>
							    <li><g:link controller="performanceCbse" action="chemistry">Chemistry</g:link></li>
							    <li><g:link controller="performanceCbse" action="mathematics">Mathematics</g:link></li>
							    <li><g:link controller="performanceCbse" action="biology">Biology</g:link></li>
							    <li><g:link controller="performanceCbse" action="accountancy">Accountancy</g:link></li>
							    <li><g:link controller="performanceCbse" action="economics">Economics</g:link></li>
							    <li><g:link controller="performanceCbse" action="english">English</g:link></li>
							    <li><g:link controller="performanceCbse" action="hindi">Hindi</g:link></li>
							    <li><g:link controller="performanceCbse" action="business">Business</g:link></li>
							    <li><g:link controller="performanceCbse" action="political">Political Science</g:link></li>
							    <li><g:link controller="performanceCbse" action="geography">Geography</g:link></li>
							    <li><g:link controller="performanceCbse" action="history">History</g:link></li>
							    <li><g:link controller="performanceCbse" action="computer">Computer Science</g:link></li>
							    <li><g:link controller="performanceCbse" action="informatics">Informatics</g:link></li>
							    <li><g:link controller="performanceCbse" action="physical">Physical Education</g:link></li>
							  </ul>
							</div>
            		   		<div class="row">
            		   			<div class="col-lg-6 " >
            		   				<div class="box">                         
		                                <div class="box-body chart-responsive">
		                                    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		                                </div><!-- /.box-body -->
		                            </div>
            		   			</div>
            		   			<div class="col-lg-6 " >
            		   				<div class="box">                         
		                                <div class="box-body chart-responsive">
		                                    <div id="chart" class="chart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		                                </div><!-- /.box-body -->
		                            </div>    
		            		   	</div>
            		   		</div>	
							<div class="row">
            		   			<div class="col-lg-12 " >
		                             <div class="box">                         
		                                <div class="box-body chart-responsive">
		                                    <div id="container2" class="chart" style="min-width: 310px; height: 600px; margin: 0 auto"></div>
		                                </div><!-- /.box-body -->
		                            </div>
	                            </div>
            		   		</div>
            		   </div>
                       
               
           		  </div>
           		 </section>   
            </aside>
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
        $( function () {
            <!-- Line chart-->
            $('#container').highcharts({
                title: {
                    text: 'School Vs Region',
                    x: -20 //center
                },
               
                xAxis: {
                    categories: ['2009','2010','2011','2012','2013','2014']
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
                series: [{
                    name: 'Regional Average',
                    data: [54.47,53.63,57.95,58.13,58.16,69.23]
                }, {
                    name: 'School Average',
                    data:[0.00,0.00,0.00,0.00,0.00,0.00]
                }]
            });


            <!-- Line chart-->
			           $(function () {
			    $('#container2').highcharts({
			        chart: {
			            type: 'column'
			        },
			        title: {
			            text: 'School Vs CBSE'
			        },
			        subtitle: {
			            text: 'cbse.nic.in'
			        },
			        xAxis: {
			            categories: ['2009','2010','2011','2012','2013','2014']
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
			        series: [{
			            name: 'CBSE Average',
			            data: [49.00,50.18,51.06,50.36,51.03,60.32]
			
			        }, {
			             name: 'School Average',
	                     data: [0.00,0.00,0.00,0.00,0.00,0.00]
			
			        }]
			    });
			});

            $('#chart').highcharts({
                title: {
                    text: 'School Vs State',
                    x: -20 //center
                },
               
                xAxis: {
                    categories: ['2009','2010','2011','2012','2013','2014']
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
                series: [{
                    name: 'State Average',
                    data: [69.46,67.58,80.31,80.51,78.14,83.96]
                }, {
                    name: 'School Average',
                    data: [0.00,0.00,0.00,0.00,0.00,0.00]
                }]
            });
            

        }); 
        
        	
    </script>
  
        
   </body>
</html>