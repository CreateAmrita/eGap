<div id="${id}" class="chartContainer">
	<img src="${resource(dir:'egov_img',file:'loader.gif')}" alt="Loading" border="0" class="loaderImg">
</div>
<script>
$.ajax({
	url: "${datasource}",
	success:function(data){
		var arr = $.map(data.data, function(el) { return el; })
		if(arr != ''){
			  $('#${id}').highcharts({
			        title: {
			            text: "${chartTitle}"
			        },
			        xAxis: {
			            categories : data.categories
			        },
			        yAxis: {
			            title: {
			                text: (data.yTitle) ? data.yTitle : ""
			            }
			        },
			        series : data.data
			    });
		}
		else{
			$("#${id}").html("No Records Found");
		}
	}
});
</script>