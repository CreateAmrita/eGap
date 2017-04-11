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
						        <h3>Trend Analysis	</h3>
						    </div>
						</div>
					</div>
                 
                 			 <!-- Dropdown-->
                	<div class="row">
                	<div class="col-md-6">
                	<div class="form-group"><h4>Academic Year</h4>
						<g:select class="form-control"  name="year" from="${AcademicYear.list()}"   optionKey="startYear" optionValue="${{it.startYear?.toString()}}"value="${AcademicYear.findByCurrent(1)?.startYear}" onchange="getYear2()"/>
					</div>
					
					<div class="form-group"><h4>To</h4>
						<select class="form-control" name="year2" id="year2"  onchange="getSubjects()"></select>	
					</div>
					
					<div class="form-group"><h4>Subjects</h4>
						<g:select class="form-control" name="subject" from="" />
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
                       <section class="col-md-6 connectedSortable">
                            <div class="box ">
                                <div class="box-header">
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn  btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                                    </div><!-- /. tools -->
                                    <i class="fa fa-line-chart"></i>
                                    <h3 class="box-title">Trend Analysis of Subjects</h3>
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
    var yearSelected2="";
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
	var yearMap=new Array();
	var classList=new Array();
	function buildClassData(year,subject,className,division,position){
		var term1=teacherData[year].subjects[subject].classes[className].divisions[division].avgs["Term1"];	
		var term2=teacherData[year].subjects[subject].classes[className].divisions[division].avgs["Term2"];
		var fields=Object.getOwnPropertyNames(term1);
		var i=0;
		var classFlag=true;
		for(classCounter=0;classCounter<classList.length;classCounter++){
			var cdiv=className+" "+division;
			if(classList[classCounter]==cdiv){
				classFlag=false;
				break;
			}
		}
		if(classFlag==true)
			classList.push(className+" "+division);
		if(i==0){
			favgMarks[position]=0;
			fsdArray[position]=[0,0];
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
				fsdArray[position]=[0,0];
			}
			checkSD=parseFloat(checkSD)+parseFloat(sdArray[j]);
			lower=parseFloat(lower)+parseFloat(avgMarks[j])-parseFloat(sdArray[j]);
			upper=parseFloat(upper)+parseFloat(avgMarks[j])+parseFloat(sdArray[j]);
		}
	//	alert(className+"  "+division+"  "+checkSD);
		fsdArray[position]=[parseFloat(lower.toFixed(2)),parseFloat(upper.toFixed(2))];
		sdArray=new Array();
		avgMarks=new Array();
 }


	
	function buildOneYrChartData(year,subject){
	//	alert(year+subject);
		if(teacherData[year]!=null && teacherData[year].subjects!=null && teacherData[year].subjects[subject]!=null){
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
			yearMap.push({
							graphLegends:gLegends,
							avg:favgMarks,
							sd:fsdArray
						 }
			);
		}
		else{
			yearMap.push({
				graphLegends:null,
				avg:null,
				sd:null
			 }
		    );	
		}
		counter=0;
		gLegends=[];
		favgMarks=[];
		fsdArray=[];
		return true;
	}

	function loadNewData(data){
		allData=JSON.parse(data.toString());  
    	teacherData=allData[rootName].acadHistory;
  	}
	
	function buildChart(year1,year2,subject){
		yearMap=new Array();
		classList=new Array();
		totalYears=new Array();
		var yearsData=Object.getOwnPropertyNames(teacherData);
		var yearsArray=new Array();
		if(year1==year2){
			buildOneYrChartData(parseInt(year1),subject);
				yearsArray.push(year1);
	    }
		else{
			var tyears=Object.getOwnPropertyNames(teacherData);
			tyears.sort();
			tyears.forEach(function(entry){
				if(parseInt(entry)<=parseInt(year2) && parseInt(entry)>=parseInt(year1)){
					buildOneYrChartData(parseInt(entry),subject);
					yearsArray.push(entry);
					
				}
			});
		}
	//	yearsArray.sort();
	//	alert(yearsData);
	//	yearMap.push({
	//		graphLegends:gLegends,
	//		avg:favgMarks,
	//		sd:fsdArray
	//	 }
	//	);
		var classMap=new Object();
		for(i=0;i<yearsArray.length;i++){
			for(j=0;j<classList.length;j++){
				var avgArr=new Array();
				var sdArr=new Array();
				var cdivFlag=false;
				if(yearMap[i].graphLegends!=null){
					for(k=0;k<yearMap[i].graphLegends.length;k++){
						if(classList[j]==yearMap[i].graphLegends[k]){
							avgArr.push(yearMap[i].avg[k]);
							sdArr.push(yearMap[i].sd[k]);
							if(classMap[classList[j]]==null){
								classMap[classList[j]]={avg:avgArr,
														sd:sdArr
										 				};
						//	alert(classList[j]+"  "+classMap[classList[j]].avg);
							}
							else{
								classMap[classList[j]].avg.push(avgArr);
								classMap[classList[j]].sd.push(yearMap[i].sd[k]);
					   	//	alert(classList[j]+"  "+classMap[classList[j]].avg+" sd "+classMap[classList[j]].sd);
							}
							cdivFlag=true;	
						}
					}
					if(cdivFlag==false){
						avgArr.push(0);
						sdArr.push([0,0]);
						if(classMap[classList[j]]==null){
							classMap[classList[j]]={avg:avgArr,
													sd:sdArr
									 				};
						//alert(classList[j]+"  "+classMap[classList[j]].avg);
						}
						else{
							classMap[classList[j]].avg.push(0);
							classMap[classList[j]].sd.push([0,0]);
						//	alert(classMap[classList[j]].sd);
						}
						cdivFlag=true;	
					}
				}
				else{
					avgArr.push(0);
					sdArr.push([0,0]);
					if(classMap[classList[j]]==null){
						classMap[classList[j]]={avg:avgArr,
												sd:sdArr
								 				};
					//alert(classList[j]+"  "+classMap[classList[j]].avg);
					}
					else{
						classMap[classList[j]].avg.push(0);
						classMap[classList[j]].sd.push([0,0]);
					//	alert(classMap[classList[j]].sd);
					}
				}
				
			}
		}
		deployChart(classMap,classList,yearsArray);
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
	
	$(document).ajaxStart(function(){
	    $("#spinner").css("display","block");
	  });
	  $(document).ajaxComplete(function(){
	    $("#spinner").css("display","none");
	  });
	//  $( document ).ajaxError(function() {
	//	  $("#spinner").css("display","none");
	//	});
    
    $(document).ready(function(){
        initializeData(); 	
    });

    function initializeData(){
    	var currentYear=allData[rootName].currentYear;
        var yearSelect=document.getElementById("year");
        yearSelected=yearSelect.options[yearSelect.selectedIndex].value;
        var year2Select=document.getElementById("year2");
        $('#year option').each(function() {
            if(parseInt(this.value)>=parseInt(yearSelected)){
            	var option = document.createElement("option");
				option.text=this.value;
				option.value=this.value;
				year2Select.add(option); 
			}
        });
        		       
		if(year2Select.options.length==0){
			var option = document.createElement("option");
			option.text=yearSelected;
			option.value=yearSelected;
			year2Select.add(option);	
		}
		if(teacherData[yearSelected].subjects==null){
			$("#container").html("No data found for year "+yearSelected+" please select another year");
			return;
		}
    	
		yearSelected2=year2Select.options[year2Select.selectedIndex].value;
		var subSelect=document.getElementById("subject");
		var subsArray=Object.getOwnPropertyNames(teacherData[yearSelected.toString()].subjects);
		for(i=0;i<subsArray.length;i++){
			var option = document.createElement("option");
			option.text=subsArray[i];
			option.value=subsArray[i];
			subSelect.add(option,i); 
		}

		subSelected=subSelect.options[subSelect.selectedIndex].value;
		buildChart(yearSelected,yearSelected2,subSelected);		   
    }
	function getYear2(){
		var yearSelect=document.getElementById("year");
    	yearSelected=yearSelect.options[yearSelect.selectedIndex].value;
    	var year2Select=document.getElementById("year2");
		var length = year2Select.options.length;
		for (i = length; i >=0; i--) {
			year2Select.remove(i);
		}
	    var year2Select=document.getElementById("year2");
	    $('#year option').each(function() {
	         if(parseInt(this.value)>=parseInt(yearSelected)){
	            	var option = document.createElement("option");
					option.text=this.value;
					option.value=this.value;
					year2Select.add(option); 
				}
	     });	
		getSubjects();
				
	}
    function getSubjects(){
    	var yearSelect=document.getElementById("year");
    	yearSelected=yearSelect.options[yearSelect.selectedIndex].value;
    	var year2Select=document.getElementById("year2");
	    yearSelected2=year2Select.options[year2Select.selectedIndex].value;
		
		if(teacherData[yearSelected].subjects==null){
			var respText=$.ajax({
				url:"/cceAV/teacherPerformance/getTeacherOneYr",
				data:"year="+yearSelected,
				type:"GET",
				async:false
			}).responseText;
			allData=JSON.parse(respText.toString());  
	    	teacherData=allData[rootName].acadHistory;
		}
	    if(teacherData[yearSelected2].subjects==null){
			var respText=$.ajax({
				url:"/cceAV/teacherPerformance/getTeacherOneYr",
				data:"year="+yearSelected2,
				type:"GET",
				async:false
			}).responseText;
			allData=JSON.parse(respText.toString());  
	    	teacherData=allData[rootName].acadHistory;
		}
		var subSelect=document.getElementById("subject");
				 length = subSelect.options.length;
			for (i = length; i >=0; i--) {
				subSelect.remove(i);
			}
		
		if(teacherData[yearSelected].subjects==null && teacherData[yearSelected2].subjects==null){
			$("#container").html("No data found for year "+yearSelected+" and "+yearSelected2+" please select another year");
			return;
		}
		var subsArray=new Array();
		if(teacherData[yearSelected].subjects==null){
			subsArray=Object.getOwnPropertyNames(teacherData[yearSelected2].subjects);
		}
		else if(teacherData[yearSelected2].subjects==null){
			subsArray=Object.getOwnPropertyNames(teacherData[yearSelected].subjects);
		}
		else if(yearSelected!=yearSelected2){
			var subjArray1=Object.getOwnPropertyNames(teacherData[yearSelected].subjects);
			var subjArray2=Object.getOwnPropertyNames(teacherData[yearSelected2].subjects);
			var subFlag=true;
			subjArray1.forEach(function(sub1) {
				subjArray2.forEach(function(sub2) {
					if(sub1==sub2){
						subFlag=false;
					}
				});
					if(subFlag){
						subsArray.push(sub1);	
					}
					subFlag=true;		
			});
			
		   subjArray2.forEach(function(sub2) {
				subsArray.push(sub2);
			});
			
		}
		else if(yearSelected==yearSelected2){
			subsArray=Object.getOwnPropertyNames(teacherData[yearSelected.toString()].subjects);
		}
		

			for(i=0;i<subsArray.length;i++){
				var option = document.createElement("option");
				option.text=subsArray[i];
				option.value=subsArray[i];
				subSelect.add(option,i); 
			}
    }

	
    function finalizeData(){
    	var yearSelect=document.getElementById("year");
    	yearSelected=yearSelect.options[yearSelect.selectedIndex].value;
    	var subSelect=document.getElementById("subject");
		subSelected=subSelect.options[subSelect.selectedIndex].value;
		var year2Select=document.getElementById("year2");
		yearSelected2=year2Select.options[year2Select.selectedIndex].value;
		if(yearSelected==yearSelected2){
			if(teacherData[yearSelected].subjects==null){
				var respText=$.ajax({
					url:"/cceAV/teacherPerformance/getTeacherOneYr",
					data:"year="+yearSelected,
					type:"GET",
					async:false
				}).responseText;
				allData=JSON.parse(respText.toString());  
		    	teacherData=allData[rootName].acadHistory;
			}
		}
		else{
			 $('#year option').each(function() {
				if(teacherData[this.value]==null){
					var respText=$.ajax({
						url:"/cceAV/teacherPerformance/getTeacherOneYr",
						data:"year="+this.value,
						type:"GET",
						async:false
					}).responseText;
					allData=JSON.parse(respText.toString());  
					teacherData=allData[rootName].acadHistory;
				}
				
			});
		}
		buildChart(yearSelected,yearSelected2,subSelected);		   
    }
	
    function deployChart(tClassMap,tClassList,tyearsArray) {
        var chartText="about this chart";
    	Highcharts.setOptions({
    		lang: {
    			contextButtonTitle: chartText
    			}
    	});
    	var helpText="<p style='line-height:120%; word-spacing:3px; font-size:13px; cursor:text'>"+chartText+"</p>";

    	var seriesData=new Array();
    	var colors = Highcharts.getOptions().colors;
    	for(i=0;i<tClassList.length;i++){
        	var tempSdArr=new Array();
        	for(k=0;k<tClassMap[tClassList[i]].sd.length;k++){
				tempSdArr[k]=tClassMap[tClassList[i]].sd[k];
			}
		//	alert(tClassMap[tClassList[i]].avg);
		//	console.log({name: tClassList[i],type: 'errorbar',data: tempSdArr});
        	    seriesData.push(
						{
		    				name: tClassList[i],
		    				color: colors[i],
		    	            yAxis: 0,
		    				type: 'column',
		    				data: tClassMap[tClassList[i]].avg,
		    				tooltip: {
		    					pointFormat: '<span style="font-weight: bold; color: {series.color}">{series.name} avg Marks</span>: <b>{point.y:.1f} </b> '
		    				}
		    			}, { 
		    				name: tClassList[i],
		    				type: 'errorbar',
		    				data: tempSdArr,
		    				tooltip: {
		    					pointFormat: '(Standard Deviation: {point.low} to {point.high})<br/>'
		    				}
		    			}
				);
    	}
		
    	
		    $(function() {
    		$('#container').highcharts({
    			chart: {
    				zoomType: 'xy'
    			},   
    			title:{
    				text:'Trend Analysis Graph'
    			}, 			
    			xAxis: [{
    				categories: tyearsArray
    			}],
    			yAxis:  
    	          { title: {
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

    			tooltip: {
    				shared: true
    			},

    			series: seriesData
    		});
    	});
     }
    </script>
