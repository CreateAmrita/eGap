
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
		
		 <!-- Select2 -->
  		<link href="${resource(dir:'js/egov_js/plugins/select2/',file:'select2.min.css')}" rel="stylesheet">
		
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
                        Dashboard
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
	                <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Student's Risk Identification</h3>
						    </div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6">
							<div class="row" style="margin-top: 2em;">
								<div class="col-md-6">
									<div class="form-group">
					               		 <label>Select Subject</label>
					               		 <select class="form-control select2" style="width: 100%;">
						                  <option selected="selected">All Subjects</option>
						                  <option>Thinking Skills</option>
						                  <option>Social Skills</option>
						                  <option>Emotional Skills</option>
					                	</select>
				              	    </div>
				                </div>
				              
				              <div class="col-md-6">
									<div class="form-group">
				               		 <label>Select Grade</label>
				               		 <select class="form-control select2" style="width: 100%;">
					                  <option>A</option>
					                  <option>B</option>
					                  <option>C</option>
					                  <option>D</option>
					                  <option>F</option>
				                	</select>
				              	</div>
				              </div>
				              
				              <div class="col-md-6">
									<div class="form-group">
					               		 <label>Select Subject</label>
					               		 <select class="form-control select2" style="width: 100%;">
						                  <option selected="selected">All Subjects</option>
						                  <option>Thinking Skills</option>
						                  <option>Social Skills</option>
						                  <option>Emotional Skills</option>
					                	</select>
				              	    </div>
				                </div>
				              
				              <div class="col-md-6">
									<div class="form-group">
				               		 <label>Select Grade</label>
				               		 <select class="form-control select2" style="width: 100%;">
					                  <option>A</option>
					                  <option>B</option>
					                  <option>C</option>
					                  <option>D</option>
					                  <option>F</option>
				                	</select>
				              	</div>
				              </div>
				              
				              <div class="col-md-6">
									<div class="form-group">
					               		 <label>Select Subject</label>
					               		 <select class="form-control select2" style="width: 100%;">
						                  <option selected="selected">All Subjects</option>
						                  <option>Thinking Skills</option>
						                  <option>Social Skills</option>
						                  <option>Emotional Skills</option>
					                	</select>
				              	    </div>
				                </div>
				              
				              <div class="col-md-6">
									<div class="form-group">
				               		 <label>Select Grade</label>
				               		 <select class="form-control select2" style="width: 100%;">
					                  <option>A</option>
					                  <option>B</option>
					                  <option>C</option>
					                  <option>D</option>
					                  <option>F</option>
				                	</select>
				              	</div>
				              </div>
				              
				              <div class="col-md-12">
				              	<div class="btn-container" style="margin-top: 2em;">
									<button type="button" onclick="showResult()" class="btn btn-block btn-success">Submit</button>
								</div>
				              </div>
				              
				           </div>	              
						</div><!-- End of dropdown group -->
						
						<div class="col-md-6">
							
						</div>
					</div>
					
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
        
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

		
		<!-- Select 2 Plugin -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/select2/select2.full.min.js')}" type="text/javascript"></script> 
		
		<script language="javascript">
			$('document').ready(function(){

				 $(".select2").select2();

			 
				});
		</script>       
        
   </body>
</html>