package egov

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

class PerformanceCbseController {
	UtilService utilService = new UtilService()
	TestService testService = new TestService()
	NewReportService newReportService = new NewReportService()
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def psa() {
		List<String> role = utilService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		def currentAcYr,acyrTerms , school , currentAcYear
		 params.schoolId = session.school_Id.toInteger()
		role.each{ roles->
			if(roles.equals("ROLE_SCHOOLS_MANAGER".toString())){
				currentAcYr = utilService.retCurrentAcYear()
				school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				params.schoolId = school.School1.SchoolId.toInteger()
				session.school_Id = school.School1.SchoolId.toInteger()
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
			}
			if(roles.equals("ROLE_ADMIN".toString())){
				currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				school = utilService.rUserSchool(session.user_Id.toInteger())
//				print "school = " + school
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
			}
		}
		def assessmentType = ["Formative", "Summative", "Final"]
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms, assessmentType: assessmentType]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms, assessmentType: assessmentType]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def retSchoolAssessmentsComparisons = {
		//print params
		def comparisons
		if(params.asmtType.equals("Formative"))
			comparisons = newReportService.retSchoolFaComparisons(params)
		if(params.asmtType.equals("Summative"))
			comparisons = newReportService.retSchoolSaComparisons(params)
		if(params.asmtType.equals("Final"))
			comparisons = newReportService.retSchoolFinalScoreComparisons(params)
		render comparisons as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def retSchoolFaComparisons = {
		//print params
		def comparisons = newReportService.retSchoolFaComparisons(params)
		render comparisons as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def retSchoolSaComparisons = {
		def comparisons = newReportService.retSchoolSaComparisons(params)
		render comparisons as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def retSchoolFinalScoreComparisons = {
		def comparisons = newReportService.retSchoolFinalScoreComparisons(params)
		render comparisons as JSON
	}
	def cbseCCE() {
		["name":"Student_1 "]
	}
	
	def plusTwo() {
		["name":"Student_1 "]
	}
	
	def physics() {
		["name":"Student_1 "] 	
	}
	
	
	def chemistry() {
		["name":"Student_1 "]
	}
	
	
	def mathematics() {
		["name":"Student_1 "]
	}
	
	def biology() {
		["name":"Student_1 "]
	}
	
	def accountancy() {
		["name":"Student_1 "]
	}
	
	
	def physical() {
		["name":"Student_1 "]
	}
	
	def economics() {
		["name":"Student_1 "]
	}
	
	def english() {
		["name":"Student_1 "]
	}
	
	def hindi() {
		["name":"Student_1 "]
	}
	
	def business() {
		["name":"Student_1 "]
	}
	
	def political() {
		["name":"Student_1 "]
	}
	
	def geography() {
		["name":"Student_1 "]
	}
	
	def history() {
		["name":"Student_1 "]
	}
	
	def computer() {
		["name":"Student_1 "]
	}
	
	def informatics() {
		["name":"Student_1 "]
	}
	
	def thinkingSkills() {
		["name":"Student_1 "]
	}
	
	def socialSkills() {
		["name":"Student_1 "]
	}
	
	def emotionalSkills() {
		["name":"Student_1 "]
	}
	
	def workEducation() {
		["name":"Student_1 "]
	}
	
	def visualArts() {
		["name":"Student_1 "]
	}
	
	def attTeach() {
		["name":"Student_1 "]
	}
	
	def attMates() {
		["name":"Student_1 "]
	}
	
	def attProg() {
		["name":"Student_1 "]
	}
	
	def valueSyst() {
		["name":"Student_1 "]
	}
	
	def classPref(){
		["name":"Student_1 "]
	}
	
	def teachStd(){
		["name":"Student_1 "]
	}
	
	def stdTeachRatio(){
		["name":"Student_1 "]
	}
	
	def coSchoImpact(){
		["name":"Student_1 "]
	}
	
	def acadAnalysis(){
		["name":"Student_1 "]
	}
	
	def vocInfo(){
		["name":"Student_1 "]
	}
	
	def class7Perf(){
		["name":"Student_1 "]
	}
	
	def class9Perf(){
		["name":"Student_1 "]
	}
	
	def subjAnalysis(){
		["name":"Student_1 "]
	}
	
	def stdPref(){
		["name":"Student_1 "]
	}
	
}
