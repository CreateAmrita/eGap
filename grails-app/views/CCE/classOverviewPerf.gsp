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
                       Academics
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
							<g:formRemote name="subForm" url="[controller:'classPerformance', action:'firstChartMethod']" onSuccess="chartUpdate(data)">
							
							<div class="form-group"><h4>Academic Year</h4>
								<g:select class="form-control" name="AcademicYear" from="${AcademicYear.list()}"   optionKey="startYear" optionValue="${{it.startYear?.toString() + '-' + it.endYear?.toString()}}" value="${AcademicYear.findByCurrent(1)?.startYear}" />	
							</div>
					
							<div class="form-group"><h4>Class</h4>
								<g:select name="classType" class="form-control" from=""   />	
							</div>
							<div class="form-group"><h4>Division</h4>
								<g:select class="form-control" name="divisionType" from=""   />	
							</div>
									
							<div class="form-group"><h4>Term</h4>
								<g:select  class="form-control" name="change" from="${['Term1','Term2','all']}"  value="Term1" />
							</div>
							<div class="pageCtrlRt">
								<table class="themeTable2" style="margin:0 auto">
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
    var chart;
    var hcopts = {
			chart: {
				renderTo: 'container',
				zoomType: 'xy',
		          // plotBackgroundImage: 'http://www.highcharts.com/demo/gfx/skies.jpg',
		          //plotBackgroundColor: '#BDEDFF',
		            type: 'line'
			},	
			 title: {
	                text: 'Class Performance Graph'
	            },	
			xAxis:{  
				 title: {
		                text: 'Assessments'
		            },
    			categories:{}
			},
			yAxis:  
	          { title: {
					text: 'Avg Marks',
					style: {
						color: '#4572A7'
					}
				},
			
				opposite: false,
				 plotLines:[{
				       color: '#FF0000',
				        width: 3,
				       value: 30,
				        dashStyle: 'ShortDash',
				       label: {
				           text: 'Max Marks SA: 30',
				           style: {
				                color: 'blue',
				              fontWeight: 'bold'
				           },
				          align:'center'
				        }     
				    },{
					       color: '#FF0000',
					        width: 3,
					       value: 10,
					        dashStyle: 'ShortDash',
					       label: {
					           text: 'Max Marks FA:10',
					           style: {
					                color: 'blue',
					              fontWeight: 'bold'
					           },
					          align:'center'
					        }     
					    }],				
						 max:30
			},

			tooltip: {
				shared: true
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
			series: []
};

    var schClassData=${session.getAttribute("schclassData")};
	var avgMarks=new Array();
	var subMap=new Object();
	var subsNames=new Array();
    var flag=0;
	var terms=new Array();
	function buildClassData(year,className,division,term){
	  var rootName = Object.getOwnPropertyNames(schClassData)[0];	
	if(schClassData[rootName].acadHistory[year]!=null){
		flag=0;
		var subsData=schClassData[rootName].acadHistory[year].classes[className].divisions[division].subjects;	
		subsNames=Object.getOwnPropertyNames(subsData);
		var k=0;
		for(;k<subsNames.length;k++){
			if(schClassData[rootName].acadHistory[year].classes[className].divisions[division].subjects[subsNames[k]].avgs==null)
				return;			
			var term1=schClassData[rootName].acadHistory[year].classes[className].divisions[division].subjects[subsNames[k]].avgs["Term1"];
			var term2=schClassData[rootName].acadHistory[year].classes[className].divisions[division].subjects[subsNames[k]].avgs["Term2"];			
			var fields=Object.getOwnPropertyNames(term1);	
			var i=0;
			if(term=="Term1"){
				for(;i<fields.length;i++){
						avgMarks[i]=parseFloat(term1[fields[i]]);
					if(k==0)
					terms.push(fields[i]);
				}			
			}
			else if(term=="Term2"){
				fields=Object.getOwnPropertyNames(term2);
				for(j=0;j<fields.length;j++,i++){
						avgMarks[i]=parseFloat(term2[fields[j]]);
					if(k==0)
					terms.push(fields[j]);
				}
			}
			else{
				for(;i<fields.length;i++){
						avgMarks[i]=parseFloat(term1[fields[i]]);
					if(k==0)
					terms.push(fields[i]);
				}
				fields=Object.getOwnPropertyNames(term2);
				for(j=0;j<fields.length;j++,i++){
						avgMarks[i]=parseFloat(term2[fields[j]]);
					if(k==0)
					terms.push(fields[j]);
				}
			
			}		
			subMap[subsNames[k]]=avgMarks;
			avgMarks=new Array();	
		}
	   }
	else{
		     flag=1;
		}	
 	}
function changeClass(year){
		var startDoc = document.getElementById('classType');   
        var studentName = Object.getOwnPropertyNames(schClassData)[0];
        console.log(studentName);
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
		var stdName = Object.getOwnPropertyNames(schClassData)[0];
		var divisionJSON = schClassData[stdName].acadHistory[year].classes[classVal].divisions;  
		var divisionList = Object.getOwnPropertyNames( divisionJSON ); 
		if(divisionList.length==0){				
			$("#division").hide();			
			$("#divisionText").show();		
			$("#divisionText").text('Divisions are not yet stored for class '+classVal);			
			$("#Go").attr("disabled", "disabled");
			}
		else{			
			$("#divisionText").hide();	
	    	$("#division").show();			
	    	$("#Go").removeAttr("disabled");		
			var divisionDoc = document.getElementById('divisionType');     	 
            var l = divisionDoc.length;           
            while (l > 0) {
                 l--
                 divisionDoc.remove(l);
             }
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
		}

		function  buildYrData(year,className,division,term){		
			terms=new Array();
			buildClassData(year,className,division,term);		
			deployChart(subsNames,subMap);
		}
	    
    $(document).ready(function(){

//for ajax symbol
    	$("#spinner").bind("ajaxSend", function() {
            $(this).show();
        }).bind("ajaxStop", function() {
            $(this).hide();
        }).bind("ajaxError", function() {
            $(this).hide();
        });
        	
        changeClass( $("#AcademicYear").val());  
        changeDivision($("#classType").val(),$("#AcademicYear").val())
	    $('#classType').change(function() {	    					
    		changeDivision($("#classType").val(),$("#AcademicYear").val())
    		});	  
		var AcademicYear=$("#AcademicYear").val();
		var classType=$("#classType").val();   	
		var divisionType=$("#divisionType").val();
		 ${remoteFunction(
			 action: 'firstChartMethod', 
			 params: "'AcademicYear='+AcademicYear+'&classType='+classType+'&divisionType='+divisionType",
			 onSuccess:'chartUpdate(data);'
		  )};
        buildYrData($("#AcademicYear").val(),$("#classType").val(),$("#divisionType").val(),$("#change").val());
    });

 	
    function deployChart(tsubNames,tsubMap) {  
        var chartText="about this chart";
    	Highcharts.setOptions({
    		lang: {
    			contextButtonTitle: chartText
    			}
    	});
    	if(flag==1 || tsubNames.length==0){
    		//document.getElementById('container').style.fontWeight = 'bold';
    		//document.getElementById('container').style.color = 'red';
   		    document.getElementById("container").textContent = "Results are not yet stored in database";
        	}
    	else{
    		//document.getElementById('container').style.fontWeight = 'normal';	
    	var helpText="<p style='line-height:120%; word-spacing:3px; font-size:13px; cursor:text'>"+chartText+"</p>";    
    	var seriesData=new Array();
    	var colors = Highcharts.getOptions().colors;
    	//alert(tsubNames.length);	
    	
    	for(i=0;i<tsubNames.length;i++){	    	  
    		        	 seriesData.push(
						{
		    				name: tsubNames[i],
		    				color: colors[i],
		    	            yAxis: 0,
		    				type: 'column',
		    				data: tsubMap[tsubNames[i]],
		    				tooltip: {
		    					pointFormat: '<span style="font-weight: bold; color: {series.color}">{series.name}</span>: <b>{point.y:.1f} </b><br> '
		    				}
		    			}
		    		);
	        }        
    	 hcopts.xAxis.categories=terms;
    	 hcopts.series = seriesData;
    	 chart = new Highcharts.Chart(hcopts);
    	}    
   }
  
 
    function chartUpdate(e){      
         schClassData=JSON.parse(e.toString());         
         buildYrData($("#AcademicYear").val(),$("#classType").val(),$("#divisionType").val(),$("#change").val());
    }
    </script>
    
</body>
</html>
