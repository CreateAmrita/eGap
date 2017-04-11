package egov

import java.util.Map;

class CceReportService {

	
    def serviceMethod() {

    }
	
	def yearwiseTotalRpt(Map params){
		def ret = [:] , apStud = 0, paStud = 0 , appearedStudents = [], passedStudents = [], yearwiseTotal=[]
//		def yearwiseTotal = YearWisePerformance.findAllByAcYr(params.acYr)
//		if(yearwiseTotal){
//			yearwiseTotal.each{ywt->
//				apStud+=ywt.appearedStudents
//				paStud+=ywt.passedStudents
//			}
//		}
//		appearedStudents.add(apStud)
//		passedStudents.add(paStud)
		AcademicYear acdYr = AcademicYear.get(params.acYr?.toLong())
		ClassMaster classMaster = ClassMaster.get(5)
		ret."keys" = [acdYr.startYear+" - "+acdYr.endYear]
		if(params.schoolGrpId=="-1" && params.schoolId=="-1"){
			appearedStudents =  StdScholFinalScore.executeQuery("""select 
																				count(distinct u.id) 
																			from 
																				User u, UserDetails ud, UserRole ur, StdScholFinalScore ssfs
																			where 
																				ud.user.id = u.id and
																				ur.user.id=u.id and
																				ur.role.id=3 and
																				ssfs.academicYr.id=:acdYrId and
																				ssfs.className.id = :classMasterId and
																				ssfs.school.id = u.school.id and
																				ssfs.student.id= u.id and
																				ssfs.finalScore is NOT NULL
															""", [acdYrId: acdYr.id, classMasterId: classMaster.id])
			passedStudents = StdScholFinalScore.executeQuery("""select 
																				count(distinct u.id) 
																			from 
																				User u, UserDetails ud, UserRole ur, StdScholFinalScore ssfs
																			where 
																				ud.user.id = u.id and
																				ur.user.id=u.id and
																				ur.role.id=3 and
																				ssfs.academicYr.id=:acdYrId and
																				ssfs.className.id = :classMasterId and
																				ssfs.school.id = u.school.id and
																				ssfs.student.id= u.id and
																				ssfs.finalScore is NOT NULL and
																				ssfs.grade NOT IN ('E1','E2')
															""", [acdYrId: acdYr.id, classMasterId: classMaster.id])

		}
		else if(params.schoolGrpId!="-1" && params.schoolId=="-1"){
			SchoolGroup schoolGroup = SchoolGroup.get(params.schoolGrpId?.toLong())
			if(schoolGroup){
				appearedStudents =  StdScholFinalScore.executeQuery("""select 
																					count(distinct u.id) 
																				from 
																					User u, UserDetails ud, UserRole ur, StdScholFinalScore ssfs, SchoolGroup sg
																				where 
																					ud.user.id = u.id and
																					ur.user.id=u.id and
																					ur.role.id=3 and
																					sg.id = :schoolGroupId and
																					u.schoolGroup.id = sg.id and
																					ssfs.academicYr.id= :acdYrId and
																					ssfs.className.id = :classMasterId and
																					ssfs.school.id = u.school.id and
																					ssfs.student.id= u.id and
																					ssfs.finalScore is NOT NULL
															""", [acdYrId: acdYr.id, schoolGroupId: schoolGroup.id, classMasterId: classMaster.id])
				passedStudents = StdScholFinalScore.executeQuery("""select 
																					count(distinct u.id) 
																				from 
																					User u, UserDetails ud, UserRole ur, StdScholFinalScore ssfs, SchoolGroup sg
																				where 
																					ud.user.id = u.id and
																					ur.user.id=u.id and
																					ur.role.id=3 and
																					sg.id = :schoolGroupId and
																					u.schoolGroup.id = sg.id and
																					ssfs.academicYr.id= :acdYrId and
																					ssfs.className.id = :classMasterId and
																					ssfs.school.id = u.school.id and
																					ssfs.student.id= u.id and
																					ssfs.finalScore is NOT NULL and
																					ssfs.grade NOT IN ('E1','E2')
															""", [acdYrId: acdYr.id, schoolGroupId: schoolGroup.id, classMasterId: classMaster.id])

			}
		}
		else if(params.schoolGrpId!="-1" && params.schoolId!="-1"){
			SchoolGroup schoolGroup = SchoolGroup.get(params.schoolGrpId?.toLong())
			School school = School.get(params.schoolId?.toLong())

			appearedStudents =  StdScholFinalScore.executeQuery("""select
																				count(distinct u.id)
																			from
																				User u, UserDetails ud, UserRole ur, StdScholFinalScore ssfs, SchoolGroup sg
																			where
																				ud.user.id = u.id and
																				ur.user.id=u.id and
																				ur.role.id=3 and
																				sg.id = :schoolGroupId and
																				u.schoolGroup.id = sg.id and
																				u.school.id= :schoolId and
																				ssfs.academicYr.id= :acdYrId and
																				ssfs.className.id = :classMasterId and
																				ssfs.school.id = u.school.id and
																				ssfs.student.id= u.id and
																				ssfs.finalScore is NOT NULL
															""", [acdYrId: acdYr.id, schoolGroupId: schoolGroup.id,schoolId: school.id, classMasterId: classMaster.id])
			passedStudents =  StdScholFinalScore.executeQuery("""select
																	count(distinct u.id)
																from
																	User u, UserDetails ud, UserRole ur, StdScholFinalScore ssfs, SchoolGroup sg
																where
																	ud.user.id = u.id and
																	ur.user.id=u.id and
																	ur.role.id=3 and
																	sg.id = :schoolGroupId and
																	u.schoolGroup.id = sg.id and
																	u.school.id= :schoolId and
																	ssfs.academicYr.id= :acdYrId and
																	ssfs.className.id = :classMasterId and
																	ssfs.school.id = u.school.id and
																	ssfs.student.id= u.id and
																	ssfs.finalScore is NOT NULL and
																	ssfs.grade NOT IN ('E1','E2')
															""", [acdYrId: acdYr.id, schoolGroupId: schoolGroup.id,schoolId: school.id, classMasterId: classMaster.id])

		}
	//	print "appearedStudents = " + appearedStudents
	//	print "passedStudents = " + passedStudents
		
		ret."appearedStudents" = appearedStudents[0]
		ret."passedStudents" = passedStudents[0]
		return ret
	}
	
	def yearwiseCategoryRpt(Map params){
		def ret = [:]
		//	def yearwiseCateg = YearWisePerformance.findAllByAcYr(params.acYr)
		def yearwiseCateg=[]
		AcademicYear acdYr = AcademicYear.get(params.acYr?.toLong())
		ClassMaster classMaster = ClassMaster.get(5)
		if(params.schoolGrpId=="-1" && params.schoolId=="-1"){
			yearwiseCateg =  StdScholFinalScore.executeQuery("""select 
																				ud.community, count(u.id) 
																			from 
																				User u, UserDetails ud, UserRole ur, StdScholFinalScore ssfs
																			where 
																				ud.user.id = u.id and
																				ur.user.id=u.id and
																				ur.role.id=3 and
																				ssfs.academicYr.id=:acdYrId and
																				ssfs.className.id = :classMasterId and
																				ssfs.school.id = u.school.id and
																				ssfs.student.id= u.id and
																				ssfs.finalScore is NOT NULL
																			group by ud.community

															""", [acdYrId: acdYr.id, classMasterId: classMaster.id])
		}
		else if(params.schoolGrpId!="-1" && params.schoolId=="-1"){
			SchoolGroup schoolGroup = SchoolGroup.get(params.schoolGrpId?.toLong())
			if(schoolGroup){
				yearwiseCateg =  StdScholFinalScore.executeQuery("""select 
																					ud.community, count(u.id) 
																				from 
																					User u, UserDetails ud, UserRole ur, StdScholFinalScore ssfs, SchoolGroup sg
																				where 
																					ud.user.id = u.id and
																					ur.user.id=u.id and
																					ur.role.id=3 and
																					sg.id = :schoolGroupId and
																					u.schoolGroup.id = sg.id and
																					ssfs.academicYr.id= :acdYrId and
																					ssfs.className.id = :classMasterId and
																					ssfs.school.id = u.school.id and
																					ssfs.student.id= u.id and
																					ssfs.finalScore is NOT NULL
																				group by ud.community
															""", [acdYrId: acdYr.id, schoolGroupId: schoolGroup.id, classMasterId: classMaster.id])
			}
		}
		else if(params.schoolGrpId!="-1" && params.schoolId!="-1"){
			SchoolGroup schoolGroup = SchoolGroup.get(params.schoolGrpId?.toLong())
			School school = School.get(params.schoolId?.toLong())

			yearwiseCateg =  StdScholFinalScore.executeQuery("""select
																				ud.community, count(u.id)
																			from
																				User u, UserDetails ud, UserRole ur, StdScholFinalScore ssfs, SchoolGroup sg
																			where
																				ud.user.id = u.id and
																				ur.user.id=u.id and
																				ur.role.id=3 and
																				sg.id = :schoolGroupId and
																				u.schoolGroup.id = sg.id and
																				u.school.id= :schoolId and
																				ssfs.academicYr.id= :acdYrId and
																				ssfs.className.id = :classMasterId and
																				ssfs.school.id = u.school.id and
																				ssfs.student.id= u.id and
																				ssfs.finalScore is NOT NULL
																			group by ud.community
															""", [acdYrId: acdYr.id, schoolGroupId: schoolGroup.id,schoolId: school.id, classMasterId: classMaster.id])

		}
	//	print "yearwiseCateg = " + yearwiseCateg
		if(yearwiseCateg){
			yearwiseCateg.each{ywc->
				def cat = ywc[0]
				ret."$cat" = ywc[1]
			}
		}
		else{
			ret."message" = "No Data Available for the Selected Criteria."
		}
	//	print "ret = " + ret
		return ret
	}
	
	def rAppearedorPassedStdList(Map params){
		def ret = [:] , totStud = 0, paStud = 0 , studentsList = []
		AcademicYear acdYr = AcademicYear.get(params.academicYrId?.toLong())
		ClassMaster classMaster = ClassMaster.get(5)
		def i = 1
		if(params.schoolGrpId!="-1" && params.schoolId!="-1"){
			SchoolGroup schoolGroup = SchoolGroup.get(params.schoolGrpId?.toLong())
			School school = School.get(params.schoolId?.toLong())
			if(params.studType.toString().equals("Appeared Students")){
				studentsList =  StdScholFinalScore.executeQuery("""select
																				distinct u.id , CONCAT(COALESCE(ud.firstName,''),' ',COALESCE(ud.lastname,'')), CONCAT(COALESCE(scr.className.className,''),' ',COALESCE(scr.classDivision.division,''))
																			from
																				User u, UserDetails ud, UserRole ur, StdScholFinalScore ssfs, SchoolGroup sg, StudentClassRel scr
																			where
																				ud.user.id = u.id and
																				ur.user.id=u.id and
																				ur.role.id=3 and
																				sg.id = :schoolGroupId and
																				u.schoolGroup.id = sg.id and
																				u.school.id= :schoolId and
																				ssfs.academicYr.id= :acdYrId and
																				ssfs.className.id = :classMasterId and
																				ssfs.school.id = u.school.id and
																				ssfs.student.id= u.id and
																				ssfs.finalScore is NOT NULL and
																				scr.academicYr.id= ssfs.academicYr.id and
																				scr.school.id = u.school.id and
																				scr.className.id = ssfs.className.id and
																				scr.student.id = ssfs.student.id
															""", [acdYrId: acdYr.id, schoolGroupId: schoolGroup.id,schoolId: school.id, classMasterId: classMaster.id])
			} else if(params.studType.toString().equals("Passed Students")){
				studentsList = StdScholFinalScore.executeQuery("""select
																	distinct u.id, CONCAT(COALESCE(ud.firstName,''),' ',COALESCE(ud.lastname,'')), CONCAT(COALESCE(scr.className.className,''),' ',COALESCE(scr.classDivision.division,''))
																from
																	User u, UserDetails ud, UserRole ur, StdScholFinalScore ssfs, SchoolGroup sg, StudentClassRel scr
																where
																	ud.user.id = u.id and
																	ur.user.id=u.id and
																	ur.role.id=3 and
																	sg.id = :schoolGroupId and
																	u.schoolGroup.id = sg.id and
																	u.school.id= :schoolId and
																	ssfs.academicYr.id= :acdYrId and
																	ssfs.className.id = :classMasterId and
																	ssfs.school.id = u.school.id and
																	ssfs.student.id= u.id and
																	ssfs.grade NOT IN ('E1','E2') and
																	scr.academicYr.id= ssfs.academicYr.id and
																	scr.school.id = u.school.id and
																	scr.className.id = ssfs.className.id and
																	scr.student.id = ssfs.student.id
															""", [acdYrId: acdYr.id, schoolGroupId: schoolGroup.id,schoolId: school.id, classMasterId: classMaster.id])
				}
		}	
		if(studentsList){
			studentsList.each{scr->
				ret."$i" = [:]
				//print "scr =" +scr
				ret."$i" = [stdId :scr[0].toLong() , stdName : scr[1] , stdDivision : scr[2]]
				i+=1
			}
		}
		return ret
	}
	
