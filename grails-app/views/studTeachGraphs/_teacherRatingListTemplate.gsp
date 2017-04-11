
<!-- 
 * 
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *  
 -->
 <g:if test="${ret.Teachers}">
	<table id="container listStud reportTable" class="table table-striped table-bordered table-hover responsive " width="100%" border="0"cellspacing="0">
			<tr>
				<th width="5%"></th>
				<th width="15%">Teacher ID</th>
				<th width="25%">Teacher Name</th>
				<th width="10%">Specification</th>
				<th width="10%">Years of Exp</th>
				<th width="10%">Tet Qualified</th>
				<th width="10%">Rating</th>
				<th width="20%">Evaluation</th>
			</tr>
			<g:each in="${ret.Teachers}" var="i" status="ik">
				<tr>
					<td width="5%" class="centerFields">
						${ik+1}
					</td>
					<td width="15%" class="centerFields">
						${i[0]}
					</td>
					<td width="25%" class="centerFields" style="text-transform: capitalize;">
						${i[1]}
					</td>
					<td width="10%" class="centerFields">
						${i[2]}
					</td>
					<td width="10%" class="centerFields">
						${i[3]}
					</td>
					<td width="10%" class="centerFields">
						${i[4]}
					</td>
					<td width="10%" class="centerFields">
						${i[5]}
					</td>
					<td width="20%" class="centerFields">
						${i[6]}
					</td>
				</tr>
			</g:each>
	</table>
</g:if>
<g:else>
	<div class="alert alert-success alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      <h4><i class="icon fa fa-times"></i> No Teachers Data Available at this Time.</h4>
    </div>
</g:else>
 <button class="btn btn-primary" type="button" style="float: right; margin-top: 10px; margin-right: 10px;" onclick="goBack()">Go Back</button>
