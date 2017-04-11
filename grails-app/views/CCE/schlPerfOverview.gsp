
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
        
        <!-- Morris chart -->
        <link href="${resource(dir:'css/egov_css/morris/',file:'morris.css')}" rel="stylesheet" type="text/css" />
        
        <!-- jvectormap -->
		<link href="${resource(dir:'css/egov_css/jvectormap/',file:'jquery-jvectormap-1.2.2.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Date Picker -->
        <link href="${resource(dir:'css/egov_css/datepicker/',file:'datepicker3.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Daterange picker -->
		<link href="${resource(dir:'css/egov_css/daterangepicker/',file:'daterangepicker-bs3.css')}" rel="stylesheet" type="text/css" />
        
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
			
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                       CCE Reports
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-bar-chart-o"></i> CCE</a></li>
                        <li><a href="javascript:"><i class="fa fa-area-chart"></i> Class Reports</a></li>
                        <li class="active">Subject Analysis</li>
                    </ol>
                </section>

                <!-- Main content -->
                
                 <section class="content">
                 
                 	<div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>School Performance Overview</h3>
						    </div>
						</div>
					</div>
                 
                 			 <!-- Dropdown-->
                	<div class="row">
                	<div class="col-md-6">
                	<div class="form-group"><h4>Zone</h4>
						<g:select class="form-control" id="zones" name="zone" from="" noSelection="['':'Choose zone']" value="" />
					</div>
					
					<div class="form-group"><h4>Region</h4>
						<g:select class="form-control" id="regions" name="region" from="" noSelection="['':'Choose region']" value=""  />
					</div>
                	
					<div class="form-group"><h4>Cluster</h4>
						<g:select class="form-control" id="clusters" name="cluster" from="" noSelection="['':'Choose cluster']" value=""  />	
					</div>
					
					<div class="form-group"><h4>Cluster</h4>
						<g:select class="form-control" id="states" name="state" from="" noSelection="['':'Choose state']" value=""  />	
					</div>
					
					<div class="form-group"><h4>District</h4>
						<g:select class="form-control" id="districts" name="district" from="" noSelection="['':'Choose district']" value=""  />		
					</div>
					
					<div class="form-group"><h4>School</h4>
						<g:select class="form-control" id="schools" name="school" from="" noSelection="['':'Choose school']" value=""  />		
					</div>
					
					<div class="form-group"><h4>Year</h4>
						<g:select  class="form-control" id="years" name="year" from="" noSelection="['':'Choose year']" value=""  />		
					</div>
					
					<div class="form-group"><h4>Class</h4>
						<g:select class="form-control" id="classes" name="cls" from="" noSelection="['':'Choose class']" value=""  />
					</div>
					
					<div class="form-group"><h4>Division</h4>
						<g:select class="form-control" id="divisions" name="cls" from="" noSelection="['':'Choose division']" value=""  />		
					</div>
					</div>
					
                     	
                        <!-- Prediction box -->
                       <section class="col-lg-6 connectedSortable" style="margin-top: 3em;">
                            <div class="box ">
                                <div class="box-header">
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                                    </div><!-- /. tools -->
                                    <i class="fa fa-line-chart"></i>
                                    <h3 class="box-title">School Performance Overview</h3>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto">
                                    	
                                    </div>
                                </div><!-- /.box-body -->
                            </div>
                        </section>
                      <!-- /.box -->
                     
                       
                    </div><!-- /.row (main row) -->
                 	
                 	
                 </section>
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
        
        <!-- Morris.js charts -->
		<script src="${createLinkTo(dir:'js/egov_js/raphael_2.1.0',file:'raphael-min.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/plugins/morris/',file:'morris.min.js')}" type="text/javascript"></script>
        
         <!-- Pace Loader -->
		<script src="${createLinkTo(dir:'js/egov_js/pace',file:'pace.min.js')}" type="text/javascript"></script>
		
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		
		 <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-more.src.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'noData.js')}" type="text/javascript"></script>


