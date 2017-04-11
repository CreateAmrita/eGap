<!DOCTYPE html>
<html class="lockscreen">
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
        <!-- Ionicons -->
        <link href="${resource(dir:'css/egov_css/',file:'ionicons.min.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Custom styles -->
        <link href="${resource(dir:'css/egov_css/',file:'custom.css')}" rel="stylesheet" type="text/css" />
        
        <!-- bootstrap wysihtml5 - text editor -->
		<link href="${resource(dir:'css/egov_css/bootstrap-wysihtml5/',file:'bootstrap3-wysihtml5.min.css')}" rel="stylesheet" type="text/css" />
		
		  <!-- Material Design -->
		<link href="${resource(dir:'css/egov_css/',file:'materialize.css')}" rel="stylesheet" type="text/css" />
		
	    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		  
	
		
    </head>
    
    <style>
    
    @media screen and (max-width: 992px) {
    	.register-box{
    		width: 100% !important;
    		padding-left: 1em;
    		padding-right: 1em;
    	}
    }
    </style>
    
    
	   <body class="hold-transition register-page">
			<div class="register-box" style="width:60%">
				<div class="callout callout-info" style="margin-bottom: 0em!important;">
					<h5>Sign up</h5>
					<a href="${createLink(controller:'home',action:'index')}" style="float: right; margin-top: -3em; color:white" ><span class="fa fa-home fa-3x"></span></a>						
				  </div>
				  
				  <div class="register-box-body">
					<div class="row">					 			
					  <div class="col-md-12">
					   <div class="row">
					    <form class="col s12">
					      <div class="row">
							<div class="col s4"><label class="labelName">Name</label></div>
					        <div class="input-field col s4">
					          <i class="material-icons prefix">account_circle</i>
					          <input id="icon_prefix" type="text" class="validate">
					          <label for="icon_prefix">First Name</label>
					        </div>
					        <div class="input-field col s4">
							  <i class="material-icons prefix">account_circle</i>
					          <input id="last_name" type="text" class="validate">
					          <label for="last_name">Last Name</label>
					        </div>
					      </div>
						  
					      <div class="row">
							<div class="col s4"><label class="labelName">Enter Password</label></div>
							<div class="input-field col s8">
							  <i class="material-icons prefix">vpn_key</i>
					          <input id="password" type="password" class="validate">
					          <label for="password">Password</label>
					        </div>
					      </div>
						  
						  <div class="row">
							<div class="col s4"><label class="labelName">Re-type Password</label></div>
							<div class="input-field col s8">
							  <i class="material-icons prefix">https</i>
					          <input id="password" type="password" class="validate">
					          <label for="password">Password</label>
					        </div>
					      </div>
						  
					      <div class="row">	
						    <div class="col s4"><label class="labelName">Email-id</label></div>
							<div class="input-field col s8">
							  <i class="material-icons prefix">email</i>
							  <input id="email" type="email" class="validate">
							  <label for="email" data-error="wrong" data-success="right">Email</label>
							</div>
						  </div>
						  
						  	  <div class="row">
							<div class="col s4"><label class="labelName">User Type</label></div>
							<div class="col s8" style="padding-top: 2em;">
							  <!-- <i class="material-icons prefix">person_pin</i> -->
							
							
							  <input class="with-gap" name="group1" type="radio" id="test1" />
							  <label class="radioPdng" for="test1">Student</label>
							
							  <input class="with-gap" name="group1" type="radio" id="test2" />
							  <label class="radioPdng" for="test2">Parent</label>
							
							  <input class="with-gap" name="group1" type="radio" id="test3"  />
							  <label class="radioPdng" for="test3">Teacher</label>
							  
							  <input class="with-gap" name="group1" type="radio" id="test3"  />
							  <label class="radioPdng" for="test3">School</label>
							 		  
						  </div>
						  </div>
						  
						  <div class="row">	
						    <div class="col s4"><label class="labelName">Student Code</label></div>
							<div class="input-field col s8">
							  <i class="material-icons prefix">perm_identity</i>
							  <input id="input_text" type="text" length="5">
					            <label for="input_text">Enter code</label>
							</div>
						  </div>
						  
						  <div class="row">	
						    <div class="col s4"><label class="labelName">Contact Number</label></div>
							<div class="input-field col s8">
							  <i class="material-icons prefix">phone</i>
					          <input id="icon_telephone" type="tel" class="validate">
					          <label for="icon_telephone">Telephone</label>
							</div>
						  </div>
						  
						  <div class="row">	
						    <div class="col s4"><label class="labelName">Contact Address</label></div>
							<div class="input-field col s8">
							  <i class="material-icons prefix">contacts</i>
							  <textarea id="textarea1" class="materialize-textarea"></textarea>
					          <label for="textarea1">Address</label>
							</div>
						  </div>
						  
						  <div class="row">	
						    <div class="col s4"><label class="labelName">City</label></div>
							<div class="input-field col s8">
							  <i class="material-icons prefix">navigation</i>
							  <input id="text" type="text" class="validate">
							  <label for="text" data-error="wrong" data-success="right">Enter City</label>
							</div>
						  </div>
						  
						  <div class="row">	
						    <div class="col s4"><label class="labelName">Pin code</label></div>
							<div class="input-field col s8">
							  <i class="material-icons prefix">location_on</i>
							  <input id="text" type="text" class="validate">
							  <label for="text" data-error="wrong" data-success="right">Enter code</label>
							</div>
						  </div>
						  
						  <div class="row">	
						    <div class="col s4"><label class="labelName">Country</label></div>
							<div class="input-field col s8">
							  <i class="material-icons prefix">navigation</i>
							  <input id="text" type="text" class="validate">
							  <label for="text" data-error="wrong" data-success="right">Enter country</label>
							</div>
						  </div>
						  
						  <div class="row">
							<div class="col s4"><label class="labelName">Captcha</label></div>
							<div class="input-field col s8">
								<div class="g-recaptcha" data-sitekey="6LdEBwcUAAAAAAwYhO_a80f6o_DOuzq_yZP0jHSu"></div>
							</div>
						  </div>
					
						  <div class="row">
							<div class="col s4"></div>
							<div class="input-field col s8">
								<button class="waves-effect waves-light btn-large">Submit</button>
							</div>
						  </div>
						  
						  
					    </form>
					  </div>
					  </div>
					  
					  <!-- /.form-box -->
					</div>
				</div>
			<!-- /.form-box -->
			</div>
			<!-- /.register-box -->
	
	</body>
    
    
    <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
	<script src="${createLinkTo(dir:'js/egov_js/bootstrap',file:'bootstrap.min.js')}" type="text/javascript"></script>
	
	<script src="${createLinkTo(dir:'js/egov_js/jquery_ui_1.11.1',file:'jquery-ui.min.js')}" type="text/javascript"></script>
	
	   
	<!-- High Charts -->
	<script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
	<script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
	<script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts-3d.js')}" type="text/javascript"></script>
	
	
	
	<!-- AdminLTE App -->
	<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
	
  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
  
  <script src='https://www.google.com/recaptcha/api.js'></script>
	