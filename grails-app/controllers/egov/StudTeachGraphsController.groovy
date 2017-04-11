package egov

import java.util.Map;

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

class StudTeachGraphsController {
	
	CceReportService cceReportService = new CceReportService()
	NewReportService nrs = new NewReportService()
	TestService testService = new TestService()
	UtilService utilService = new UtilService()
	DataEntryService des = new DataEntryService() 
    def index() { }
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def cgpaWise() {
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
				  acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger()) 
				  classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
			  }
		}
		
		if(request.xhr){
			[isAjax:true,zoneList: zoneList, selZone: selZone, role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes]
		}
		else
			[zoneList: zoneList, selZone: selZone,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes]
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teachStat() {
		def acyrTerms,currentAcYr,userSG,userS,schoolId,schools , school
		Map zoneList=[:], regionList = [:], clusterList=[:], stateList=[:]
		def selZone, selRegion, selCluster, zoneHoldKey, regionHoldKey, clusterHoldKey
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		List<String> useroles = testService.rUserRoles()
		Map finalUserInstance= [:]
		useroles.each{roles->
			if(roles.equals("ROLE_CCEADMIN")){
				acyrTerms = testService.retAcYrAndTermsForCbseAdmin(0)
//				println "acyrTerms="+acyrTerms
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
				regionList = cceReportService.retAllZoneRegions(params)
				if(params.zoneId && !params.regionId){
					if(regionList.regions.size() >= 1){
						regionHoldKey = (regionList.regions.keySet() as List).get(0)
						params.regionId = regionList.regions."${regionHoldKey}".regionId.toInteger()
						selRegion = params.regionId
					}
					
				}
				else{
					selRegion = params.regionId
				}
				
				clusterList = cceReportService.retAllZoneRegionClusters(params)
				if(params.zoneId && params.regionId && !params.clusterId){
					if(clusterList.clusters.size() >= 1){
						clusterHoldKey = (clusterList.clusters.keySet() as List).get(0)
						params.clusterId = clusterList.clusters."${clusterHoldKey}".clusterId.toInteger()
						selCluster = params.clusterId
					}
				}
				else{
					selCluster = params.clusterId
				}
				if(params.zoneId && params.regionId && params.clusterId){
					stateList = cceReportService.retAllClusterStates(params)
				}
				return true
			}
			if(roles.equals("ROLE_SCHOOLS_MANAGER")){
				currentAcYr = utilService.retCurrentAcYear()
				school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				params.schoolId = school.School1.SchoolId.toInteger()
				session.school_Id = school.School1.SchoolId.toInteger()
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
			}
			if(roles.equals("ROLE_ADMIN".toString())){
				params.schoolId = session.school_Id.toInteger()
				userSG = utilService.rUserSchoolGroup(session.user_Id.toInteger())
				userS = utilService.rUserSchool(session.user_Id.toInteger())
				school = utilService.rUserSchool(session.user_Id.toInteger())
				schoolId = school.Schoolid.toInteger()
				acyrTerms = testService.retAcYrAndTermsForCbseAdmin(params.schoolId)
				return true
			}
		}
		 if(request.xhr){
			 [isAjax: true,schoolGp:schoolGp,school:school,acyrTerms:acyrTerms,userSG:userSG,userS:userS,zoneList: zoneList, regionList: regionList, clusterList: clusterList, stateList:stateList, selZone: selZone, selRegion: selRegion, selCluster:selCluster]
		 }
		 else{
			 [schoolGp:schoolGp,school:school,acyrTerms:acyrTerms,userSG:userSG,userS:userS,zoneList: zoneList, regionList: regionList, clusterList: clusterList, stateList:stateList, selZone: selZone, selRegion: selRegion, selCluster:selCluster]
		 }
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def healthStat() {
		def acyrTerms,currentAcYr,userSG,userS,schoolId,school
		Map zoneList=[:], regionList = [:], clusterList=[:], stateList=[:]
		def selZone, selRegion, selCluster, zoneHoldKey, regionHoldKey, clusterHoldKey
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())		
		List<String> useroles = testService.rUserRoles()
		Map finalUserInstance= [:]
		useroles.each{roles->
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
				return true
			}
			if(roles.equals("ROLE_SCHOOLS_MANAGER")){
				currentAcYr = utilService.retCurrentAcYear()
				school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				params.schoolId = school.School1.SchoolId.toInteger()
				session.school_Id = school.School1.SchoolId.toInteger()
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
			}
			else if(roles.equals("ROLE_ADMIN".toString())){
				params.schoolId = session.school_Id.toInteger()
				userSG = utilService.rUserSchoolGroup(session.user_Id.toInteger())
				userS = utilService.rUserSchool(session.user_Id.toInteger())
				schoolId = session.school_Id.toInteger()
				acyrTerms = testService.retAcYrAndTermsForCbseAdmin(params.schoolId)
				return true
			}
			
		}
		
		def bloodGroups = BloodGrpMaster.getAll()
		def schoolGroups = utilService.listAllSchoolGroups()
		if(request.xhr){
			[isAjax: true,bloodGroups: bloodGroups,schoolGp:schoolGp,schoolGroups:schoolGroups,school:school,acyrTerms:acyrTerms,userSG:userSG,userS:userS,zoneList: zoneList,selZone: selZone]
		}
		else{
			[schoolGp:schoolGp,bloodGroups: bloodGroups,schoolGroups:schoolGroups,school:school,acyrTerms:acyrTerms,userSG:userSG,userS:userS,zoneList: zoneList, selZone: selZone]
		}
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def incomeWisePerf() { }
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def passPerf() {
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
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def heightVsWeight(){
		//print session
		def acyrTerms,currentAcYr,userSG,school,schoolId,classes,terms,division
		Map classList=[:], divisionList = [:]
		def selClass, selDivision, classHoldKey, divisionHoldKey
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		List<String> useroles = testService.rUserRoles()
		Map finalUserInstance= [:]
		useroles.each{roles->
			if(roles.equals("ROLE_SCHOOLS_MANAGER")){
				currentAcYr = utilService.retCurrentAcYear()
				school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				params.schoolId = school.School1.SchoolId.toInteger()
				session.school_Id = school.School1.SchoolId.toInteger()
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				terms = testService.retTerms(currentAcYr.id.toInteger())
				classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
				if(classes.class1."totDiv".toInteger() == 0){
					flash.msgStatus = true
					flash.message = "please add divisions for school classes"
					redirect(action:"schoolSettings")
				}
				def clholdKey = (classes.keySet() as List).get(0)
				params.classMasterId = classes."${clholdKey}".classMasterId.toInteger()
				params.schoolClassId = (SchoolClassRel.find("from SchoolClassRel where school= '"+session.school_Id.toInteger()+"' and className= '"+params.classMasterId.toInteger()+"' and academicYr= '"+currentAcYr.id.toInteger()+"'"))?.id
				
				division = utilService.rSchoolClassDivisions(params.schoolClassId.toInteger())
			}
			if(roles.equals("ROLE_ADMIN".toString())){
				params.schoolId = session.school_Id.toInteger()
				school = utilService.rUserSchool(session.user_Id.toInteger())
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				terms = testService.retTerms(currentAcYr.id.toInteger())
				classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
				if(classes.class1."totDiv".toInteger() == 0){
					flash.msgStatus = true
					flash.message = "please add divisions for school classes"
					redirect(action:"schoolSettings")
				}
				def clholdKey = (classes.keySet() as List).get(0)
				params.classMasterId = classes."${clholdKey}".classMasterId.toInteger()
				params.schoolClassId = (SchoolClassRel.find("from SchoolClassRel where school= '"+session.school_Id.toInteger()+"' and className= '"+params.classMasterId.toInteger()+"' and academicYr= '"+currentAcYr.id.toInteger()+"'"))?.id
				
				division = utilService.rSchoolClassDivisions(params.schoolClassId.toInteger())
				
				return true
			}
		}
		 if(request.xhr){
			 [isAjax: true,school:school,schoolGp:schoolGp,acyrTerms:acyrTerms,userSG:userSG,terms:terms,classes:classes,division:division]
		 }
		 else{
			 [schoolGp:schoolGp,school:school,acyrTerms:acyrTerms,userSG:userSG,terms:terms,classes:classes,division:division]
		 }
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])	
	def listAllSchoolClasses = {
		def academicYrId = params.acYrId.toInteger()
		def schoolId = params.school_Id.toInteger()
		def schoolClasses = utilService.listAllSchoolClasses(schoolId.toInteger(),academicYrId.toInteger())
		render schoolClasses as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def sports() {
		def acyrTerms,currentAcYr,userSG,userS,schoolId,school
		Map zoneList=[:], regionList = [:], clusterList=[:], stateList=[:]
		def selZone, selRegion, selCluster, zoneHoldKey, regionHoldKey, clusterHoldKey
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		List<String> useroles = testService.rUserRoles()
		Map finalUserInstance= [:]
		useroles.each{roles->
			if(roles.equals("ROLE_CCEADMIN")){
				acyrTerms = testService.retAcYrAndTermsForCbseAdmin(0)
//				println "acyrTerms="+acyrTerms
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
				regionList = cceReportService.retAllZoneRegions(params)
				if(params.zoneId && !params.regionId){
					if(regionList.regions.size() >= 1){
						regionHoldKey = (regionList.regions.keySet() as List).get(0)
						params.regionId = regionList.regions."${regionHoldKey}".regionId.toInteger()
						selRegion = params.regionId
					}
					
				}
				else{
					selRegion = params.regionId
				}
				
				clusterList = cceReportService.retAllZoneRegionClusters(params)
				if(params.zoneId && params.regionId && !params.clusterId){
					if(clusterList.clusters.size() >= 1){
						clusterHoldKey = (clusterList.clusters.keySet() as List).get(0)
						params.clusterId = clusterList.clusters."${clusterHoldKey}".clusterId.toInteger()
						selCluster = params.clusterId
					}
				}
				else{
					selCluster = params.clusterId
				}
				if(params.zoneId && params.regionId && params.clusterId){
					stateList = cceReportService.retAllClusterStates(params)
				}
				return true
			}
			if(roles.equals("ROLE_SCHOOLS_MANAGER")){
				currentAcYr = utilService.retCurrentAcYear()
				school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				params.schoolId = school.School1.SchoolId.toInteger()
				session.school_Id = school.School1.SchoolId.toInteger()
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
			}
			if(roles.equals("ROLE_ADMIN".toString())){
				params.schoolId = session.school_Id.toInteger()
				userSG = utilService.rUserSchoolGroup(session.user_Id.toInteger())
				userS = utilService.rUserSchool(session.user_Id.toInteger())
				schoolId = session.school_Id.toInteger()
				acyrTerms = testService.retAcYrAndTermsForCbseAdmin(params.schoolId)
				return true
			}
		}
		
		def sports = SportsMaster.getAll()
		def schoolGroups = utilService.listAllSchoolGroups()
		if(request.xhr){
			[isAjax: true,sports: sports,schoolGp:schoolGp,schoolGroups:schoolGroups,school:school,acyrTerms:acyrTerms,userSG:userSG,userS:userS,zoneList: zoneList, regionList: regionList, clusterList: clusterList, stateList:stateList, selZone: selZone, selRegion: selRegion, selCluster:selCluster]
		}
		else{
			[sports: sports,,schoolGp:schoolGp,schoolGroups:schoolGroups,school:school,acyrTerms:acyrTerms,userSG:userSG,userS:userS,zoneList: zoneList, regionList: regionList, clusterList: clusterList, stateList:stateList, selZone: selZone, selRegion: selRegion, selCluster:selCluster]
		}
		
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def schoolTeacherRating() {
		def acyrTerms,currentAcYr,userSG,userS,schoolId,school
		Map zoneList=[:], regionList = [:], clusterList=[:], stateList=[:]
		def selZone, selRegion, selCluster, zoneHoldKey, regionHoldKey, clusterHoldKey
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		List<String> useroles = testService.rUserRoles()
		Map finalUserInstance= [:]
		useroles.each{roles->
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
				return true
			}
			if(roles.equals("ROLE_SCHOOLS_MANAGER")){
				currentAcYr = utilService.retCurrentAcYear()
				school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				params.schoolId = school.School1.SchoolId.toInteger()
				session.school_Id = school.School1.SchoolId.toInteger()
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
			}
			else if(roles.equals("ROLE_ADMIN".toString())){
				params.schoolId = session.school_Id.toInteger()
				userSG = utilService.rUserSchoolGroup(session.user_Id.toInteger())
				userS = utilService.rUserSchool(session.user_Id.toInteger())
				schoolId = session.school_Id.toInteger()
				acyrTerms = testService.retAcYrAndTermsForCbseAdmin(params.schoolId)
				return true
			}
			
		}
		def schoolGroups = utilService.listAllSchoolGroups()
		if(request.xhr){
			[isAjax: true,schoolGp:schoolGp,schoolGroups:schoolGroups,school:school,acyrTerms:acyrTerms,userSG:userSG,userS:userS,zoneList: zoneList,selZone: selZone]
		}
		else{
			[schoolGp:schoolGp,schoolGroups:schoolGroups,school:school,acyrTerms:acyrTerms,userSG:userSG,userS:userS,zoneList: zoneList, selZone: selZone]
		}
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherRating = {
		params.put('userName', session.userName)
		def teachers
		params.put('user_Id',session.user_Id)
		teachers = nrs.teacherRatingStatistics(params)
//		println teachers
		render teachers as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherRatingList = {
	
		def teachers = nrs.teacherRatingList(params)
		render(template:"/studTeachGraphs/teacherRatingListTemplate",model:[ret:teachers])
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
	def rStatesUnderCluster = {
		def states = cceReportService.rStatesUnderCluster(params)
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
	def rSchoolsUnderClusterState = {
		//println "rSchoolsUnderClusterState params="+params
		def schools = cceReportService.rSchoolsUnderClusterState(params)
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
	def rSchoolClassDivisions={
		//println "rSchoolClass params="+params
		def classDivisions = utilService.rSchoolClassDivisions(params.schoolClassId)
		render classDivisions as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def rSchoolsForCbseAdminUnderGroup = {
		def schlGrpId = params.sId.toInteger()
		def schools = cceReportService.listAllSchlsUndrSchlGrpForCbseAdmin(schlGrpId)
		render schools as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def studPerfYrCatGen() { 
//		print "in studPerfYrCatGen"
		List<String> role = utilService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		def currentAcYr,acyrTerms , school , currentAcYear
		 params.schoolId = session.school_Id.toInteger()
		role.each{ roles->
			if(roles.equals("ROLE_CCEADMIN".toString())){
				currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				schoolGp = utilService.retAllSchoolGroups()
//				print "schoolGp = " +schoolGp
				params.schoolGrpId = schoolGp."groups"."SG1"."id".toInteger()
				school = utilService.retAllSchoolGroupSchools(params)
				//print "school = " +school
				params.schoolId = school."schools"."School1"."SchoolId".toInteger()
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
			}
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
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,studentId:params.studentId,studentName:params.studentName,name:"Student_1"]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,studentId:params.studentId,studentName:params.studentName,name:"Student_1"]
	}
	
	def rAllSchoolGroupSchools = {
		def schoolGrpId = params.schoolGrpId
		def schools=[:]
//		if(schoolGrpId.equals("-1")){
//			def school= utilService.listAllSchools()
//			def i=1
//			if(school){
//				school.each {x->
//					schools."School$i"=[SchoolId:x.id,schoolName:x.schoolName.toLowerCase(),schoolIdentifier:x.schoolIdentifier]
//					i+=1
//				}
//				schools."totSchools"= i -1
//			}
//		}
//		else 
		if(!schoolGrpId.equals("-1"))
		 	schools = utilService.listAllSchlsUndrSchlGrp(schoolGrpId.toInteger())
		render schools as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def retSchoolAcYrs = {
		def schoolId = params.schoolId.toInteger()
		def acyrTerms = [:]
		if(schoolId==-1) //for All schools
			acyrTerms = testService.retAcYrAndTermsForCbseAdmin(schoolId)
		else //for A particular schools
			acyrTerms = testService.retAcYrAndTerms(schoolId)
		render acyrTerms as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def yearwiseCategoryRpt = {
		def students = cceReportService.yearwiseTotalRpt(params)
		def studCategory = cceReportService.yearwiseCategoryRpt(params)
		def acYrArray = [students:students , studCategory:studCategory]
		render acYrArray as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def cgpawiseCategoryRpt = {
		def students = cceReportService.catwiseTotalRpt(params)
		render students as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def incomeWiseRpt = {
//		des.fillParentDetails()
		def incRange = cceReportService.incomewiseRangeRpt(params)
		def incCat = cceReportService.incomewiseCategoryRpt(params)
		def incGend = cceReportService.incomewiseGenderRpt(params)
		def acYrArray = [incRange:incRange,incCat:incCat,incGend:incGend];
		render acYrArray as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def passPerformanceRpt = {
		def students = cceReportService.passingPerformance(params)
//		println "students="+students
		render students as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def passPerformanceStudentRpt = {
		def students = cceReportService.passPerformanceStudentRpt(params)
		render(template:"/studTeachGraphs/passPerfStudentListTemplate",model:["ret":students])
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def vocEnrolmentRpt = {
		def students = cceReportService.vocationalEnrollment(params)
		render students as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def sportsStatisticsRpt = {
//		AcademicYear acYr = AcademicYear.get(1)
//		School school = School.get(42)
//		params.put('acdYr', acYr)
//		params.put('school', school)
		params.put('userName', session.userName)
//		des.fillStdSportsActRel()
//		nrs.updateSportsStatistics(params)
		params.put('user_Id',session.user_Id)
		def students = cceReportService.sportsStatistics(params)
		render students as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def sportsParticipationList = {
		def students = cceReportService.sportsParticipationList(params)
		render(template:"/studTeachGraphs/sportsParticipationListTemplate",model:[ret:students])
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def healthStatusRpt = {
		params.put('userName', session.userName)
//		des.fillStudentHealthStatus(params)
//		des.fillUserBloodGroup()
//		nrs.updateSchoolClsBloodGroupStatistics(params)
//		nrs.updateSchoolClsOralHygiene(params)
//		nrs.updateSchoolClsVision(params)
		def students, stds
		params.put('user_Id',session.user_Id)
		if(params.hParameter == "Blood Group"){
			students = cceReportService.bloodGrpStatistics(params)
//			students=['APositive': stds.'A+', 'BNegative': stds.'B-', 'ANegative': stds.'A-', 'BPositive': stds.'B+', 'ABPositive': stds.'AB+', 'ABNegative': stds.'AB-', 'ONegative': stds.'O-', 'OPositive': stds.'O+']
		}
		else if(params.hParameter == "Vision")
			students = cceReportService.visionStatistics(params)
		else if(params.hParameter == "Oral Hygiene"){
			students = cceReportService.oralStatistics(params)
		}
//		println students
		if(!students)
			students = ["No Students"]
		render students as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def bloodGroupStudentsList = {
		def students = cceReportService.bloodGroupStudentsList(params)
		render(template:"/studTeachGraphs/bloodGroupStudentsListTemplate",model:[ret:students])
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def studTeacherRpt = {
		params.put('user_Id',session.user_Id)
		
//		nrs.updateSchoolTeacherStudentRatio(params)
		def teacherStudRatio = cceReportService.teacherStudRatio(params)
		def teacherStudStat = cceReportService.teacherStudStat(params)
		def students = [teacherStudRatio:teacherStudRatio,teacherStudStat:teacherStudStat]
//		print students
		render students as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherTrainingRpt = {
		params.put('user_Id',session.user_Id)
//		des.fillTetQualifiedTeachers()
//		nrs.updateSchoolTeacherTrainingStat(params)
		def teachers=[:]
		teachers = cceReportService.trainedTeachers(params)
		render teachers as JSON
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def heightToWeight={
		def comparison=[:]
		comparison = nrs.genderBasedStdHeightToWeightRpt(params)
		render comparison as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def studRisk() { }
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def studTeachRatio() {
		//print session
		def acyrTerms,currentAcYr,userSG,school,schoolId,schools
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		List<String> useroles = testService.rUserRoles()
		Map finalUserInstance= [:]
		useroles.each{roles->
			if(roles.equals("ROLE_SCHOOLS_MANAGER")){
				currentAcYr = utilService.retCurrentAcYear()
				school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				params.schoolId = school.School1.SchoolId.toInteger()
				session.school_Id = school.School1.SchoolId.toInteger()
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
			}
			if(roles.equals("ROLE_ADMIN".toString())){
				params.schoolId = session.school_Id.toInteger()
				userSG = utilService.rUserSchoolGroup(session.user_Id.toInteger())
				school = utilService.rUserSchool(session.user_Id.toInteger())
				schoolId = school.Schoolid.toInteger()
				acyrTerms = testService.retAcYrAndTermsForCbseAdmin(params.schoolId)
				return true
			}
		}
		 if(request.xhr){
			 [isAjax: true,schoolGp:schoolGp,school:school,acyrTerms:acyrTerms,userSG:userSG]
		 }
		 else{
			 [schoolGp:schoolGp,school:school,acyrTerms:acyrTerms,userSG:userSG]
		 }
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def subjWisePerf() { }
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def vocEnrlmnt() { }
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def gradeDist(){
		List<String> role = utilService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		def currentAcYr,acyrTerms,terms,type,classDiv,classes,division,school
		Map classSubj = [:]
		role.each{ roles->
			if(roles.equals("ROLE_SCHOOLS_MANAGER")){
				currentAcYr = utilService.retCurrentAcYear()
				school = utilService.listAllSchlsUndrSchlGrp(schoolGp.Grpid.toInteger())
				params.schoolId = school.School1.SchoolId.toInteger()
				session.school_Id = school.School1.SchoolId.toInteger()
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				terms = testService.retTerms(currentAcYr.id.toInteger())
				classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
				
				return true
			}
			if(roles.equals("ROLE_ADMIN".toString())){
				params.schoolId = session.school_Id.toInteger()
				school = utilService.rUserSchool(session.user_Id.toInteger())
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				terms = testService.retTerms(currentAcYr.id.toInteger())
				classes = utilService.listAllSchoolClasses(session.school_Id.toInteger(),currentAcYr.id.toInteger())
				return true
			}
			
		}
	
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,terms:terms,classes:classes,division:division,classDiv:classDiv,classSubj:classSubj]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,terms:terms,classes:classes,division:division,classDiv:classDiv,classSubj:classSubj]

	}
	
	/* Retrieve subjects for a particular school class. */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def rSubjectsForSchoolClass = {
		Map qnAttributes = params
		def schoolClassSubjects = utilService.rSubjectsForSchoolClass(qnAttributes)
		if(schoolClassSubjects.equals([:]))
			schoolClassSubjects=null
		render schoolClassSubjects as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def stdGradeDist (){
//		println "stdGradeDist params="+params
		def studSubjPer = cceReportService.studSubjPer(params)
		render studSubjPer as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def studPerf(){
		List<String> role = utilService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		def currentAcYr,acyrTerms , school , classes , currentAcYear
		def terms,type,classDiv,division
		Map classSubj = [:]
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
			if(roles.equals("ROLE_TEACHER")){
				params.schoolId = session.school_Id.toInteger()
				school = utilService.rUserSchool(session.user_Id.toInteger())
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())

				def acyrholdKey = (acyrTerms?.acYrTerm?.keySet() as List).get(0)
				def acYrId
				if(currentAcYr.id)
					acYrId = currentAcYr.id
				else
					acYrId = (acyrTerms?.acYrTerm?."${acyrholdKey}"?.academicYrId?.toInteger())

				params.acYr = params.acYr ?: acYrId
				params.acYr = params.acYr ?:currentAcYr.id
				terms = testService.retTerms(params.acYr.toInteger())
				def termlholdKey = (terms.terms.keySet() as List).get(0)
				params.term = params.term ?: (terms.terms."${termlholdKey}".termId.toInteger())

				classDiv = utilService.rTeacherClassDivSubjects(params.schoolId.toInteger(), session.user_Id.toInteger(),params.acYr.toInteger())
				if(classDiv.message!=null){
					render(view:"/login/denied.gsp", model:[message:classDiv.message])
				}
				else{
					classDiv = classDiv.teacher
					def classholdKey = (classDiv.classes.keySet() as List).get(0)
					params.cm = params.cm ?: (classDiv.classes."${classholdKey}".classId.toInteger())
					def divholdKey = (classDiv.classes.keySet() as List).get(0)
					params.divId = params.divId ?: (classDiv.classes."${divholdKey}".divisionId.toInteger())
					def j=1
					classSubj.subList = [:]
					classDiv.totClass.toInteger().times{
						def key = "class"+"$j"
						def cmId = classDiv.classes."$key".classId
						def divId = classDiv.classes."$key".divisionId
						classSubj."totSub" = classDiv.classes."$key".totSub
	
						if(cmId.toInteger()==params.cm.toInteger() && divId.toInteger() ==params.divId.toInteger()){
							classSubj.subList = classDiv.classes."$key".subList
						}
						j+=1
					}
					def subjholdKey = (classSubj?.subList?.keySet() as List).get(0)
					params.subject = params.subject ?: (classSubj?.subList?."${subjholdKey}"?.subjectId.toInteger())
					return true
				}
			}
		}
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes,classDiv:classDiv]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,classes:classes,classDiv:classDiv]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def stdPerformanceRpt(){
		def schoolId = params.schoolId
		def students
		if(params.schoolId && schoolId.equals("-1")){
			students=["message":"Please select a school under a school group to view the data."]
			render students as JSON
		}
		else{
			if(params.rptType=='studPerfYrCat'){
				students = cceReportService.rAppearedorPassedStdList(params)
			}
			else{
			    students = cceReportService.retrieveClassStudents(params)
			}
			render(template:"/studTeachGraphs/studPerformanceTemplate",model:[students:students])
		}
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def stdAcYrAvgScores = {
		def studAcYrValues = cceReportService.rStudAcYrTotScore(params)
		render studAcYrValues as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def classSubjWisePerformRpt = {
		def subjPerf = cceReportService.rStudAcYrSubWiseScore(params)
		render subjPerf as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def classAssessWisePerformRpt = {
		def assessPerf = cceReportService.rStudAssessWiseScore(params)
		render assessPerf as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def classFaAssessWisePerformRpt = {
		def faAssessPerf = cceReportService.rFaAssessScore(params)
		render faAssessPerf as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def classSaAssessWisePerformRpt = {
		def saAssessPerf = cceReportService.rSaAssessScore(params)
		render saAssessPerf as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def classFaActWisePerformRpt = {
		def faActPerf = cceReportService.rFaAssessActScore(params)
		render faActPerf as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def classSaActWisePerformRpt ={
		def saActPerf = cceReportService.rSaAssessActScore(params) 
		render saActPerf as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def selfEvaluation = {
		List<String> role = utilService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		def currentAcYr,acyrTerms,terms,type,classDiv,classes,division,school,TeacherAcYrs
		Map classSubj = [:]
		role.each{ roles->
			if(roles.equals("ROLE_TEACHER")){
				params.schoolId = session.school_Id.toInteger()
				school = utilService.rUserSchool(session.user_Id.toInteger())
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				TeacherAcYrs = utilService.rTeacherAcYrs(session.school_Id.toInteger(), session.user_Id.toInteger())
				def acyrholdKey = (acyrTerms?.acYrTerm?.keySet() as List).get(0)
				def acYrId
				if(currentAcYr.id)
					acYrId = currentAcYr.id
				else
					acYrId = (acyrTerms?.acYrTerm?."${acyrholdKey}"?.academicYrId?.toInteger())

				params.acYr = params.acYr ?: acYrId
				params.acYr = params.acYr ?:currentAcYr.id
				terms = testService.retTerms(params.acYr.toInteger())
				def termlholdKey = (terms.terms.keySet() as List).get(0)
				params.term = params.term ?: (terms.terms."${termlholdKey}".termId.toInteger())

				//classes = utilService.rTeacherClasses(params.schoolId.toInteger(), session.user_Id.toInteger(),params.acYr.toInteger())
			}
			return false
		}
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,terms:terms,TeacherAcYrs:TeacherAcYrs]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,terms:terms,TeacherAcYrs:TeacherAcYrs]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def rTeacherClasses={
		params.userId = session.user_Id
		def teachClasses = utilService.rTeacherClasses(params.schoolId.toInteger(), params.userId.toInteger(), params.academicYrId.toInteger())
		render teachClasses as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherClassSubjects={
		params.userId = session.user_Id.toInteger()
		def teachClsSubjs = utilService.rTeacherClassSubjects(params.schoolId.toInteger(), params.userId.toInteger(), params.acYr.toInteger() , params.classId.toInteger())
		render teachClsSubjs as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherAcYrClsSubjPerf ={
		params.teacherId = session.user_Id.toInteger()
		params.userName = session.userName
		def clsSubPerf = cceReportService.teacherAcYrClsSubjPerf(params)
		render clsSubPerf as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def teacherAcYrClsDivSubjPerf ={
		params.teacherId = session.user_Id.toInteger()
		params.userName = session.userName
		def clsDivSubPerf = cceReportService.teacherAcYrClsDivSubjPerf(params)
		render clsDivSubPerf as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def clsDivSubjMinMaxPerf={
		params.teacherId = session.user_Id.toInteger()
		params.userName = session.userName
		def clsDivSubjMinMaxPerf = cceReportService.clsDivSubjMinMaxPerf(params)
		render clsDivSubjMinMaxPerf as JSON
	}
	
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def gdAvgLowStudPerf={
		List<String> role = utilService.rUserRoles()
		params.schoolId = session.school_Id.toInteger()
		def schoolGp = utilService.rUserSchoolGroup(session.user_Id.toInteger())
		def currentAcYr,acyrTerms,terms,type,classDiv,classes,division,school,TeacherAcYrs
		Map classSubj = [:]
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
			if(roles.equals("ROLE_TEACHER")){
				params.schoolId = session.school_Id.toInteger()
				school = utilService.rUserSchool(session.user_Id.toInteger())
				acyrTerms = testService.retAcYrAndTerms(params.schoolId.toInteger())
				currentAcYr = utilService.retCurrentSchoolAcYear(session.school_Id.toInteger())
				TeacherAcYrs = utilService.rTeacherAcYrs(session.school_Id.toInteger(), session.user_Id.toInteger())
				def acyrholdKey = (acyrTerms?.acYrTerm?.keySet() as List).get(0)
				def acYrId
				if(currentAcYr.id)
					acYrId = currentAcYr.id
				else
					acYrId = (acyrTerms?.acYrTerm?."${acyrholdKey}"?.academicYrId?.toInteger())

				params.acYr = params.acYr ?: acYrId
				params.acYr = params.acYr ?:currentAcYr.id
				terms = testService.retTerms(params.acYr.toInteger())
				def termlholdKey = (terms.terms.keySet() as List).get(0)
				params.term = params.term ?: (terms.terms."${termlholdKey}".termId.toInteger())

				//classes = utilService.rTeacherClasses(params.schoolId.toInteger(), session.user_Id.toInteger(),params.acYr.toInteger())
			}
			return false
		}
		if(request.xhr){
			[isAjax:true,role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,terms:terms,TeacherAcYrs:TeacherAcYrs,classes:classes]
		}
		else
			[role:role,schoolGp:schoolGp,school:school,currentAcYr:currentAcYr,acyrTerms:acyrTerms,terms:terms,TeacherAcYrs:TeacherAcYrs,classes:classes]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def gdAvgLowStudList = {
		params.teacherId = session.user_Id.toInteger()
		params.userName = session.userName
		def rTeachSubjTopStudents = cceReportService.rTeachSubjTopStudents(params)
		def rTeachSubjAverageStudents = cceReportService.rTeachSubjAverageStudents(params)
		def rTeachSubjBottomStudents = cceReportService.rTeachSubjBottomStudents(params)
		render(template:"/studTeachGraphs/gdAvgLowStudTemplate",model:[topStudents:rTeachSubjTopStudents, averageStudents:rTeachSubjAverageStudents, bottomStudents:rTeachSubjBottomStudents])
	}
	

	@Secured(['IS_AUTHENTICATED_FULLY'])
	def schlStdGenSubDistribution={
		def schlStdDistribution = cceReportService.schlStdGenSubDistribution(params)
		render schlStdDistribution as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def schlSubGenClsDistribution={
		if(params.gender == "F")
		  params.gender = "Female"
	    else
		  params.gender = "Male"
		def schlStdDistribution = cceReportService.schlSubGenClsDistribution(params)
		render schlStdDistribution as JSON
	}
	
	/*For cbse admin, group manager and school admin logins
	On page load, on the map load the regions in the system as pins
	When clicking on a pin show the count of students registered for each subject stream (optional subjects only needed) in each year.
	As a line graph plot count for each year for a subject  stream.
	The above said in the case of cbse admin.
	When the user is a schools manager and school admin, show the region pins relevant for the school manager /school admin only.*/
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def roleRegions = {
		params.userId = session.user_Id.toInteger()
		params.userName = session.userName
		def roleRegions = cceReportService.roleRegions(params)
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def regionSubjAnalytics = {
		//params.regionId = 3
		def regionSubjAnalytics = cceReportService.regionSubjAnalytics(params)
	}
}
