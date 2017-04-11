
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
		
		 <!-- Pace Loader style -->
        <link href="${resource(dir:'css/egov_css/pace',file:'paceBlueHor.css')}" rel="stylesheet" type="text/css" />
        
 
    </head>
    <%@page import="egov.AcademicYear"%>
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
                       Academics
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
						        <h3>Class Chart	</h3>
						    </div>
						</div>
					</div>
                 	 <!-- Dropdown-->
                 	 
                	<div class="row">
                	<div class="col-md-6">
                	<div class="form-group"><h4>Academic Year</h4>
						<g:select class="form-control" name="year" from=""  onchange="getSubjects()" />
					</div>
					
					<div class="form-group"><h4>Subjects</h4>
						<g:select class="form-control" name="subject" from="" onclick="getClasses()" onchange="getClasses()" />
					</div>
                	
					<div class="form-group"><h4>Class</h4>
						<g:select name="class" class="form-control" from="" onclick="getDivisions()" onchange="getDivisions()"/>	
					</div>
					
					<div class="form-group"><h4>Division</h4>
						<g:select name="division" class="form-control" from="" />		
					</div>
					
						<table class="themeTable2" style="margin:0 auto">
							<tr class="themeTable2Row">
							   <td width="100%">
					           	<g:submitButton class="btn btn-success" name="Show Result" onclick="finalizeData()"/>
					           </td>
					        </tr>
				        </table>		

					</div>
				
                     	
                        <!-- Prediction box -->
                       <section class="col-md-6	 connectedSortable">
                            <div class="box ">
                                <div class="box-header">
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                                    </div><!-- /. tools -->
                                    <i class="fa fa-line-chart"></i>
                                    <h3 class="box-title">Class Performance Analysis</h3>
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
    <script type="text/javascript">
    var yearSelected="";
    var subSelected="";
    var classSelected="";
    var divisionSelected="";
    var allData=${session.getAttribute("teacherData")};
    var rootName=Object.getOwnPropertyNames(allData);
    var teacherData=allData[rootName].acadHistory;
	var sdArray=new Array();
	var sdCounter=0;
	var avgMarks=new Array();
	var gLegends=new Array();
	function buildChart(year,subject,className,division){
		gLegends=new Array();
		var term1=teacherData[year].subjects[subject].classes[className].divisions[division].avgs["Term1"];	
		var term2=teacherData[year].subjects[subject].classes[className].divisions[division].avgs["Term2"];
		var fields=Object.getOwnPropertyNames(term1);
		var i=0;
		for(;i<fields.length;i++){
			avgMarks[i]=term1[fields[i]];
			sdArray[i]=0;
			gLegends.push(fields[i]);
		}
		fields=Object.getOwnPropertyNames(term2);
		for(j=0;j<fields.length;j++,i++){
			avgMarks[i]=term2[fields[j]];
			sdArray[i]=0;
			gLegends.push(fields[j]);
		}
		sdCounter=i;
		
		calculateSD(teacherData[year].subjects[subject].classes[className].divisions[division].students);

		var sdDataMax=new Array();
		var sdDataMin=new Array();
		for(j=0;j<sdCounter;j++){
			var lower=parseFloat(avgMarks[j])-parseFloat(sdArray[j]);
			var upper=parseFloat(avgMarks[j])+parseFloat(sdArray[j]);
			sdDataMin[j]=parseFloat(lower.toFixed(2));
			sdDataMax[j]=parseFloat(upper.toFixed(2));
		}

		deployChart(avgMarks,sdDataMin,sdDataMax);
	}

	function calculateSD(students){
		var stuIds=Object.getOwnPropertyNames(students);
		var i=0;
		for(;i<stuIds.length;i++){
			var term1=students[stuIds[i]].Term1;
			var term2=students[stuIds[i]].Term2;
			var term1Names=Object.getOwnPropertyNames(term1);
			var j=0;
			for(;j<term1Names.length;j++){
				if(term1[term1Names[j]]!=null){
					sdArray[j]=parseFloat(sdArray[j])+Math.pow(parseFloat(avgMarks[j])-parseFloat(term1[term1Names[j]]),2);
				}
			}
			var term2Names=Object.getOwnPropertyNames(term2);
			for(k=0;k<term2Names.length;k++,j++){
				if(term2[term2Names[k]]!=null){
					sdArray[j]=parseFloat(sdArray[j])+Math.pow(parseFloat(avgMarks[j])-parseFloat(term2[term2Names[k]]),2);
				}
			}
		}
		
		for(j=0;j<sdCounter;j++){
			sdArray[j]=Math.sqrt(parseFloat(sdArray[j])/parseFloat(i));		
		}
	}
	
    
    $(document).ready(function(){
    	$(document).ajaxStart(function(){
    	    $("#spinner").css("display","block");
    	  });
    	  $(document).ajaxComplete(function(){
    	    $("#spinner").css("display","none");
    	  });

        
        initializeData(); 	
    });

    function initializeData(){
    	var currentYear=allData[rootName].currentYear;
        var yearSelect=document.getElementById("year");
        var yearsArray=Object.getOwnPropertyNames(teacherData);
		for(i=0;i<yearsArray.length;i++){
			var option = document.createElement("option");
			option.text=yearsArray[i];
			option.value=yearsArray[i];
			if(yearsArray[i]==currentYear)
				option.selected=true;
			else
				option.selected=false;
			yearSelect.add(option,i); 
		}

		yearSelected=yearSelect.options[yearSelect.selectedIndex].value;
		var subSelect=document.getElementById("subject");
		if(teacherData[yearSelected].subjects==null){
			$("#container").html("No data found");
		}
		else{
			var subsArray=Object.getOwnPropertyNames(teacherData[yearSelected].subjects);
			for(i=0;i<subsArray.length;i++){
				var option = document.createElement("option");
				option.text=subsArray[i];
				option.value=subsArray[i];
				subSelect.add(option,i); 
			}
	
			subSelected=subSelect.options[subSelect.selectedIndex].value;
			var classSelect=document.getElementById("class");
			if(teacherData[yearSelected].subjects[subSelected].classes==null){
				$("#container").html("No data found");
			}
			else{
				var classesArray=Object.getOwnPropertyNames(teacherData[yearSelected].subjects[subSelected].classes);
				for(i=0;i<classesArray.length;i++){
					var option = document.createElement("option");
					option.text=classesArray[i];
					option.value=classesArray[i];
					classSelect.add(option,i); 
				}       
				classSelected=classSelect.options[classSelect.selectedIndex].value;
				if(teacherData[yearSelected].subjects[subSelected].classes[classSelected].divisions==null){
					$("#container").html("No data found");
				}
				else{			
					var divisionSelect=document.getElementById("division");
					var divisionsArray=Object.getOwnPropertyNames(teacherData[yearSelected].subjects[subSelected].classes[classSelected].divisions);
					for(i=0;i<divisionsArray.length;i++){
						var option = document.createElement("option");
						option.text=divisionsArray[i];
						option.value=divisionsArray[i];
						divisionSelect.add(option,i); 
					}
				}
			}

		}
		divisionSelected=divisionSelect.options[divisionSelect.selectedIndex].value;
		buildChart(yearSelected,subSelected,classSelected,divisionSelected);		   
    }

    function getSubjects(){
        var yearSelect=document.getElementById("year");
    	yearSelected=yearSelect.options[yearSelect.selectedIndex].value;
		var subSelect=document.getElementById("subject");
		var length = subSelect.options.length;
		for (i = length; i >=0; i--) {
			subSelect.remove(i);
		}
	    $("#division").empty();
	   if(teacherData[yearSelected].subjects==null){
			${remoteFunction(action: 'getTeacherOneYr',
				    params:"'year='+yearSelected",
		                onSuccess: 'reinitializeData(data);',
						asynchronous: false
		                )}
		
		}
		else{
			
	 			var subsArray=Object.getOwnPropertyNames(teacherData[yearSelected].subjects);
				for(i=0;i<subsArray.length;i++){
					var option = document.createElement("option");
					option.text=subsArray[i];
					option.value=subsArray[i];
					subSelect.add(option,i); 
				}
				getClasses();
			}
		}

	function getClasses(){
		var subSelect=document.getElementById("subject");
		subSelected=subSelect.options[subSelect.selectedIndex].value;
		var classSelect=document.getElementById("class");
		var length = classSelect.options.length;
		for (i = length; i >=0; i--) {
			classSelect.remove(i);
		}
		if(teacherData[yearSelected].subjects[subSelected].classes==null){
			$("#container").html("No data found");
			$("#division").empty();
			return;
		}
		
		var classesArray=Object.getOwnPropertyNames(teacherData[yearSelected].subjects[subSelected].classes);
		for(i=0;i<classesArray.length;i++){
			var option = document.createElement("option");
			option.text=classesArray[i];
			option.value=classesArray[i];
			classSelect.add(option); 
		}
		getDivisions();
	}

	function getDivisions(){
		var classSelect=document.getElementById("class");
		classSelected=classSelect.options[classSelect.selectedIndex].value;
		var divisionSelect=document.getElementById("division");
		var length = divisionSelect.options.length;
		for (i = length; i >=0; i--) {
			divisionSelect.remove(i);
		}
		if(teacherData[yearSelected].subjects[subSelected].classes[classSelected].divisions==null){
			$("#container").html("No data found");
			return;
		}
		var divisionsArray=Object.getOwnPropertyNames(teacherData[yearSelected].subjects[subSelected].classes[classSelected].divisions);
		for(i=0;i<divisionsArray.length;i++){
			var option = document.createElement("option");
			option.text=divisionsArray[i];
			option.value=divisionsArray[i];
			divisionSelect.add(option,i); 
		}
	}
    function finalizeData(){
    	var yearSelect=document.getElementById("year");
    	yearSelected=yearSelect.options[yearSelect.selectedIndex].value;
    	var subSelect=document.getElementById("subject");
		subSelected=subSelect.options[subSelect.selectedIndex].value;
		var classSelect=document.getElementById("class");
		classSelected=classSelect.options[classSelect.selectedIndex].value;
		var divisionSelect=document.getElementById("division");
		divisionSelected=divisionSelect.options[divisionSelect.selectedIndex].value;
		buildChart(yearSelected,subSelected,classSelected,divisionSelected);		   
    }
    function reinitializeData(data){
    	allData=JSON.parse(data.toString());  
    	teacherData=allData[rootName].acadHistory;

    	var yearSelect=document.getElementById("year");
     	yearSelected=yearSelect.options[yearSelect.selectedIndex].value;
 		var subSelect=document.getElementById("subject");
 		var length = subSelect.options.length;
 		for (i = length; i >=0; i--) {
 			subSelect.remove(i);
 		}

 		if(teacherData[yearSelected].subjects!=null){
			var subsArray=Object.getOwnPropertyNames(teacherData[yearSelected].subjects);
			for(i=0;i<subsArray.length;i++){
				var option = document.createElement("option");
				option.text=subsArray[i];
				option.value=subsArray[i];
				subSelect.add(option,i); 
			}
			getClasses();
		}
		else{
			$("#container").html("No data found");
			$("#class").empty();
			$("#division").empty();
			
		}
	}
	
    function deployChart(avgData,minData,maxData) {
    	 var chartText="This chart is used to show the class performance in all assessments of a year in a subject taught by the teacher. There is one bar corresponding to each assessment. User can select a different class, academic year, subject, term from the timeline. The class performance indicators for given assessment are calculated in the same way as done in the case of overview, but the student scores in particular assessment only are considered during the calculation";
    	Highcharts.setOptions({
    		lang: {
    			contextButtonTitle: chartText
    			}
    	});
    	var helpText="<p style='line-height:120%; word-spacing:3px; font-size:13px; cursor:text'>"+chartText+"</p>";
    	$(function () {
            $('#container').highcharts({
                chart: {
                    type: 'area'
                },   
                title: {
				            text: 'Class Performance Graph'
				        },           
                xAxis: {
                      categories:gLegends
                    ,
                    labels: {
                        formatter: function() {
                            return this.value; // clean, unformatted number for year
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: 'Avg Marks'
                    },
                    labels: {
                        formatter: function() {
                            return this.value+'';
                        }
                    }
                },
                tooltip: {
                    pointFormat: '{series.name} <b>{point.y:,.2f}</b><br/>'
                },
                plotOptions: {
                    area: {
                        pointStart: 0,
                        marker: {
                            enabled: true,
                            symbol: 'circle',
                            radius: 2,
                            states: {
                                hover: {
                                    enabled: true
                                }
                            }
                        }
                    }
                },
                exporting: {
    	            buttons: {	  
    	            	 contextButton: {
    	                     enabled: false
    	                 },             
    	                exportButton: {
    	                   text: 'Download',
    	                   onclick: function () {
    	                        //alert("download option");
    	                        this.print();
    	                    }	                   
    	                    //Use only the download related menu items from the default context button	                    
    	                }    	              
    	            }
    	        },
            navigation: {
                buttonOptions: {
                    theme: {
                        style: {
                            color: '#039',
                            textDecoration: 'underline'
                        }     
                     }
                },
                menuItemStyle: {
                    fontWeight: 'normal',
                    background: 'none'
                },
                menuItemHoverStyle: {
                    background: 'none',
                    color: 'black'
                }
                        
            },
                series: [{
                    name: 'Upper bound of Standard Deviation',
                    data: maxData
                },
                {
                    name: 'Class Avg Marks',
                    data: avgData
                },
                {
                    name: 'Lower bound of Standard Deviation',
                    data: minData
                }         
              ]
            });
        });
        
        	
    	}
    </script>