<div class="box ">
	<%
		def id
		if(!time){
			id = wid
		}
		else{
			id = type + time
		}
		
		height = height ? height.replaceAll("\\s","") : ""
		
	 %>
    <div class="box-header">
        <!-- tools box -->
	        <div class="pull-right box-tools">
	            <button class="btn  btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove" data-wid="${id}"><i class="fa fa-times"></i></button>
	        </div>
        <!-- /. tools -->
       	<g:if test="${type == 'line'}">
       		<i class="fa fa-line-chart"></i>
       	</g:if>
       	
       	<g:elseif test="${type == 'bar'}">
       		<i class="fa fa-bar-chart"></i>
       	</g:elseif>
       	
       	<g:elseif test="${type == 'pie'}">
       		<i class="fa fa-pie-chart"></i>
       	</g:elseif>
       	
       	<g:elseif test="${type == 'area'}">
       		<i class="fa fa-area-chart"></i>
       	</g:elseif>
       	
       	<g:else>
       		<i class="fa fa-plus-square-o"></i>
       	</g:else>
        
        <h3 class="box-title">${title}</h3>
    </div>
    <div class="box-body chart-responsive">
    	<g:if test="${data == 'page'}">
    		<div class="root" id="${id}" style="height: ${height == '' ? 415 : height}px;">
    		    <iframe src="${link}"></iframe>
    		</div>
        </g:if>
        <g:elseif test="${data == 'datasource'}">
        	<g:if test="${type == 'line'}">
        		<g:render template="/widget/lineWidget" model="['id':id,'chartTitle':title,'datasource':link]"></g:render>
        	</g:if>
        	
        	<g:if test="${type == 'bar'}">
        		<g:render template="/widget/barWidget" model="['id':id,'chartTitle':title,'datasource':link]"></g:render>
        	</g:if>
        	
        	<g:if test="${type == 'pie'}">
        		<g:render template="/widget/pieWidget" model="['id':id,'chartTitle':title,'datasource':link]"></g:render>
        	</g:if>
        	
        	<g:if test="${type == 'area'}">
        		<g:render template="/widget/areaWidget" model="['id':id,'chartTitle':title,'datasource':link]"></g:render>
        	</g:if>
        	
        </g:elseif>
    </div><!-- /.box-body -->
</div>