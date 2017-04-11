<!-- 
 * 
 * @Author: AmritaCREATE, Amrita University
	www. amrita.edu/create.
 *  
 -->
 
<head>
<meta name='layout' content='pagewrap' />
<title><g:message code="springSecurity.denied.title" /></title>
<style>
	.errors {
		position: absolute;
		text-align: center;
		font-size: 24px;
		/*color: #BF0101;*/
		width: 50%;
		padding: 20px;
		border-radius: 5px;
		background: #222;
		opacity: 0.75;
		box-shadow: 1px 0px 11px rgba(50, 50, 50, 0.87);
		-webkit-box-shadow: 1px 0px 11px rgba(50, 50, 50, 0.87);
		-moz-box-shadow: 1px 0px 11px rgba(50, 50, 50, 0.87);
	}
	
	.errors > img {
		width: 15%;
	}
	
	.errors > p {
		font-weight: 300;
		text-align: center;
		color: #FFF;
	}
	
	@media screen and (max-width:800px){ 
		.errors > p {
			font-size: 18px;
		}
	}
	
	@media screen and (min-width:320px) and (max-width:480px){
		.errors{
			width: 70%;		
		}
	}
</style>

<script>
	$(document).ready(function(){
		$(".errors").position({
			of: $("#wraper"),
		    my: "center bottom",
		    at: "center center"
		 });
	});
</script>
</head>

<body>
<div class='body'>
	<g:if test="${message}">
		<div class="errors">
			<img src="${resource(dir:'images/theme',file:'denied.png')}" />
			<p>${message}</p>
		</div>
	</g:if>
	<g:else>
		<div class="errors">
			<img src="${resource(dir:'images/theme',file:'denied.png')}" />
			<p><g:message code="springSecurity.denied.message" /></p>
		</div>
	</g:else>
</div>
</body>