<script type="text/javascript">


	var selZone, selRegion, selCluster, selState, selDistrict, selSchool, selYear, selClass;
    var selZoneId, selRegionId, selClusterId, selStateId, selDistrictId, selSchoolId, selYearId, selClassId;
    var div,sub;
    var allData=${session.getAttribute("schoolsData")};
    console.log(allData);
    var rootName=Object.getOwnPropertyNames(allData)[0];
 	var zonesJson=allData[rootName].zones;
 	var zones = Object.getOwnPropertyNames( zonesJson );
 	$( document ).ready(function() {
 		for(var i=0; i< zones.length; i++)
 	 	{
 	 	 	var zoneId=allData[rootName].zones[zones[i]].zoneId;
 	 	 //	alert(zoneId+" "+zones[i]);
 	 	    $('#zones').append($('<option>', { 
 	 	        value: zoneId,
 	 	        text : zones[i] 
 	 	    }));
 	 	}
 	});
 	$( document ).ready(function() {
 		$(".box").hide();
 		$("#zones").change(function(){
 	 		selZone=$('option:selected', $(this)).text();
 	 		selZoneId=$('option:selected', $(this)).val();
 	// 		alert($('#regions').children('option').length);
 	 		//wt r u doing$('#regions').noSelection="Hello";
 	 		//$('#regions').noSelection="['':'Choose class']"
 			$('#regions option:not(:first)').remove();
 			$('#clusters option:not(:first)').remove();
 			$('#states option:not(:first)').remove();
 			$('#districts option:not(:first)').remove();
 			$('#schools option:not(:first)').remove();
 			$('#years option:not(:first)').remove();
 			$('#classes option:not(:first)').remove();
 			$('#divisions option:not(:first)').remove();
 	 		updateRegion(selZone);	  
 			});

 		$("#regions").change(function(){
	 		selRegion=$('option:selected', $(this)).text();
	 		selRegionId=$('option:selected', $(this)).val();
			$('#clusters option:not(:first)').remove();
 			$('#states option:not(:first)').remove();
 			$('#districts option:not(:first)').remove();
 			$('#schools option:not(:first)').remove();
 			$('#years option:not(:first)').remove();
 			$('#classes option:not(:first)').remove();
 			$('#divisions option:not(:first)').remove();
 
	 		updateCluster(selRegion);	  
			});

 		$("#clusters").change(function(){
 			selCluster=$('option:selected', $(this)).text();
 			selClusterId=$('option:selected', $(this)).val();
			$('#states option:not(:first)').remove();
 			$('#districts option:not(:first)').remove();
 			$('#schools option:not(:first)').remove();
 			$('#years option:not(:first)').remove();
 			$('#classes option:not(:first)').remove();
 			$('#divisions option:not(:first)').remove();

 			updateState(selCluster);	  
		});

 		$("#states").change(function(){
 			selState=$('option:selected', $(this)).text();
 			selStateId=$('option:selected', $(this)).val();
 			$('#districts option:not(:first)').remove();
 			$('#schools option:not(:first)').remove();
 			$('#years option:not(:first)').remove();
 			$('#classes option:not(:first)').remove();
 			$('#divisions option:not(:first)').remove();

 			updateDistrict(selState);	  
		});

 		$("#districts").change(function(){
 			selDistrict=$('option:selected', $(this)).text();
 			selDistrictId=$('option:selected', $(this)).val();
			$('#schools option:not(:first)').remove();
 			$('#years option:not(:first)').remove();
 			$('#classes option:not(:first)').remove();
 			$('#divisions option:not(:first)').remove();
 			${remoteFunction(action: 'getSchools',
				    params:"'zoneName='+selZone+'&zoneId='+selZoneId+'&regionName='+selRegion+'&regionId='+selRegionId+'&clusterName='+selCluster+'&clusterId='+selClusterId+'&stateName='+selState+'&clusterStateId='+selStateId+'&districtName='+selDistrict+'&districtId='+selDistrictId",
 	                onSuccess: 'setSchools(data);'
 	                )} 
		});

 		$("#schools").change(function(){
 			selSchool=$('option:selected', $(this)).val();
 			selSchoolId=$('option:selected', $(this)).val();
 			$('#years option:not(:first)').remove();
 			$('#classes option:not(:first)').remove();
 			$('#divisions option:not(:first)').remove();
 			 updateYear();
			
		});

 		$("#years").change(function(){
 			selYear=$('option:selected', $(this)).text();
 			//selYearId=$('option:selected', $(this)).val();
 			//updateClass();
 			//alert("Remote call");
 			$('#classes option:not(:first)').remove();
 			$('#divisions option:not(:first)').remove();
 			
 			${remoteFunction(action: 'getSchoolDetails',
				    params:"'zoneName='+selZone+'&zoneId='+selZoneId+'&regionName='+selRegion+'&regionId='+selRegionId+'&clusterName='+selCluster+'&clusterId='+selClusterId+'&stateName='+selState+'&clusterStateId='+selStateId+'&districtName='+selDistrict+'&districtId='+selDistrictId+'&schoolId='+selSchool+'&year='+selYear",
 	                onSuccess: 'setSchoolsDetails(data);'
 	                )}
 			 
		});
 		$("#classes").change(function(){
 			selClass=$('option:selected', $(this)).text();
 	 		selClassId=$('option:selected', $(this)).val();
 	 		$('#divisions option:not(:first)').remove();
 			updateDivision(selClass);	 
 				 
		});

 		$("#divisions").change(function(){
 			selDivision=$('option:selected', $(this)).text();
 	 		selDivisionId=$('option:selected', $(this)).val();
 	 		//alert(selDivision);
 			//updateDivision();	
 			chartData();
 			 
		});
		
 	});

 	function updateRegion(selZone)
 	{
			var regJson=allData[rootName].zones[selZone].regions;
		 	var regions = Object.getOwnPropertyNames( regJson );
		 	for(var i=0; i< regions.length; i++)
	 	 	{
		 		var regionId=allData[rootName].zones[selZone].regions[regions[i]].regionId;
		 	 //	alert(regions[i]);
	 	 	    $('#regions').append($('<option>', { 
	 	 	        value: regionId,
	 	 	        text : regions[i] 
	 	 	    }));
	 	 	}
 	}
 	function updateCluster(selRegion)
 	{
		var cluJson=allData[rootName].zones[selZone].regions[selRegion].clusters;
	 	var cluster = Object.getOwnPropertyNames( cluJson );
	 	for(var i=0; i< cluster.length; i++)
 	 	{
	 	 	var clusterId=allData[rootName].zones[selZone].regions[selRegion].clusters[cluster[i]].clusterId;
 	 	    $('#clusters').append($('<option>', { 
 	 	        value: clusterId,
 	 	        text : cluster[i] 
 	 	    }));
 	 	}
 	}

 	function updateState(selCluster)
 	{
		var staJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states;
	 	var state = Object.getOwnPropertyNames( staJson );
	 	for(var i=0; i< state.length; i++)
 	 	{
 	 		var clusterStateId=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[state[i]].clusterStateId;
 		 	$('#states').append($('<option>', { 
 	 	        value:clusterStateId,
 	 	        text : state[i] 
 	 	    }));
 	 	}
 	}

 	function updateDistrict(selState)
 	{
		var disJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts;
	 	var district = Object.getOwnPropertyNames( disJson );
	 	for(var i=0; i< district.length; i++)
 	 	{
 	 	 	var districtId=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[district[i]].districtId;
 	 	    $('#districts').append($('<option>', { 
 	 	        value: districtId,
 	 	        text : district[i] 
 	 	    }));
 	 	}
	 	
 	}

 	function setSchools(data){
 	 	allData=JSON.parse(data.toString());
 	    rootName=Object.getOwnPropertyNames(allData)[0];
 	 	zonesJson=allData[rootName].zones;
 	 	zones = Object.getOwnPropertyNames( zonesJson );
 	 	updateSchool(selDistrict);	 	
 	}

	function setSchoolsDetails(data){
 	 	allData=JSON.parse(data.toString());
 	    rootName=Object.getOwnPropertyNames(allData)[0];
 	 	zonesJson=allData[rootName].zones;
 	 	zones = Object.getOwnPropertyNames( zonesJson );
 	 	updateClass(selYear);	 	
 	}

 	function updateSchool(selDistrict)
 	{
		var schJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools;
	 	var school = Object.getOwnPropertyNames( schJson );
	
	 	for(var i=0; i< school.length; i++)
 	 	{
	 	 	var schoolName=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[school[i]].schoolName;
	 
 	 	    $('#schools').append($('<option>', { 
 	 	        value: school[i],
 	 	        text : schoolName 
 	 	    }));
 	 	}

 	}

 	function updateYear()
 	{
		var yrJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory;
	 	var year = Object.getOwnPropertyNames( yrJson );
		year.reverse();
	 	for(var i=0; i< year.length; i++)
 	 	{
	 	 
 	 	    $('#years').append($('<option>', { 
 	 	        value: i,
 	 	        text : year[i] 
 	 	    }));
 	 	}

 	}

 	function updateClass()
 	{
	
	
		var clsJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes;
	 	var cls = Object.getOwnPropertyNames( clsJson );
	 	
	 	for(var i=0; i< cls.length; i++)
 	 	{
	 	 	var classId=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[cls[i]].classId;
	 	 
 	 	    $('#classes').append($('<option>', { 
 	 	        value: classId,
 	 	        text : cls[i] 
 	 	    }));
 	 	}

		var divJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[cls[0]].divisions;
	 	 div = Object.getOwnPropertyNames( divJson );
	 	
		var subJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[cls[0]].divisions[div[0]].subjects;
	 	 sub = Object.getOwnPropertyNames( subJson );
	 	
 	}

 	function updateDivision(selClass)
 	{
		var divJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[selClass].divisions;

	 	var divn = Object.getOwnPropertyNames( divJson );
	 	
	 	for(var i=0; i< divn.length; i++)
 	 	{		//alert("Update Division");
 	 	
	 	 	//var divId=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[cls[i]].divisions[div[i]].divId;
	 	// alert(div[i]);
 	 	    $('#divisions').append($('<option>', { 
 	 	        value: i,
 	 	        text : divn[i] 
 	 	    }));
 	 	}
 	}

 	function chartData()
 	{
 	$(".box").show();
 	$( "#container" ).empty();
 	 	//alert("Inside chartdata");
 		var subJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[selClass].divisions[selDivision].subjects;
	 	 sub = Object.getOwnPropertyNames( subJson );
	 	//	alert("Subjects:"+sub);

		var series=[];
		var ser=[];
		var ts=[0,0,0,0];
		for(var i=0; i<sub.length; i++)
			{ 	 	
			//alert("Inside Subject");
			//alert("Subject Length"+sub.length);
			
			var cat=[" < 40 "," 40 < 60 "," 60 < 80 "," 80 < 100 "];
			var sno=[0,0,0,0];
			var add=0;	
			 	var stdJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[selClass].divisions[selDivision].subjects[sub[i]].students;
			 	//alert(stdJson)
			 	if(stdJson == null)
			 	{
			 		//alert("NULL JSON");
			 		$('#container').html("No data found");
			 	}
			 	std = Object.getOwnPropertyNames( stdJson );
			 	//alert("Student::::"+std);
			 	
			 	//alert(sub[i]+":::"+std);
			 	//alert("Student Length:"+std.length);
					for(var j=0; j<std.length; j++)
						{
						//alert("sdsadsaInside casdasdashartdata");
						var fa=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[selClass].divisions[selDivision].subjects[sub[i]].students[std[j]].avgs.FA;
						var sa=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[selClass].divisions[selDivision].subjects[sub[i]].students[std[j]].avgs.SA;
				 		add=fa+sa;
						//alert("Add:"+add);
						if(add < 40)
						{
							sno[0]=sno[0]+1;
							//ts[0]=ts[0]+1;
						}
						else if(add > 40 && add < 60)
						{
							sno[1]=sno[1]+1;
							//ts[0]=ts[1]+1;
						}
						else if(add > 60 && add < 80)
						{
							sno[2]=sno[2]+1;
							//ts[0]=ts[2]+1;
						}
						else if(add > 80 && add < 100)
						{
							sno[3]=sno[3]+1;
							//ts[0]=ts[3]+1;
						}		

						}
						
						for(var a=0; a<sno.length; a++)
						{
							//alert("sno["+a+"]"+sno[a]);
						}
					ser.push({name:cat[i], y:ts});
					series.push({type:'column', name:sub[i], data:sno});
					//series.push({type:'pie', name:'Students', data:ser, center: [100, 80], size: 100});

			}
			
		hcopts.xAxis.categories=cat;
		hcopts.series = series;
		chart = new Highcharts.Chart(hcopts);
		
 	}

 	function chartData1()
 	{
 		var subJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[selClass].divisions[selDivision].subjects;
	 	 sub = Object.getOwnPropertyNames( subJson );
		var series=[];
		var ts=[0,0,0,0];
		for(var i=0; i<sub.length; i++)
			{
			var cat=[" < 40 "," 40 < 60 "," 60 < 80 "," 80 < 100 "];
			
			var add=0;	
			 	var stdJson=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[selClass].divisions[selDivision].subjects[sub[i]].students;
			 	std = Object.getOwnPropertyNames( stdJson );
			 	alert("Student Length:"+std.length);
					for(var j=0; j<std.length; j++)
						{
						var fa=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[selClass].divisions[selDivision].subjects[sub[i]].students[std[j]].avgs.FA;
						var sa=allData[rootName].zones[selZone].regions[selRegion].clusters[selCluster].states[selState].districts[selDistrict].schools[selSchool].acadHistory[selYear].classes[selClass].divisions[selDivision].subjects[sub[i]].students[std[j]].avgs.SA;
				 		add=fa+sa;
						//alert("Add:"+add);
						if(add < 40)
						{
							sno[0]=sno[0]+1;
							ts[0]=ts[0]+1;
						}
						else if(add > 40 && add < 60)
						{
							sno[1]=sno[1]+1;
							ts[0]=ts[1]+1;
						}
						else if(add > 60 && add < 80)
						{
							sno[2]=sno[2]+1;
							ts[0]=ts[2]+1;
						}
						else if(add > 80 && add < 100)
						{
							sno[3]=sno[3]+1;
							ts[0]=ts[3]+1;
						}		

						}
					ser.push({name:cat[i], y:ts});
					//series.push({type:'column', name:sub[i], data:sno});
					series.push({type:'pie', name:'Total Number of students', data:ser});
			}
			
		//hcopts.xAxis.categories=cat;
		hcopts.series = series;
		chart = new Highcharts.Chart(hcopts);
 	}

 	
var chart;
    var hcopts = {
    		  chart: {
                  
                  renderTo: 'container'
              },
              title: {
                  text: 'School performance overview'
              },
              xAxis: {
                  title: {
		                text: 'Marks range'
		            },
                  categories: []
              },
              yAxis: {
                  min: 0,
                  max: 100,
                  title: {
                      text: 'Number of students'
                  }
              },
              center: [100, 80],
              size: 100,
              showInLegend: false,
              dataLabels: {
                  enabled: false
              },
              tooltip: {
                  headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                  pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                      '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
                  footerFormat: '</table>',
                  shared: true,
                  useHTML: true
              },
              exporting: {
	            buttons: {	  
	            	 contextButton: {
	                     enabled: false
	                 },             
	                exportButton: {
	                   text: 'Download',
	                   onclick: function () {
	                        this.print();
	                    }	                   
	                }
	            }
	        },
              plotOptions: {
                  column: {
                      pointPadding: 0.2,
                      borderWidth: 0
                  }
              },
              series: []
    		    }

 
     </script>    
 
