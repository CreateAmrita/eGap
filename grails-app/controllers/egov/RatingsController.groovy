package egov

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

class RatingsController {
	CceReportService cceReportService = new CceReportService()
	NewReportService nrs = new NewReportService()
	TestService testService = new TestService()
	UtilService utilService = new UtilService()
	DataEntryService des = new DataEntryService()

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index() { 
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def acadRept() {
		//println "acadRept params="+params
		Map zoneList=[:], regionList = [:], clusterList=[:], stateList=[:], districtList=[:]
		def selZone, selRegion, selCluster, selState, zoneHoldKey, regionHoldKey, clusterHoldKey, stateHoldKey
		List<String> useroles = testService.rUserRoles()
		useroles.each{roles->
			if(roles.equals("ROLE_CCEADMIN")){
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
				stateList = cceReportService.rStatesUnderCluster(params)
				if(params.zoneId && params.regionId && params.clusterId && !params.state){
					if(stateList.states.size() >= 1){
						stateHoldKey = (stateList.states.keySet() as List).get(0)
						//params.stateId = stateList.states."${stateHoldKey}".stateId.toInteger()
						//params.csId = stateList.states."${stateHoldKey}".csId.toInteger()
						selState = params.stateName
					}
				}
				else{
					selState = params.state
				}
				return true
			}
		}
		if(request.xhr){
			[isAjax: true,"name":"Student_1 ",zoneList: zoneList, regionList: regionList, clusterList: clusterList, stateList:stateList,selZone: selZone, selRegion: selRegion, selCluster:selCluster, selState:selState]
		}
		else{
			["name":"Student_1 ",zoneList: zoneList, regionList: regionList, clusterList: clusterList, stateList:stateList, selZone: selZone, selRegion: selRegion, selCluster:selCluster, selState:selState]
		}
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def schoolView = {
		//println "schoolView params="+params
		def school = EgovSchoolDetails.get(params.schoolId);
		["school":school,"zoneId":params.zoneId,"regionId":params.regionId,"clusterId":params.clusterId,"state":params.state]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def listschool = {
		def state = params.state.toString()
		def schools = EgovSchoolDetails.findAll("from EgovSchoolDetails where state='"+ params.state.toString()+"'")
		if(schools)
			schools = schools
		else
			schools = [msg:"No Schools"]
		render schools as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def trendAnalysis() {
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
	def geoTrendAnalysis() {
		def role = testService.rUserRoles()
		if(request.xhr){
			[isAjax:true,role:role]
		}
		else
			[role:role]
	}
	
	def roleRegions(){
		params.userId = session.user_Id.toInteger()
		params.userName = session.userName
		def roleRegions = cceReportService.roleRegions(params)
		//println "roleRegions="+roleRegions
		render roleRegions as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def fetchRegionDetails() {
		//print "fetchRegionDetails = "+ params
		List<String> role = testService.rUserRoles()
		def stdCount
		params.userId = session.user_Id.toInteger()
		params.userName = session.userName
		role.each{ roles->
			if(params.region.toString().equals("All") && roles.equals("ROLE_CCEADMIN".toString())){
				stdCount = cceReportService.regionSubjAnalyticsCbse(params)
			}
			if(params.region.toString().equals("All") && roles.equals("ROLE_SCHOOLS_MANAGER".toString())){
				//need regionIds
				stdCount = cceReportService.regionSubjAnalyticsGroup(params)
			}
			if(roles.equals("ROLE_ADMIN".toString()) || !(params.region.toString().equals("All")) ){
				stdCount = cceReportService.regionSubjAnalytics(params)
			}
		}
		//println "stdCount="+stdCount
		render stdCount as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def regionA() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def regionB() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def regionC() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def regionD() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def regionG() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def regionM() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def regionP() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def regionR() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def regionT() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def regionU() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def male() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def female() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def science() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def commerce() {
		["name":"Student_1 "]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def arts() {
		["name":"Student_1 "]
	}
	
	
	
}
