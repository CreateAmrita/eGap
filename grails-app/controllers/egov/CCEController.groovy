package egov

import grails.converters.JSON
import grails.plugins.springsecurity.Secured


class CCEController {
	TestService testService = new TestService()
	SchoolReportService schools=new SchoolReportService();
	ClassReportService classReportService=new ClassReportService()
	CceReportService cceReportService = new CceReportService()
	NewReportService newReportService = new NewReportService()
	UtilService utilService = new UtilService()
	DataEntryService des = new DataEntryService()
	def springSecurityService;
	static String user_name;

	@Secured(['IS_AUTHENTICATED_FULLY'])
     def classSubjAnalysisReport() { 
		 List<String> role = testService.rUserRoles()
		 params.schoolId = session.school_Id.toInteger()
		 def schoolGp = testService.rUserSchoolGroup(session.user_Id.toInteger())
		 def school = testService.rUserSchool(session.user_Id.toInteger())
		 def currentAcYr,acyrTerms,currentAcYear,classes
		  params.schoolId = session.school_Id.toInteger()
 //		acyrTerms = dataAdminService.retAcYrAndTerms(params.schoolId.toInteger())
 //		def currentAcYear = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
 //		def classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYear.id.toInteger())
		  role.each{ roles->
			  if(roles.equals("ROLE_ADMIN".toString())){
				  currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				  school = testService.rUserSchool(session.user_Id.toInteger())
				  acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				  classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
			  }
			  if(roles.equals("ROLE_SCHOOLS_MANAGER".toString())){
				  currentAcYr = utilService.retCurrentAcYear()
				  school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				  params.schoolId = school.School1.SchoolId.toInteger()
				  session.school_Id = school.School1.SchoolId.toInteger()
				  acyrTerms = testService.retTerms(currentAcYr.id.toInteger())
				  classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
			  }
		  }
		 if(request.xhr){
			 [isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes]
		 }
		 else
			 [role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes]
		}
	 
	 @Secured(['IS_AUTHENTICATED_FULLY'])
	 def classSubjectsAnalysis= {
		 def students = testService.classSubjectsAnalysis(params)
		 render students as JSON
	 }
	 
