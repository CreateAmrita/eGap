<div id="${id}" class="chartContainer">
	<img src="${resource(dir:'egov_img',file:'loader.gif')}" alt="Loading" border="0" class="loaderImg">
</div>
<script>
$.ajax({
	url: "${datasource}",
	success:function(data){		
		var arr = $.map(data.categories, function(el) { return el; })
		if(arr != ''){
			$('#${id}').highcharts({
		        title: {
		            text: "${chartTitle}",
		            x: -20 //center
		        },
		        xAxis: {
		            categories: data.categories
		        },
		        yAxis: {
		            title: {
		                text: (data.yTitle) ? data.yTitle : ""
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#808080'
		            }]
		        },
		        tooltip: {
		            valueSuffix: ''
		        },
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series:data.data
		    });
		}
		else{
			$("#${id}").html("No Records Found");
		}
	}
});
</script>