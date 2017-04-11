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
        
       
        <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
        
        <script src="${createLinkTo(dir:'js/egov_js/bootstrap',file:'bootstrap.min.js')}" type="text/javascript"></script>
	
		<script src="${createLinkTo(dir:'js/egov_js/jquery_ui_1.11.1',file:'jquery-ui.min.js')}" type="text/javascript"></script>
		
		
        
        <style>
        	
        body{
        	/* Prevent rightpadding pussing the body when popup is invoked*/
        	padding-right:0px !important;
        }
		
		*:not(i){font-family: 'Source Sans Pro', sans-serif !important;}
				
		.ui-helper-hidden-accessible{
			display:none;
		}
		   
		section.content-header > h3 {
			color:#006AB8;
		} 
		
		.content-header {
		    box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.1);
		}  
		   
		.content-box {
		    box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.3);
		    margin:0 0px 5px 0px;
		}    
			
		
		
		.label {
	        border-radius: 50%;
		    font-size: 15px;
		    font-weight: normal;
		    width: 25px;
		    height: 25px;
		    display: inline-block;
		    line-height: 1em;
		    padding: 5px;
		}
		
		
		.content-header {
		    position: relative;
		}
		
		.label-male{
			background: #FF9900;
		}
		
		.label-female{
			background: #5CB85C;
		}
        </style>
 
    </head>
    <body class="skin-blue">
    
        <g:render template="/templates/header" model="['login':false]"></g:render>
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
        	<section class="content">	
            	<div class="row ">
            		<div class="col-lg-2 " >
            		</div>
            	
	            		<div class="col-lg-8 " >
	            			<section class="content-header">
							    <h3>
							        <i class="fa fa-building"> </i> School Compare
							    </h3>
							    <ol class="breadcrumb">
			                        <li><g:link controller="home"><i class="fa fa-home"></i> Home</g:link></li>
			                        <li><g:link controller="school" action="search" ><i class="fa fa-search"></i> School Search</g:link></li>
			                        <li class="active"><i class="fa fa-check"></i> Compare</li>
			                    </ol>
							</section>
							
							<section class="content">
								<div class="">
									<g:each in="${schools}" var="school" status="i">
										<div class="col-lg-3 content-box">
												<h4 class="text-blue">${school.value.schoolName}</h4>
												<table class="table table-striped">
								                <tbody>
								                	<tr>
									                  <td width="50%">Category</td>
									                  <td><strong>${school.value.schlCat}</strong></td>
									                </tr>
									                <tr>
									                  <td>Medium</td>
									                  <td><strong>${school.value.schlMedium}</strong></td>
									                </tr>
									                <tr>
									                  <td>Type</td>
									                  <td><strong>${school.value.schlType}</strong></td>
									                </tr>
									                
									                <tr>
									                  <td class="text-blue"><strong>Rating</strong></td>
									                  <%
														  def flag = ""
														  if(school.value.rating >= 8){
																flag = "label-success"
															}	
															else if(school.value.rating <= 7 && school.value.rating > 5){
																flag = "label-warning"	
															}
															else{
																flag = "label-danger"	
															}
														  
														%>
									                  <td><span class="label ${flag}">${school.value.rating}</span></td>
									                </tr>
									                
									                <tr>
									                  <td class="text-blue"><strong>Trained Teachers</strong></td>
									                  <td><strong>${school.value.tgts}</strong></td>
									                </tr>
								              </tbody>
								            </table>
											<h4 class="text-blue">Facilities</h4>							             
								            <table class="table table-striped">
								                <tbody>
								                	<tr>
									                  <td width="50%">Physics Lab</td>
									                  <td width="10%"><i class=" text-blue fa fa-sun-o fa-2x"></i></td>
									                  <td><strong>${school.value.phyLab ? school.value.phyLab : 0}</strong></td>
									                </tr>
									                
									                <tr>
									                  <td width="50%">Chemistry Lab</td>
									                  <td width="10%"><i class=" text-blue fa fa-flask fa-2x"></i></td>
									                  <td><strong>${school.value.cheLab ? school.value.cheLab : 0}</strong></td>
									                </tr>
									                
									                <tr>
									                  <td width="50%">Biology Lab</td>
									                  <td width="10%"><i class=" text-blue fa fa-tree fa-2x"></i></td>
									                  <td><strong>${school.value.bioLab ? school.value.bioLab : 0}</strong></td>
									                </tr>
									                
									                <tr>
									                  <td width="50%">Computer Lab</td>
									                  <td width="10%"><i class=" text-blue fa fa-desktop fa-2x"></i></td>
									                  <td><strong>${school.value.bioLab ? school.value.bioLab : 0}</strong></td>
									                </tr>
									                
									                <tr>
									                  <td width="50%">Home Science Lab</td>
									                  <td width="10%"><i class=" text-blue fa fa-cutlery fa-2x"></i></td>
									                  <td><strong>${school.value.bioLab ? school.value.bioLab : 0}</strong></td>
									                </tr>
									                
									                <tr>
									                  <td width="50%">Library</td>
									                  <td width="10%"><i class=" text-blue fa fa-book fa-2x"></i></td>
									                  <td><strong>${school.value.bioLab ? school.value.bioLab : 0}</strong></td>
									                </tr>
									                
								             </tbody>
								            </table>
								            
								            <h4 class="text-blue">Hygiene</h4>
								             <table class="table table-striped">
								                <tbody>
								                	<tr>
									                  <td width="50%">Boys Urinals</td>
									                  <td width="10%"><i class=" text-blue fa fa-male fa-2x"></i></td>
									                  <td><strong>${school.value.urinalsBoys ? school.value.urinalsBoys : 0 }</strong></td>
									                </tr>
									                
									                <tr>
									                  <td width="50%">Girls Urinals</td>
									                  <td width="10%"><i class=" text-blue fa fa-female fa-2x"></i></td>
									                  <td><strong>${school.value.urinalsGirls  ? school.value.urinalsGirls : 0 }</strong></td>
									                </tr>
								             </tbody>
								            </table>
								            
								            <h4 class="text-blue">Student Distribution</h4>
								            <div class="sparkline text-center"  data-value="${20*(i+1)},${100 - (20*(i+1))}">
								            </div>
								            <br/>
								             <table class="table">
								                <tbody>
								                	<tr>
								                		<td width="100%" class="text-center"><span class="label label-male" >&nbsp;</span> Male &nbsp;&nbsp;<span class="label label-female">&nbsp;</span> Female</td>
									                </tr>
								             </tbody>
								            </table>
								            
										</div>
										<div class="col-lg-1"></div>
									</g:each>
								</div>
							</section>
	            		</div>
	            		
	            		<div class="col-lg-2 " >
	            		</div>
	            	</div>
	            </section>
    		</div>
        
		<g:render template="/templates/footer"></g:render>
        
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/plugins/sparkline',file:'jquery.sparkline.min.js')}" type="text/javascript"></script>
		<script>
		$(document).ready(function(){
			$(".sparkline").each(function () {
		      var $this = $(this);
		      var value =  ($this.attr("data-value")).split(",");
		      $this.sparkline(value, {
		    	  type:"pie",
		    	  offset:"90",
		    	  width:"200px",
		    	  sliceColors:['#FF9900','#5CB85C'],
		    	  height:"200px"
			  });
		    });
		});
		</script>
		
     </body>
</html>