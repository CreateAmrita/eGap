<div class="modal fade" id="addNewWidgetModal" tabindex="-1" role="dialog" aria-labelledby="helpModalLabel" aria-hidden="true">
            <div class="modal-dialog">      
         		<div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;
                            </span><span class="sr-only">Close</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Add new widget</h4>
                    </div>
   					<div class="modal-body">
                       <div class="input-group">
            				<span class="input-group-addon"><i class="fa fa-align-left"></i></span>
            					<input type="text" class="form-control"	placeholder="Title" id="widTitle" value=""/>
        				</div>
        				<p></p>
				        <div class="input-group">
				            <span class="input-group-addon"><i class="fa fa-link"></i></span>
				            <input type="text" class="form-control" placeholder="Specify link" id="widLink" value=""/>
				        </div>
        				<p></p>
        				<form role="form" align="">
			            	<label class="radio-inline">
						      <input type="radio" value="page" name="widDataType" class="widDataType" /><i class="fa fa-newspaper-o"></i> Page
						    </label>
						    <label class="radio-inline">
						      <input type="radio" value="datasource" name="widDataType" class="widDataType"/><i class="fa fa-database"></i> Datasource
						    </label>
			        	</form>
			        	<p></p>
			        	<form role="form" align="">
			            	<label class="radio-inline">
						      <input type="radio" value="bar" name="widType" class="widType" /><i class="fa fa-bar-chart"></i> Bar
						    </label>
						    <label class="radio-inline">
						      <input type="radio" value="line" name="widType" class="widType"/><i class="fa fa-line-chart"></i> Line
						    </label>
						    <label class="radio-inline">
						      <input type="radio" value="pie" name="widType" class="widType"/><i class="fa fa-pie-chart"></i> Pie
						    </label>
						    <label class="radio-inline">
						      <input type="radio" value="area" name="widType" class="widType"/><i class="fa fa-area-chart"></i> Area
						    </label>		
			        	</form>
        				<p></p>
        				<div class="input-group">
				            <span class="input-group-addon"><i class="fa fa-arrows-v"></i></span>
				            <input type="text" class="form-control" placeholder="Height of the widget (px)" id="widHeight" value=""/>
				        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:addNewWidget();">Add</button>
            </div>
        </div>
    </div>
</div>