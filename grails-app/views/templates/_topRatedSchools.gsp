<section class="content-header">
    <h3>
        <i class="fa fa-building-o"></i> Top rated CBSE schools in India
    </h3>
</section>
          
<section class="content top-schools">
	<div class="row">
		<g:each in="${schools}" var="i" status="j">
				<div class="col-lg-4 col-sm-6 col-xs-12" >
					<div class="row content-box top-schools-ele">
						<div class="col-lg-2 col-sm-2 col-xs-2" >
							<span class="label label-success">${i.rating}</span>
				    	</div>
				    	<div class="col-lg-10  col-sm-10 col-xs-10" >
				    		<g:link controller="school" action="view" id="${i.id}"><h4>${i.schoolName.toUpperCase()}</h4></g:link>
				    		<p>${i.state.toUpperCase()}</p>
				    	</div>								
					</div>
				 </div>
		</g:each>
	</div> 
</section>	