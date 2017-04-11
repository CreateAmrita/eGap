
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
                 			 <!-- Dropdown-->
                	<div class="row">
                	<section class="col-xs-12 col-sm-4 col-md-4 col-lg-4 "><h4>Academic Year</h4>
						<select class="selectpicker form-control" name="academicYear" id="academicYear" >
							<% 
								for(def i=1;i<=acyrTerms.totAcyr;i++){
								def acyrId = acyrTerms.acYrTerm."acYrTrm$i".academicYrId
								def acyrStart = acyrTerms.acYrTerm."acYrTrm$i".academicYrStart
								def acyrEnd = acyrTerms.acYrTerm."acYrTrm$i".academicYrEnd
								def current = acyrTerms.acYrTerm."acYrTrm$i".current
							%>
							<g:if test="${current==true}">	
								<option value="${acyrId}" data-index=${i} selected="selected">${acyrStart} ${acyrEnd}</option>
							</g:if>
							<g:else>
								<option value="${acyrId}" data-index=${i}>${acyrStart} ${acyrEnd}</option>
							</g:else>
							<% 
								}
							%>
						</select>
					</section>
					
					<section class="col-xs-12 col-sm-4 col-md-4 col-lg-4 "><h4>Subjects</h4>
						<select name="subject" id="subject" class="form-control">
							
						</select>
					</section>
                	
                	<section class="col-xs-12 col-sm-1 col-md-1 col-lg-1  ">
					</section>
                	
					<section class="col-xs-12 col-sm-3 col-md-3 col-lg-3  "><h4></h4>
						<g:submitButton onclick="finalizeData()" class="btn btn-success" name="Search" style="margin-top: 2em;width: 8em;"/>	
					</section>
					</div>
					</section>                 	
                 	
                 	<section class="content">
                 	 <!-- Main row -->
                    <div class="row">
                     	
                        <!-- Prediction box -->
                       <section class="col-lg-12 connectedSortable">
                            <div class="box ">
                                <div class="box-header">
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                                    </div><!-- /. tools -->
                                    <i class="fa fa-line-chart"></i>
                                    <h3 class="box-title">Overview Chart</h3>
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
	var sdCounter=0;
    var sdArray=new Array();
	var avgMarks=new Array();
	var gLegends=new Array();
	var favgMarks=new Array();
	var fsdArray=new Array();
	function buildClassData(year,subject,className,division,position){
		var term1=teacherData[year].subjects[subject].classes[className].divisions[division].avgs["Term1"];	
		var term2=teacherData[year].subjects[subject].classes[className].divisions[division].avgs["Term2"];

		var fields=Object.getOwnPropertyNames(term1);
		var i=0;
		if(i==0){
			favgMarks[position]=0;
			fsdArray[position]=0;
		}
		for(;i<fields.length;i++){
			avgMarks[i]=term1[fields[i]];
			favgMarks[position]=parseFloat(favgMarks[position])+parseFloat(term1[fields[i]])
			sdArray[i]=0;
		}
		fields=Object.getOwnPropertyNames(term2);
		for(j=0;j<fields.length;j++,i++){
			avgMarks[i]=term2[fields[j]];
			favgMarks[position]=parseFloat(favgMarks[position])+parseFloat(term2[fields[j]]);
			sdArray[i]=0;
		}
		sdCounter=i;
		calculateSD(teacherData[year].subjects[subject].classes[className].divisions[division].students);
		var lower=0.0;
		var upper=0.0
		var checkSD=0.0;
		for(j=0;j<sdCounter;j++){
			if(j==0){
				fsdArray[position]=0;
			}
			checkSD=parseFloat(checkSD)+parseFloat(sdArray[j]);
			lower=parseFloat(lower)+parseFloat(avgMarks[j])-parseFloat(sdArray[j]);
			upper=parseFloat(upper)+parseFloat(avgMarks[j])+parseFloat(sdArray[j]);
		}		
		fsdArray[position]=[parseFloat(lower.toFixed(2)),parseFloat(upper.toFixed(2))];
		sdArray=new Array();
		avgMarks=new Array();
 }


	
	function buildChart(year,subject){
		var counter=0;
		var classData=teacherData[year].subjects[subject].classes;
		var classNames=	Object.getOwnPropertyNames(classData);
		for(i=0;i<classNames.length;i++){
			var divisionsData=teacherData[year].subjects[subject].classes[classNames[i]].divisions;
			var divisionsNames=Object.getOwnPropertyNames(divisionsData);

			divisionsNames.forEach(function(entry) {
				gLegends[counter]=classNames[i]+" "+entry;
				buildClassData(year,subject,classNames[i],entry,counter);
				counter++;
			});
		}
		deployChart(gLegends,favgMarks,fsdArray);
		counter=0;
		gLegends=[];
		favgMarks=[];
		fsdArray=[];
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
			return;
		}
		var subsArray=Object.getOwnPropertyNames(teacherData[yearSelected].subjects);
		for(i=0;i<subsArray.length;i++){
			var option = document.createElement("option");
			option.text=subsArray[i];
			option.value=subsArray[i];
			subSelect.add(option,i); 
		}

		subSelected=subSelect.options[subSelect.selectedIndex].value;
		buildChart(yearSelected,subSelected);		   
    }

    function getSubjects(){
    	var yearSelect=document.getElementById("year");
     	yearSelected=yearSelect.options[yearSelect.selectedIndex].value;
 		var subSelect=document.getElementById("subject");
 		var length = subSelect.options.length;
 		for (i = length; i >=0; i--) {
 			subSelect.remove(i);
 		}
		
 		
    
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
			}
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
		}
		else{
			$("#container").html("No data found");
		}
	}
	
    function finalizeData(){
        var yearSelect=document.getElementById("year");
    	yearSelected=yearSelect.options[yearSelect.selectedIndex].value;
    	var subSelect=document.getElementById("subject");
		subSelected=subSelect.options[subSelect.selectedIndex].value;
	
    	buildChart(yearSelected,subSelected);		   
    }
	
    function deployChart(gLegendsData,avgData,errorData) {
    	 var chartText="This chart is used to show the overview of class performance in a subject taught by the teacher. There is one bar corresponding to a class/division which is taught by the teacher. User can select a different class, academic year, subject, term from the timeline. The class performance indicator is calculated as the mean of all students' scores in all assessments( by default, or only the assessments of a particular term if term is selected from timeline). Standard deviation from mean is used to demonstrate the class performance distribution around the mean. Formulae used to calculate the mean and standard deviation are given in the image above.";
    	Highcharts.setOptions({
    		lang: {
    			contextButtonTitle: chartText
    			}
    	});
    	var helpText="<p style='line-height:120%; word-spacing:3px; font-size:13px; cursor:text'>"+chartText+"</p>";
    	$(function() {
    		$('#container').highcharts({
    			chart: {
    				borderRadius: 20,
					borderColor: '#EBBA95',
		            borderWidth: 2
    			},    		
    			legend:{
    		            enabled: false
    		    },
    			xAxis: [{
    				categories: gLegendsData
    			}],
    			yAxis:  // Primary yAxis
    	          { // Secondary yAxis
    				title: {
    					text: 'Avg Marks',
    					style: {
    						color: '#4572A7'
    					}
    				},
    				labels: {
    					formatter: function() {
    						return this.value + '';
    					},
    					style: {
    						color: '#4572A7'
    					}
    				},
    				opposite: false
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
    				name: 'Class Avg Marks',
    				color: '#4572A7',
    				type: 'column',
    				data: avgData,
    				tooltip: {
    					pointFormat: '<span style="font-weight: bold; color: {series.color}">{series.name}</span>: <b>{point.y:.1f} </b> '
    				}
    			}, { 
    				name: 'min-max',
    				type: 'errorbar',
    				data: errorData,
    				tooltip: {
    					pointFormat: '<br>Standard Deviation (min-max: {point.low} to {point.high} )<br/>'
    				}
    			}]
    		});
    	});
     }
    </script>