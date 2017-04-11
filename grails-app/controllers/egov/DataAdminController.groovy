package egov
import grails.converters.JSON
import grails.plugins.springsecurity.Secured
class DataAdminController {
	TestService testService = new TestService()
	UtilService utilService = new UtilService()
	TeacherReportService teacherReportService = new TeacherReportService()
	CceReportService cceReportService = new CceReportService()
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teachProfile() {
			List<String> role = testService.rUserRoles()
			params.schoolId = session.school_Id.toInteger()
			def schoolGp = testService.rUserSchoolGroup(session.user_Id.toInteger())
			def school,faculty
			 params.userId = session.user_Id
			 role.each{ roles->
				 if(roles.equals("ROLE_TEACHER".toString()) || roles.equals("ROLE_ADMIN".toString())){
					 school = testService.rUserSchool(session.user_Id.toInteger())
					 if(roles.equals("ROLE_TEACHER".toString())){
					 	faculty = teacherReportService.retTeacherDetail(params)
					 }
					 else if(roles.equals("ROLE_ADMIN".toString())){
						faculty = teacherReportService.retSchoolTeachers(params)
					 }
				 }
				 if(roles.equals("ROLE_SCHOOLS_MANAGER".toString())){
					 school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
					 params.schoolId = school.School1.SchoolId.toInteger()
					 session.school_Id = school.School1.SchoolId.toInteger()
					 faculty = teacherReportService.retSchoolTeachers(params)
				 }
			 }
			if(request.xhr){
				[isAjax:true,"name":"Student_1 ",role:role,schoolGp:schoolGp,school:school,faculty:faculty]
			}
			else
				["name":"Student_1 ",role:role,schoolGp:schoolGp,school:school,faculty:faculty]
	}
	def retSchoolTeachers = {
		def faculty = teacherReportService.retSchoolTeachers(params)
		render faculty as JSON
	}
	
	def retTeacherDetails ={
		def teacherDetails = teacherReportService.retSelectedTeacherDetails(params)
		render teacherDetails as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def gdAvgLowStudList = {
		params.teacherId = session.user_Id.toInteger()
		params.userName = session.userName
		def rTeachSubjTopStudents = cceReportService.rTeachSubjTopStudents(params)
		def rTeachSubjAverageStudents = cceReportService.rTeachSubjAverageStudents(params)
		def rTeachSubjBottomStudents = cceReportService.rTeachSubjBottomStudents(params)
		render(template:"/studTeachGraphs/gdAvgLowStudTemplate",model:[topStudents:rTeachSubjTopStudents,averageStudents:rTeachSubjAverageStudents,bottomStudents:rTeachSubjBottomStudents])
	}
	
	def stdProfile() {
		["name":"Student_1 "]
	}
	
    def regsub() { 
		["name":"Student_1 "]
	}
	
	def assessments() {
		["name":"Student_1 "]
	}
	
	def performance() {
		["name":"Student_1 "]
	}
	
	def stdreport() {
		["name":"Student_1 "]
	}
	
	def authoring() {
		["name":"Student_1 "]
	}
	
	def qnbank() {
		["name":"Student_1 "]
	}
	
}
