
	 <table class="table table-striped table-bordered table-hover responsive" border="0" cellspacing="0">
		<tr>			
			<td width="100%" rowspan="5" style="background-color: #00c0ef;">
				<h4 class="sectionHdr fa fa-line-chart"> 5 Above Average Students</h4>
			</td>
		</tr>
	</table>
	 <g:if test="${topStudents.message}">
	 	 <table border="0" cellspacing="0">
			<tr>			
				<td width="100%" rowspan="5">
	                 <h5>No Students Data Available at this Time.</h5>
				</td>
			</tr>
		</table>
	 </g:if>
	 <g:else>
		<table id="topStud" class="table table-striped table-bordered table-hover responsive scrollProp" width="100%" border="0" cellspacing="0">
			<tr>
				<th width="5%"></th>
				<th width="20%">Student ID</th>
				<th width="45%">Student Name</th>
				<th width="10%">Division</th>
				<th width="20%">Marks</th>
			</tr>
			<g:each in="${topStudents}" var="i" status="ik">
				<tr>
					<td width="5%" class="centerFields">${ik+1}</td>
					<td width="20%" class="centerFields">${i.value.studentId}</td>
					<td width="45%" class="centerFields" style="text-transform: capitalize;">${i.value.studentName}</td>
					<td width="10%" class="centerFields">${i.value.division}</td>
					<td width="20%" class="centerFields">${i.value.marks}</td>
				</tr>
			</g:each>
		</table>
	</g:else>
	 <table class="table table-striped table-bordered table-hover responsive" border="0" cellspacing="0">
		<tr>			
			<td width="100%" rowspan="5" style="background-color: #00c0ef;">
				<h3 class="sectionHdr fa fa-line-chart"> 5 Average Students</h3>
			</td>
		</tr>
	</table>
	 <g:if test="${averageStudents.message}">
	 	 <table border="0" cellspacing="0">
			<tr>			
				<td width="100%" rowspan="5">
	                 <h5>No Students Data Available at this Time.</h5>
				</td>
			</tr>
		</table>
	 </g:if>
	 <g:else>
		<table class="table table-striped table-bordered table-hover responsive" width="100%" border="0"cellspacing="0">
			<tr>
				<th width="5%"></th>
				<th width="20%">Student ID</th>
				<th width="45%">Student Name</th>
				<th width="10%">Division</th>
				<th width="20%">Marks</th>
			</tr>
			<g:each in="${averageStudents}" var="i" status="ik">
				<tr>
					<td width="5%" class="centerFields">${ik+1}</td>
					<td width="20%" class="centerFields">${i.value.studentId}</td>
					<td width="45%" class="centerFields" style="text-transform: capitalize;">${i.value.studentName}</td>
					<td width="10%" class="centerFields">${i.value.division}</td>
					<td width="20%" class="centerFields">${i.value.marks}</td>
				</tr>
			</g:each>
		</table>
	</g:else>
	<table class="table table-striped table-bordered table-hover responsive" border="0" cellspacing="0">
		<tr>			
			<td width="100%" rowspan="5" style="background-color: #00c0ef;">
				<h3 class="sectionHdr fa fa-line-chart"> 5 Below Average Students</h3>
			</td>
		</tr>
	</table>
	 <g:if test="${bottomStudents.message}">
	 	 <table border="0" cellspacing="0">
			<tr>			
				<td width="100%" rowspan="5">
	                 <h5>No Students Data Available at this Time.</h5>
				</td>
			</tr>
		</table>
	 </g:if>
	 <g:else>
		<table class="table table-striped table-bordered table-hover responsive" width="100%" border="0"cellspacing="0">
			<tr>
				<th width="5%"></th>
				<th width="20%">Student ID</th>
				<th width="45%">Student Name</th>
				<th width="10%">Division</th>
				<th width="20%">Marks</th>
			</tr>
			<g:each in="${bottomStudents}" var="i" status="ik">
				<tr>
					<td width="5%" class="centerFields">${ik+1}</td>
					<td width="20%" class="centerFields">${i.value.studentId}</td>
					<td width="45%" class="centerFields" style="text-transform: capitalize;">${i.value.studentName}</td>
					<td width="10%" class="centerFields">${i.value.division}</td>
					<td width="20%" class="centerFields">${i.value.marks}</td>
				</tr>
			</g:each>
		</table>
	</g:else>
