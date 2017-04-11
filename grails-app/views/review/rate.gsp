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
		
		
		<!-- Star rating -->
		<script src="${createLinkTo(dir:'js/egov_js/',file:'star-rating.min.js')}" type="text/javascript"></script>
		<link href="${resource(dir:'css/egov_css/',file:'star-rating.min.css')}" rel="stylesheet" type="text/css" />
		
        
        <style>
        	
        body{
        	/* Prevent rightpadding pussing the body when popup is invoked*/
        	padding-right:0px !important;
        }
		
		/* *:not(i){font-family: 'Source Sans Pro', sans-serif !important;}*/
				
		.ui-helper-hidden-accessible{
			display:none;
		}
		
		.no-top-padding{
			padding-top: 0px !important;
		}
		   
		section.content-header > h3 {
			color:#006AB8;
		} 
		.content-header {
		    box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.1);
		}  
		   
		.content-box {
		    box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.3);
		    margin:0 0px 20px 0px;
		}    
		
		.content-header {
		    position: relative;
		}
		
		.botm-padding{
			padding-bottom: 20px;
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
        
        <div class="wrapper">
        	<section class="content">	
           		<div class="col-lg-2"></div>
           		<div class="col-lg-8">
           			<div class="row">
            			<div class="col-lg-12">
	            			<section class="content-header">
							    <h3>
							        <i class="fa fa-university">${school.schoolName}</i> 
							    </h3>
							    <ol class="breadcrumb">
			                        <li><g:link controller="home" href="javascript:"><i class="fa fa-home"></i> Home</g:link></li>
			                        <li><g:link controller="review" action="ratingIndex" href="javascript:"><i class="fa fa-list"></i> Ratings</g:link></li>
			                        <li class="active"><i class="fa fa-comments-o"></i> Rate School</li>
			                    </ol>
							</section>
						</div>
					</div> <!-- End of row -->
					
					<div class="row">
						<div class="col-lg-4 col-sm-4 col-xs-12">
							<section class="content-header">
								<h3><i class="fa fa-list"></i> Details</h3>
								<div class="col-lg-12 content-box">
									<h4 class="text-blue">School Details</h4>	
									<table class="table table-striped">
						                <tbody>
						                	<tr>
							                  <td width="50%">Category</td>
							                  <td><strong>${school.schlCat}</strong></td>
							                </tr>
							                <tr>
							                  <td>Medium</td>
							                  <td><strong>${school.schlMedium}</strong></td>
							                </tr>
							                <tr>
							                  <td>Type</td>
							                  <td><strong>${school.schlType}</strong></td>
							                </tr>
							                
							                <tr>
							                  <td class="text-blue"><strong>Rating</strong></td>
							                  <%
												  def flag = ""
												  if(school.rating >= 8){
														flag = "label-success"
													}	
													else if(school.rating <= 7 && school.rating > 5){
														flag = "label-warning"	
													}
													else{
														flag = "label-danger"	
													}
												  
												%>
							                  <td><span class="label ${flag}">${school.rating}</span></td>
							                </tr>
							                
							                <tr>
							                  <td class="text-blue"><strong>Trained Teachers</strong></td>
							                  <td><strong>${school.tgts}</strong></td>
							                </tr>
						              </tbody>
						            </table>
									<h4 class="text-blue">Facilities</h4>							             
						            <table class="table table-striped">
						                <tbody>
						                	<tr>
							                  <td width="50%">Physics Lab</td>
							                  <td width="10%"><i class=" text-blue fa fa-sun-o fa-2x"></i></td>
							                  <td><strong>${school.phyLab ? school.phyLab : 0}</strong></td>
							                </tr>
							                
							                <tr>
							                  <td width="50%">Chemistry Lab</td>
							                  <td width="10%"><i class=" text-blue fa fa-flask fa-2x"></i></td>
							                  <td><strong>${school.cheLab ? school.cheLab : 0}</strong></td>
							                </tr>
							                
							                <tr>
							                  <td width="50%">Biology Lab</td>
							                  <td width="10%"><i class=" text-blue fa fa-tree fa-2x"></i></td>
							                  <td><strong>${school.bioLab ? school.bioLab : 0}</strong></td>
							                </tr>
							                
							                <tr>
							                  <td width="50%">Computer Lab</td>
							                  <td width="10%"><i class=" text-blue fa fa-desktop fa-2x"></i></td>
							                  <td><strong>${school.bioLab ? school.bioLab : 0}</strong></td>
							                </tr>
							                
							                <tr>
							                  <td width="50%">Home Science Lab</td>
							                  <td width="10%"><i class=" text-blue fa fa-cutlery fa-2x"></i></td>
							                  <td><strong>${school.bioLab ? school.bioLab : 0}</strong></td>
							                </tr>
							                
							                <tr>
							                  <td width="50%">Library</td>
							                  <td width="10%"><i class=" text-blue fa fa-book fa-2x"></i></td>
							                  <td><strong>${school.bioLab ? school.bioLab : 0}</strong></td>
							                </tr>
							                
						             </tbody>
						            </table>
						            
						            <h4 class="text-blue">Hygiene</h4>
						             <table class="table table-striped">
						                <tbody>
						                	<tr>
							                  <td width="50%">Boys Urinals</td>
							                  <td width="10%"><i class=" text-blue fa fa-male fa-2x"></i></td>
							                  <td><strong>${school.urinalsBoys ? school.urinalsBoys : 0 }</strong></td>
							                </tr>
							                
							                <tr>
							                  <td width="50%">Girls Urinals</td>
							                  <td width="10%"><i class=" text-blue fa fa-female fa-2x"></i></td>
							                  <td><strong>${school.urinalsGirls  ? school.urinalsGirls : 0 }</strong></td>
							                </tr>
						             </tbody>
						            </table>
						            
						             <h4 class="text-blue">Extrcurricular Activities</h4>
						             <table class="table table-striped">
						                <tbody>
							                <tr>
							                  <td width="50%">Gymnasium</td>
							                  <td width="10%"><i class=" text-blue fa fa-futbol-o fa-2x"></i></td>

							                  <td><strong>${school.indoorGames}</strong></td>
							                </tr>
							                <tr>
							                  <td width="50%">Dance rooms</td>
							                  <td width="10%"><i class=" text-blue fa fa-video-camera fa-2x"></i></td>

							                  <td><strong>${school.danceRm}</strong></td>
							                </tr>
							                <tr>
							                  <td width="50%">Indoor Games</td>
							                  <td width="10%"><i class=" text-blue fa fa-futbol-o fa-2x"></i></td>

							                  <td><strong>${school.gym}</strong></td>
							                </tr>
							            </tbody>
						            </table>
						            
						            <h4 class="text-blue">Student Distribution</h4>
						            <div class="sparkline text-center"  data-value="${10*(school.rating+1)},${100 - (10*(school.rating+1))}"></div>
						            <br/>
						             <table class="table">
						                <tbody>
						                	<tr>
						                		<td width="100%" class="text-center"><span class="label label-male" >&nbsp;</span> Male &nbsp;&nbsp;<span class="label label-female">&nbsp;</span> Female</td>
							                </tr>
						             </tbody>
						            </table>
								</div> <!-- End of content-box -->
							</section>
						
						</div><!-- End of details box -->
					
						<div class="col-lg-8 col-sm-8 col-xs-12">
							<section class="content-header">
		            			<section class="content-header">
								    <h3><i class="fa fa-comments-o"></i> Review</h3>
								</section>
		            			<div class="row content-box">
		            				<div class="col-lg-12 col-lg-sm-12 col-xs-12">
		            					<blockquote>How would you rate the infrastructure of the school?</blockquote>
	            						<div class="radio-inline">
									      <label><input type="radio" name="optradio">Excellent</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Good</label>
									    </div>
										<div class="radio-inline">
									      <label><input type="radio" name="optradio">Average </label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Below Average</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Unsatisfactory</label>
									    </div>
		            				</div>
		            				<div class="col-lg-12 col-lg-sm-12 col-xs-12">
		            					<blockquote>What do feel about the teaching faculty at the school?</blockquote>
	            						<div class="radio-inline">
									      <label><input type="radio" name="optradio">Excellent</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Good</label>
									    </div>
										<div class="radio-inline">
									      <label><input type="radio" name="optradio">Average </label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Below Average</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Unsatisfactory</label>
									    </div>
		            				</div>
		            				<div class="col-lg-12 col-lg-sm-12 col-xs-12">
		            					<blockquote>How would you evaluate the extra-curricular activities ?</blockquote>
	            						<div class="radio-inline">
									      <label><input type="radio" name="optradio">Excellent</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Good</label>
									    </div>
										<div class="radio-inline">
									      <label><input type="radio" name="optradio">Average </label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Below Average</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Unsatisfactory</label>
									    </div>
		            				</div>
		            				<div class="col-lg-12 col-lg-sm-12 col-xs-12">
		            					<blockquote>Assess the laboratory facilities in the school?</blockquote>
	            						<div class="radio-inline">
									      <label><input type="radio" name="optradio">Excellent</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Good</label>
									    </div>
										<div class="radio-inline">
									      <label><input type="radio" name="optradio">Average </label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Below Average</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Unsatisfactory</label>
									    </div>
		            				</div>
		            				<div class="col-lg-12 col-lg-sm-12 col-xs-12">
		            					<blockquote>Does your school helps in developing moral values to the students?</blockquote>
	            						<div class="radio-inline">
									      <label><input type="radio" name="optradio">Excellent</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Good</label>
									    </div>
										<div class="radio-inline">
									      <label><input type="radio" name="optradio">Average </label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Below Average</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Unsatisfactory</label>
									    </div>
		            				</div>
		            				<div class="col-lg-12 col-lg-sm-12 col-xs-12">
		            					<blockquote>How would you rate the computing facility in this school?</blockquote>
	            						<div class="radio-inline">
									      <label><input type="radio" name="optradio">Excellent</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Good</label>
									    </div>
										<div class="radio-inline">
									      <label><input type="radio" name="optradio">Average </label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Below Average</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Unsatisfactory</label>
									    </div>
		            				</div>
		            				<div class="col-lg-12 col-lg-sm-12 col-xs-12">
		            					<blockquote>Evaluate the library facility in this school?</blockquote>
	            						<div class="radio-inline">
									      <label><input type="radio" name="optradio">Excellent</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Good</label>
									    </div>
										<div class="radio-inline">
									      <label><input type="radio" name="optradio">Average </label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Below Average</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Unsatisfactory</label>
									    </div>
		            				</div>
		            				<div class="col-lg-12 col-lg-sm-12 col-xs-12">
		            					<blockquote>How well does the school take care of its hygenic facility?</blockquote>
	            						<div class="radio-inline">
									      <label><input type="radio" name="optradio">Excellent</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Good</label>
									    </div>
										<div class="radio-inline">
									      <label><input type="radio" name="optradio">Average </label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Below Average</label>
									    </div>
									    <div class="radio-inline">
									      <label><input type="radio" name="optradio">Unsatisfactory</label>
									    </div>
		            				</div>
		            				<div class="col-lg-12 col-lg-sm-12 col-xs-12">
		            					<blockquote>How would you rate the overall performance of the school?</blockquote>
		            					<div style="margin-top: -25px;">
		            						<input id="input-1" class="rating" data-min="0" data-max="5" data-step="1">
		            					</div>
		            				</div>
		            				<div class="col-lg-12 col-lg-sm-12 col-xs-12 botm-padding">
		           						<blockquote>Share your thoughts</blockquote>
		            					<textarea class="form-control" rows="5"></textarea>
		            				</div>
		            				<div class="col-lg-12 col-lg-sm-12 col-xs-12" >
		            					<button type="button" class="btn btn-primary center-block ">Submit</button>
		            				</div>
		            				
		            			</div> <!-- End of row-content-box -->
							</section> 
						</div> <!-- End of review box -->
					
           			</div> <!-- End of row -->
           		
           		</div> <!-- End of col-lg-10 -->
            		
            	<div class="col-lg-2"></div>
            	
            </section>
   		</div> <!-- End of wrapper -->
        
		<g:render template="/templates/footer"></g:render>
        
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		<!-- Sparkline -->
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
		    	  height:"200px",
		    	  tooltipFormat: '{{offset:offset}} ({{percent.1}}%)',
		    	    tooltipValueLookups: {
		    	        'offset': {
		    	            0: 'Male',
		    	            1: 'Female'
		    	        }
		    	    }
			  });
		    });
		});
		</script>
		
     </body>
</html>