	def catwiseTotalRpt(Map params){
		
/*		def range1Count = 0 , range2Count = 0 , range3Count = 0 , range4Count = 0 , catStudCount = []
		if(params.category=="All Category"){
			def catwiseTotal = CgpaWisePerformance.findAllByAcYr("2013-2014")
			if(catwiseTotal){
				catwiseTotal.each{cwt->
					range1Count += cwt.range1
					range2Count += cwt.range2
					range3Count += cwt.range3
					range4Count += cwt.range4
				}
				catStudCount.add(range1Count)
				catStudCount.add(range2Count)
				catStudCount.add(range3Count)
				catStudCount.add(range4Count)
			}
		}
		else{
			def catwiseTotal = CgpaWisePerformance.findAllByAcYrAndCategory("2013-2014" , "General")
			if(catwiseTotal){
				catwiseTotal.each{cwt->
					range1Count = cwt.range1
					range2Count = cwt.range2
					range3Count = cwt.range3
					range4Count = cwt.range4
				}
				catStudCount.add(range1Count)
				catStudCount.add(range2Count)
				catStudCount.add(range3Count)
				catStudCount.add(range4Count)
			}
		}
//		return catStudCount*/
		def ret = ["keys":[],"noOfStudents":[]]
		AcademicYear acdYr = AcademicYear.get(params.acYr.toLong())
		School school = School.get(params.schoolId.toLong())
		ClassMaster classMaster = ClassMaster.get(params.classMasterId.toLong())
		def gradeCounts =  StudentCgpa.executeQuery("""select
											count(student.id), '<6' 
										from 
											StudentCgpa
										where 
											acdYr.id= :acdYrId and
											school.id = :schoolId and
											classMaster.id= :classMasterId and
											cgpa <6
										""", [acdYrId: acdYr.id, schoolId: school.id, classMasterId: classMaster.id])
		def gradeCounts1 =  StudentCgpa.executeQuery("""select
											count(student.id), '6-8' 
										from 
											StudentCgpa
										where 
											acdYr.id= :acdYrId and
											school.id = :schoolId and
											classMaster.id= :classMasterId and
											cgpa between 6 and 8
										""", [acdYrId: acdYr.id, schoolId: school.id, classMasterId: classMaster.id])
		def gradeCount2 =  StudentCgpa.executeQuery("""select
											count(student.id), '8-10' 
										from 
											StudentCgpa
										where 
											acdYr.id= :acdYrId and
											school.id = :schoolId and
											classMaster.id= :classMasterId and
											cgpa > 8 and cgpa <10
										""", [acdYrId: acdYr.id, schoolId: school.id, classMasterId: classMaster.id])

		def gradeCount3 =  StudentCgpa.executeQuery("""select
											count(student.id), '=10' 
										from 
											StudentCgpa
										where 
											acdYr.id= :acdYrId and
											school.id = :schoolId and
											classMaster.id= :classMasterId and
											cgpa = 10
										""", [acdYrId: acdYr.id, schoolId: school.id, classMasterId: classMaster.id])
		def allZero=false
		if(gradeCounts[0][0]==0 && gradeCounts1[0][0]==0 && gradeCount2[0][0]==0 && gradeCount3[0][0]==0)
			allZero=true
		if(allZero){
			ret =[:]
			ret."message" = "No data available for the selected criteria."
		}
		else{
			ret."keys".add(gradeCounts[0][1])
			ret."noOfStudents".add(gradeCounts[0][0])
			ret."keys".add(gradeCounts1[0][1])
			ret."noOfStudents".add(gradeCounts1[0][0])
			ret."keys".add(gradeCount2[0][1])
			ret."noOfStudents".add(gradeCount2[0][0])
			ret."keys".add(gradeCount3[0][1])
			ret."noOfStudents".add(gradeCount3[0][0])
		}
//		print "ret ="+ret
		return ret
	}
	
	def incomewiseRangeRpt(Map params){
		def appearedStudents = [] , passedStudents = [] , ret = [:]
		def incomewise = IncomeWisePerformance.findByAcYr(params.acYr)
		if(incomewise){
			def range1 = incomewise.range1.split(',')
			appearedStudents.add(range1[0])
			passedStudents.add(range1[1])
			def range2 = incomewise.range2.split(',')
			appearedStudents.add(range2[0])
			passedStudents.add(range2[1])
			def range3 = incomewise.range3.split(',')
			appearedStudents.add(range3[0])
			passedStudents.add(range3[1])
			def range4 = incomewise.range4.split(',')
			appearedStudents.add(range4[0])
			passedStudents.add(range4[1])
			def range5 = incomewise.range5.split(',')
			appearedStudents.add(range5[0])
			passedStudents.add(range5[1])
		}
		ret."appearedStudents" = appearedStudents
		ret."passedStudents" = passedStudents
		return ret
	}
	
	def incomewiseCategoryRpt(Map params){
		def ret = [:]
		def incomewiseCateg = IncomeCategoryGenderWise.findByAcYr(params.acYr)
		if(incomewiseCateg){
			incomewiseCateg.each{iwc->
				ret =  ["GENERAL" : iwc.general , "OBC" : iwc.obc , "SC" : iwc.sc , "ST" : iwc.st]
			}
		}
		return ret
	}
	
	def incomewiseGenderRpt(Map params){
		def ret = [:]
		def incomewiseGender = IncomeCategoryGenderWise.findByAcYr(params.acYr)
		if(incomewiseGender){
			incomewiseGender.each{iwg->
				ret =  ["Male" : iwg.male , "Female" : iwg.female]
			}
		}
		return ret
	}
	
	def passingPerformance(Map params){
		def ret = ["keys":[],"noOfStudents":[]]
		AcademicYear acdYr = AcademicYear.get(params.acYr.toLong())
		School school = School.get(params.schoolId.toLong())
		ClassMaster classMaster = ClassMaster.get(params.classMasterId.toLong())
		SchoolClassDivision division = SchoolClassDivision.get(params.divId.toLong())
		def gradeCounts =  StudentCgpa.executeQuery("""select
											count(student.id), grade 
										from 
											StudentCgpa
										where 
											acdYr.id= :acdYrId and
											school.id = :schoolId and
											classMaster.id= :classMasterId and 
											division.id= :divisionId
										group by 
											grade
										""", [acdYrId: acdYr.id, schoolId: school.id, classMasterId: classMaster.id, divisionId: division.id])
//		print "gradeCounts =" + gradeCounts
		if(gradeCounts){
			def grades = CbseGradesMaster.getAll()
			
			grades.each{g->
				ret."keys".add(g.grade)
				gradeCounts.each {gc->
					def grade = gc[1]
					if(g.grade.equalsIgnoreCase(grade)){
						ret."noOfStudents".add(gc[0])
					}
				}
				if(!ret."keys".size().equals(ret."noOfStudents".size())){
					ret."noOfStudents".add(0)
				}
			}
		}
		else{
			ret =[:]
			ret."message" = "No data available for the selected criteria."
		}
//		print "ret ="+ret
		return ret
	}
	
	def passPerformanceStudentRpt(Map params){
		def ret = ["keys":[],"noOfStudents":[]]
		AcademicYear acdYr = AcademicYear.get(params.acYr.toLong())
		School school = School.get(params.schoolId.toLong())
		ClassMaster classMaster = ClassMaster.get(params.classMasterId.toLong())
		SchoolClassDivision division = SchoolClassDivision.get(params.divId.toLong())
		def gradeStudentDetails =  UserDetails.executeQuery("""select
														sc.student.id, CONCAT(COALESCE(ud.firstName,''),' ',COALESCE(ud.lastname,'')), (sc.cgpa)*10, sc.cgpa
												from 
													UserDetails ud, StudentCgpa sc
												where 
													sc.acdYr.id= :acdYrId and
													sc.school.id = :schoolId and
													sc.classMaster.id= :classMasterId and 
													sc.division.id= :divisionId and 
													sc.grade= :grade and
													ud.user.id = sc.student.id
												""", [acdYrId: acdYr.id, schoolId: school.id, classMasterId: classMaster.id, divisionId: division.id, grade: params.grade.toString()])
		//print "gradeStudentDetails = " + gradeStudentDetails
		return gradeStudentDetails
	}
	
	def vocationalEnrollment(Map params){
		def female = [] , male = [] , ret = [:]
		def vocational = VocationalEnrollment.findByAcYr(params.acYr)
		if(vocational){
			female.add(vocational.range1Female)
			female.add(vocational.range2Female)
			female.add(vocational.range3Female)
			female.add(vocational.range4Female)
			female.add(vocational.range5Female)
			female.add(vocational.range6Female)
			male.add(vocational.range1Male)
			male.add(vocational.range2Male)
			male.add(vocational.range3Male)
			male.add(vocational.range4Male)
			male.add(vocational.range5Male)
			male.add(vocational.range6Male)
		}
		ret.'female' = female
		ret.'male' = male
		return ret
	}
	
