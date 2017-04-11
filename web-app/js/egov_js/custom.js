$(document).ready(function(){

	if((window.location.href.indexOf("classSubjAnalysisReport")> -1) || (window.location.href.indexOf("subjectClass")> -1) || (window.location.href.indexOf("classPerformanceReport")> -1) || (window.location.href.indexOf("teacherMarkEntryStatusReport")> -1) || (window.location.href.indexOf("cgpaWise")> -1) || (window.location.href.indexOf("studPerfYrCatGen")> -1))
		
		{
			$("#one").addClass("active");
		}
	
	else if((window.location.href.indexOf("geoTrendAnalysis")> -1) || (window.location.href.indexOf("psa")> -1) || (window.location.href.indexOf("cbseCCE")> -1) || (window.location.href.indexOf("thinkingSkills")> -1) || (window.location.href.indexOf("visualArts")> -1) || (window.location.href.indexOf("socialSkills")> -1) || (window.location.href.indexOf("emotionalSkills")> -1) || (window.location.href.indexOf("attTeach")> -1) || (window.location.href.indexOf("physics")> -1) || (window.location.href.indexOf("chemistry")> -1) || (window.location.href.indexOf("mathematics")> -1) || (window.location.href.indexOf("biology")> -1) || (window.location.href.indexOf("accountancy")> -1) || (window.location.href.indexOf("economics")> -1) || (window.location.href.indexOf("english")> -1) || (window.location.href.indexOf("plusTwo")> -1) || (window.location.href.indexOf("nationWideSchools")> -1) || (window.location.href.indexOf("acadRept")> -1) || (window.location.href.indexOf("schlPerfOverview")> -1) || (window.location.href.indexOf("nationSchoolRating")> -1)|| (window.location.href.indexOf("schoolTeacherRating")> -1) || (window.location.href.indexOf("religion")> -1) || (window.location.href.indexOf("schoolView")> -1))
		
		{
			$("#two").addClass("active");
		}
	
	else if((window.location.href.indexOf("trendAnalysis")> -1) || (window.location.href.indexOf("studOptionalSubjReport")> -1) || (window.location.href.indexOf("studPositionReport")> -1) || (window.location.href.indexOf("studTransferReport")> -1) || (window.location.href.indexOf("vocEnrlmnt")> -1) || (window.location.href.indexOf("passPerf")> -1) || (window.location.href.indexOf("gradeDist")> -1) || (window.location.href.indexOf("studPerf")> -1) || (window.location.href.indexOf("nationWideStudents")> -1) || (window.location.href.indexOf("gdAvgLowStudPerf")> -1))
		
		{
			$("#three").addClass("active");
		}
	
	else if((window.location.href.indexOf("teacherClassPerformanceReport")> -1) || (window.location.href.indexOf("studTeachRatio")> -1) || (window.location.href.indexOf("teacherTransferReport")> -1) || (window.location.href.indexOf("teachProfile")> -1) || (window.location.href.indexOf("teachStat")> -1) || (window.location.href.indexOf("selfEvaluation")> -1))
		
		{
			$("#four").addClass("active");
		}
	
	else if((window.location.href.indexOf("teacherClassPerformanceReport")> -1))
		
		{
			$("#five").addClass("active");
		}
	
	else if((window.location.href.indexOf("healthStat")> -1) || (window.location.href.indexOf("heightVsWeight")> -1))
		
		{
			$("#six").addClass("active");
		}
	
	else if((window.location.href.indexOf("studTeachGraphs")> -1) || (window.location.href.indexOf("sports")> -1))
		
		{
			$("#seven").addClass("active");
		}
	

	else if((window.location.href.indexOf("dataMaintanenceFour")> -1) || (window.location.href.indexOf("dataMaintanenceFive")> -1))
		
		{
			$("#eight").addClass("active");
		}
	

	else if((window.location.href.indexOf("classChart")> -1) || (window.location.href.indexOf("trend")> -1) || (window.location.href.indexOf("classOverviewPerf")> -1) || (window.location.href.indexOf("overview")> -1))
		
		{
			$("#nine").addClass("active");
		}
	
	else if((window.location.href.indexOf("teachProfile")> -1))
		
		{
	
			$("#ten").addClass("active");
		}

	else if((window.location.href.indexOf("vocEnrlmnt")> -1) || (window.location.href.indexOf("incomeWisePerf")> -1))
		
		{
	
			$("#eleven").addClass("active");
		}
	else
		{
			document.location.href="${grailsApplication.config.grails.serverURL}/dashboard/index";
		}
	
})		
		