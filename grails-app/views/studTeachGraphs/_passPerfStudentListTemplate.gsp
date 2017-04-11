
<!-- 
 * 
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *  
 -->
 <g:if test="${ret}">
	<table id="container listStud reportTable" class="table table-striped table-bordered table-hover responsive " width="100%" border="0"cellspacing="0">
			<tr>
				<th width="5%"></th>
				<th width="20%">Student ID</th>
				<th width="25%">Student Name</th>
				<th width="20%">Percentage Score</th>
				<th width="10%">CGPA</th>
				<!-- <th width="10%">Cancel TC</th> -->
			</tr>
			<g:each in="${ret}" var="i" status="ik">
				<tr>
					<td width="5%" class="centerFields">
						${ik+1}
					</td>
					<td>
						${i[0]}
					</td>
					<td style="text-transform: capitalize;">
						${i[1]}
					</td>
					<td>
						${i[2]}
					</td>
					<td>
						${i[3]}
					</td>
				</tr>
			</g:each>
	</table>
</g:if>
<g:else>
	<div class="alert alert-success alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      <h4><i class="icon fa fa-times"></i> No Students Data Available at this Time.</h4>
    </div>
</g:else>
 <button class="btn btn-primary" type="button" style="float: right; margin-top: 10px; margin-right: 10px;" onclick="goBack()">Go Back</button>