	def sportsStatistics(Map params){
		//print "params: " + params
		def girlCount = 0 , boyCount = 0 , Female = [] , Male = [] , ret
		def sportId= (Integer.parseInt(params.sportId)).toLong()
		UserRole userRole = UserRole.findByUser(User.get(params.user_Id.toLong()))
		School school=null
		if(params.schoolId !=0)
			school = School.get(params.schoolId.toLong())
		AcademicYear acdYr = AcademicYear.get(params.academicYrId.toLong())
//		ret=["totGames":games.size(), "keys":[],"games":["athletics": [], "football": [], "basketball": [], "volleyball": [], "tennis": [], "cricket": [], "khokho": []]]
		ret=["keys":[],"Male":[],"Female":[],"hasVal":false]
				

		if(sportId==0 && params.schoolId!="undefined"){
			ret."keys"=["athletics", "football", "basketball", "volleyball", "tennis", "cricket", "khokho"]
			if(userRole.role.authority=="ROLE_ADMIN" || userRole.role.authority=="ROLE_SCHOOLS_MANAGER" || (userRole.role.authority=="ROLE_CCEADMIN" && params.schoolId !=0 ) ){
				SportsStatistics sportsStat = SportsStatistics.findByAcdYrAndSchool(acdYr,school)
				if(sportsStat){
					def totCount = sportsStat.athletics.split(',')
					//					ret."games"."athletics"= totCount
					if(totCount[0].toInteger()!=0 || totCount[1].toInteger()!=0 )
						ret."hasVal"=true
					
					Female.add(totCount[0].toInteger()) //delete this after you implement ret
					Male.add(totCount[1].toInteger()) 	//delete this after you implement ret
					totCount=[]
					totCount = sportsStat.football.split(',')
					//					ret."games"."football"= totCount
					if(totCount[0].toInteger()!=0 || totCount[1].toInteger()!=0 )
						ret."hasVal"=true
					Female.add(totCount[0].toInteger())	//delete this line after you implement ret
					Male.add(totCount[1].toInteger())	//delete this line after you implement ret
					totCount=[]
					totCount = sportsStat.basketball.split(',')
					//					ret."games"."basketball"= totCount
					if(totCount[0].toInteger()!=0 || totCount[1].toInteger()!=0 )
						ret."hasVal"=true
					Female.add(totCount[0].toInteger())	//delete this line after you implement ret
					Male.add(totCount[1].toInteger())	//delete this line after you implement ret
					totCount=[]
					totCount = sportsStat.volleyball.split(',')
					//					ret."games"."volleyball"= totCount
					if(totCount[0].toInteger()!=0 || totCount[1].toInteger()!=0 )
						ret."hasVal"=true
					Female.add(totCount[0].toInteger())	//delete this line after you implement ret
					Male.add(totCount[1].toInteger())	//delete this line after you implement ret
					totCount=[]
					totCount = sportsStat.tennis.split(',')
					//					ret."games"."tennis"= totCount
					if(totCount[0].toInteger()!=0 || totCount[1].toInteger()!=0 )
						ret."hasVal"=true
					Female.add(totCount[0].toInteger())	//delete this line after you implement ret
					Male.add(totCount[1].toInteger())	//delete this line after you implement ret
					totCount=[]
					totCount = sportsStat.cricket.split(',')
					if(totCount[0].toInteger()!=0 || totCount[1].toInteger()!=0 )
						ret."hasVal"=true
					Female.add(totCount[0].toInteger())	//delete this line after you implement ret
					Male.add(totCount[1].toInteger())	//delete this line after you implement ret
					//					ret."games"."cricket"= totCount
					totCount=[]
					totCount = sportsStat.khokho.split(',')
					if(totCount[0].toInteger()!=0 || totCount[1].toInteger()!=0 )
						ret."hasVal"=true
					Female.add(totCount[0].toInteger())	//delete this line after you implement ret
					Male.add(totCount[1].toInteger())	//delete this line after you implement ret
					//					ret."games"."khokho"= totCount
				}
			}
			else{
				def sportsStat = SportsStatistics.findAllByAcdYr(acdYr)
				def agCount = 0 , abCount = 0, fgCount = 0 , fbCount = 0, bgCount = 0 , bbCount = 0, vgCount = 0 , vbCount = 0, tgCount = 0 , tbCount = 0, cgCount=0, cbCount=0, kgCount=0, kbCount=0
				sportsStat.each {ss->
					def aCount = ss.athletics.split(',')
					agCount += aCount[0].toInteger()
					abCount += aCount[1].toInteger()
					def fCount = ss.football.split(',')
					fgCount += fCount[0].toInteger()
					fbCount += fCount[1].toInteger()
					def bCount = ss.basketball.split(',')
					bgCount += bCount[0].toInteger()
					bbCount += bCount[1].toInteger()
					def vCount = ss.volleyball.split(',')
					vgCount += vCount[0].toInteger()
					vbCount += vCount[1].toInteger()
					def tCount = ss.tennis.split(',')
					tgCount += tCount[0].toInteger()
					tbCount += tCount[1].toInteger()
					def cCount = ss.cricket.split(',')
					cgCount += cCount[0].toInteger()
					cbCount += cCount[1].toInteger()
					def kCount = ss.khokho.split(',')
					kgCount += kCount[0].toInteger()
					kbCount += kCount[1].toInteger()
				}
				//				ret."games"."athletics"= [agCount,abCount]
				//				ret."games"."football"= [fgCount,fbCount]
				//				ret."games"."basketball"= [bgCount,bbCount]
				//				ret."games"."volleyball"= [vgCount,vbCount]
				//				ret."games"."tennis"= [tgCount,tbCount]
				//				ret."games"."cricket"= [cgCount,cbCount]
				//				ret."games"."khokho"= [kgCount,kbCount]

				//delete this after you implement ret
				if(agCount.toInteger()!=0 || abCount.toInteger()!=0 || fgCount.toInteger()!=0 || fbCount.toInteger()!=0|| bgCount.toInteger()!=0 || bbCount.toInteger()!=0 || vgCount.toInteger()!=0 || vbCount.toInteger()!=0 || tgCount.toInteger()!=0|| tbCount.toInteger()!=0 || cgCount.toInteger()!=0 || cbCount.toInteger()!=0 || kgCount.toInteger()!=0 || kbCount.toInteger()!=0)
					ret."hasVal"=true
				Female.add(agCount)
				Male.add(abCount)
				Female.add(fgCount)
				Male.add(fbCount)
				Female.add(bgCount)
				Male.add(bbCount)
				Female.add(vgCount)
				Male.add(vbCount)
				Female.add(tgCount)
				Male.add(tbCount)
				Female.add(cgCount)
				Male.add(cbCount)
				Female.add(kgCount)
				Male.add(kbCount)
				//delete this after you implement ret
			}
		}
		else if(sportId!=0 && params.schoolId!="undefined"){
			SportsMaster sport = SportsMaster.get(sportId)
			def sportName = sport.sportName.indexOf('_')? (sport.sportName.replace('_', '')).toLowerCase():sport.sportName.toLowerCase()
			ret."keys".add(sportName)
			if(userRole.role.authority=="ROLE_ADMIN" || userRole.role.authority=="ROLE_SCHOOLS_MANAGER" || (userRole.role.authority=="ROLE_CCEADMIN" && params.schoolId !=0 ) ){
				SportsStatistics sportsStat = SportsStatistics.findByAcdYrAndSchool(acdYr,school)
				if(sportsStat){
					def totCount=[]
					if(sportName == "athletics"){
						totCount = sportsStat.athletics.split(',')
					}else if(sportName == "football"){
						totCount = sportsStat.football.split(',')
					}else if(sportName == "basketball"){
						totCount = sportsStat.basketball.split(',')
					}else if(sportName == "volleyball"){
						totCount = sportsStat.volleyball.split(',')
					}else if(sportName == "tabletennis"){
						totCount = sportsStat.tennis.split(',')
					}else if(sportName == "cricket"){
						totCount = sportsStat.cricket.split(',')
					}else if(sportName == "khokho"){
						totCount = sportsStat.khokho.split(',')
					}
					if(totCount[0].toInteger()!=0 || totCount[1].toInteger()!=0 )
						ret."hasVal"=true
					Female.add(totCount[0].toInteger())
					Male.add(totCount[1].toInteger())
				}
			}
			else{
				def sportsStat = SportsStatistics.findAllByAcdYr(acdYr)
				def totCount=[], male=0, female=0
				sportsStat.each {ss->
					if(sportName == "athletics"){
						totCount = ss.athletics.split(',')
					}else if(sportName == "football"){
						totCount = ss.football.split(',')
					}else if(sportName == "basketball"){
						totCount = ss.basketball.split(',')
					}else if(sportName == "volleyball"){
						totCount = ss.volleyball.split(',')
					}else if(sportName == "tabletennis"){
						totCount = ss.tennis.split(',')
					}else if(sportName == "cricket"){
						totCount = ss.cricket.split(',')
					}else if(sportName == "khokho"){
						totCount = ss.khokho.split(',')
					}
					female += totCount[0].toInteger()
					male += totCount[1].toInteger()
				}
				if(female.toInteger()!=0 || male.toInteger()!=0 )
					ret."hasVal"=true
				Female.add(female)
				Male.add(male)
			}
		}
		ret."Female" = Female
		ret."Male" = Male
		if((ret."Female".size()==0 && ret."Male".size()==0 )|| (!ret."hasVal")){
			ret=[:]
			ret."message"="No Students Sport Activity Details Are Available"
		}
//		print "ret="+ret
		return ret
	}
	def sportsParticipationList(Map params){
//		print "params: " + params
		def ret = [:]
		def sportId= (Integer.parseInt(params.sportId)).toLong()
		def acdYrId= (Integer.parseInt(params.academicYrId)).toLong()
		def schoolId= (Integer.parseInt(params.schoolId)).toLong()
		School school= School.get(schoolId)
		AcademicYear acdYr = AcademicYear.get(acdYrId)
		SportsMaster sport = SportsMaster.get(sportId)
//		print "acdYr="+ acdYr+" school="+ school +" sport="+sport
		ret=["Students":[:]]
		def students = StudentSportActivityRel.findAllByAcademicYrAndSchoolAndSport(acdYr,school,sport)		
	//	print "students = " + students.size()
			if(students){
				def i=1
				ret."totStudents" = students.size()
				students.each{s->
					User student = s.student
					ClassMaster classMaster = s.classMaster
					UserDetails uDetails = UserDetails.findByUser(student)
					def studentName = uDetails.firstName+" "+((uDetails.lastname)? uDetails.lastname:"")
					studentName = studentName.trim()
					StudentClassRel stdClassDetails = StudentClassRel.findByAcademicYrAndSchoolAndClassName(acdYr,school,classMaster)
					ret."Students"."stud$i"=[:]
					ret."Students"."stud$i" = [studentId:student.id,"gender":uDetails.gender,"StudentName":studentName, "className":stdClassDetails.className.className, "division":stdClassDetails.classDivision.division]
					i+=1
				}
			}
			else{
				ret."message"="No Students Data Available at this Time"

			}
//		print "ret="+ret
		return ret
	}
	def bloodGrpStatistics(Map params){
		//print "params: " + params
		def ret=[:], retrn=[:]
		def bloodGroupId= (Integer.parseInt(params.bloodGroupId)).toLong()
		UserRole userRole = UserRole.findByUser(User.get(params.user_Id.toLong()))
		School school=null
		if(params.schoolId !=0)
			school = School.get(params.schoolId?.toLong())
		AcademicYear acdYr = AcademicYear.get(params.academicYrId.toLong())
		
		if(bloodGroupId==0 && params.schoolId!="undefined"){
			if(userRole.role.authority=="ROLE_ADMIN"|| userRole.role.authority=="ROLE_SCHOOLS_MANAGER" || (userRole.role.authority=="ROLE_CCEADMIN" && params.schoolId !=0 ) ){
				def bldGrpStat = BloodGroupStatistics.findAllByAcdYrAndSchool(acdYr, school)
//				print "bldGrpStat = "+ bldGrpStat
				if(bldGrpStat){
//					print "inside if"
					bldGrpStat.each{bgs->
						retrn."$bgs.bloodGroupName" = bgs.noOfStudents
					}
				}
			}
			else{
				//print "cbse admin all schools"
				def bldGrpStat = BloodGroupStatistics.findAllByAcdYr(acdYr)
				//print "bldGrpStat ="+ bldGrpStat.size()
				if(bldGrpStat){
					bldGrpStat.each{bgs->
						if(!retrn.keySet().contains(bgs.bloodGroupName))
							retrn."$bgs.bloodGroupName" = 0
						retrn."$bgs.bloodGroupName" += bgs.noOfStudents
					}
				}
			}
			if(retrn){
				ret=["keys":[], "val":[]]
				ret."keys"=['A+', 'B-', 'A-', 'B+', 'AB+', 'AB-', 'O-', 'O+']
				def temp = [retrn.'A+', retrn.'B-',retrn.'A-', retrn.'B+', retrn.'AB+',  retrn.'AB-', retrn.'O-', retrn.'O+']
				ret."val"=temp
			}
		}
		else if(bloodGroupId!=0 && params.schoolId!="undefined"){
			BloodGrpMaster bloodGroup = BloodGrpMaster.get(bloodGroupId)
			def totCount=0
			if(userRole.role.authority=="ROLE_ADMIN"|| userRole.role.authority=="ROLE_SCHOOLS_MANAGER" || (userRole.role.authority=="ROLE_CCEADMIN" && params.schoolId !=0 ) ){
				BloodGroupStatistics bloodGrpStat = BloodGroupStatistics.findByAcdYrAndSchoolAndBloodGrp(acdYr,school,bloodGroup)
				if(bloodGrpStat){
					totCount= bloodGrpStat.noOfStudents
				}
			}
			else{
				def bloodGrpStat = BloodGroupStatistics.findAllByAcdYrAndBloodGrp(acdYr,bloodGroup)
				bloodGrpStat.each {bgs->
					totCount += bgs.noOfStudents
				}
			}
			if(totCount){
				ret=["keys":[], "val":[]]
				ret."keys".add(bloodGroup.bloodGrp)
				ret."val".add(totCount)
			}
		}
		//print "ret ="+ret
		return ret
	}	
	def bloodGroupStudentsList(Map params){
		//		print "params: " + params
		def ret = [:]
		def bloodGroupId= (Integer.parseInt(params.bloodGroupId)).toLong()
		def acdYrId= (Integer.parseInt(params.academicYrId)).toLong()
		def schoolId= (Integer.parseInt(params.schoolId)).toLong()
		School school= School.get(schoolId)
		AcademicYear acdYr = AcademicYear.get(acdYrId)
		BloodGrpMaster bloodGroup = BloodGrpMaster.get(bloodGroupId)
		//		print "acdYr="+ acdYr+" school="+ school +" bloodGroup="+bloodGroup
		ret=["Students":[:]]
		def students=[]
		students = StudentClassRel.findAllBySchoolAndAcademicYr(school, acdYr)
//		print "students = " + students.size()
		if(students){
			def i=1
			def uDets = UserDetails.createCriteria()
			def uDetails = uDets.list {
				and{
					'in'("user", students.student)
					'eq'("bloodGrp",bloodGroup)
				}
			}
//			print "uDetails= " + uDetails.size()
			ret."totStudents" = uDetails.size()
			uDetails.each{ud->
				def studentName = ud.firstName+" "+((ud.lastname)? ud.lastname:"")
				studentName = studentName.trim()
				def contact = ud.mobile //+" ("+ud.relationship+")"
				contact = contact.trim()
				StudentClassRel stdClassDetails = StudentClassRel.findByAcademicYrAndSchoolAndStudent(acdYr,school,ud.user)
				ret."Students"."stud$i"=[:]
				//						print " contact= "+contact
				ret."Students"."stud$i" = [studentId:ud.user.id,"gender":ud.gender,"StudentName":studentName, "className":stdClassDetails?stdClassDetails.className.className:"-", "division":stdClassDetails?stdClassDetails.classDivision.division:"-", "contact":contact]
				i+=1
			}
		}
		else{
			ret."message"="No Students Data Available at this Time"

		}
//		print "ret="+ret
		return ret
	}
	
	def visionStatistics(Map params){
		//print "params: " + params
		UserRole userRole = UserRole.findByUser(User.get(params.user_Id.toLong()))
		School school=null
		if(params.schoolId !="All")
			school = School.get(params.schoolId.toLong())
		AcademicYear acdYr = AcademicYear.get(params.academicYrId.toLong())
//		def ret =["poor":0, "normal":0]
		def ret = []
		if(userRole.role.authority=="ROLE_ADMIN" || (userRole.role.authority=="ROLE_CCEADMIN" && params.schoolId !="All" ) ){
			VisionStatistics vs = VisionStatistics.findByAcdYrAndSchool(acdYr, school)
			if(vs){
					ret = [vs.poor , vs.normal]
//					ret."poor" = vs.poor
//					ret."normal" = vs.normal
					
			}
		}
		else{
			def poor = 0 , normal = 0
			//print "cbse admin all schools"
			def vs = VisionStatistics.findAllByAcdYr(acdYr)
			//print "vs ="+ vs.size()
			if(vs){
				ret = []
	//			ret =["poor":0,"normal":0]
				vs.each{v->
					poor += v.poor
					normal += v.normal
//					ret."poor" += v.poor
//					ret."normal" += v.normal
				}
				ret = [poor , normal]
			}
		}
		//print "ret ="+ret
		return ret
	}
	
	def oralStatistics(Map params){
		//print "params: " + params
		UserRole userRole = UserRole.findByUser(User.get(params.user_Id.toLong()))
		School school=null
		if(params.schoolId !="All")
			school = School.get(params.schoolId.toLong())
		AcademicYear acdYr = AcademicYear.get(params.academicYrId.toLong())
//		def ret =["poor":0, "bad":0, "normal":0, "good":0, "very good":0]
		def ret = []
		if(userRole.role.authority=="ROLE_ADMIN" || (userRole.role.authority=="ROLE_CCEADMIN" && params.schoolId !="All" ) ){
			OralHygiene oralHygiene = OralHygiene.findByAcdYrAndSchool(acdYr, school)
			if(oralHygiene){
//					ret."poor" = oralHygiene.poor
//					ret."bad" = oralHygiene.bad
//					ret."normal" = oralHygiene.normal
//					ret."good" = oralHygiene.good
//					ret."very good" = oralHygiene.veryGood
					ret = [oralHygiene.poor , oralHygiene.bad , oralHygiene.normal , oralHygiene.good , oralHygiene.veryGood]
					
			}
		}
		else{
			//print "cbse admin all schools"
			def oralHygiene = OralHygiene.findAllByAcdYr(acdYr)
			//print "oralHygiene ="+ oralHygiene.size()
			if(oralHygiene){
//				ret =["poor":0, "bad":0, "normal":0, "good":0, "very good":0]
				def poor = 0 , bad = 0 , normal = 0 , good = 0 , veryGood = 0
				oralHygiene.each{ogs->
					poor += ogs.poor
					bad += ogs.bad
					normal += ogs.normal
					good += ogs.good
					veryGood += ogs.veryGood
				}
				ret = [poor , bad , normal , good , veryGood]
			}
		}
		//print "ret ="+ret
		return ret

	}
	