	 @Secured(['IS_AUTHENTICATED_FULLY'])
	 def classPerformanceReport = {
		List<String> role = testService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = testService.rUserSchoolGroup(session.user_Id.toInteger())
//		def school = utilService.rUserSchool(session.user_Id.toInteger())
		def currentAcYr,acyrTerms,currentAcYear,school
		 params.schoolId = session.school_Id.toInteger()
//		acyrTerms = dataAdminService.retAcYrAndTerms(params.schoolId.toInteger())
//		def currentAcYear = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
		 role.each{ roles->
			 if(roles.equals("ROLE_ADMIN".toString())){
				 currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				 school = testService.rUserSchool(session.user_Id.toInteger())
				 acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
			 }
			 if(roles.equals("ROLE_SCHOOLS_MANAGER".toString())){
				 currentAcYr = utilService.retCurrentAcYear()
				 school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				 params.schoolId = school.School1.SchoolId.toInteger()
				 session.school_Id = school.School1.SchoolId.toInteger()
				 acyrTerms = testService.retAcYrAndTerms( params.schoolId)
				 //retTerms(currentAcYr.id.toInteger())
				 //print "acyrTerms = "+ acyrTerms
			 }
		 }
		
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms]
	}
	
	/* Function to fetch all classes under the school. */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def classPerformanceGraph= {
		def classes = testService.classPerformanceRpt(params)
		render classes as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	 def classDivPerformRpt = {
		 def classDivs = testService.classDivPerformRpt(params)
		 render classDivs as JSON
	 }
	 
	 @Secured(['IS_AUTHENTICATED_FULLY'])
	 def classDivSubjPerformRpt = {
		 def classDivSubjs = testService.classDivSubjPerformRpt(params)
		 render classDivSubjs as JSON
	 }
	 
	 @Secured(['IS_AUTHENTICATED_FULLY'])
	 def clsDivSubAssessRpt = {
		 def clsDivSubAssess = testService.clsDivSubAssessRpt(params)
		 render clsDivSubAssess as JSON
	 }
	 
	 @Secured(['IS_AUTHENTICATED_FULLY'])
	 def clsDivSubjAssessments = {
		 def clsDivSubAssessments = testService.clsDivSubjAssessments(params)
		 render clsDivSubAssessments as JSON
	 }
	 
	 @Secured(['IS_AUTHENTICATED_FULLY'])
	 def clsDivSubjFaActivities = {
		 def clsDivSubFaActScores = testService.clsDivSubjFaActivities(params)
		 render clsDivSubFaActScores as JSON
	 }
	 
	 def studSubjFaActivities = {
		 def studSubjFaActivityScore = testService.studSubjFaActivities(params)
		 render studSubjFaActivityScore as JSON
	 }
	 
	 
	 def clsDivSubjSaActivities = {
		 def clsDivSubjSaActivities = testService.clsDivSubjSaActivities(params)
		 render clsDivSubjSaActivities as JSON
	 }
	 
	 def studSubjSaActivities = {
		 def studSubjSaActivities = testService.studSubjSaActivities(params)
		 render studSubjSaActivities as JSON
	 }
	 
	 
	/* Fetch gsp page to view teacher performance of class. */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherClassPerformanceReport = {
		List<String> role = testService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = testService.rUserSchoolGroup(session.user_Id.toInteger())
//		def school = utilService.rUserSchool(session.user_Id.toInteger())
		def currentAcYr,acyrTerms,currentAcYear,classes,school
		 params.schoolId = session.school_Id.toInteger()
//		acyrTerms = dataAdminService.retAcYrAndTerms(params.schoolId.toInteger())
//		def currentAcYear = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
//		def classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYear.id.toInteger())
		 role.each{ roles->
			 if(roles.equals("ROLE_ADMIN".toString())){
				 currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				 school = testService.rUserSchool(session.user_Id.toInteger())
				 acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				 classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
			 }
			 if(roles.equals("ROLE_SCHOOLS_MANAGER".toString())){
				 currentAcYr = utilService.retCurrentAcYear()
				 school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				 params.schoolId = school.School1.SchoolId.toInteger()
				 session.school_Id = school.School1.SchoolId.toInteger()
				 acyrTerms = testService.retTerms(currentAcYr.id.toInteger())
				 classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
			 }
		 }
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes]
	}
	
	/* Retrieve average mark of all subject a teacher teaches in the selected class. */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherClassPerformanceRpt= {
		def teachers = testService.teacherClassPerformanceRpt(params)
		render teachers as JSON
	}
	 
	@Secured(['IS_AUTHENTICATED_FULLY'])
	 def rSchoolClassDivisions = {
		 def division = testService.rSchoolClassDivisions(params.schoolClassId.toInteger())
		 render division as JSON
	 }
	 
	 	/* Fetch gsp page to show percentage of mark entry done on each FA/SA. */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherMarkEntryStatusReport = {
		def division
		List<String> role = testService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = testService.rUserSchoolGroup(session.user_Id.toInteger())
		def currentAcYr,acyrTerms,school,currentAcYear,classes
		 params.schoolId = session.school_Id.toInteger()
		 
		 role.each{ roles->
			 if(roles.equals("ROLE_SCHOOLS_MANAGER")){
				 currentAcYr = utilService.retCurrentAcYear()
				 school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				 params.schoolId = school.School1.SchoolId.toInteger()
				 session.school_Id = school.School1.SchoolId.toInteger()
				 classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
				 if(classes.class1."totDiv".toInteger() == 0){
					 flash.msgStatus = true
					 flash.message = "please add divisions for school classes"
					 redirect(action:"schoolSettings")
				 }
				 def clholdKey = (classes.keySet() as List).get(0)
				 params.classMasterId = classes."${clholdKey}".classMasterId.toInteger()
				 params.schoolClassId = (SchoolClassRel.find("from SchoolClassRel where school= '"+session.school_Id.toInteger()+"' and className= '"+params.classMasterId.toInteger()+"' and academicYr= '"+currentAcYr.id.toInteger()+"'"))?.id
				 
				 division = testService.rSchoolClassDivisions(params.schoolClassId.toInteger())
				 return true
			 }
			 if(roles.equals("ROLE_ADMIN".toString())){
				 params.schoolId = session.school_Id.toInteger()
				 school = testService.rUserSchool(session.user_Id.toInteger())
				 currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				 acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				 classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
				 if(classes.class1."totDiv".toInteger() == 0){
					 flash.msgStatus = true
					 flash.message = "please add divisions for school classes"
					 redirect(action:"schoolSettings")
				 }
				 def clholdKey = (classes.keySet() as List).get(0)
				 params.classMasterId = classes."${clholdKey}".classMasterId.toInteger()
				 params.schoolClassId = (SchoolClassRel.find("from SchoolClassRel where school= '"+session.school_Id.toInteger()+"' and className= '"+params.classMasterId.toInteger()+"' and academicYr= '"+currentAcYr.id.toInteger()+"'"))?.id
				 
				 division = testService.rSchoolClassDivisions(params.schoolClassId.toInteger())
				return true
			 }
		}
		
		def types = testService.rAllAssessmentTypes()
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes,division:division,assmtType:types]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes,division:division,assmtType:types]
	}
	
	/* Shows percentage of mark entry done for each FA/SA. */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherMarkEntryStatus= {
		def teachers = testService.teacherMarkEntryStatus(params)
		render teachers as JSON
	}
	 
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def studPositionReport = {
		List<String> role = utilService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		def currentAcYr,acyrTerms , school , classes , currentAcYear
		 params.schoolId = session.school_Id.toInteger()
		role.each{ roles->
			if(roles.equals("ROLE_ADMIN".toString())){
				currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				school = utilService.rUserSchool(session.user_Id.toInteger())
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
			}
			if(roles.equals("ROLE_SCHOOLS_MANAGER".toString())){
				currentAcYr = utilService.retCurrentAcYear()
				school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				params.schoolId = school.School1.SchoolId.toInteger()
				session.school_Id = school.School1.SchoolId.toInteger()
				acyrTerms = testService.retTerms(currentAcYr.id.toInteger())
				classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
			}
		}
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def stdFinalPositionRpt = {
		def students = testService.stdFinalPositionRpt(params)
		render(template:"/CCE/studPositionTemplate",model:[students:students])
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def studPositionReportGraph = {
		//List<String> role = testService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = testService.rUserSchoolGroup(session.user_Id.toInteger())
		def school = testService.rUserSchool(session.user_Id.toInteger())
		School schoolName = School.get(params."schoolId".toInteger())
		ClassMaster seleClass = ClassMaster.get(params."classMasterId".toInteger())
		def classId = seleClass.id
		def className = seleClass.className
		AcademicYear acYr = AcademicYear.get(params."academicYrId".toInteger())
		def acdYrId = acYr.id
		def acYrName = acYr.startYear +" - " + acYr.endYear
		def currentAcYr,acyrTerms
		//params.schoolId =42
		acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
		def subjName = [] , subjMark = [];
		def students = testService.stdSubjsAvgScores(params)
		def studPosition = students.studSubjPosition
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,studentId:params.studentId,studentName:params.studentName,className:className,classId:classId,acdYrId:acdYrId,acYrName:acYrName,studentPosition:studPosition,name:"Student_1"]
		}
		else
			[schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,studentId:params.studentId,studentName:params.studentName,className:className,classId:classId,acdYrId:acdYrId,acYrName:acYrName,studentPosition:studPosition,name:"Student_1"]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def stdSubjsAvgScores= {
		def subjName = [] , subjMark = [];
		def students = testService.stdSubjsAvgScores(params)
		students.studSubjFinScores.each(){stud->
			stud.value.each(){studMark->
			subjName.add(studMark.key)
			subjMark.add(studMark.value)
			}
		}
		def studPosition = students.studSubjPosition
		def studentArray = [subjName:subjName , subjMark:subjMark]
		def ret = [studentArray: studentArray, studPosition: students.studSubjPosition1]
		render ret as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def subjectAnalysis = {
		params.academicYrId=1
		params.classMasterId=5
		params.schoolId=42
		forward(action:"classSubjectsAnalysis", params:params)
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def classPerformance = {
		params.academicYrId=1
		params.classMasterId=5
		params.schoolId=42
		forward(action:"teacherClassPerformanceRpt", params:params)
	}	
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def studOptionalSubjReport = {
		def division
		Map zoneList=[:]
		def selZone, zoneHoldKey
		List<String> role = testService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = testService.rUserSchoolGroup(session.user_Id.toInteger())
		def school = testService.rUserSchool(session.user_Id.toInteger())
		def currentAcYr,acyrTerms,currentAcYear,classes
		 params.schoolId = session.school_Id.toInteger()

		 
		role.each{ roles->
			if(roles.equals("ROLE_CCEADMIN")){
				//				print "role cce admin"
				zoneList = cceReportService.retAllZones()
				acyrTerms = testService.retAcYrAndTermsForCbseAdmin(0)
				if(!params.zoneId){
					if(zoneList.zones.size() >= 1){
						zoneHoldKey = (zoneList.zones.keySet() as List).get(0)
						params.zoneId =  zoneList.zones."${zoneHoldKey}".zoneId.toInteger()
						selZone = params.zoneId
					}
				}
				else{
					selZone = params.zoneId
				}
				classes=[totClass:0]
				return true
			}
			else if(roles.equals("ROLE_SCHOOLS_MANAGER")){
				currentAcYr = utilService.retCurrentAcYear()
				school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				params.schoolId = school.School1.SchoolId.toInteger()
				session.school_Id = school.School1.SchoolId.toInteger()
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger()) //testService.retTerms(currentAcYr.id.toInteger())
				//acyrTerms = testService.retTerms(currentAcYr.id.toInteger())
				classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
				if(classes.class1."totDiv".toInteger() == 0){
					flash.msgStatus = true
					flash.message = "please add divisions for school classes"
					redirect(action:"schoolSettings")
				}
				def clholdKey = (classes.keySet() as List).get(0)
				params.classMasterId = classes."${clholdKey}".classMasterId.toInteger()
				params.schoolClassId = (SchoolClassRel.find("from SchoolClassRel where school= '"+session.school_Id.toInteger()+"' and className= '"+params.classMasterId.toInteger()+"' and academicYr= '"+currentAcYr.id.toInteger()+"'"))?.id

				division = testService.rSchoolClassDivisions(params.schoolClassId.toInteger())
				//				terms = acyrTerms.acYrTerm as JSON
				return true
			}
			else if(roles.equals("ROLE_ADMIN".toString())){
				params.schoolId = session.school_Id.toInteger()
				school = testService.rUserSchool(session.user_Id.toInteger())
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
				if(classes.class1."totDiv".toInteger() == 0){
					flash.msgStatus = true
					flash.message = "please add divisions for school classes"
					redirect(action:"schoolSettings")
				}
				def clholdKey = (classes.keySet() as List).get(0)
				params.classMasterId = classes."${clholdKey}".classMasterId.toInteger()
				params.schoolClassId = (SchoolClassRel.find("from SchoolClassRel where school= '"+session.school_Id.toInteger()+"' and className= '"+params.classMasterId.toInteger()+"' and academicYr= '"+currentAcYr.id.toInteger()+"'"))?.id

				return true
			}
		}
		
		def types = testService.rAllAssessmentTypes()
		if(request.xhr){
			[isAjax:true,zoneList: zoneList, selZone: selZone, role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes,division:division,assmtType:types]
		}
		else
			[zoneList: zoneList, selZone: selZone,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes,division:division,assmtType:types]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def stdFinalOptionalSubjRpt= {
		def students = testService.stdFinalOptionalSubjRpt(params)
		render students as JSON
//		render(template:"/CCE/optionalSubjTemplate",model:[students:students.ret])
	}

	@Secured(['IS_AUTHENTICATED_FULLY'])
	def OptionalSubjStdList= {
		def students = testService.OptionalSubjStdList(params)
		//print "studentsList ="+students
		render(template:"/CCE/optionalSubjTemplate",model:[students:students])
	}
	
	/* Report to view list of teachers who have transferred from a particular school. */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherTransferReport = {
		List<String> role = testService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = testService.rUserSchoolGroup(session.user_Id.toInteger())
//		def school = utilService.rUserSchool(session.user_Id.toInteger())
		def currentAcYr,acyrTerms,school,currentAcYear
		 params.schoolId = session.school_Id.toInteger()
//		acyrTerms = dataAdminService.retAcYrAndTerms(params.schoolId.toInteger())
//		def currentAcYear = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
		
		role.each{ roles->
			if(roles.equals("ROLE_ADMIN".toString())){
				currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				school = testService.rUserSchool(session.user_Id.toInteger())
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
			}
			if(roles.equals("ROLE_SCHOOLS_MANAGER".toString())){
				currentAcYr = utilService.retCurrentAcYear()
				school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				params.schoolId = school.School1.SchoolId.toInteger()
				session.school_Id = school.School1.SchoolId.toInteger()
				acyrTerms = testService.retTerms(currentAcYr.id.toInteger())
			}
		}
		
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherFinalTransferRpt = {
		def students = testService.teacherFinalTransferRpt(params)
		render(template:"/CCE/teacherTransferTemplate",model:[students:students])
	}
	
	
	/* Report to view the list of students transferred in a particular class. */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def studTransferReport = {
		List<String> role = testService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = testService.rUserSchoolGroup(session.user_Id.toInteger())
//		def school = utilService.rUserSchool(session.user_Id.toInteger())
		def currentAcYr,acyrTerms,school,currentAcYear,classes
//		acyrTerms = dataAdminService.retAcYrAndTerms(params.schoolId.toInteger())
//		def currentAcYear = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
//		def classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYear.id.toInteger())
		 role.each{ roles->
			 if(roles.equals("ROLE_ADMIN".toString())){
				 params.schoolId = session.school_Id.toInteger()
				 currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				 school = testService.rUserSchool(session.user_Id.toInteger())
				 acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				 classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
			 }
			 if(roles.equals("ROLE_SCHOOLS_MANAGER".toString())){
				 currentAcYr = utilService.retCurrentAcYear()
				 school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				 params.schoolId = school.School1.SchoolId.toInteger()
				 session.school_Id = school.School1.SchoolId.toInteger()
				 acyrTerms = testService.retTerms(currentAcYr.id.toInteger())
				 classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
			 }
		 }
		 
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes]
	}
	
	
	/* Retrieve student list who have been given TC studentTcEditReports. */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def stdFinalTransferRpt = {
		def students = testService.stdFinalTransferRpt(params)
		render(template:"/CCE/studTransferTemplate",model:[students:students,rptFormat:params.rptFormat])
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def schlPerfOverview(){
		if(session.getAttribute("schoolsData")==null)
		session.setAttribute("schoolsData",schools.setBaseString());
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def getSchools(){
		def schoolsData=JSON.parse(session.getAttribute("schoolsData").toString());
/*		def zoneName="South Zone";
		def regionName="Chennai";
		def clusterName="Cluster VI";
		def stateName="Kerala";
		def districtName="Trivandrum";
		def zoneId="2".toLong();
		def regionId="3".toLong();
		def clusterId="6".toLong();
		def clusterStateId="18".toLong();
		def districtId="366".toLong();
*/
		def zoneName=params.zoneName;
		def regionName=params.regionName;
		def clusterName=params.clusterName;
		def stateName=params.stateName;
		def districtName=params.districtName;
		def zoneId=params.zoneId.toLong();
		def regionId=params.regionId.toLong();
		def clusterId=params.clusterId.toLong();
		def clusterStateId=params.clusterStateId.toLong();
		def districtId=params.districtId.toLong();
		
		if(schoolsData["schoolsData"].zones[zoneName].regions[regionName].clusters[clusterName].states[stateName].districts[districtName].schools != null){
			def schoolsMap=JSON.parse((schools.getSchools(zoneId,regionId,clusterId,clusterStateId,districtId)).toString());
			schoolsData["schoolsData"].zones[zoneName].regions[regionName].clusters[clusterName].states[stateName].districts[districtName].putAt("schools",schoolsMap)
			session.setAttribute("schoolsData",schoolsData);
			render(schoolsData.toString());
			//redirect action:"getSchoolDetails"
	//		render(view:"/subjectClass");
		}
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def getSchoolDetails(){
		def schoolsAllData=JSON.parse(session.getAttribute("schoolsData").toString());
/*		def zoneName="South Zone";
		def regionName="Chennai";
		def clusterName="Cluster VI";
		def stateName="Kerala";
		def districtName="Trivandrum";
		def schoolId="42".toLong();
		def year="2013";
*/
		def zoneName=params.zoneName;
		def regionName=params.regionName;
		def clusterName=params.clusterName;
		def stateName=params.stateName;
		def districtName=params.districtName;
		def schoolId=params.schoolId.toLong();
		def year=params.year;
		
		def schoolDataMap=JSON.parse((schools.getSchoolData(schoolId,year)).toString());
		schoolsAllData["schoolsData"].zones[zoneName].regions[regionName].clusters[clusterName].states[stateName].districts[districtName].schools[schoolId.toString()].acadHistory[year.toString()].putAt("classes",schoolDataMap);
	   session.setAttribute("schoolsData",schoolsAllData);
	   render(schoolsAllData.toString());
	}
	
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def overviewChart(){}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def classChart(){
		def userName=springSecurityService.authentication.name;
		if(userName==null){
			redirect(controller: 'login', action: 'index')
		}
		else{
		def user=User.findByUsername(userName);
		UserRole userRoleObj=UserRole.findByUser(user);
		Role userRole=Role.find(userRoleObj.role);
		if(userRole.authority.equals("ROLE_TEACHER"))
		{
			if(session.getAttribute("teacherData")==null){
				TeacherReportService teacher=new TeacherReportService();
				def jTeacher=teacher.getTeacherHistory(userName,10);
				session.setAttribute("teacherData", jTeacher);
			}
		}
	  }
	
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def getTeacherOneYr(){
		String year=params.year.toString();
		def userName=springSecurityService.authentication.name;
		TeacherReportService teacher=new TeacherReportService();
		def teacherData=JSON.parse(session.getAttribute("teacherData").toString());
			teacher.setTeacher(userName);
			def tOneData=teacher.getTeacherOneYrDtls(year.toInteger());
				if(tOneData!=null){
				def oneYrRec=JSON.parse((tOneData as JSON).toString());
				if(oneYrRec!=null){
				teacherData[userName].acadHistory[year].putAt("subjects",oneYrRec);
				session.setAttribute("teacherData", teacherData);
				}
			}
			render(teacherData.toString());
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def subjectClass(){
		Map zoneList=[:]
		def selZone, zoneHoldKey
		List<String> role = testService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = testService.rUserSchoolGroup(session.user_Id.toInteger())
		def school = testService.rUserSchool(session.user_Id.toInteger())
		def currentAcYr,acyrTerms,currentAcYear,classes
		 params.schoolId = session.school_Id.toInteger()
		role.each{ roles->
			if(roles.equals("ROLE_CCEADMIN")){
				zoneList = cceReportService.retAllZones()
				acyrTerms = testService.retAcYrAndTermsForCbseAdmin(0)
				if(!params.zoneId){
					if(zoneList.zones.size() >= 1){
						zoneHoldKey = (zoneList.zones.keySet() as List).get(0)
						params.zoneId =  zoneList.zones."${zoneHoldKey}".zoneId.toInteger()
						selZone = params.zoneId
					}
				}
				else{
					selZone = params.zoneId
				}
				
				classes=[totClass:0]
				return true
			}
		}
		
		def types = testService.rAllAssessmentTypes()
		if(session.getAttribute("schoolsData")==null)
		session.setAttribute("schoolsData",schools.setBaseString());
		if(request.xhr){
			[isAjax:true,zoneList: zoneList,selZone: selZone, role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes,assmtType:types]
		}
		else
			[zoneList: zoneList,selZone: selZone,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes,assmtType:types]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def trend() {}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def classOverview() {}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def classOverviewPerf() {
		def userName=springSecurityService.authentication.name;
		if(session.getAttribute("schclassData")==null)
		session.setAttribute("schclassData",classReportService.getClassDetails(userName));
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def firstChartMethod(){
		def user_name =springSecurityService.authentication.name;
		List year=[]
		def flag=0
		if(params.year1!=null){
			for ( i in params.year1..params.year2 ) {
				year.push(i)
			}
		}
		else{
			year.push(params.AcademicYear)
		}
	
		def jsonString=JSON.parse(session.getAttribute("schclassData").toString())
		for(int j=0;j<year.size();j++){
			if(jsonString[user_name]?.acadHistory[year[j]]!=null){
			jsonString[user_name]?.acadHistory[year[j]]?.classes[params.classType]?.divisions[params.divisionType]?.subjects.each {
			if((it.value.students).equals(null)){
				flag=1
			}
		  }
		}
		if(flag==1){
			def data=classReportService.appendData(year[j],params.classType,params.divisionType,user_name)
			jsonString[user_name]?.acadHistory[year[j]]?.classes[params.classType]?.divisions[params.divisionType]?.putAt("subjects",JSON.parse(data.toString()))
			
		}
		}
		if(flag==1){
		session.setAttribute("schclassData", jsonString);
		}
		render(jsonString.toString());
		
	  }
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def overview(){
		def userName=springSecurityService.authentication.name;
		if(userName==null){
			redirect(controller: 'login', action: 'index')
		}
		else{
		def user=User.findByUsername(userName);
		UserRole userRoleObj=UserRole.findByUser(user);
		Role userRole=Role.find(userRoleObj.role);
		if(userRole.authority.equals("ROLE_TEACHER"))
		{
			if(session.getAttribute("teacherData")==null){
				TeacherReportService teacher=new TeacherReportService();
				def jTeacher=teacher.getTeacherHistory(userName,10);
				session.setAttribute("teacherData", jTeacher);
			}
		}
	  }
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def performanceBased(){
		def userName=springSecurityService.authentication.name;
		user_name=userName;		
		def user=User.findByUsername(userName);		
		UserRole userRoleObj=UserRole.findByUser(user);
		Role userRole=Role.find(userRoleObj?.role);		//in this line null pointer exception is occured when session timeout
		if(userRole?.authority.equals("ROLE_TEACHER"))
		{
			if(session.getAttribute("schclassData")==null){				
				def jClassDetails=classReportService.getClassDetails(userName);
				session.setAttribute("schclassData", jClassDetails);				
			}		
		}	
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def nationWideSchools(){
//		print "params="+params
		Map zoneList=[:]
		def selZone, zoneHoldKey
		List<String> useroles = testService.rUserRoles()
		useroles.each{roles->
			if(roles.equals("ROLE_CCEADMIN")){
//				print "role cce admin"
				zoneList = cceReportService.retAllZones()
				if(!params.zoneId){
					if(zoneList.zones.size() >= 1){
						zoneHoldKey = (zoneList.zones.keySet() as List).get(0)
						params.zoneId =  zoneList.zones."${zoneHoldKey}".zoneId.toInteger()
						selZone = params.zoneId
					}
				}
				else{
					selZone = params.zoneId
				}
				return true
			}
		}
//		print "params="+params
//		print "zoneList="+zoneList
		
		if(request.xhr){
			[isAjax: true,zoneList: zoneList, selZone: selZone]
		}
		else{
			[zoneList: zoneList, selZone: selZone]
		}

	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def nationSchools = {
//		print session
//		des.fillSchoolCategory()
		params.put('user_Id',session.user_Id)
		def schools = newReportService.nationWideSchoolsRpt(params)
		
//		def schools=["boys":[10,45,35,12,78], "girls":[45,78,10,78,35], "coed":[35,12,45,78,12]]
		render schools as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def nationWideStudents(){
//		print "params="+params
		Map zoneList=[:]
		def selZone, zoneHoldKey
		List<String> useroles = testService.rUserRoles()
		useroles.each{roles->
			if(roles.equals("ROLE_CCEADMIN")){
//				print "role cce admin"
				zoneList = cceReportService.retAllZones()
				if(!params.zoneId){
					if(zoneList.zones.size() >= 1){
						zoneHoldKey = (zoneList.zones.keySet() as List).get(0)
						params.zoneId =  zoneList.zones."${zoneHoldKey}".zoneId.toInteger()
						selZone = params.zoneId
					}
				}
				else{
					selZone = params.zoneId
				}
				return true
			}
		}
//		print "params="+params
//		print "zoneList="+zoneList
		
		if(request.xhr){
			[isAjax: true,zoneList: zoneList, selZone: selZone]
		}
		else{
			[zoneList: zoneList, selZone: selZone]
		}

	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def nationStudents = {
//		print session
//		des.fillSchoolCategory()
		params.put('user_Id',session.user_Id)
		def schools = newReportService.nationWideStudentsRpt(params)
		
//		def schools=["boys":[10,45,35,12,78], "girls":[45,78,10,78,35], "coed":[35,12,45,78,12]]
		render schools as JSON
	}	
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def nationSchoolRating(){
//		print "params="+params
		Map zoneList=[:]
		def selZone, zoneHoldKey
		List<String> useroles = testService.rUserRoles()
		useroles.each{roles->
			if(roles.equals("ROLE_CCEADMIN")){
//				print "role cce admin"
				zoneList = cceReportService.retAllZones()
				if(!params.zoneId){
					if(zoneList.zones.size() >= 1){
						zoneHoldKey = (zoneList.zones.keySet() as List).get(0)
						params.zoneId =  zoneList.zones."${zoneHoldKey}".zoneId.toInteger()
						selZone = params.zoneId
					}
				}
				else{
					selZone = params.zoneId
				}
				return true
			}
		}
//		print "params="+params
//		print "zoneList="+zoneList
		
		if(request.xhr){
			[isAjax: true,zoneList: zoneList, selZone: selZone]
		}
		else{
			[zoneList: zoneList, selZone: selZone]
		}
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def schoolRating = {
//		print session
//		des.fillSchoolCategory()
		params.put('user_Id',session.user_Id)
		def schools = newReportService.nationWideSchoolRating(params)
		
//		def schools=["boys":[10,45,35,12,78], "girls":[45,78,10,78,35], "coed":[35,12,45,78,12]]
		render schools as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def religion(){
//		print "params="+params
		Map zoneList=[:]
		def selZone, zoneHoldKey
		List<String> useroles = testService.rUserRoles()
		useroles.each{roles->
			if(roles.equals("ROLE_CCEADMIN")){
//				print "role cce admin"
				zoneList = cceReportService.retAllZones()
				if(!params.zoneId){
					if(zoneList.zones.size() >= 1){
						zoneHoldKey = (zoneList.zones.keySet() as List).get(0)
						params.zoneId =  zoneList.zones."${zoneHoldKey}".zoneId.toInteger()
						selZone = params.zoneId
					}
				}
				else{
					selZone = params.zoneId
				}
				return true
			}
		}
//		print "params="+params
//		print "zoneList="+zoneList
		
		if(request.xhr){
			[isAjax: true,zoneList: zoneList, selZone: selZone]
		}
		else{
			[zoneList: zoneList, selZone: selZone]
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def religionReport = {
//		print session
//		des.fillSchoolCategory()
		params.put('user_Id',session.user_Id)
		def religionDistribution = newReportService.religionRpt(params)
//		print religionDistribution
//		def schools=["boys":[10,45,35,12,78], "girls":[45,78,10,78,35], "coed":[35,12,45,78,12]]
		render religionDistribution as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def rZoneRegion = {
		def regions = cceReportService.rZoneRegion(params)
		//print "regions = "+regions
		render regions as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def rZoneRegionClusters ={
		def clusters = cceReportService.rZoneRegionClusters(params)
		//print "clusters = "+clusters
		render clusters as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def rClusterStates={
		def states = cceReportService.retAllClusterStates(params)
		//print "clusters = "+clusters
		render states as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def rSchoolsUnderCluster = {
		//println "rSchoolsUnderCluster params="+params
		def schools = cceReportService.rSchoolsUnderCluster(params)
		//print schools
		render schools as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def rSchoolClass={
		//println "rSchoolClass params="+params
		def schoolClasses = utilService.rSchoolClasses(params)
		render schoolClasses as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def rSchoolsForCbseAdminUnderGroup = {
		def schlGrpId = params.sId.toInteger()
		def schools = cceReportService.listAllSchlsUndrSchlGrpForCbseAdmin(schlGrpId)
		render schools as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def subjClassWisePerfGraph = {
		//println "params="+params
		def studMarks = newReportService.subjectWiseClassPerfRpt(params)
		//print studMarks
		render studMarks as JSON
	}
	
		
}
