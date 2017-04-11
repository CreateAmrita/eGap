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
    
    
     <!-- header logo: style can be found in header.less -->
		<g:render template="/templates/header" model="['login':true]"></g:render>
       	<!-- End of header -->     

      <%@page import="egov.AcademicYear"%>
      <body class="skin-blue">
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
				<section class="content">
				
					<div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Class Overview Performance</h3>
						    </div>
						</div>
					</div>
					<div class="row">
	                	<div class="col-md-6">
							<g:formRemote name="subForm" url="[controller:'CCE', action:'firstChartMethod']" onSuccess="chartUpdate(data)" >
							
							<div class="form-group"><h4>Academic Year</h4>
								<g:select class="form-control" name="AcademicYear" from="${AcademicYear.list()}"   optionKey="startYear" optionValue="${{it.startYear?.toString() + '-' + it.endYear?.toString()}}" value="${AcademicYear.findByCurrent(1)?.startYear}" />		
							</div>
					
							<div class="form-group"><h4>Class</h4>
								<g:select class="form-control" name="classType" from=""   />		
							</div>
							<div class="form-group"><h4>Division</h4>
								<g:select class="form-control" name="divisionType" from=""   />	
							</div>
									
							<div class="form-group"><h4>Term</h4>
								<g:select  class="form-control" name="change" from="${['Term1','Term2','all']}"  value="Term1" />
							</div>
							
							<div class="form-group"><h4>Subject</h4>
								<g:select class="form-control" name="subject" from="" />
							</div>
							
							<div class="form-group">
								<table class="themeTable2" style="margin:auto">
									<tr class="themeTable2Row">
									   <td width="100%">
							           <g:submitButton class="btn btn-success" name="Show Result"/>
							           </td>
							        </tr>
						        </table>
				       		 </div>
					        </g:formRemote>
				        </div>
			        
				        <div class="col-md-6" id="pageContent">
							
							<div class="box ">
								<div class="box-header">
								<!-- tools box -->
									<div class="pull-right box-tools">
										<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
									</div><!-- /. tools -->
									<i class="fa fa-line-chart"></i>
									<h3 class="box-title">Class Performance</h3>
								</div>
								<div class="box-body chart-responsive">
									<div id="container" style="min-width: 600px; height: 500px; margin: 0 auto"></div>
								</div>
							</div>
							
						</div>
					
			        </div>
			        
					</section>
			    </div>
			
		</aside>
    

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
    var schClassData=${session.getAttribute("schclassData")};
	var subsNames=new Array();	
	var yearMap=new Object();
	var scoreMap=null;
	function buildYrData(year,className,division,subject,term){	
		var rootName = Object.getOwnPropertyNames(schClassData)[0];					
		scoreMap=new Object();
		if(schClassData[rootName].acadHistory[year]==null){
		   scoreMap=null;
		   document.getElementById("container").textContent = "Results are not yet stored in database";
		}
		else{
		var studentsObj=schClassData[rootName].acadHistory[year].classes[className].divisions[division].subjects[subject].students;
		var studentsIds=Object.getOwnPropertyNames(studentsObj);
		for(scounter=0;scounter<studentsIds.length;scounter++){
			var term1=schClassData[rootName].acadHistory[year].classes[className].divisions[division].subjects[subject].students[studentsIds[scounter]].Term1;
			var term2=schClassData[rootName].acadHistory[year].classes[className].divisions[division].subjects[subject].students[studentsIds[scounter]].Term2;			
			var fields=Object.getOwnPropertyNames(term1);
			var i=0;
			var score=0;
			var flag=true;
			if(term=="Term1"){
				for(;i<fields.length;i++){
					if(term1[fields[i]]!=0 && term1[fields[i]]!=null){
						score+=parseFloat(term1[fields[i]]);
						flag=false;	
					}
				}
			}
			else if(term=="Term2"){
				fields=Object.getOwnPropertyNames(term2);
				for(j=0;j<fields.length;j++,i++){
					if(term2[fields[j]]!=0 && term2[fields[j]]!=null){
						score+=parseFloat(term2[fields[j]]);
						flag=false;	
					}
				}
			}
			else{
				for(;i<fields.length;i++){
					if(term1[fields[i]]!=0 && term1[fields[i]]!=null){
						score+=parseFloat(term1[fields[i]]);
						flag=false;	
					}
				}
				fields=Object.getOwnPropertyNames(term2);
				for(j=0;j<fields.length;j++,i++){
					if(term2[fields[j]]!=0 && term2[fields[j]]!=null){
						score+=parseFloat(term2[fields[j]]);
						flag=false;	
					}
				}
			}
			if(flag)
				continue;
			if(score >=0 && score <40){
				if(scoreMap["Percentage between 0 to 40"]!=null){
					var temp=parseInt(scoreMap["Percentage between 0 to 40"])+1;
					scoreMap["Percentage between 0 to 40"]=temp;
				}
				else{
					scoreMap["Percentage between 0 to 40"]=1;
				}
					
			}
			else if(score >=40 && score <60){
				if(scoreMap["Percentage between 40 to 60"]!=null){
					var temp=parseInt(scoreMap["Percentage between 40 to 60"])+1;
					scoreMap["Percentage between 40 to 60"]=temp;
				}
				else{
					scoreMap["Percentage between 40 to 60"]=1;
				}
			}
			else if(score >=60 && score <80){
				if(scoreMap["Percentage between 60 to 80"]!=null){
					var temp=parseInt(scoreMap["Percentage between 60 to 80"])+1;
					scoreMap["Percentage between 60 to 80"]=temp;
				}
				else{
					scoreMap["Percentage between 60 to 80"]=1;
				}
			}
			else if(score >=80){
				if(scoreMap["Percentage above 80"]!=null){
					var temp=parseInt(scoreMap["Percentage above 80"])+1;
					scoreMap["Percentage above 80"]=temp;
				}
				else{
					scoreMap["Percentage above 80"]=1;
				}
			}
		}
	}
		deployChart(scoreMap);
 	}   

    function changeClass(year){
		var startDoc = document.getElementById('classType');            
        var studentName = Object.getOwnPropertyNames(schClassData)[0];
        var subjectsJSON = schClassData[studentName].acadHistory[year].classes;      
    	var classes = Object.getOwnPropertyNames( subjectsJSON );     		          	
        for(var i=classes.length-1;i>=0;i--){
    	    var classOption = document.createElement('option');
    	    classOption.text = classes[i];
    	    classOption.value = classes[i];   
    	    try {
    	    	  startDoc.add(classOption, null); // standards compliant; doesn't work in IE
    	    	}
    	    	catch(ex) {
    	    		startDoc.add(classOption); // IE only
    	    	}
    	   }           
		}

	function changeDivision(classVal,year){		
		var divisionDoc = document.getElementById('divisionType');
		var l = divisionDoc.length;
        while (l > 0) {
            l--
            divisionDoc.remove(l);
        }
		var stdName = Object.getOwnPropertyNames(schClassData)[0];
		var divisionJSON = schClassData[stdName].acadHistory[year].classes[classVal].divisions;  
		var divisionList = Object.getOwnPropertyNames( divisionJSON ); 
		 for(var i=0;i<divisionList.length;i++){
	    	    var divisionOption = document.createElement('option');
	    	    divisionOption.text = divisionList[i];
	    	    divisionOption.value = divisionList[i];   
	    	    try {
	    	    	divisionDoc.add(divisionOption, null); // standards compliant; doesn't work in IE
	    	    	}
	    	    	catch(ex) {
	    	    		divisionDoc.add(divisionOption); // IE only
	    	    	}
	    	   }    
		}

	function getSubjects(year,classVal,division){
		var subjectDoc = document.getElementById('subject');
		var l = subjectDoc.length;
        while (l > 0) {
            l--
            subjectDoc.remove(l);
        }
		var stdName = Object.getOwnPropertyNames(schClassData)[0];
		var subjectJSON = schClassData[stdName].acadHistory[year].classes[classVal].divisions[division].subjects;  
		var subjectList = Object.getOwnPropertyNames( subjectJSON ); 
		if(subjectList.length==0){
			document.getElementById("container").textContent = "Subjects are not stored in the database for "+classVal+" class";
			}
		 for(var i=0;i<subjectList.length;i++){
	    	    var subjectOption = document.createElement('option');
	    	    subjectOption.text = subjectList[i];
	    	    subjectOption.value = subjectList[i];   
	    	    try {
	    	    	subjectDoc.add(subjectOption, null); // standards compliant; doesn't work in IE
	    	    	}
	    	    	catch(ex) {
	    	    		subjectDoc.add(subjectOption); // IE only
	    	    	}
	    	   }    
		}


	 $(document).ready(function(){
		    changeClass( $("#AcademicYear").val());  
	        changeDivision($("#classType").val(),$("#AcademicYear").val())
	        getSubjects($("#AcademicYear").val(),$("#classType").val(),$("#divisionType").val())
	         $('#classType').change(function() {	        	  					
    		 	changeDivision($("#classType").val(),$("#AcademicYear").val())
    		 	getSubjects($("#AcademicYear").val(),$("#classType").val(),$("#divisionType").val())	  
    			});	
	        $('#divisionType').change(function() {	
   				getSubjects($("#AcademicYear").val(),$("#classType").val(),$("#divisionType").val())
   	   			});	 
	        var AcademicYear=$("#AcademicYear").val();
			var classType=$("#classType").val();   	
			var divisionType=$("#divisionType").val();
			 ${remoteFunction(
				 action: 'firstChartMethod', 
				 params: "'AcademicYear='+AcademicYear+'&classType='+classType+'&divisionType='+divisionType",
				 onSuccess:'chartUpdate(data);'
			  )}; 
	        buildYrData($("#AcademicYear").val(),$("#classType").val(),$("#divisionType").val(),$("#subject").val(),$("#change").val());		   	
		    });

	

 	
    function deployChart(tscoreMap) {
        var chartText="about this chart";
    	Highcharts.setOptions({
    		lang: {
    			contextButtonTitle: chartText
    			}
    	});
    	var helpText="<p style='line-height:120%; word-spacing:3px; font-size:13px; cursor:text'>"+chartText+"</p>";
    	var seriesData=new Array();
    	var colors = Highcharts.getOptions().colors;
    	var dataNames=Object.keys(tscoreMap);
		for(i=0;i<dataNames.length;i++){
			seriesData.push( [dataNames[i],  tscoreMap[dataNames[i]]]);
		}
		$('#container').highcharts({
            chart: {
            	           
            },
            title: {
                text: 'Percentage Based Class Distribution'
            },
            credits:{
            	enabled:false
            },
            tooltip: {
                formatter: function() {
                            return '<span style="font-weight: bold; color: {series.color}">'+this.point.name+'</span><br>Total Students:'+ this.y;
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
                          // Good old text links
                          style: {
                              color: '#039',
                              textDecoration: 'underline'
                          }
                      }
                  }
              },
          
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                type: 'pie',
                name: 'Percentage Share',
                data: seriesData
            }]
        });
	
	}


    function chartUpdate(e){	
    	schClassData=JSON.parse(e.toString());   
        buildYrData($("#AcademicYear").val(),$("#classType").val(),$("#divisionType").val(),$("#subject").val(),$("#change").val());     
     }
    </script>   
    
 