	def teacherStudRatio(Map params){
		def studentTeacherRatio = [], acYrs=[]
		def teacherStudRatio = TeacherStudentRatio.findAllBySchool(School.get(params.schoolId.toInteger()))
		Map ret=[acYrs:[], ratio:[]]
		if(teacherStudRatio){
			teacherStudRatio.each{tsr->
				studentTeacherRatio.add(Math.ceil(tsr.ratioVal))
				acYrs.add(tsr.acdYr.startYear+"-"+tsr.acdYr.endYear)
			}
		}
		ret."acYrs"=acYrs
		ret."ratio"=studentTeacherRatio
		
		if(ret."acYrs".size()==0 && ret."ratio".size()==0){
			ret=[:]
			ret."message"="No Students : Teachers Details Are Available"
		}
		
		return ret
	}
	
	def teacherStudStat(Map params){
		def ret =[:]
		def teacherStudStat = TeacherStudentRatio.findByAcYr(params.acYr)
		if(teacherStudStat){
			ret = ["Teachers" : teacherStudStat.noOfTeachers , "Students" : teacherStudStat.noOfStudents]
		}
		return ret
	}
	
	def trainedTeachers(Map params){
		def ret =["All":[],"Trained":[],"keys":[]]
		AcademicYear acdYr = AcademicYear.get(params.academicYrId.toLong())
		School school=null
		if(params.schoolId !=0)
			school = School.get(params.schoolId.toLong())
		def trainedTeacherStat = TrainedTeachers.findByAcdYrAndSchool(acdYr,school)
		if(trainedTeacherStat){
			ret."All" = [trainedTeacherStat.maleTeachers, trainedTeacherStat.femaleTeachers ]
			ret."Trained" = [trainedTeacherStat.trainedMaleTeachers,trainedTeacherStat.trainedFemaleTeachers]
			ret."keys" = ["Male","Female"]
		}
		if(ret."All".size()==0 && ret."Trained".size()==0 && ret."keys".size()==0){
			ret=[:]
			ret."message"="No Trained Teachers Details Are Available"
		}
		
		return ret
	}
	
	def retAllZones(){
		def res=[:]
		def cbseZones = CbseZone.getAll()
		def j=1
		res = [zones: [:], totZones: cbseZones.size()]
		cbseZones.each(){ y ->
			res."zones"."zone$j"=[:]
			res."zones"."zone$j"=[zoneId:y.id, zoneName:y.zoneName]
			j += 1
		}
		return res
	}
	
	def retAllZoneRegions(Map params){
		def res=[:]
		CbseZone cbseZone = CbseZone.get(params.zoneId.toInteger())
		def j=1
		def zoneRegions = ZoneRegion.findAllByZone(cbseZone)
		res= [zoneId:cbseZone.id,  totRegions:zoneRegions.size(), regions: [:]]
		zoneRegions.each { r->
			res."regions"."region$j"=[:]
			res."regions"."region$j"=[regionId:r.id, regionName: r.regionName, createdBy:r.createdBy, createdDate: r.createdDate, modifiedDate: r.modifiedDate]
			j += 1
		}
		return res
	}
	
	def retAllZoneRegionClusters(Map params){
		def res=[:]
		CbseZone cbseZone = CbseZone.get(params.zoneId.toInteger())
		ZoneRegion region = ZoneRegion.get(params.regionId.toInteger())
		def clusters = RegionCluster.findAllByZoneAndRegion(cbseZone, region)
		def j=1
		res = [zoneId: cbseZone.id, regionId: region.id, totClusters:  clusters.size(), clusters: [:]]
		clusters.each(){ c ->
			res."clusters"."cluster$j"=[:]
			res."clusters"."cluster$j"=[clusterId:c.id,clusterName:c.clusterName, createdBy:c.createdBy, createdDate: c.createdDate, modifiedDate: c.modifiedDate]
			j += 1
		}
		return res
	}
	
	def retAllClusterStates(Map params){
		def res=[:]
		RegionCluster cluster = RegionCluster.get(params.clusterId.toInteger())
		def states = ClusterStateRel.findAllByCluster(cluster)
		def j=1
		res."states" = [:]
		states.each(){ s ->
			res."states"."state$j"=[:]
				res."states"."state$j"=[zoneId: s.cluster.zone.id, regionId: s.cluster.region.id, clusterId: s.cluster.id, csId: s.id, countryId: s.state?.country?.id,  countryName: s.state?.country?.countryName, stateId: s.state.id, stateName: s.state.stateName, createdBy:s.createdBy, createdDate: s.createdDate, modifiedDate: s.modifiedDate]
				j += 1
		}
		res."totStates" = states.size()
		return res
	}
	
	def listAllSchoolGroups(){
		def schoolList = SchoolGroup.findAllByStatus("A")
		def ret = [:]
		def i = 1
		if(schoolList){
			ret."totSG"=schoolList.size()
			schoolList.each {x->
				ret."SG$i"=[id:x.id,groupName:x.groupName]
				i+=1
			}
			
		}
		return ret
	}
	
	def rZoneRegion(Map params){
		CbseZone zone = CbseZone.get(params.zoneId.toLong())
		def regions = ZoneRegion.findAllByZone(zone)
		def i=1
		def ret = ["totRegions":0,"regions":[:] ]
		regions.each {r->
			ret."regions"."region$i"=[regionId:r.id,regionName:r.regionName]
			i+=1
		}
		ret."totRegions"=i-1
		return ret
	}
	
	def rZoneRegionClusters(Map params){
		CbseZone zone = CbseZone.get(params.zoneId.toLong())
		ZoneRegion region = ZoneRegion.get(params.regionId.toLong())
		def clusters = RegionCluster.findAllByZoneAndRegion(zone,region )
		def i=1
		def ret = ["totClusters":0,"clusters":[:] ]
		clusters.each {c->
			ret."clusters"."cluster$i"=[clusterId:c.id,clusterName:c.clusterName]
			i+=1
		}
		ret."totClusters"=i-1
		return ret
	}
	
	def rStatesUnderCluster(Map params){
		def res=[:]
		RegionCluster cluster = RegionCluster.get(params.clusterId.toInteger())
		def states = ClusterStateRel.findAllByCluster(cluster)
		def j=1
		res."states" = [:]
		states.each(){ s ->
			res."states"."state$j"=[:]
				res."states"."state$j"=[csId: s.id, stateId: s.state.id, stateName: s.state.stateName]
				j += 1
		}
		res."totStates" = states.size()
		return res
	}
	
	def rSchoolsUnderCluster(Map params){
		
		def schools = []
		def ret= ["totSchools":0, schools: [:]]
		def i=1
		
		CbseZone zone = CbseZone.get(params.zoneId.toLong())
		ZoneRegion region = ZoneRegion.get(params.regionId.toLong())
		RegionCluster cluster = RegionCluster.get(params.clusterId.toLong())
		schools = School.findAllByZoneAndRegionAndClusterAndStatus(zone, region, cluster,'A')
		schools.each {x->
			ret."schools"."School$i"=[SchoolId:x.id,schoolName:x.schoolName.toLowerCase(),schoolIdentifier:x.schoolIdentifier]
			i+=1
		}
		ret."totSchools"=i-1
		return ret
	}
	
	def rSchoolsUnderClusterState(Map params){
		def schools = []
		def ret= ["totSchools":0, schools: [:]]
		def i=1
		CbseZone zone = CbseZone.get(params.zoneId.toLong())
		ZoneRegion region = ZoneRegion.get(params.regionId.toLong())
		RegionCluster cluster = RegionCluster.get(params.clusterId.toLong())
		ClusterStateRel state = ClusterStateRel.get(params.clusterStateId.toLong())
		schools = School.findAllByZoneAndRegionAndClusterAndClusterStateAndStatus(zone, region, cluster, state,'A')
		schools.each {x->
			ret."schools"."School$i"=[SchoolId:x.id,schoolName:x.schoolName.toLowerCase(),schoolIdentifier:x.schoolIdentifier]
			i+=1
		}
		ret."totSchools"=i-1
		return ret
	}
	
	def listAllSchlsUndrSchlGrpForCbseAdmin(Integer schlGrpId){
		def parentSchool = SchoolGroup.find("from SchoolGroup where id= '"+schlGrpId.toInteger()+"' and status='A'" )
		def school = School.createCriteria()
		def schoolList = school {
			and{
				'eq' ('parentGroup', parentSchool)
				'eq' ('status', "A")
			}
		}
		Map ret=[:]
		def i=1,noSchoolStatus = false
		ret."totSchools"=i
		if(!noSchoolStatus && parentSchool.id!=0){
			School noSchool = School.get(0)
			ret."School$i"=[SchoolId:noSchool.id,schoolName:"All School",schoolIdentifier:noSchool.schoolIdentifier]
			noSchoolStatus=true
			i+=1
		}
		if(schoolList){
			schoolList.each {x->
				def schoolName
				if(x.schoolName=="No School")
					schoolName = "All School"
				else
					schoolName = x.schoolName
				ret."School$i"=[SchoolId:x.id,schoolName:schoolName.toLowerCase(),schoolIdentifier:x.schoolIdentifier]
				i+=1
			}
			ret."totSchools"= i -1
		}
		return ret
	}
	
	def fetchScholasticGrade(Double mark, EvaluationTypes evalType,Double classId){
		Map ret = [:]
//		Grades grade =  Grades.findByEvalTypeAndMaxValGreaterThanEquals(evalType, gradePoint)
//		return grade.grade
		def grades =  Grades.findAllByEvalTypeAndClassId(evalType,classId)
		String grade = null
		grades.each {g->
			if( (mark.intValue() >= g.minVal.intValue()) && (mark.intValue() <= g.maxVal.intValue())){
				ret.grade = g.grade
				ret.gradePoint = g.gradePoint
			}
		}
		return ret
	}
	
	def studSubjPer(Map params){
		
		def ret = ["keys":[],"A1":[],"A2":[],"B1":[],"B2":[],"C1":[],"C2":[],"D":[],"E1":[],"E2":[]]
		AcademicYear acdYr = AcademicYear.get(params.academicYrId.toLong())
		School school = School.get(params.schoolId.toLong())
		ClassMaster classMaster = ClassMaster.get(params.classMasterId.toLong())
		def subjectGradeCounts =  StdScholFinalScore.executeQuery("""select 
																count(student.id), subject.id,  grade
															from 
																StdScholFinalScore
															where 
																academicYr.id= :acdYrId and
																school.id = :schoolId and
																className.id= :classMasterId
															group by 
																subject.id, grade
															""", [acdYrId: acdYr.id, schoolId: school.id, classMasterId: classMaster.id])
//		print "subjectGradeCounts =" + subjectGradeCounts
		def subjects = SubjectMaster.findAllByClassNameAndRequired(classMaster,"Y")
		def i=0
		subjects.each{s->
			if(!ret."keys".contains(s.subject)){
				ret."keys".add(s.subject)
				ret."A1"[i]=0
				ret."A2"[i]=0
				ret."B1"[i]=0
				ret."B2"[i]=0
				ret."C1"[i]=0
				ret."C2"[i]=0
				ret."D"[i]=0
				ret."E1"[i]=0
				ret."E2"[i]=0
			}
			subjectGradeCounts.each {sgc->
				if(s.id.toInteger()==sgc[1].toInteger()){
					def k = sgc[2]
					ret."$k"[i]=sgc[0].toInteger()
				}
			}
			i+=1
		}
//		print "ret = " + ret
		return ret
	}
	
	def retrieveClassStudents(Map attributes){
		Map ret = [:] 
		def i = 1
		ret."$i" = [:]
		AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		ClassMaster classMaster = ClassMaster.get(attributes.classMasterId.toInteger())
		def stdClsRel = StudentClassRel.executeQuery("select s from User u , StudentClassRel s , UserDetails ud where u.id = ud.user and u.school='"+school.id+"' and (u.status = 'Active' or u.status = 'Transfer') and u.id=s.student and s.className = '"+classMaster.id+"' and s.academicYr = '"+acYr.id+"' order by ud.gender desc,ud.firstName asc,ud.lastname asc")
		if(stdClsRel){
			stdClsRel.each{scr->
				User student = User.get(scr.student.id.toInteger())
				def ud = UserDetails.findByUser(student)
				def studentName , stdDivision
				if(ud.lastname=="null" || ud.lastname==null){
					studentName= ud.firstName
				}
				else{
					studentName= ud.firstName+" " + ud.lastname
				}
				if(scr.classDivision!=null){
					stdDivision = classMaster.className+" "+scr.classDivision.division
				}
				else{
					stdDivision = '-'
				}
				ret."$i" = [stdId :student.id , stdName : studentName , stdDivision : stdDivision]
				i+=1
			}
		}
		return ret
	}
	
