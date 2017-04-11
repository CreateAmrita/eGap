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
                       Co-Scholastic
                   </h1>
                   <ol class="breadcrumb">
                       <li><a href="javascript:"><i class="fa fa-area-chart"></i> Performance analysis</a></li>
                       <li class="active">Co-Scholastic</li>
                   </ol>
               </section>
               
               <section class="content">
                    <div class="row">
            		   <div class="col-lg-12 " >
            		   		<div class="dropdown">
							  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
							   Select an indicator <span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
							    <li><g:link controller="performanceCbse" action="thinkingSkills">Thinking Skills</g:link></li>
							    <li><g:link controller="performanceCbse" action="attTeach">Attitude Towards Teachers</g:link></li>
							    <li><g:link controller="performanceCbse" action="socialSkills">Social Skills</g:link></li>
							    <li><g:link controller="performanceCbse" action="emotionalSkills">Emotional Skills</g:link></li>
							    <li><g:link controller="performanceCbse" action="visualArts">Visual & Performing Arts</g:link></li>
							    <!-- 
							    <li><g:link controller="performanceCbse" action="workEducation">Work Education</g:link></li>
							    <li><g:link controller="performanceCbse" action="attMates">Attitude Towards Schoolmates</g:link></li>
							    <li><g:link controller="performanceCbse" action="valueSyst">Value Systems</g:link></li>
							    <li><g:link controller="performanceCbse" action="attProg">Attitude Towards School Programes</g:link></li>
							     -->
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

                colors: [
                         '#ff0000',
                         '#00ff00',
                     ],
                
                title: {
                    text: 'School Vs Region',
                    x: -20 //center
                },
               
                xAxis: {
                    categories: [2007,2008,2009,2010,2011,2012,2013,2014,2011,2011,2012,2012,2013,2014,2014,2014,2011,2012,2013,2014]
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
                    data: []
                }, {
                    name: 'School Average',
                    data: [0.00,0.00,0.00,0.00,80.53,86.98,0.00,94.05,0.00,87.64,0.00,86.98,0.00,0.00,94.49,87.64,80.72,77.62,80.94,60.41]
                }]
            });


            <!-- Line chart-->
			           $(function () {
			    $('#container2').highcharts({
			    
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
			            text: 'cbse.nic.in'
			        },
			        xAxis: {
			            categories: [2007,2008,2009,2010,2011,2012,2013,2014,2011,2011,2012,2012,2013,2014,2014,2014,2011,2012,2013,2014]
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
			            data: [0.00,0.00,0.00,0.00,71.27,72.61,36.09,90.85,71.27,71.27,72.61,72.61,36.09,36.09,90.85,90.85,67.75,69.79,86.72,58.18]
			
			        }, {
			             name: 'School Average',
			             data: [0.00,0.00,0.00,0.00,80.53,86.98,0.00,94.05,0.00,87.64,0.00,86.98,0.00,0.00,94.49,87.64,80.72,77.62,80.94,60.41]
			
			        }]
			    });
			});

            $('#chart').highcharts({
            
            	colors: [
                         '#66FF66',
                         '#0033CC',
                     ],
            
                title: {
                    text: 'School Vs State',
                    x: -20 //center
                },
               
                xAxis: {
                    categories: [2007,2008,2009,2010,2011,2012,2013,2014,2011,2011,2012,2012,2013,2014,2014,2014,2011,2012,2013,2014]
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
                    data: [0.00,0.00,0.00,0.00,79.56,82.39,0.00,95.19,79.56,79.56,82.39,82.39,0.00,0.00,95.19,95.19,74.39,78.03,92.61,60.66]
                }, {
                    name: 'School Average',
                    data: [0.00,0.00,0.00,0.00,80.53,86.98,0.00,94.05,0.00,87.64,0.00,6.98,0.00,0.00,94.49,87.64,80.72,77.62,80.94,60.41]
                }]
            });
            

        }); 
        
        	
    </script>
        
   </body>
</html>