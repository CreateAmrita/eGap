
<style>
.circleDiv:hover{
	 
 -moz-transform: scale(1.1);
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
  transition: transform .3s ease-in-out,width .3s ease-in-out;
}
.circleDiv img{
	width:100%;
}
</style>

<section class="content-header">
    <h3>
       <i class="fa fa-link"></i> Quick links
    </h3>
</section>

<section class="content">
<div class="row ">
    <div class="col-lg-3 col-xs-6 circleMain searchSchools">
    	<g:link controller="school" action="search">
	    	<div class="circleDiv">
	    		<img src="${resource(dir:'egov_img',file:'SCHOOL15.png')}">
	    	</div>
	       	<h4>Search for schools</h4>
		</g:link>
    </div>
    
    <div class="col-lg-3 col-xs-6 circleMain rateSchools">
    	<g:link controller="review" action="ratingIndex">
	        <div class="circleDiv">
	     		<img src="${resource(dir:'egov_img',file:'icon__rate_review-128.png')}">
	    	</div>
	    	<h4>Rate and review schools</h4>
    	</g:link>
    </div>
    
    <div class="col-lg-3 col-xs-6 circleMain compareSchools">
    	<g:link>
	    	<div class="circleDiv">
	    		<img src="${resource(dir:'egov_img',file:'comparison_doc_report.png')}">	
	    	</div>
	       	<h4>Compare schools</h4>
       	</g:link>
    </div>
    <div class="col-lg-3 col-xs-6 circleMain findSchools">
    	<g:link>
	        <div class="circleDiv" style="position: relative">
	     		<img src="${resource(dir:'egov_img',file:'13-128.png')}" style="position: absolute;top: -9px;right: 0px">
	    	</div>
	    	<h4>Find schools near you</h4>
    	</g:link>
    </div>
</div>
</section>