	def rStudAcYrTotScore(Map attributes){
		User student = User.get(attributes.studentId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		def categories = [] , data = []
		Map ret = [:]
		def studAcYrTotScores = StdScholFinalScore.executeQuery("""select 
																CONCAT(a.startYear,'-',a.endYear) as academicYr,
																SUM(ssf.finalScore)/count(ssf.id) as totalScore
															from 
																SchoolClassRel r , SchoolSubjectRel s ,
																SubjectMaster sm , StdScholFinalScore ssf, AcademicYear a
															where 
																r.school= :schoolId and ssf.student=:studentId and
																s.schoolClass=r.id and s.subjectMaster=sm.id and s.status in ('A' , 'F') and
																sm.status ='A' and s.subjectMaster=ssf.subject and
																r.academicYr=ssf.academicYr and r.className=ssf.className and 
																r.school=ssf.school and sm.id=ssf.subject and
																r.academicYr=a.id and ssf.academicYr=a.id
															group by 
																ssf.academicYr,ssf.className""" , 
															[schoolId: school , studentId : student])
		if(studAcYrTotScores){
			studAcYrTotScores.each{scts->
				categories.add(scts[0])
				data.add(scts[1])
			}
			ret."categories" = categories
			ret."data" =  data
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}
	
	def rStudAcYrSubWiseScore(Map attributes){
		def categories = [] , data = [] , schlSubjects = []
		Map ret = [:]
		User student = User.get(attributes.studentId.toInteger())
		def academicYr = attributes.academicYrId.split('-')
		def acYr = AcademicYear.findByStartYearAndEndYear(academicYr[0] , academicYr[1])
		School school = School.get(attributes.schoolId.toInteger())
		def stdClsRel = StudentClassRel.findByAcademicYrAndSchoolAndStudent(acYr , school ,student)
		ClassMaster classMasterId = ClassMaster.get(stdClsRel.className.id.toInteger())
		def schlClsRel = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMasterId)
		def compSubjs = SchoolSubjectRel.executeQuery("""select sm from SchoolSubjectRel s , SubjectMaster sm where
														 s.schoolClass = :schlClsRel and s.subjectMaster = sm and
														 s.status in ('A' ,'F') and s.subType in ('Compulsory' ,'Language I')""",
														 [schlClsRel : schlClsRel])
			
		def optSubjects = SchoolSubjectRel.executeQuery("""select sm from SchoolSubjectRel s , SubjectMaster sm , StudentOptionalSubject sos
														 where sos.academicYr = :acYr and sos.school=:school and
														 s.schoolClass = :schlClsRel and sos.student = :student and
														 s.status in ('A' ,'F') and s.subType in ('Language II' ,'Additional') and
														 s.subjectMaster = sm and sos.subject = sm and
														 s.schoolClass=sos.schoolClass and s.subType=sos.subjectType and
														 sos.status = 'A' """,
													     [acYr : acYr , school : school , schlClsRel : schlClsRel , student : student])
		if(compSubjs){
			compSubjs.each{cs->
				schlSubjects.add(cs)
			}
		}
		if(optSubjects){
			optSubjects.each{os->
				schlSubjects.add(os)
			}
		}
		if(schlSubjects){
			schlSubjects.each{ss->
				categories.add(ss.subject)
				def studFinalScores = StdScholFinalScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndStudent(acYr , school , classMasterId , ss , student )
				if(studFinalScores){
					data.add(studFinalScores.finalScore.toDouble().round(2))
				}
				else{
					data.add(0.0)
				}
			}
			def name = acYr.startYear+"-"+acYr.endYear+" "+"Class "+classMasterId.className+"-Subject Marks"
			ret."name" = name
			ret."categories" = categories
			ret."data" =  data
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}
	
	def rStudAssessWiseScore(Map attributes){
		def categories = [] , data = []
		Map ret = [:]
		def assmntTypes = AssessmentTypes.findAllByStatus('A')
		if(assmntTypes){
			assmntTypes.each{at->
				categories.add(at.assessmentType)
			}
		}
		User student = User.get(attributes.studentId.toInteger())
		def academicYr = attributes.acYrVal.split('-')
		def acYr = AcademicYear.findByStartYearAndEndYear(academicYr[0] , academicYr[1])
		School school = School.get(attributes.schoolId.toInteger())
		def stdClsRel = StudentClassRel.findByAcademicYrAndSchoolAndStudent(acYr , school ,student)
		ClassMaster classMasterId = ClassMaster.get(stdClsRel.className.id.toInteger())
		def schlClsRel = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMasterId)
		def subject = SubjectMaster.findBySubjectAndClassName(attributes.subject.toString() , classMasterId)
		def studFinalScore = StdScholFinalScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndStudent(acYr , school , classMasterId , subject , student )
		if(studFinalScore){
			data.add(studFinalScore.formativeAssmt.toDouble().round(2))
			data.add(studFinalScore.summativeAssmt.toDouble().round(2))
		}
		def name = acYr.startYear+"-"+acYr.endYear+" "+"Class "+classMasterId.className+"-"+attributes.subject
		ret."name" = name
		ret."categories" = categories
		ret."data" =  data
		return ret
	}
	
	def rFaAssessScore(Map attributes){
		def categories = [] , data = []
		Map ret = [:]
		def assmntType = AssessmentTypes.findByAssessmentType(attributes.assessType.toString())
		User student = User.get(attributes.studentId.toInteger())
		def academicYr = attributes.acYrVal.split('-')
		def acYr = AcademicYear.findByStartYearAndEndYear(academicYr[0] , academicYr[1])
		School school = School.get(attributes.schoolId.toInteger())
		def stdClsRel = StudentClassRel.findByAcademicYrAndSchoolAndStudent(acYr , school ,student)
		ClassMaster classMasterId = ClassMaster.get(stdClsRel.className.id.toInteger())
		def subject = SubjectMaster.findBySubjectAndClassName(attributes.subject.toString() , classMasterId)
		def assessments = SchoolAssessments.executeQuery("""select a.assessmentName , sa 
															from Assessments a , SchoolAssessments sa where 
															a.academicYr=:acYr and a.className=:classMaster and a.subject=:subject and 
															a.assessmentType=:assmntType and a.status= 'A' and sa.school=:school and
															sa.assessment=a and a.className=sa.className""",
															[acYr:acYr , classMaster : classMasterId , subject : subject , assmntType : assmntType , school : school])
		if(assessments){
			assessments.each{a->
				categories.add(a[0])
				def studFaSore = StudentFaScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndSchoolAssmntAndStudent(acYr , school , classMasterId , subject , a[1] , student)
				if(studFaSore){
					data.add(studFaSore.percentage.toDouble().round(2))
				}
				else{
					data.add(0.0)
				}
			}
			def name = acYr.startYear+"-"+acYr.endYear+" "+"Class "+classMasterId.className+"-"+attributes.subject+" "+attributes.assessType
			ret."name" = name
			ret."categories" = categories
			ret."data" =  data
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}
	
	def rSaAssessScore(Map attributes){
		def categories = [] , data = []
		Map ret = [:]
		def assmntType = AssessmentTypes.findByAssessmentType(attributes.assessType.toString())
		User student = User.get(attributes.studentId.toInteger())
		def academicYr = attributes.acYrVal.split('-')
		def acYr = AcademicYear.findByStartYearAndEndYear(academicYr[0] , academicYr[1])
		School school = School.get(attributes.schoolId.toInteger())
		School school0 = School.get(0)
		def stdClsRel = StudentClassRel.findByAcademicYrAndSchoolAndStudent(acYr , school ,student)
		ClassMaster classMasterId = ClassMaster.get(stdClsRel.className.id.toInteger())
		def subject = SubjectMaster.findBySubjectAndClassName(attributes.subject.toString() , classMasterId)
		def assessments = SummativeAssessments.executeQuery("""select a.assessmentName , sa
															from Assessments a , SummativeAssessments sa where 
															a.academicYr=:acYr and a.className=:classMaster and a.subject=:subject and 
															a.assessmentType=:assmntType and a.status= 'A' and 
															sa.school in (:school ,:school0)  and
															sa.assessment=a and a.className=sa.className and sa.status ='Active'""",
															[acYr:acYr , classMaster : classMasterId , subject : subject , assmntType : assmntType , school : school, school0 : school0])
		if(assessments){
			assessments.each{a->
				categories.add(a[0])
				def studSaSore = StudentSaScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndSummativeAssessmentAndStudent(acYr , school , classMasterId , subject , a[1] , student)
				if(studSaSore){
					data.add(studSaSore.percentage.toDouble().round(2))
				}
				else{
					data.add(0.0)
				}
			}
			def name = acYr.startYear+"-"+acYr.endYear+" "+"Class "+classMasterId.className+"-"+attributes.subject+" "+attributes.assessType
			ret."name" = name
			ret."categories" = categories
			ret."data" =  data
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	} 
	
	def rFaAssessActScore(Map attributes){
		def categories = [] , data = []
		Map ret = [:]
		def assmntType = AssessmentTypes.findByAssessmentType(attributes.assessType.toString())
		User student = User.get(attributes.studentId.toInteger())
		def academicYr = attributes.acYrVal.split('-')
		def acYr = AcademicYear.findByStartYearAndEndYear(academicYr[0] , academicYr[1])
		School school = School.get(attributes.schoolId.toInteger())
		def stdClsRel = StudentClassRel.findByAcademicYrAndSchoolAndStudent(acYr , school ,student)
		ClassMaster classMasterId = ClassMaster.get(stdClsRel.className.id.toInteger())
		def schlClsRel = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMasterId)
		SchoolClassDivision division = SchoolClassDivision.get(stdClsRel.classDivision.id.toInteger())
		def subject = SubjectMaster.findBySubjectAndClassName(attributes.subject.toString() , classMasterId)
		def schlAssmnt = SchoolAssessments.executeQuery("""select sa 
															from Assessments a , SchoolAssessments sa where 
															a.academicYr=:acYr and a.className=:classMaster and a.subject=:subject and 
															a.assessmentType=:assmntType and a.status= 'A' and 
															sa.school=:school and sa.assessmentName = :assmntName and
															sa.assessment=a and a.className=sa.className""",
															[acYr:acYr , classMaster : classMasterId , subject : subject , assmntType : assmntType , school : school , assmntName : attributes.activity])
		
		if(schlAssmnt){
			def schlAssmntActs = SchlAsmntActivityClsRel.findBySchoolAssessment(schlAssmnt[0])
			if(schlAssmntActs){
				def activityScores = StdScholActivityScore.executeQuery("""select aa.activityName,ssas.marksObtained 
																		from 
																			SchlAsmntActivityClsRel s , AssessmentActivities aa , StdScholActivityScore ssas
																		where 
																			ssas.student = :student and ssas.academicYr = :acYr and 
																			ssas.school=:school and ssas.className= :classMaster and
																			s.schlClsDiv = :division and s.schoolClass = :schlClsRel and s.schoolAssessment= :schlAssmnt and
																			s.activityMode='Classroom' and s.status='Active' and 
																			s.createdBy in (select u.username from TeacherSubjectAssign t , User u where
																			t.academicYr=:acYr and t.className=:classMaster and t.school=:school and
																			t.subject=:subject and t.classDivision=:division and t.teacher = u) and
																			aa.assmntType=:assmntType and aa = s.assmntActivity and 
																			ssas.assmntActivity = s and ssas.division = s.schlClsDiv""" ,
																			[student : student , acYr:acYr , classMaster : classMasterId , subject : subject , school : school , schlClsRel : schlClsRel , division : division , schlAssmnt : schlAssmnt , assmntType : assmntType])
				if(activityScores){
					activityScores.each{ats->
						categories.add(ats[0])
						data.add(ats[1])
					}
					def name = acYr.startYear+"-"+acYr.endYear+" "+"Class "+classMasterId.className+"-"+attributes.subject+" "+attributes.assessType+"-Activities"
					ret."name" = name
					ret."categories" = categories
					ret."data" =  data
				}
			}
			else{
				ret."message" = "No data available for the selected criteria."
			}
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}
	
	def rSaAssessActScore(Map attributes){
		def categories = [] , data = []
		Map ret = [:]
		def assmntType = AssessmentTypes.findByAssessmentType(attributes.assessType.toString())
		User student = User.get(attributes.studentId.toInteger())
		def academicYr = attributes.acYrVal.split('-')
		def acYr = AcademicYear.findByStartYearAndEndYear(academicYr[0] , academicYr[1])
		School school = School.get(attributes.schoolId.toInteger())
		School school0 =School.get(0)
		def stdClsRel = StudentClassRel.findByAcademicYrAndSchoolAndStudent(acYr , school ,student)
		ClassMaster classMasterId = ClassMaster.get(stdClsRel.className.id.toInteger())
		def schlClsRel = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMasterId)
		SchoolClassDivision division = SchoolClassDivision.get(stdClsRel.classDivision.id.toInteger())
		def subject = SubjectMaster.findBySubjectAndClassName(attributes.subject.toString() , classMasterId)
		def summAssmnt = SummativeAssessments.executeQuery("""select sa
															from Assessments a , SummativeAssessments sa where 
															a.academicYr=:acYr and a.className=:classMaster and a.subject=:subject and 
															a.assessmentType=:assmntType and a.status= 'A' and sa.school in (:school,:school0) and
															sa.assessment=a and a.className=sa.className and sa.status ='Active' and sa.assessmentName = :assmntName""",
															[acYr:acYr , classMaster : classMasterId , subject : subject , assmntType : assmntType , school : school , school0 :school0 ,assmntName : attributes.activity])
		
		if(summAssmnt){
			def summAssmntActs = SummAsmntActivityClsRel.findBySummAssessment(summAssmnt[0])
			if(summAssmntActs){
				def activityScores = StdScholSaActivityScore.executeQuery("""select aa.activityName,ssas.marksObtained
																from 
																	SummAsmntActivityClsRel s , AssessmentActivities aa , StdScholSaActivityScore ssas
																where 
																	ssas.student = :student and ssas.academicYr = :acYr and 
																	ssas.school=:school and ssas.className= :classMaster and
																	s.schlClsDiv = :division and s.schoolClass = :schlClsRel and s.schoolAssessment= :schlAssmnt and
																	s.activityMode='Classroom' and s.status='Active' and 
																	s.createdBy in (select u.username from TeacherSubjectAssign t , User u where
																	t.academicYr=:acYr and t.className=:classMaster and t.school=:school and
																	t.subject=:subject and t.classDivision=:division and t.teacher = u) and
																	aa.assmntType=:assmntType and aa = s.assmntActivity and 
																	ssas.assmntActivity = s and ssas.division = s.schlClsDiv""" ,
																	[student : student , acYr:acYr , classMaster : classMasterId , subject : subject , school : school , schlClsRel : schlClsRel , division : division , schlAssmnt : schlAssmnt , assmntType : assmntType])
				if(activityScores){
					activityScores.each{ats->
						categories.add(ats[0])
						data.add(ats[1])
					}
				}
				def name = acYr.startYear+"-"+acYr.endYear+" "+"Class "+classMasterId.className+"-"+attributes.subject+" "+attributes.assessType+"-Activities"
				ret."name" = name
				ret."categories" = categories
				ret."data" =  data
			}
			else{
				ret."message" = "No data available for the selected criteria."
			}
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}
	
	def teacherAcYrClsSubjPerf(Map attributes){
		Map ret = [:]
		def acYrScores = [] , categories = [] , data = []
		User teacher = User.get(attributes.teacherId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		ClassMaster classMasterId = ClassMaster.get(attributes.classMasterId.toInteger())
		SubjectMaster subject = SubjectMaster.get(attributes.subjectId.toInteger())
		def teacherSubjectAssign = TeacherSubjectAssign.executeQuery("""select distinct t.academicYr from TeacherSubjectAssign t where 
																		t.teacher= :teacher and t.school= :school and t.subject= :subject and t.className= :className 
																		group by t.academicYr""",[school : school , className : classMasterId , subject : subject , teacher : teacher])
		if(teacherSubjectAssign){
			teacherSubjectAssign.each{tsa->
				def finalScores = StdScholFinalScore.executeQuery("""select CONCAT(a.startYear,'-',a.endYear) , sum(s.finalScore)/count(s)
																	from StdScholFinalScore s ,  AcademicYear a where
																	s.school=:school and s.className=:className and s.subject=:subject and
																	s.academicYr=:acYr and s.createdBy=:userName and s.academicYr = a""",
																	[school : school , className : classMasterId , subject : subject , acYr : tsa , userName : attributes.userName.toString()])
				if(finalScores){
					acYrScores.add(finalScores)
				}
			}
			if(acYrScores){
				acYrScores.each{ays->
					categories.add(ays[0][0])
					if(ays[0][1]){
						data.add(ays[0][1])
					}
					else{
						data.add(0)
					}
				}
				if(categories.size().toInteger()==1 && data.size().toInteger()==1 && data[0]==0){
				 	ret."message" = "No data available for the selected criteria."
				 }
				else{
					ret."categories" = categories
					ret."data" =  data
				}
			}
			else{
				ret."message" = "No data available for the selected criteria."
			}
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}
	
	/*def teacherAcYrClsSubjPerf(Map attributes){
		Map ret = [:]
		def acYrScores = [] , categories = [] , data = [:] , i=1
		data."$i" = [:]
		User teacher = User.get(attributes.teacherId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		ClassMaster classMasterId = ClassMaster.get(attributes.classMasterId.toInteger())
		SubjectMaster subject = SubjectMaster.get(attributes.subjectId.toInteger())
		def teacherSubjectAssign = TeacherSubjectAssign.findAllBySchoolAndClassNameAndSubjectAndTeacher(school , classMasterId , subject , teacher)
		if(teacherSubjectAssign){
			teacherSubjectAssign.each{tsa->
				def finalScores = StdScholFinalScore.executeQuery("""select CONCAT(a.startYear,'-',a.endYear) , sum(s.finalScore)/count(s)
																	from StdScholFinalScore s ,  AcademicYear a where
																	s.school=:school and s.className=:className and s.subject=:subject and
																	s.academicYr=:acYr and s.createdBy=:userName and s.academicYr = a""",
																	[school : school , className : classMasterId , subject : subject , acYr : tsa.academicYr , userName : attributes.userName.toString()])
				if(finalScores){
					acYrScores.add(finalScores)
				}
			}
			if(acYrScores){
				acYrScores.each{ays->
					categories.add(ays[0][0])
					data."$i" = [name : ays[0][0],data:[y : ays[0][1] , drilldown: ays[0][0]+" Division Score"]]
					i+=1	
				}
				ret."categories" = categories
				ret."data" =  data
			}
			else{
				ret."message" = "No data available for the selected criteria."
			}
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}*/
	
	def teacherAcYrClsDivSubjPerf(Map attributes){
		Map ret = [:]
		def acYrScores = [] , categories = [] , data = []
		User teacher = User.get(attributes.teacherId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		ClassMaster classMasterId = ClassMaster.get(attributes.classMasterId.toInteger())
		SubjectMaster subject = SubjectMaster.get(attributes.subjectId.toInteger())
		def academicYr = attributes.acYrVal.split('-')
		def acYr = AcademicYear.findByStartYearAndEndYear(academicYr[0] , academicYr[1])
		def teacherSubjectAssign = TeacherSubjectAssign.findAllByAcademicYrAndSchoolAndClassNameAndSubjectAndTeacher(acYr , school , classMasterId , subject , teacher)
		if(teacherSubjectAssign){
			teacherSubjectAssign.each{tsa->
				def finalScores = StdScholFinalScore.executeQuery("""select scd.division , sum(s.finalScore)/count(s)
																	from StdScholFinalScore s ,  SchoolClassDivision scd where
																	s.school=:school and s.className=:className and s.subject=:subject and
																	s.academicYr=:acYr and s.createdBy=:userName and s.division = scd and s.division = :division""",
																	[school : school , className : classMasterId , subject : subject , acYr : acYr , userName : attributes.userName.toString() , division :tsa.classDivision])
				if(finalScores){
					acYrScores.add(finalScores)
				}
			}
			if(acYrScores){
				acYrScores.each{ays->
					categories.add(ays[0][0])
					if(ays[0][1]){
						data.add(ays[0][1])
					}
					else{
						data.add(0)
					}
				}
				ret."categories" = categories
				ret."data" =  data
			}
			else{
				ret."message" = "No data available for the selected criteria."
			}
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}
	
	def clsDivSubjMinMaxPerf(Map attributes){
		Map ret = [:]
		def acYrScores = [] , categories = [] , data = []
		User teacher = User.get(attributes.teacherId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		ClassMaster classMasterId = ClassMaster.get(attributes.classMasterId.toInteger())
		SubjectMaster subject = SubjectMaster.get(attributes.subjectId.toInteger())
		def academicYr = attributes.acYrVal.split('-')
		def acYr = AcademicYear.findByStartYearAndEndYear(academicYr[0] , academicYr[1])
		def schlClsRel = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMasterId)
		def division = SchoolClassDivision.findBySchoolClassAndDivision(schlClsRel , attributes.divVal.toString())
		def teacherSubjectAssign = TeacherSubjectAssign.findAllByAcademicYrAndSchoolAndClassNameAndSubjectAndTeacher(acYr , school , classMasterId , subject , teacher)
		def maxFinalScores = StdScholFinalScore.executeQuery("""select s.finalScore , CONCAT(COALESCE(ud.firstName,''),' ',COALESCE(ud.lastname,'')) from 
															StdScholFinalScore s , User u , UserDetails ud where
															u=ud.user and u=s.student and ud.user=s.student and
															s.school=:school and s.className=:className and s.subject=:subject and
															s.academicYr=:acYr and s.createdBy=:userName and s.division = :division and
															s.finalScore=(select max(s.finalScore) from StdScholFinalScore s where
															s.school=:school and s.className=:className and s.subject=:subject and
															s.academicYr=:acYr and s.createdBy=:userName and s.division = :division)""",
															[school : school , className : classMasterId , subject : subject , acYr : acYr , userName : attributes.userName.toString() , division :division])
		def minFinalScores = StdScholFinalScore.executeQuery("""select s.finalScore , CONCAT(COALESCE(ud.firstName,''),' ',COALESCE(ud.lastname,'')) from 
															StdScholFinalScore s , User u , UserDetails ud where
															u=ud.user and u=s.student and ud.user=s.student and
															s.school=:school and s.className=:className and s.subject=:subject and
															s.academicYr=:acYr and s.createdBy=:userName and s.division = :division and
															s.finalScore=(select min(s.finalScore) from StdScholFinalScore s where
															s.school=:school and s.className=:className and s.subject=:subject and
															s.academicYr=:acYr and s.createdBy=:userName and s.division = :division)""",
															[school : school , className : classMasterId , subject : subject , acYr : acYr , userName : attributes.userName.toString() , division :division])
		if(maxFinalScores){
			maxFinalScores.each{mfs->
				acYrScores.add(mfs)
			}
		}
		if(minFinalScores){
			minFinalScores.each{mfs->
				acYrScores.add(mfs)
			}
		}
		if(acYrScores){
			acYrScores.each{ays->
				categories.add(ays[1])
				data.add(ays[0])
			}
			ret."categories" = categories
			ret."data" =  data
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}
	
	def rTeachSubjTopStudents(Map attributes){
		Map ret = [:]
		def i=1
 		AcademicYear acYr = AcademicYear.get(attributes.acYr.toInteger())
		User teacher = User.get(attributes.teacherId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		ClassMaster classMasterId = ClassMaster.get(attributes.classMasterId.toInteger())
		SubjectMaster subject = SubjectMaster.get(attributes.subjectId.toInteger())
		//and s.createdBy=:userName userName : attributes.userName.toString(), 
		def students = StdScholFinalScore.executeQuery("""select s.student.id,CONCAT(COALESCE(ud.firstName,''),' ',COALESCE(ud.lastname,'')),scd.division,s.finalScore
														from StdScholFinalScore s , SchoolClassDivision scd ,User u, UserDetails ud where
														s.academicYr=:acYr and s.className=:className and s.school=:school and s.subject=:subject and s.division=scd.id and
														u=ud.user and s.student=ud.user and u=s.student and u.school=s.school
														order by s.finalScore desc""", 
														[acYr : acYr , className : classMasterId , school : school ,subject : subject, max:5])
		if(students){
			students.each{s->
				ret."$i" = [studentId : s[0] , studentName : s[1] , division : s[2] , marks : s[3].toDouble().round(2)]
				i+=1
			}
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}
	
	def rTeachSubjBottomStudents(Map attributes){
		Map ret = [:]
		def i=1
		AcademicYear acYr = AcademicYear.get(attributes.acYr.toInteger())
		User teacher = User.get(attributes.teacherId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		ClassMaster classMasterId = ClassMaster.get(attributes.classMasterId.toInteger())
		SubjectMaster subject = SubjectMaster.get(attributes.subjectId.toInteger())
		//s.createdBy=:userName and ; userName : attributes.userName.toString(), 
		def students = StdScholFinalScore.executeQuery("""select s.student.id,CONCAT(COALESCE(ud.firstName,''),' ',COALESCE(ud.lastname,'')),scd.division,s.finalScore
														from StdScholFinalScore s , SchoolClassDivision scd ,User u, UserDetails ud where
														s.academicYr=:acYr and s.className=:className and s.school=:school and 
														s.subject=:subject and s.division=scd.id and
														u=ud.user and s.student=ud.user and u=s.student and u.school=s.school
														order by s.finalScore""",
														[acYr : acYr , className : classMasterId , school : school ,subject : subject, max:5])
		if(students){
			students.each{s->
				ret."$i" = [studentId : s[0] , studentName : s[1] , division : s[2] , marks : s[3].toDouble().round(2)]
				i+=1
			}
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}
	
	def rTeachSubjAverageStudents(Map attributes){
		Map ret = [:]
		def i=1
		AcademicYear acYr = AcademicYear.get(attributes.acYr.toInteger())
		User teacher = User.get(attributes.teacherId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		ClassMaster classMasterId = ClassMaster.get(attributes.classMasterId.toInteger())
		SubjectMaster subject = SubjectMaster.get(attributes.subjectId.toInteger())
		//s.createdBy=:userName and ; userName : attributes.userName.toString(),
		def minValues = StdScholFinalScore.executeQuery("""select s.finalScore from StdScholFinalScore s where
														s.academicYr=:acYr and s.className=:className and 
														s.school=:school and s.subject=:subject
														order by s.finalScore asc""",
														[acYr : acYr , className : classMasterId , school : school , subject : subject, max:5])
		//s.createdBy=:userName and ; userName : attributes.userName.toString(),
		def maxValues = StdScholFinalScore.executeQuery("""select s.finalScore from StdScholFinalScore s where
														s.academicYr=:acYr and s.className=:className and 
														s.school=:school and s.subject=:subject
														order by s.finalScore desc""",
														[acYr : acYr , className : classMasterId , school : school , subject : subject, max:5])
		def minVal = 0.0  , maxVal = 0.0
		if(minValues){
			minVal= minValues.last()
		}
		if(maxValues){
			maxVal = maxValues.last()
		}
		if(maxVal!=0){
			//s.createdBy=:userName and ; userName : attributes.userName.toString(), 
			def students = StdScholFinalScore.executeQuery("""select s.student.id,CONCAT(COALESCE(ud.firstName,''),' ',COALESCE(ud.lastname,'')),scd.division,s.finalScore
															from StdScholFinalScore s , SchoolClassDivision scd ,User u, UserDetails ud where
															s.finalScore> :minVal and s.finalScore<:maxVal and
															s.academicYr=:acYr and s.className=:className and s.school=:school and 
															s.subject=:subject and s.division=scd.id and
															u=ud.user and s.student=ud.user and u=s.student and u.school=s.school
															order by s.finalScore""",
															[acYr : acYr , className : classMasterId , school : school , subject : subject, minVal : minVal , maxVal : maxVal , max:5])
			if(students){
				students.each{s->
					ret."$i" = [studentId : s[0] , studentName : s[1] , division : s[2] , marks : s[3].toDouble().round(2)]
					i+=1
				}
			}
			else{
				ret."message" = "No data available for the selected criteria."
			}
		}
		else{
			ret."message" = "No data available for the selected criteria."
		}
		return ret
	}
	
	/*categories = ['Female', 'Male'],
        data = [{
            y: 56.33, 
            drilldown: {
                name: 'Female Subject Count',
                categories: ['Science' ,'Maths', 'Social Science','English','Malayalam','Sanskrit', 'Hindi'],
                data: [1.06, 0.5, 17.2, 8.11, 5.33, 24.13,32]                
            }
        }, {
            y: 10.38,
            drilldown: {
                name: 'Male Subject Count',
                categories: ['Science' ,'Maths', 'Social Science','English','Malayalam','Sanskrit', 'Hindi'],
                data: [0.33, 0.15, 0.22, 1.27, 2.76, 2.32, 2.31]               
            }
        }] */
	
	/*def schlStdGenSubDistribution(Map attributes){
		def categories = [] , data = [] , i = 1
		Map ret = [:] , dataMap = [:]
		School school = School.get(attributes.schoolId.toInteger())
		AcademicYear acYr = AcademicYear.get(attributes.acYrId.toInteger())
		def genderWiseStdCount = User.executeQuery("""select ud.gender,count(u.id)
													from User u ,UserDetails ud , StudentClassRel scr where
													u.school=:school and scr.academicYr=:acYr and
													u=ud.user and ud.user=scr.student and 
													u.school=scr.school and u=scr.student 
													group by ud.gender""",[school : school , acYr : acYr])
		def schlSubjects = SchoolSubjectRel.executeQuery("""select distinct sm.subject from SchoolClassRel scr , SchoolSubjectRel ssr , SubjectMaster sm
															where scr.academicYr=:acYr and scr.school=:school and
															scr=ssr.schoolClass and scr.className=sm.className and
															ssr.subjectMaster=sm""" , [acYr : acYr , school:school])
		if(genderWiseStdCount){
			genderWiseStdCount.each{gwsc->
				def catSubjCountArray =[]
				categories.add(gwsc[0])
				if(schlSubjects){
					schlSubjects.each{ss->
						def catSubjCount = 0
						def schlSubjClasses = SchoolSubjectRel.executeQuery("""select sm,scr,scr.className,ssr.subType from
																		SchoolClassRel scr , SchoolSubjectRel ssr , SubjectMaster sm
																		where scr.academicYr=:acYr and scr.school=:school and sm.subject=:subject and
																		scr.id=ssr.schoolClass and scr.className=sm.className and
																		ssr.subjectMaster=sm order by scr.classVal desc""",[acYr : acYr , school:school , subject : ss])
						if(schlSubjClasses){
							schlSubjClasses.each{ssc->
								def listClsSubjStudents 
								if(ssc[3].toString().equals("Compulsory") || ssc[3].toString().equals("Language I")){
									listClsSubjStudents =  StudentClassRel.executeQuery("""select count(s.id) from User u , StudentClassRel s , UserDetails ud where 
																						u= ud.user and u.school=:school and u.status= 'Active' and u=s.student and
																						u.school=s.school and s.className = :className and s.academicYr = :acYr and 
																						ud.gender = :gender""",[school :school , className : ssc[2],acYr : acYr , gender : gwsc[0]])			
								}
								if(ssc[3].toString().equals("Language II") || ssc[3].toString().equals("Additional")){
									listClsSubjStudents = StudentClassRel.executeQuery("""select count(s.id) from User u , StudentClassRel s , 
																						UserDetails ud ,StudentOptionalSubject sos where 
																						u = ud.user and u.school=:school and u.status= 'Active' and u=s.student and
																						u.school=s.school and s.className = :className and s.academicYr = :acYr and 
																						sos.student=u and sos.school=u.school and sos.student=ud.user and
																						sos.academicYr=s.academicYr and sos.school=s.school and sos.student=s.student and
																						sos.subject=:subject and sos.schoolClass=:schoolClass and sos.status='A' and ud.gender=:gender""",
																						[school :school , className : ssc[2],acYr : acYr , gender : gwsc[0] ,subject:ssc[0],schoolClass:ssc[1]])
								}
								if(listClsSubjStudents){
									catSubjCount+= listClsSubjStudents[0]
								}
							}
						}
					//	println ss
					//	println catSubjCount
						catSubjCountArray.add(catSubjCount)
					}
				}
			//	println catSubjCountArray
				dataMap."$i" = [y:gwsc[1] , drilldown:[:]]
				dataMap."$i"."drilldown" = [name :gwsc[0]+" Subject Count" , categories : schlSubjects , data : catSubjCountArray]
				i+=1
			}
		}
		if(dataMap){
			dataMap.each {dm->
		//		println dm
				data.add(dm.value)
			}
		}
		ret."categories" = categories
		ret."data" = data
	//	println ret
		return ret
	}*/
	
	def schlStdGenSubDistribution(Map attributes){
		def categories = [] , data = [] , i = 1 , j = 1 , noDataSubjs =[] , compSubjs=[]
		Map ret = [:] , dataMap = [:] , subGenCount = [:]
		School school = School.get(attributes.schoolId.toInteger())
		AcademicYear acYr = AcademicYear.get(attributes.acYrId.toInteger())
		def genderWiseStdCount = User.executeQuery("""select ud.gender,count(u.id)
													from User u ,UserDetails ud , StudentClassRel scr where
													u.school=:school and scr.academicYr=:acYr and
													u=ud.user and ud.user=scr.student and 
													u.school=scr.school and u=scr.student 
													group by ud.gender""",[school : school , acYr : acYr])
		def schlSubjects = SchoolSubjectRel.executeQuery("""select distinct sm.subject, ssr.subType from SchoolClassRel scr , SchoolSubjectRel ssr , SubjectMaster sm
															where scr.academicYr=:acYr and scr.school=:school and
															scr=ssr.schoolClass and scr.className=sm.className and
															ssr.subjectMaster=sm""" , [acYr : acYr , school:school])
		
		if(schlSubjects){
			schlSubjects.each{ss->
				def subj = ss[0]
				def subjectType = ss[1]
				if(subjectType.toString().equals("Language II") || subjectType.toString().equals("Additional"))
					subGenCount."$subj"=[:]
				if(genderWiseStdCount){
					genderWiseStdCount.each{gwsc->
						def catSubjCount = 0
						def schlSubjClasses = SchoolSubjectRel.executeQuery("""select sm,scr,scr.className,ssr.subType from
																		SchoolClassRel scr , SchoolSubjectRel ssr , SubjectMaster sm
																		where scr.academicYr=:acYr and scr.school=:school and sm.subject=:subject and
																		scr.id=ssr.schoolClass and scr.className=sm.className and
																		ssr.subjectMaster=sm order by scr.classVal desc""",[acYr : acYr , school:school , subject : subj])
						if(schlSubjClasses){
							schlSubjClasses.each{ssc->
								def listClsSubjStudents
								if(ssc[3].toString().equals("Compulsory") || ssc[3].toString().equals("Language I")){
									/*listClsSubjStudents =  StudentClassRel.executeQuery("""select count(s.id) from User u , StudentClassRel s , UserDetails ud where
																						u= ud.user and u.school=:school and u.status= 'Active' and u=s.student and
																						u.school=s.school and s.className = :className and s.academicYr = :acYr and 
																						ud.gender = :gender""",[school :school , className : ssc[2],acYr : acYr , gender : gwsc[0]])	*/
									SubjectMaster subject = ssc[0]
									if(!compSubjs.contains(subject.subject))
										compSubjs.add(subject.subject)
									
								}
								if(ssc[3].toString().equals("Language II") || ssc[3].toString().equals("Additional")){
									listClsSubjStudents = StudentClassRel.executeQuery("""select count(s.id) from User u , StudentClassRel s ,
																						UserDetails ud ,StudentOptionalSubject sos where 
																						u = ud.user and u.school=:school and u.status= 'Active' and u=s.student and
																						u.school=s.school and s.className = :className and s.academicYr = :acYr and 
																						sos.student=u and sos.school=u.school and sos.student=ud.user and
																						sos.academicYr=s.academicYr and sos.school=s.school and sos.student=s.student and
																						sos.subject=:subject and sos.schoolClass=:schoolClass and sos.status='A' and ud.gender=:gender""",
																						[school :school , className : ssc[2],acYr : acYr , gender : gwsc[0] ,subject:ssc[0],schoolClass:ssc[1]])
								}
								if(listClsSubjStudents){
									catSubjCount+= listClsSubjStudents[0]
								}
							}
						}
						if(subjectType.toString().equals("Language II") || subjectType.toString().equals("Additional")){
							def gender = gwsc[0]
							subGenCount."$subj"."$i" = ["$gender" : catSubjCount]
							i+=1
						}
					}
				}
				i=1
			}
		//	print "subGenCount = " + subGenCount
			if(genderWiseStdCount){
				genderWiseStdCount.each{gwsc->
					def gender = gwsc[0]
					categories.add(gwsc[0])
					def dataSubjs = [] , catSubjCountArray = []
					dataMap."$j" = [y:gwsc[1] , drilldown:[:]]
					if(subGenCount){
						ret."tot$gender"=0
						subGenCount.each{sgc->
						//	print sgc
							def subjStdCount = 0
							sgc.value.each{sgcv->
								sgcv.value.each{
									if(gwsc[0]== it.key){
										if(it.value!=0){
											catSubjCountArray.add(it.value)
											ret."tot$gender"+=it.value
										}
									}
									subjStdCount+= it.value
								}
							}
							if(subjStdCount!=0){
								dataSubjs.add(sgc.key)
							}
							else{
								noDataSubjs.add(sgc.key)
							}
						}
					}
					dataMap."$j"."drilldown" = [name :gwsc[0]+" Subject Count" , categories : dataSubjs , data : catSubjCountArray]
					//ret."tot$gender" = gwsc[1]
					ret."subjCount$gender" = catSubjCountArray
					ret."dataSubjs" = dataSubjs
					ret."compSubjs" = compSubjs.unique()
					j+=1
				}
			}
			if(dataMap){
				dataMap.each {dm->
					data.add(dm.value)
				}
			}
			ret."categories" = categories
			ret."data" = data
			ret."noDataSubjs" = noDataSubjs.unique()
			//ret."noDataSubjs".add("French")
		}
		else{
			ret."message" = "No subjects registered for the selected academic year."
		}
		return ret
	}
	
	def schlSubGenClsDistribution(Map attributes){
		def classSubjCount = 0 , categories= [] , data = []
		Map ret = [:]
		School school = School.get(attributes.schoolId.toInteger())
		AcademicYear acYr = AcademicYear.get(attributes.acYrId.toInteger())
		def schlSubjClasses = SchoolSubjectRel.executeQuery("""select scr,scr.className,scr.classVal,ssr.subType,sm from
															SchoolClassRel scr , SchoolSubjectRel ssr , SubjectMaster sm
															where scr.academicYr=:acYr and scr.school=:school and sm.subject=:subject and
															scr.id=ssr.schoolClass and scr.className=sm.className and
															ssr.subjectMaster=sm order by scr.classVal desc""",[acYr : acYr , school:school , subject : attributes.subject.toString()])
		if(schlSubjClasses){
			schlSubjClasses.each{ssc->
				categories.add(ssc[2].toInteger())
				def listClsSubjStudents
				if(ssc[3].toString().equals("Compulsory") || ssc[3].toString().equals("Language I")){
					listClsSubjStudents =  StudentClassRel.executeQuery("""select count(s.id) from User u , StudentClassRel s , UserDetails ud where
																			u= ud.user and u.school=:school and u.status= 'Active' and u=s.student and
																			u.school=s.school and s.className = :className and s.academicYr = :acYr and 
																			ud.gender = :gender""",[school :school , className : ssc[1],acYr : acYr , gender : attributes.gender.toString()])			
				}
				if(ssc[3].toString().equals("Language II") || ssc[3].toString().equals("Additional")){
					listClsSubjStudents = StudentClassRel.executeQuery("""select count(s.id) from User u , StudentClassRel s ,
																		UserDetails ud ,StudentOptionalSubject sos where 
																		u = ud.user and u.school=:school and u.status= 'Active' and u=s.student and
																		u.school=s.school and s.className = :className and s.academicYr = :acYr and 
																		sos.student=u and sos.school=u.school and sos.student=ud.user and
																		sos.academicYr=s.academicYr and sos.school=s.school and sos.student=s.student and
																		sos.subject=:subject and sos.schoolClass=:schoolClass and sos.status='A' and ud.gender=:gender""",
																		[school :school , className : ssc[1],acYr : acYr , gender : attributes.gender.toString(),subject : ssc[4],schoolClass:ssc[0]])
				}
				if(listClsSubjStudents){
					data.add(listClsSubjStudents[0])
				}
				else{
					data.add(0)
				}
			}
			if(data.unique()[0]==0){
				ret."message" = "No data available for the selected Subject."
			}
			else{
				ret."categories" = categories
				ret."data" = data
			}
		}
		else{
				ret."message" = "No data available for the selected Subject."
		}
		return ret
	}
	
	def roleRegions(Map params){
		def regionIds = [] , regions = [] , latitudes = [] , longitudes = [] , ret = [:] , regCount = 0 , stdCount
		User user = User.get(params.userId.toInteger())
		def role = Role.executeQuery("""select r.id,r.authority from UserRole ur,Role r where ur.user=:user and ur.role=r.id""" , [user:user])
		if(role[0][1]=="ROLE_CCEADMIN"){
			def zoneRegions = ZoneRegion.executeQuery("""select zr.regionName,zr.latitude,zr.longitude from ZoneRegion zr""")
			if(zoneRegions){
				zoneRegions.each{zr->
					if(zr[1]!=null && zr[2]!=null){
						regCount += 1
						regions.add(zr[0])
						latitudes.add(zr[1])
						longitudes.add(zr[2])
					}
				}
				//stdCount = regionSubjAnalyticsCbse(params)
			}
		}
		if(role[0][1]=="ROLE_SCHOOLS_MANAGER"){
			SchoolGroup schlGrp = SchoolGroup.get(user.schoolGroup.id.toInteger())
			def zoneRegions = ZoneRegion.executeQuery("""select distinct zr.regionName,zr.latitude,zr.longitude,zr
												from School s,SchoolGroup sg,ZoneRegion zr
												where sg=:schlGrp and s.parentGroup=sg and s.region=zr""",[schlGrp : schlGrp])
			if(zoneRegions){
				zoneRegions.each{zr->
					if(zr[1]!=null && zr[2]!=null){
						regCount += 1
						regions.add(zr[0])
						latitudes.add(zr[1])
						longitudes.add(zr[2])
						regionIds.add(zr[3])
					}
				}
				//params."regionIds" = regionIds
				//stdCount = regionSubjAnalyticsGroup(params)
			}
		}
		if(role[0][1]=="ROLE_ADMIN"){
			School school = School.get(user.school.id.toInteger())
			ZoneRegion zoneRegion = ZoneRegion.get(school.region.id.toInteger())
			if(zoneRegion.latitude!=null && zoneRegion.longitude!= null){
				regCount = 1
				regions.add(zoneRegion.regionName)
				latitudes.add(zoneRegion.latitude)
				longitudes.add(zoneRegion.longitude)
			}
			//params.regionId= zoneRegion.id.toInteger()
			//stdCount = regionSubjAnalytics(params)
		}
		ret."regCount" = regCount
		ret."regions" = regions
		ret."latitudes" = latitudes
		ret."longitudes" = longitudes
		//ret."stdCount" = stdCount
		return ret
	}
	
	def regionSubjAnalytics(Map attributes){
		def categories = [] , series = []
		Map r = [:] , ret = [:] , dataMap = [:]
		def subjList = [] , yearList =[] , years = [], i=1
		ZoneRegion region = ZoneRegion.findByRegionName(attributes.region.toString())
		def subjYrs = StudentOptionalSubject.executeQuery("""select
																sm.subject,a,CONCAT(a.startYear,'-',a.endYear)
															from
																SchoolClassRel scr,SchoolSubjectRel ssr ,SubjectMaster sm,
																AcademicYear a,School s ,ZoneRegion zr,
																User u , StudentClassRel stcr,StudentOptionalSubject sos
															where
																zr=:region and s.region=zr and scr.school=s and
																(ssr.subType='Language II' or ssr.subType='Additional') and
																scr.academicYr=a and scr=ssr.schoolClass and
																scr.className=sm.className and ssr.subjectMaster=sm and 
																u=stcr.student and u.school=stcr.school and 
																scr.school=u.school and stcr.academicYr=scr.academicYr and
																stcr.school=scr.school and stcr.className=scr.className and
																a=stcr.academicYr and sos.academicYr=scr.academicYr and 
																sos.school=scr.school and sos.schoolClass=scr and 
																ssr.schoolClass=sos.schoolClass and sos.subject=ssr.subjectMaster and 
																sos.subject=sm and sos.academicYr=a and sos.student=u and
																stcr.academicYr=sos.academicYr and stcr.school=sos.school and
																stcr.student=sos.student and sos.status='A'
																group by a.id,sm.subject
																order by sm.subject,a.id,sm.className,scr.school""",[region:region])
		if(subjYrs){
			subjYrs.each{sy->
				subjList.add(sy[0])
				yearList.add(sy[1])
				years.add(sy[2])
			}
			if(subjList){
				subjList.unique().each{sl->
					def subYrStdCount = []
					dataMap."$i" = [name:sl , data:[]]
					if(yearList){
						yearList.unique().each{yl->
							def subjYrStdCount = StudentOptionalSubject.executeQuery("""select
																							count(sos.id)
																						from
																							SchoolClassRel scr,SchoolSubjectRel ssr ,SubjectMaster sm,
																							AcademicYear a,School s ,ZoneRegion zr,
																							User u , StudentClassRel stcr,StudentOptionalSubject sos
																						where
																							zr=:region and s.region=zr and scr.school=s and
																							sm.subject=:subject and a=:acYr and
																							(ssr.subType='Language II' or ssr.subType='Additional') and
																							scr.academicYr=a and scr=ssr.schoolClass and
																							scr.className=sm.className and ssr.subjectMaster=sm and 
																							u=stcr.student and u.school=stcr.school and 
																							scr.school=u.school and stcr.academicYr=scr.academicYr and
																							stcr.school=scr.school and stcr.className=scr.className and
																							a=stcr.academicYr and sos.academicYr=scr.academicYr and 
																							sos.school=scr.school and sos.schoolClass=scr and 
																							ssr.schoolClass=sos.schoolClass and sos.subject=ssr.subjectMaster and 
																							sos.subject=sm and sos.academicYr=a and sos.student=u and
																							stcr.academicYr=sos.academicYr and stcr.school=sos.school and
																							stcr.student=sos.student and sos.status='A'
																							group by a.id,sm.subject
																							order by sm.subject,a.id,sm.className,scr.school""",[region:region , subject : sl , acYr : yl])
							if(subjYrStdCount){
								subYrStdCount.add(subjYrStdCount[0])
							}
							else{
								subYrStdCount.add(0)
							}
						}
					}
					dataMap."$i"."data" = subYrStdCount
					i+=1
				}
			}
			if(dataMap){
				dataMap.each{dm->
					series.add(dm.value)
				}
			}
			ret."categories" = years.unique()
			ret."series" = series
		}
		else{
			ret."message" = "No data available for the selected Region."
		}
		return ret
	}
	
	def regionSubjAnalyticsCbse(Map attributes){
		def categories = [] , series = []
		Map r = [:] , ret = [:] , dataMap = [:]
		def subjList = [] , yearList =[] , years = [], i=1
		def subjYrs = StudentOptionalSubject.executeQuery("""select
																sm.subject,a,CONCAT(a.startYear,'-',a.endYear)
															from
																SchoolClassRel scr,SchoolSubjectRel ssr ,SubjectMaster sm,
																AcademicYear a,School s ,
																User u , StudentClassRel stcr,StudentOptionalSubject sos
															where
																scr.school=s and
																(ssr.subType='Language II' or ssr.subType='Additional') and
																scr.academicYr=a and scr=ssr.schoolClass and
																scr.className=sm.className and ssr.subjectMaster=sm and 
																u=stcr.student and u.school=stcr.school and 
																scr.school=u.school and stcr.academicYr=scr.academicYr and
																stcr.school=scr.school and stcr.className=scr.className and
																a=stcr.academicYr and sos.academicYr=scr.academicYr and 
																sos.school=scr.school and sos.schoolClass=scr and 
																ssr.schoolClass=sos.schoolClass and sos.subject=ssr.subjectMaster and 
																sos.subject=sm and sos.academicYr=a and sos.student=u and
																stcr.academicYr=sos.academicYr and stcr.school=sos.school and
																stcr.student=sos.student and sos.status='A'
																group by a.id,sm.subject
																order by sm.subject,a.id,sm.className,scr.school""")
		if(subjYrs){
			subjYrs.each{sy->
				subjList.add(sy[0])
				yearList.add(sy[1])
				years.add(sy[2])
			}
			if(subjList){
				subjList.unique().each{sl->
					def subYrStdCount = []
					dataMap."$i" = [name:sl , data:[]]
					if(yearList){
						yearList.unique().each{yl->
							def subjYrStdCount = StudentOptionalSubject.executeQuery("""select
																							count(sos.id)
																						from
																							SchoolClassRel scr,SchoolSubjectRel ssr ,SubjectMaster sm,
																							AcademicYear a,School s,
																							User u , StudentClassRel stcr,StudentOptionalSubject sos
																						where
																							scr.school=s and
																							sm.subject=:subject and a=:acYr and
																							(ssr.subType='Language II' or ssr.subType='Additional') and
																							scr.academicYr=a and scr=ssr.schoolClass and
																							scr.className=sm.className and ssr.subjectMaster=sm and 
																							u=stcr.student and u.school=stcr.school and 
																							scr.school=u.school and stcr.academicYr=scr.academicYr and
																							stcr.school=scr.school and stcr.className=scr.className and
																							a=stcr.academicYr and sos.academicYr=scr.academicYr and 
																							sos.school=scr.school and sos.schoolClass=scr and 
																							ssr.schoolClass=sos.schoolClass and sos.subject=ssr.subjectMaster and 
																							sos.subject=sm and sos.academicYr=a and sos.student=u and
																							stcr.academicYr=sos.academicYr and stcr.school=sos.school and
																							stcr.student=sos.student and sos.status='A'
																							group by a.id,sm.subject
																							order by sm.subject,a.id,sm.className,scr.school""",[subject : sl , acYr : yl])
							if(subjYrStdCount){
								subYrStdCount.add(subjYrStdCount[0])
							}
							else{
								subYrStdCount.add(0)
							}
						}
					}
					dataMap."$i"."data" = subYrStdCount
					i+=1
				}
			}
			if(dataMap){
				dataMap.each{dm->
					series.add(dm.value)
				}
			}
			ret."categories" = years.unique()
			ret."series" = series
		}
		else{
			ret."message" = "No data available for the selected Region."
		}
		return ret
	}
	
	def regionSubjAnalyticsGroup(Map attributes){
		def categories = [] , series = [], regionIds=[], zoneRegions=[]
		Map r = [:] , ret = [:] , dataMap = [:]
		def subjList = [] , yearList =[] , years = [], i=1
		User user =User.get(attributes.userId.toInteger())
		SchoolGroup schlGrp = SchoolGroup.get(user.schoolGroup.id.toInteger())
		zoneRegions = ZoneRegion.executeQuery("""select distinct zr.regionName,zr.latitude,zr.longitude,zr
													from School s,SchoolGroup sg,ZoneRegion zr
													where sg=:schlGrp and s.parentGroup=sg and s.region=zr""",[schlGrp : schlGrp])
		if(zoneRegions){
			zoneRegions.each{zr->
				if(zr[1]!=null && zr[2]!=null){
					regionIds.add(zr[3])
				}
			}
		}
		
		def subjYrs = StudentOptionalSubject.executeQuery("""select
																distinct sm.subject,a,CONCAT(a.startYear,'-',a.endYear)
															from
																SchoolClassRel scr,SchoolSubjectRel ssr ,SubjectMaster sm,
																AcademicYear a,School s , ZoneRegion zr,
																User u , StudentClassRel stcr,StudentOptionalSubject sos
															where
																zr in (:regions) and s.region=zr and scr.school=s and
																(ssr.subType='Language II' or ssr.subType='Additional') and
																scr.academicYr=a and scr=ssr.schoolClass and
																scr.className=sm.className and ssr.subjectMaster=sm and 
																u=stcr.student and u.school=stcr.school and 
																scr.school=u.school and stcr.academicYr=scr.academicYr and
																stcr.school=scr.school and stcr.className=scr.className and
																a=stcr.academicYr and sos.academicYr=scr.academicYr and 
																sos.school=scr.school and sos.schoolClass=scr and 
																ssr.schoolClass=sos.schoolClass and sos.subject=ssr.subjectMaster and 
																sos.subject=sm and sos.academicYr=a and sos.student=u and
																stcr.academicYr=sos.academicYr and stcr.school=sos.school and
																stcr.student=sos.student and sos.status='A'
																group by a.id,sm.subject
																order by sm.subject,a.id,sm.className,scr.school""",[regions : regionIds])
		if(subjYrs){
			subjYrs.each{sy->
				subjList.add(sy[0])
				yearList.add(sy[1])
				years.add(sy[2])
			}
			if(subjList){
				subjList.unique().each{sl->
					def subYrStdCount = []
					
					if(yearList){
						yearList.unique().each{yl->
							def subjYrStdCount = StudentOptionalSubject.executeQuery("""select
																							count(distinct sos.id)
																						from
																							SchoolClassRel scr,SchoolSubjectRel ssr ,SubjectMaster sm,
																							AcademicYear a,School s,ZoneRegion zr,
																							User u , StudentClassRel stcr,StudentOptionalSubject sos
																						where
																							zr in (:regions) and s.region=zr and scr.school=s and
																							sm.subject=:subject and a=:acYr and
																							(ssr.subType='Language II' or ssr.subType='Additional') and
																							scr.academicYr=a and scr=ssr.schoolClass and
																							scr.className=sm.className and ssr.subjectMaster=sm and 
																							u=stcr.student and u.school=stcr.school and 
																							scr.school=u.school and stcr.academicYr=scr.academicYr and
																							stcr.school=scr.school and stcr.className=scr.className and
																							a=stcr.academicYr and sos.academicYr=scr.academicYr and 
																							sos.school=scr.school and sos.schoolClass=scr and 
																							ssr.schoolClass=sos.schoolClass and sos.subject=ssr.subjectMaster and 
																							sos.subject=sm and sos.academicYr=a and sos.student=u and
																							stcr.academicYr=sos.academicYr and stcr.school=sos.school and
																							stcr.student=sos.student and sos.status='A'
																							group by a.id,sm.subject
																							order by sm.subject,a.id,sm.className,scr.school""",[regions : regionIds , subject : sl , acYr : yl])
							if(subjYrStdCount){
								subYrStdCount.add(subjYrStdCount[0])
							}
							else{
								subYrStdCount.add(0)
							}
						}
					}
					if(subYrStdCount.count(0)!=subYrStdCount.size()){
						dataMap."$i" = [name:sl , data:[]]
						dataMap."$i"."data" = subYrStdCount
						i+=1
					}
				}
			}
			if(dataMap){
				dataMap.each{dm->
					series.add(dm.value)
				}
			}
			ret."categories" = years.unique()
			ret."series" = series
		}
		else{
			ret."message" = "No data available for the selected Region."
		}
		return ret
	}
}
