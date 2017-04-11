
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
                        Schools 
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-bar-chart-o"></i> Schools</a></li>
                        <li class="active">Nation Wide Schools</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Schools Across Nation</h3>
						    </div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6">
							  <sec:ifAllGranted roles="ROLE_CCEADMIN">
						            <div class="form-group">
						                <h4>Zone</h4>
						                <select class="selectpicker form-control" name="Zone" id="Zone">
						                	<option value="0">All Zones</option>
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

						             <!--   <div class="form-group">
						                <h4>State</h4>
						                <select class="selectpicker form-control" name="state" id="state">
						                </select>
						              </div> -->
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
									<h3 class="box-title">Nation Wide Schools</h3>
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
		 <sec:ifAllGranted roles="ROLE_CCEADMIN">
	
			$('document').ready(function(){
				$('#Zone').change();
			});

			$('#Zone').change(function() {
				var data = "zoneId="+$('#Zone').find("option:selected").val();
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/CCE/rZoneRegion",
					data : data,
					success:function(data){
						var len = data.totRegions;
						var regions = data.regions;
						$("#Region").html("");
						$("#Region").append("<option value='0'>All Regions</option>");
						for(var i=0;i<len;i++){
							var x = "region" + (i+1);
							$("#Region").append("<option value='"+regions[x].regionId +"'>"+regions[x].regionName+"</option>");
						}
						$("#Region").change();
					}
				});
			});

			$('#Region').change(function() {
				//if($("#schList").val()=="All Regions")
				var data = "zoneId="+$('#Zone').find("option:selected").val()+"&regionId="+$(this).find("option:selected").val();
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/CCE/rZoneRegionClusters",
					data : data,
					success:function(data){
						var len = data.totClusters;
						var clusters = data.clusters;
						$("#Cluster").html("");
						$("#Cluster").append("<option value='0'>All Clusters</option>");
						for(var i=1;i<=len;i++){
							var x = "cluster" + i;
							$("#Cluster").append("<option value='"+clusters[x].clusterId +"'>"+clusters[x].clusterName+"</option>");
						}
						$("#Cluster").change();
					}
				});
			});

			/* $('#Cluster').change(function() {
				var data = "zoneId="+$('#Zone').find("option:selected").val()+"&regionId="+$('#Region').find("option:selected").val()+"&clusterId="+$(this).find("option:selected").val();
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/CCE/rClusterStates",
					data : data,
					success:function(data){
						var len = data.totStates;
						var states = data.states;
						$("#state").html("");
						$("#state").append("<option value='0'>All States</option>");
						for(var i=1;i<=len;i++){
							var x = "state" + i;
							$("#state").append("<option value='"+states[x].stateId +"'>"+states[x].stateName+"</option>");
						}
						$("#state").change();
					}
				});
			});

			$("#state").change(function() {
				fetchSchoolDetails();
			}); */

			$('#Cluster').change(function() {
				fetchSchoolDetails();
			});

			var fetchSchoolDetails = function(){
				$(".box").show();
				
				var p_data = "zoneId="+$('#Zone').find("option:selected").val()+"&regionId="+$('#Region').find("option:selected").val()+"&clusterId="+$('#Cluster').find("option:selected").val(); //+"&stateId="+$("#state").find("option:selected").val();
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/CCE/nationSchools",
					data : p_data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '50%', 'margin-top': '40px'});
					},
					success:function(data){
						$('#container').html("").css({'min-width': '310px', 'height': '400px', 'margin': '0 auto'})
						 $('#container').highcharts({
						        chart: {
						            type: 'column'
						        },
						        title: {
						            text: 'Nation Wide Schools'
						        },
						        xAxis: {
						            categories: data.keys
						        },
						        yAxis: {
						            min: 0,
						            title: {
						                text: 'Total No:Of Schools'
						            },
						            stackLabels: {
						                enabled: true,
						                style: {
						                    fontWeight: 'bold',
						                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
						                }
						            }
						        },
						        legend: {
						            align: 'right',
						            x: -30,
						            verticalAlign: 'top',
						            y: 25,
						            floating: true,
						            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
						            borderColor: '#CCC',
						            borderWidth: 1,
						            shadow: false
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
						                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
						                }
						            }
						        },
						        series: [{
						            name: 'Boys',
						            data: data.boys
						        }, {
						            name: 'Girls',
						            data: data.girls
						        }, {
						            name: 'Co-Ed',
						            data: data.coed
						        }]
						    });			 
					}
				});
			}
			
		</sec:ifAllGranted>

		
	</script>          
   </body>
</html>