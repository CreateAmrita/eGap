package egov

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import java.util.Random;

class NewReportService {
	DataEntryService des =  new DataEntryService()
	UtilService utilService = new UtilService()
    def serviceMethod() {

    }
	
	//fetches data from student_sport_activity_rel table for an academic year and consolidates the count male and female count for each sport.
	//stores the result in Sports_Statistics table with academic year and school_id. i.e single entry for a school for an academic year.
	def updateSportsStatistics(Map params){
//		def school_id= params.school.id.toLong()
		//def schoolIds = [42, 651, 326, 1198, 1200, 652,653, 1199, 327, 654, 656, 1204, 1208, 658, 275, 660, 661, 625, 662, 663, 665, 666, 1202, 667, 1203, 669, 670, 1216, 1221, 1291, 1292, 1294, 1293, 1339, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363]
		//def schoolIds = School.getAll()
		def schoolIds = School.executeQuery("""select s from School s where s.id<>0 and s.status='A'""")
		def acYrs = AcademicYear.executeQuery("""select a from AcademicYear a where id in(1,6,7)""")
		acYrs.each{acYr->
		//AcademicYear acdYr = AcademicYear.get(7)
			String year = acYr.startYear+ " - "+acYr.endYear
			//println year
			schoolIds.each {school->
				//School school = School.get(schoolId)
	//			print "school = " + school.id
				//println school
				Map genderCount = ['athletics_male':0, 'athletics_female':0, 'football_male':0, 'football_female':0, 'basketball_male':0, 'basketball_female':0, 'volleyball_male':0, 'volleyball_female':0, 'table_tennis_male':0, 'table_tennis_female':0, 'cricket_male':0, 'cricket_female':0, 'kho_kho_male':0,'kho_kho_female':0]
				def studentSportsActivity = []
				studentSportsActivity = StudentSportActivityRel.findAllBySchoolAndAcademicYr(school,acYr)
	//			print "studentSportsActivity = "+studentSportsActivity.size()
				studentSportsActivity.each { ssa->
					User student = User.get(ssa.student.id)
					UserDetails stdDetail = UserDetails.findByUser(student)
					String gender = stdDetail.gender
		//			if(stdDetail.gender.equals(null))
		//				gender = des.RandGender().toString()
		//			else if(stdDetail.gender=="M" )
		//				gender = "Male"
		//			else if(stdDetail.gender=="F" )
		//				gender = "Female"
					String sportName = ssa.sport.sportName
					def key = sportName.toLowerCase()+"_"+gender.toLowerCase()
					genderCount."$key"+=1
				}
				String athletics = genderCount.'athletics_female'.toString()+","+genderCount.'athletics_male'.toString()
				String football = genderCount.'football_female'.toString()+","+genderCount.'football_male'.toString()
				String basketball = genderCount.'basketball_female'.toString()+","+genderCount.'basketball_male'.toString()
				String volleyball = genderCount.'volleyball_female'.toString()+","+genderCount.'volleyball_male'.toString()
				String tennis = genderCount.'table_tennis_female'.toString()+","+genderCount.'table_tennis_male'.toString()
				String cricket = genderCount.'cricket_female'.toString()+","+genderCount.'cricket_male'.toString()
				String khokho = genderCount.'kho_kho_female'.toString()+","+genderCount.'kho_kho_male'.toString()
				
				SportsStatistics ss = null
				
				ss = SportsStatistics.findBySchoolAndAcdYr(school,acYr)
				if(ss){
	//				print "updating ss with id =" + ss.id
					ss.athletics= athletics
					ss.football= football
					ss.basketball= basketball
					ss.volleyball= volleyball
					ss.tennis= tennis
					ss.cricket= cricket
					ss.khokho= khokho
				}
				else{
					ss = new SportsStatistics(acYr: year, acdYr: acYr, school: school, athletics: athletics, football: football, basketball: basketball, volleyball: volleyball, tennis: tennis, cricket: cricket, khokho: khokho)
				}
				ss.save(flush:true)
	//			print "ss =" + ss.id
			}
		}
	}
	def updateSchoolClsBloodGroupStatistics(Map params){
		def schoolIds = [42, 651, 326, 1198, 1200, 652,653, 1199, 327, 654, 656, 1204, 1208, 658, 275, 660, 661, 625, 662, 663, 665, 666, 1202, 667, 1203, 669, 670, 1216, 1221, 1291, 1292, 1294, 1293, 1339, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363]
		AcademicYear acYr = AcademicYear.get(7)
		String year = acYr.startYear+"-"+acYr.endYear
		schoolIds.each{ schoolId->
			School school = School.get(schoolId.toInteger())
//			print "school -> "+ school
			def schoolClasses = SchoolClassRel.findAllByAcademicYrAndSchool(acYr, school)
			Map bloodGrpCount = ['A+_count':0, 'A-_count':0, 'B+_count':0, 'B-_count':0, 'AB+_count':0, 'AB-_count':0, 'O+_count':0, 'O-_count':0]
			if(schoolClasses){
				schoolClasses.each{schoolClass->
//					print "schoolClass -> "+ schoolClass
					def students = []
					students = StudentClassRel.findAllByAcademicYrAndSchoolAndClassName(acYr,school, schoolClass.className)
//					print "students length " + students.size()
					if(students){
						students.each { std->
							UserDetails stdDet = UserDetails.findByUser(std.student)
							if(stdDet){
									String bloodGrp = stdDet.bloodGrp.bloodGrp
									def key = bloodGrp+"_count"
									bloodGrpCount."$key"+=1
							}
						}
					}
				}
			}
			
//			print "bloodGrpCount = "+bloodGrpCount
			def bldgrps = []
			bldgrps=BloodGrpMaster.getAll()
			if(bldgrps){
				bldgrps.each{bg->
					//print "bg ="+ bg
					BloodGroupStatistics bgs = null
					bgs=BloodGroupStatistics.findBySchoolAndAcdYrAndBloodGrp(school,acYr,bg)
					try{
						String bldGrp = bg.bloodGrp
						def key = bldGrp+"_count"
						if(bgs){
//							print "updating bgs with id =" + bgs.id
							bgs.noOfStudents= bloodGrpCount."$key".toInteger()
						}
						else{
							bgs = new BloodGroupStatistics(acYr: year, acdYr: acYr, school: school, bloodGroupName: bldGrp, noOfStudents: bloodGrpCount."$key".toInteger(), bloodGrp: bg)
						}
						bgs.save(flush:true)
//						print "bgs =" + bgs.id
					} catch(Exception e){
						e.printStackTrace()
					}
				}
			}
		}
//		print "finished"
	}
	def updateBloodGroupStatistics(Map params){
		def school_id= params.school.id.toLong()
		School school = School.get(school_id)
		AcademicYear acdYr = AcademicYear.get(params.acdYr.id.toLong())
		String year = acdYr.startYear+"-"+acdYr.endYear
		Role role = Role.findByAuthority("ROLE_STUDENT")
		//print "role = " + role.authority
		def students=[]
		students = UserRole.findAllByRole(role)
		//print "users = " + students.size()
		Map bloodGrpCount = ['A+_count':0, 'A-_count':0, 'B+_count':0, 'B-_count':0, 'AB+_count':0, 'AB-_count':0, 'O+_count':0, 'O-_count':0]
		students.each { u->
			UserDetails stdDet = UserDetails.findByUser(u.user)
			if(stdDet){
					String bloodGrp = stdDet.bloodGrp.bloodGrp
					def key = bloodGrp+"_count"
					bloodGrpCount."$key"+=1
			}
		}
		//print "bloodGrpCount = "+bloodGrpCount
		def bldgrps = []
		bldgrps=BloodGrpMaster.getAll()
		if(bldgrps){
			bldgrps.each{bg->
				//print "bg ="+ bg
				BloodGroupStatistics bgs = null
				bgs=BloodGroupStatistics.findBySchoolAndAcdYrAndBloodGrp(school,acdYr,bg)
				try{
					String bldGrp = bg.bloodGrp
					def key = bldGrp+"_count"
					if(bgs){
						//print "updating bgs with id =" + bgs.id
						bgs.noOfStudents= bloodGrpCount."$key".toInteger()
					}
					else{
						bgs = new BloodGroupStatistics(acYr: year, acdYr: acdYr, school: school, bloodGroupName: bldGrp, noOfStudents: bloodGrpCount."$key".toInteger(), bloodGrp: bg)
					}
					bgs.save(flush:true)
					//print "bgs =" + bgs.id
				} catch(Exception e){
					e.printStackTrace()
				}
			}
		}
	}
	def updateSchoolClsOralHygiene(Map params){
		def schoolIds = [42, 651, 326, 1198, 1200, 652, 653, 1199, 327, 654, 656, 1204, 1208, 658, 275, 660, 661, 625, 662, 663, 665, 666, 1202, 667, 1203, 669, 670, 1216, 1221, 1291, 1292, 1294, 1293, 1339, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363]
		AcademicYear acYr = AcademicYear.get(7)
		String year = acYr.startYear+"-"+acYr.endYear
		def students=[]
		schoolIds.each{ schoolId->
			School school = School.get(schoolId.toInteger())
//			print "school -> "+ school
			Map oralStatusCount = ["poor":0, "bad":0, "normal":0, "good":0, "very good":0]
			students = StudentHealthStatus.findAllBySchool(school)
//			print "students length " + students.size()
			if(students){
				students.each { s->
					def key = s.oralHygiene
					oralStatusCount."$key"+=1
				}
			}
//			print "oralStatusCount = "+oralStatusCount
			OralHygiene og = null
			og=OralHygiene.findBySchoolAndAcdYr(school,acYr)
			try{
				def veryGood= oralStatusCount."very good".toInteger()
				def good= oralStatusCount."good".toInteger()
				def normal= oralStatusCount."normal".toInteger()
				def bad= oralStatusCount."bad".toInteger()
				def poor= oralStatusCount."poor".toInteger()
				if(og){
//					print "updating bgs with id =" + og.id
					og.veryGood= veryGood
					og.good= good
					og.normal= normal
					og.bad= bad
					og.poor= poor
				}
				else{
					og = new OralHygiene(acYr: year, acdYr: acYr, school: school, veryGood: veryGood, good: good, normal: normal, bad: bad, poor: poor)
				}
				og.save(flush:true)
//				print "og =" + og.id
			} catch(Exception e){
				e.printStackTrace()
			}
		}
//		print "finished"
	}
	def updateOralHygiene(Map params){
		def school_id= params.school.id.toLong()
		School school = School.get(school_id)
		AcademicYear acdYr = AcademicYear.get(params.acdYr.id.toLong())
		String year = acdYr.startYear+"-"+acdYr.endYear
		def students=[]
		students = StudentHealthStatus.findAllBySchool(school)
		//print "users = " + students.size()
		Map oralStatusCount = ["poor":0, "bad":0, "normal":0, "good":0, "very good":0]
		if(students){
			students.each { s->
				def key = s.oralHygiene
				oralStatusCount."$key"+=1
			}
		}
		//print "oralStatusCount = "+oralStatusCount
		OralHygiene og = null
		og=OralHygiene.findBySchoolAndAcdYr(school,acdYr)
		try{
			def veryGood= oralStatusCount."very good".toInteger()
			def good= oralStatusCount."good".toInteger()
			def normal= oralStatusCount."normal".toInteger()
			def bad= oralStatusCount."bad".toInteger()
			def poor= oralStatusCount."poor".toInteger()
			if(og){
				//print "updating bgs with id =" + og.id
				og.veryGood= veryGood
				og.good= good
				og.normal= normal
				og.bad= bad
				og.poor= poor
			}
			else{
				og = new OralHygiene(acYr: year, acdYr: acdYr, school: school, veryGood: veryGood, good: good, normal: normal, bad: bad, poor: poor)
			}
			og.save(flush:true)
			//print "og =" + og.id
		} catch(Exception e){
			e.printStackTrace()
		}
	}
	def updateSchoolClsVision(Map params){
		def schoolIds = [42, 651, 326, 1198, 1200, 652,653, 1199, 327, 654, 656, 1204, 1208, 658, 275, 660, 661, 625, 662, 663, 665, 666, 1202, 667, 1203, 669, 670, 1216, 1221, 1291, 1292, 1294, 1293, 1339, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363]
		AcademicYear acYr = AcademicYear.get(7)
		String year = acYr.startYear+"-"+acYr.endYear
		def students=[]
		schoolIds.each{ schoolId->
			School school = School.get(schoolId.toInteger())
//			print "school -> "+ school
			Map visionStatusCount = ["poor":0, "normal":0]
			students = StudentHealthStatus.findAllBySchool(school)
//			print "students length " + students.size()
			if(students){
				students.each { s->
					if(s.vision.equals("(L) 6/6 (R) N6"))
						visionStatusCount."normal"+=1
					else
						visionStatusCount."poor"+=1
				}
			}
//			print "visionStatusCount = "+visionStatusCount
			try{
				VisionStatistics vs = null
				vs=VisionStatistics.findBySchoolAndAcdYr(school,acYr)
				def normal= visionStatusCount."normal".toInteger()
				def poor= visionStatusCount."poor".toInteger()
				if(vs){
//					print "updating bgs with id =" + vs.id
					vs.normal= normal
					vs.poor= poor
				}
				else{
					vs = new VisionStatistics(acYr: year, acdYr: acYr, school: school, normal: normal, poor: poor)
				}
				vs.save(flush:true)
//				print "vs= " + vs.id
			} catch(Exception e){
				e.printStackTrace()
			}
		}
	}

	def updateVisionStatistics(Map params){
		def school_id= params.school.id.toLong()
		School school = School.get(school_id)
		AcademicYear acdYr = AcademicYear.get(params.acdYr.id.toLong())
		String year = acdYr.startYear+"-"+acdYr.endYear
		def students=[]
		students = StudentHealthStatus.findAllBySchool(school)
		//print "users = " + students.size()
		Map visionStatusCount = ["poor":0, "normal":0]
		if(students){
			students.each { s->
				if(s.vision.equals("(L) 6/6 (R) N6"))
					visionStatusCount."normal"+=1
				else
					visionStatusCount."poor"+=1
			}
		}
		//print "visionStatusCount = "+visionStatusCount
		try{
			VisionStatistics vs = null
			vs=VisionStatistics.findBySchoolAndAcdYr(school,acdYr)
			def normal= visionStatusCount."normal".toInteger()
			def poor= visionStatusCount."poor".toInteger()
			if(vs){
				//print "updating bgs with id =" + vs.id
				vs.normal= normal
				vs.poor= poor
			}
			else{
				vs = new VisionStatistics(acYr: year, acdYr: acdYr, school: school, normal: normal, poor: poor)
			}
			vs.save(flush:true)
			//print "vs= " + vs.id
		} catch(Exception e){
			e.printStackTrace()
		}
	}
	
	int gcd(int p, int q) {
		if (q == 0) return p;
		else return gcd(q, p % q);
	}
	
	int[] ratio(int a, int b) {
	   final int gcd = gcd(a,b);
//	   print "gcd = " + gcd
	   if(gcd!=0)
	   	return [(a/gcd) ,(b/gcd)]
	   else
	   	return[0,0]
	}
	
	def updateSchoolTeacherStudentRatio(Map params){
		//def schoolIds = [42, 651, 326, 1198, 1200, 652,653, 1199, 327, 654, 656, 1204, 1208, 658, 275, 660, 661, 625, 662, 663, 665, 666, 1202, 667, 1203, 669, 670, 1216, 1221, 1291, 1292, 1294, 1293, 1339, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363]
		//AcademicYear acYr = AcademicYear.get(7)
		def schoolIds = School.executeQuery("""select s from School s where s.id<>0 and s.status='A'""")
		def acYrs = AcademicYear.executeQuery("""select a from AcademicYear a where id in(1,6,7)""")
		acYrs.each{acYr->
			String year = acYr.startYear+"-"+acYr.endYear
			schoolIds.each{ school->
				//School school = School.get(schoolId.toInteger())
	//			print "school -> "+ school
				def students=[]
				students = StudentClassRel.findAllBySchoolAndAcademicYr(school, acYr)
	//			print "students = " + students.size()
				def stdCount=0, tchCount=0
				stdCount = students.size()
				
				Role role = Role.findByAuthority("ROLE_TEACHER")
	//			print "role = " + role.authority
				def teachers = User.findAll("""from User as usr, UserRole as r where r.user = usr and usr.school = :school and r.role = :role""", [school: school, role: role])
	//			print "teachers="+teachers.size()
				tchCount=teachers.size()
				def ratio = ratio(stdCount,tchCount)
	//			print "students:teachers="+ratio
				try{
					
					def teachStudRatio = TeacherStudentRatio.findByAcdYrAndSchool(acYr,school)
					if(teachStudRatio){
	//						print "updating teachStudRatio with id =" + teachStudRatio.id
							teachStudRatio.noOfStudents= stdCount
							teachStudRatio.noOfTeachers= tchCount
							if(ratio[1])
								teachStudRatio.ratioVal= ratio[0]/ratio[1]
							teachStudRatio.teacherStudRatio= ratio[0]+":"+ratio[1]
						}
						else{
							teachStudRatio = new TeacherStudentRatio(acYr: year, acdYr: acYr, school: school, noOfStudents: stdCount, noOfTeachers: tchCount, teacherStudRatio: ratio[0]+":"+ratio[1], ratioVal: (ratio[1])? ratio[0]/ratio[1]:0)
						}
						teachStudRatio.save(flush:true)
	//					print "teachStudRatio= " + teachStudRatio.id
				} catch(Exception e){
					e.printStackTrace()
				}
			}
		}
	}
	
	def updateTeacherStudentRatio(Map params){
		//print "params="+params
		def school_id= params.schoolId.toLong()
		School school = School.get(school_id)
		AcademicYear acdYr = AcademicYear.get(params.academicYrId.toLong())
		String year = acdYr.startYear+"-"+acdYr.endYear
		def students=[]
		students = StudentClassRel.findAllBySchoolAndAcademicYr(school, acdYr)
		//print "students = " + students.size()
		def stdCount=0, tchCount=0
		stdCount = students.size()
		
		Role role = Role.findByAuthority("ROLE_TEACHER")
		//print "role = " + role.authority
		def users=[]
		def teachers = User.findAll("""from User as usr, UserRole as r where r.user = usr and usr.school = :school and r.role = :role""", [school: school, role: role])
		//print "teachers="+teachers.size()
		tchCount=teachers.size()
		def ratio = ratio(stdCount,tchCount)
		//print "students:teachers="+ratio
		try{
			
			def teachStudRatio = TeacherStudentRatio.findByAcdYrAndSchool(acdYr,school)
			if(teachStudRatio){
					//print "updating teachStudRatio with id =" + teachStudRatio.id
					teachStudRatio.noOfStudents= stdCount
					teachStudRatio.noOfTeachers= tchCount
					teachStudRatio.ratioVal= ratio[0]/ratio[1]
					teachStudRatio.teacherStudRatio= ratio[0]+":"+ratio[1]
				}
				else{
					teachStudRatio = new TeacherStudentRatio(acYr: year, acdYr: acdYr, school: school, noOfStudents: stdCount, noOfTeachers: tchCount, teacherStudRatio: ratio[0]+":"+ratio[1], ratioVal: ratio[0]/ratio[1])
				}
				teachStudRatio.save(flush:true)
				//print "teachStudRatio= " + teachStudRatio.id
		} catch(Exception e){
			e.printStackTrace()
		}
	}
	def updateSchoolTeacherTrainingStat(Map params){
		//def schoolIds = [42, 651, 326, 1198, 1200, 652,653, 1199, 327, 654, 656, 1204, 1208, 658, 275, 660, 661, 625, 662, 663, 665, 666, 1202, 667, 1203, 669, 670, 1216, 1221, 1291, 1292, 1294, 1293, 1339, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363]
		def schoolIds = School.executeQuery("""select s from School s where s.id<>0 and s.status='A'""")
		//AcademicYear acYr = AcademicYear.get(7)
		def acYrs = AcademicYear.executeQuery("""select a from AcademicYear a where id in(1,6,7)""")
		acYrs.each{acYr->
			String year = acYr.startYear+"-"+acYr.endYear
			Role role = Role.findByAuthority("ROLE_TEACHER")
			//print "role = " + role.authority
			schoolIds.each{ school->
				//School school = School.get(schoolId.toInteger())
	//			print "school -> "+ school
				def teachers = User.findAll("""from User as usr, UserRole as r where r.user = usr and usr.school = :school and r.role = :role""", [school: school, role: role])
	//			print "teachers="+teachers.size()
				def maleTeachers=0,femaleTeachers=0, trainedMaleTeachers=0, trainedFemaleTeachers=0
				teachers.each {tch->
					User teacher =tch[0]
					//print "teacher="+teacher
					UserDetails teacherDetails = UserDetails.findByUser(teacher)
					def gender = teacherDetails.gender
					def tetQualified = teacherDetails.tetQualified
					if(gender.toString().toLowerCase().equals("male")){
						maleTeachers +=1
						if(tetQualified)
							trainedMaleTeachers +=1
					}
					else if(gender.toString().toLowerCase().equals("female")){
						femaleTeachers +=1
						if(tetQualified)
							trainedFemaleTeachers +=1
					}
				}
				//print maleTeachers+" "+trainedMaleTeachers+" "+femaleTeachers+" "+trainedFemaleTeachers
				try{
					TrainedTeachers trainedTeachers = TrainedTeachers.findByAcdYrAndSchool(acYr,school)
					if(trainedTeachers){
	//						print "updating teachStudRatio with id =" + trainedTeachers.id
							trainedTeachers.maleTeachers= maleTeachers
							trainedTeachers.trainedMaleTeachers= trainedMaleTeachers
							trainedTeachers.femaleTeachers= femaleTeachers
							trainedTeachers.trainedFemaleTeachers= trainedFemaleTeachers
						}
						else{
							trainedTeachers = new TrainedTeachers(acYr: year, acdYr: acYr, school: school, maleTeachers: maleTeachers, trainedMaleTeachers: trainedMaleTeachers, femaleTeachers: femaleTeachers, trainedFemaleTeachers: trainedFemaleTeachers)
						}
						trainedTeachers.save(flush:true)
	//					print "trainedTeachers= " + trainedTeachers.id
				} catch(Exception e){
					e.printStackTrace()
				}
			}
		}
	}

	
	def updateTeacherTrainingStatistics(Map params){
		//print "params="+params
		def school_id= params.schoolId.toLong()
		School school = School.get(school_id)
		AcademicYear acdYr = AcademicYear.get(params.academicYrId.toLong())
		String year = acdYr.startYear+"-"+acdYr.endYear
	
		Role role = Role.findByAuthority("ROLE_TEACHER")
		//print "role = " + role.authority
		def users=[]
		def teachers = User.findAll("""from User as usr, UserRole as r where r.user = usr and usr.school = :school and r.role = :role""", [school: school, role: role])
		//print "teachers="+teachers
		def maleTeachers=0,femaleTeachers=0, trainedMaleTeachers=0, trainedFemaleTeachers=0
		teachers.each {tch->
			User teacher =tch[0]
			//print "teacher="+teacher
			UserDetails teacherDetails = UserDetails.findByUser(teacher)
			def gender = teacherDetails.gender
			def tetQualified = teacherDetails.tetQualified
			if(gender.toString().toLowerCase().equals("male")){
				maleTeachers +=1
				if(tetQualified)
					trainedMaleTeachers +=1
			}
			else if(gender.toString().toLowerCase().equals("female")){
				femaleTeachers +=1
				if(tetQualified)
					trainedFemaleTeachers +=1
			}
		}
		//print maleTeachers+" "+trainedMaleTeachers+" "+femaleTeachers+" "+trainedFemaleTeachers
		try{
			TrainedTeachers trainedTeachers = TrainedTeachers.findByAcdYrAndSchool(acdYr,school)
			if(trainedTeachers){
					//print "updating teachStudRatio with id =" + trainedTeachers.id
					trainedTeachers.maleTeachers= maleTeachers
					trainedTeachers.trainedMaleTeachers= trainedMaleTeachers
					trainedTeachers.femaleTeachers= femaleTeachers
					trainedTeachers.trainedFemaleTeachers= trainedFemaleTeachers
				}
				else{
					trainedTeachers = new TrainedTeachers(acYr: year, acdYr: acdYr, school: school, maleTeachers: maleTeachers, trainedMaleTeachers: trainedMaleTeachers, femaleTeachers: femaleTeachers, trainedFemaleTeachers: trainedFemaleTeachers)
				}
				trainedTeachers.save(flush:true)
				//print "trainedTeachers= " + trainedTeachers.id
		} catch(Exception e){
			e.printStackTrace()
		}
	}
	
	def genderBasedStdHeightToWeightRpt(Map params){
		//print "params="+params
		def ret = [Female:[], Male:[]]
		AcademicYear academicYr = AcademicYear.get(params.academicYrId.toLong())
		School school = School.get(params.schoolId.toLong())
		SchoolClassRel schlClsRel = SchoolClassRel.get(params.schoolClassId.toInteger())
		//print "schlClsRel.classname="+ schlClsRel.className
		SchoolClassDivision classDivision = SchoolClassDivision.get(params.divisionId.toInteger())
		def students =[], femaleList=[], maleList=[]
		students = StudentClassRel.findAll("""from StudentClassRel as scr where scr.academicYr = :academicYr and scr.school = :school and scr.className = :className and scr.classDivision= :classDivision""", [academicYr: academicYr,school: school, className: schlClsRel.className, classDivision: classDivision])
		//print "students="+students
		students?.each {scr->
			User student =scr.student
			//print "student="+student
			UserDetails studentDetails = UserDetails.findByUser(student)
			//print "studentDetails= "+studentDetails
			def gender = studentDetails.gender
			
			StudentHealthStatus healthStatus = StudentHealthStatus.findByStudent(student)
			//print "healthStatus= "+healthStatus
			def height = 0, weight = 0
			if(healthStatus){
				height = healthStatus.height
				weight = healthStatus.weight
				
				def heightWeight = [height,weight]
				
				if(gender.toString().toLowerCase().equals("male")){
					maleList.add(heightWeight)
				}
				else if(gender.toString().toLowerCase().equals("female")){
					femaleList.add(heightWeight)
				}
			}
			
		}
		
		ret."Female" = femaleList
		ret."Male" = maleList
		if(ret."Female".size()==0 && ret."Male".size()==0){
			ret=[:]
			ret."message"="No Height v/s Weight Data of Students Available"
		}
		return ret
	}
	
	def nationWideSchoolsRpt(Map params){
//		print "params="+params
		def schools = []
		def ret=[:]
		int zoneId = Integer.parseInt(params.zoneId)
		int regionId = Integer.parseInt(params.regionId)
		int clusterId = Integer.parseInt(params.clusterId)
//		int stateId = Integer.parseInt(params.stateId)
		if(zoneId==0  && regionId==0  && clusterId==0){// && stateId==0){
			schools = School.getAll()
			def zones = CbseZone.getAll()
//			print "zones= "+zones.size()+" schools="+schools.size()
			ret = ["keys":[],"boys":[], "girls":[], "coed":[]]
			zones.each{z->
				ret."keys".add(z.zoneName)
				if(schools){
					def boys=0, girls=0, coed=0
					schools.each {s->
						SchoolCategory category = s.schoolCategory
						if(s.id!=0 && (s.zone.id == z.id)){
							if(category.schoolCategoryName.toLowerCase().equals("boys")){
								boys+=1
							}
							else if(category.schoolCategoryName.toLowerCase().equals("girls")){
								girls+=1
							}
							else if(category.schoolCategoryName.toLowerCase().equals("coed")){
								coed+=1
							}
						}
					}
					ret."boys".add(boys)
					ret."girls".add(girls)
					ret."coed".add(coed)
				}
			}
		}
		else if(zoneId!=0  && regionId==0  && clusterId==0){// && stateId==0){
			CbseZone zone = CbseZone.get(zoneId.toLong())
			schools = School.findAllByZone(zone)
			def regions = ZoneRegion.findAllByZone(zone)
			ret = ["keys":[],"boys":[], "girls":[], "coed":[]]
			regions.each{r->
				ret."keys".add(r.regionName)
				if(schools){
					def boys=0, girls=0, coed=0
					schools.each {s->
						SchoolCategory category = s.schoolCategory
						if(s.region.id == r.id){
							if(category.schoolCategoryName.toLowerCase().equals("boys")){
								boys+=1
							}
							else if(category.schoolCategoryName.toLowerCase().equals("girls")){
								girls+=1
							}
							else if(category.schoolCategoryName.toLowerCase().equals("coed")){
								coed+=1
							}
						}
					}
					ret."boys".add(boys)
					ret."girls".add(girls)
					ret."coed".add(coed)
				}
			}
		}
		else if(zoneId!=0  && regionId!=0  && clusterId==0){// && stateId==0){
			CbseZone zone = CbseZone.get(params.zoneId.toLong())
			ZoneRegion region = ZoneRegion.get(params.regionId.toLong())
			schools = School.findAllByZoneAndRegion(zone,region)
			def clusters = RegionCluster.findAllByRegion(region)
			ret = ["keys":[],"boys":[], "girls":[], "coed":[]]
			clusters.each{c->
				ret."keys".add(c.clusterName)
				if(schools){
					def boys=0, girls=0, coed=0
					schools.each {s->
						SchoolCategory category = s.schoolCategory
						if(s.cluster.id == c.id){
							if(category.schoolCategoryName.toLowerCase().equals("boys")){
								boys+=1
							}
							else if(category.schoolCategoryName.toLowerCase().equals("girls")){
								girls+=1
							}
							else if(category.schoolCategoryName.toLowerCase().equals("coed")){
								coed+=1
							}
						}
					}
					ret."boys".add(boys)
					ret."girls".add(girls)
					ret."coed".add(coed)
				}
			}
		}
		else if(zoneId!=0  && regionId!=0  && clusterId!=0){// && stateId==0){
			CbseZone zone = CbseZone.get(params.zoneId.toLong())
			ZoneRegion region = ZoneRegion.get(params.regionId.toLong())
			RegionCluster cluster = RegionCluster.get(params.clusterId.toLong())
			schools = School.findAllByZoneAndRegionAndCluster(zone,region,cluster)
			def states = ClusterStateRel.findAllByCluster(cluster)
			ret = ["keys":[],"boys":[], "girls":[], "coed":[]]
			states.each{st->
				State state = st.state
				ret."keys".add(state.stateName)
				if(schools){
					def boys=0, girls=0, coed=0
					schools.each {s->
						SchoolCategory category = s.schoolCategory
						if(s.clusterState.id == st.id){
							if(category.schoolCategoryName.toLowerCase().equals("boys")){
								boys+=1
							}
							else if(category.schoolCategoryName.toLowerCase().equals("girls")){
								girls+=1
							}
							else if(category.schoolCategoryName.toLowerCase().equals("coed")){
								coed+=1
							}
						}
					}
					ret."boys".add(boys)
					ret."girls".add(girls)
					ret."coed".add(coed)
				}
			}
		}
	/*	else if(zoneId!=0  && regionId!=0  && clusterId!=0 && stateId!=0){
			CbseZone zone = CbseZone.get(params.zoneId.toLong())
			ZoneRegion region = ZoneRegion.get(params.regionId.toLong())
			RegionCluster cluster = RegionCluster.get(params.clusterId.toLong())
			ClusterStateRel state = ClusterStateRel.get(params.stateId.toLong())
			ret = ["keys":[],"boys":[], "girls":[], "coed":[]]
			
			def districts = ClusterStateDistrictRel.findAllByClusterStateRel(state)
			def dId = []
			schools = School.findAllByZoneAndRegionAndClusterAndClusterState(zone,region,cluster,state)
			districts.each{d->
				StateDistrict district = d.district
				ret."keys".add(district.districtName)
				if(schools){
					def boys=0, girls=0, coed=0
					schools.each {s->
						SchoolCategory category = s.schoolCategory
						if(s.clusterDistrict.district.id == d.id){
							if(category.schoolCategoryName.toLowerCase().equals("boys")){
								boys+=1
							}
							else if(category.schoolCategoryName.toLowerCase().equals("girls")){
								girls+=1
							}
							else if(category.schoolCategoryName.toLowerCase().equals("coed")){
								coed+=1
							}
						}
					}
					ret."boys".add(boys)
					ret."girls".add(girls)
					ret."coed".add(coed)
				}
			}
		}*/
//		print "ret="+ret
		return ret
	}
	
	def nationWideStudentsRpt(Map params){
//		print "params="+params
		SchoolReportService srs = new SchoolReportService()
		def students = []
		def ret=[:]
		int zoneId = Integer.parseInt(params.zoneId)
		int regionId = Integer.parseInt(params.regionId)
		int clusterId = Integer.parseInt(params.clusterId)
		ret = ["keys":[],"Male":[], "Female":[]]
//		int stateId = Integer.parseInt(params.stateId)

		if(zoneId==0  && regionId==0  && clusterId==0){// && stateId==0){
			def stds =  User.executeQuery("""select
												count(u.id) as count, ud.gender as gender, sc.zone.id as zoneId
											from 
												User as u, UserDetails as ud, UserRole as ur, School as sc
											where
															u.id = ur.user.id and
															ur.role.id = (select id from Role where authority='ROLE_STUDENT') and
															u.school.id in (select id from School) and
															u.school.id = sc.id and
															sc.zone.id in (select id from CbseZone) and
															ud.user.id=u.id
											group by ud.gender, sc.zone.id""")
			def zones = CbseZone.getAll()
//			print "stds =" + stds
			zones.each{z->
				ret."keys".add(z.zoneName)
				def girls=0
				def boys=0
				stds.each {st->
					def zId = st[2]
					if(z.id.toInteger()== zId.toInteger()){
						if(st[1].toString().equalsIgnoreCase("Female"))
							girls = st[0].toInteger()
						else if(st[1].toString().equalsIgnoreCase("Male"))
							boys = st[0].toInteger()
					}
				}
				ret."Male".add(boys)
				ret."Female".add(girls)
			}
		}
		else if(zoneId!=0  && regionId==0  && clusterId==0){// && stateId==0){
			CbseZone zone = CbseZone.get(zoneId.toLong())
			def stds =  User.executeQuery("""select
												count(u.id), ud.gender, sc.region.id
											from 
												User as u, UserDetails as ud, UserRole as ur, School as sc
											where
															u.id = ur.user.id and
															ur.role.id = (select id from Role where authority='ROLE_STUDENT') and
															u.school.id in (select id from School) and
															u.school.id = sc.id and
															sc.region.id in (select id from ZoneRegion where zone.id = :zoneId) and
															ud.user.id=u.id
											group by ud.gender, sc.region.id""", [zoneId: zone.id])
//			print "stds =" + stds
			def regions = ZoneRegion.findAllByZone(zone)
			regions.each{r->
				ret."keys".add(r.regionName)
				def girls=0
				def boys=0
				stds.each {st->
					def rId = st[2]
					if(r.id.toInteger()== rId.toInteger()){
						if(st[1].toString().equalsIgnoreCase("Female"))
							girls = st[0].toInteger()
						else if(st[1].toString().equalsIgnoreCase("Male"))
							boys = st[0].toInteger()
					}
				}
				ret."Male".add(boys)
				ret."Female".add(girls)
			}
		}
		else if(zoneId!=0  && regionId!=0  && clusterId==0){// && stateId==0){
			CbseZone zone = CbseZone.get(params.zoneId.toLong())
			ZoneRegion region = ZoneRegion.get(params.regionId.toLong())
			def stds =  User.executeQuery("""select
												count(u.id), ud.gender, sc.cluster.id
											from 
												User as u, UserDetails as ud, UserRole as ur, School as sc
											where
															u.id = ur.user.id and
															ur.role.id = (select id from Role where authority='ROLE_STUDENT') and
															u.school.id in (select id from School) and
															u.school.id = sc.id and
															sc.cluster.id in (select id from RegionCluster where zone.id = :zoneId and region.id = :regionId) and
															ud.user.id=u.id
											group by ud.gender, sc.cluster.id""", [zoneId: zone.id, regionId: region.id])
//			print "stds =" + stds

			def clusters = RegionCluster.findAllByRegion(region)
			clusters.each{c->
				ret."keys".add(c.clusterName)
				def girls=0
				def boys=0
				stds.each {st->
					def cId = st[2]
					if(c.id.toInteger()== cId.toInteger()){
						if(st[1].toString().equalsIgnoreCase("Female"))
							girls = st[0].toInteger()
						else if(st[1].toString().equalsIgnoreCase("Male"))
							boys = st[0].toInteger()
					}
				}
				ret."Male".add(boys)
				ret."Female".add(girls)
			}
		}
		else if(zoneId!=0  && regionId!=0  && clusterId!=0){// && stateId==0){
			RegionCluster cluster = RegionCluster.get(params.clusterId.toLong())
			def stds =  User.executeQuery("""select
												count(u.id), ud.gender, sc.clusterState.id
											from 
												User as u, UserDetails as ud, UserRole as ur, School as sc
											where
															u.id = ur.user.id and
															ur.role.id = (select id from Role where authority='ROLE_STUDENT') and
															u.school.id in (select id from School) and
															u.school.id = sc.id and
															sc.clusterState.id in (select id from ClusterStateRel where cluster.id = :clusterId) and
															ud.user.id=u.id
											group by ud.gender, sc.clusterState.id""", [clusterId: cluster.id])
//			print "stds =" + stds
			def states = ClusterStateRel.findAllByCluster(cluster)
			states.each{s->
				State state = s.state
				ret."keys".add(state.stateName)
				def girls=0
				def boys=0
				stds.each {st->
					def sId = st[2]
					if(s.id.toInteger()== sId.toInteger()){
						if(st[1].toString().equalsIgnoreCase("Female"))
							girls = st[0].toInteger()
						else if(st[1].toString().equalsIgnoreCase("Male"))
							boys = st[0].toInteger()
					}
				}
				ret."Male".add(boys)
				ret."Female".add(girls)			
			}
		}
//		print "ret="+ret
		return ret
	}
	
	def nationWideSchoolRating(Map params){
		//		print "params="+params
				SchoolReportService srs = new SchoolReportService()
				def students = []
				def ret=[:]
				int zoneId = Integer.parseInt(params.zoneId)
				int regionId = Integer.parseInt(params.regionId)
				int clusterId = Integer.parseInt(params.clusterId)
				ret = ["keys":[],"one":[], "two":[],"three":[], "four":[], "five":[]]
		//		int stateId = Integer.parseInt(params.stateId)
		
				if(zoneId==0  && regionId==0  && clusterId==0){// && stateId==0){
					def stds =  School.executeQuery("""select 
														count(s.id), r.id, s.zone.id
													from 
														RatingMaster r, School s
													where 
															s.rating.id = r.id and
															s.zone.id in (select id from CbseZone)
													group by r.id, s.zone.id""")
					def zones = CbseZone.getAll()
//					print "stds =" + stds
					zones.each{z->
						ret."keys".add(z.zoneName)
						def one=0, two=0, three=0, four=0, five=0
						stds.each {st->
							def zId = st[2]
							if(z.id.toInteger()== zId.toInteger()){
								if(st[1].toString().equalsIgnoreCase("1"))
									one = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("2"))
									two = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("3"))
									three = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("4"))
									four = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("5"))
									five = st[0].toInteger()
							}
						}
						ret."one".add(one)
						ret."two".add(two)
						ret."three".add(three)
						ret."four".add(four)
						ret."five".add(five)
					}
				}
				else if(zoneId!=0  && regionId==0  && clusterId==0){// && stateId==0){
					CbseZone zone = CbseZone.get(zoneId.toLong())
					def stds =  School.executeQuery("""select 
														count(s.id), r.id, s.region.id
													from 
														RatingMaster r, School s
													where 
															s.rating.id = r.id and
															s.region.id in (select id from ZoneRegion where zone.id= :zoneId)
													group by r.id, s.region.id""", [zoneId: zone.id])
		//			print "stds =" + stds
					def regions = ZoneRegion.findAllByZone(zone)
					regions.each{r->
						ret."keys".add(r.regionName)
						def one=0, two=0, three=0, four=0, five=0
						stds.each {st->
							def rId = st[2]
							if(r.id.toInteger()== rId.toInteger()){
								if(st[1].toString().equalsIgnoreCase("1"))
									one = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("2"))
									two = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("3"))
									three = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("4"))
									four = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("5"))
									five = st[0].toInteger()
							}
						}
						ret."one".add(one)
						ret."two".add(two)
						ret."three".add(three)
						ret."four".add(four)
						ret."five".add(five)
					}
				}
				else if(zoneId!=0  && regionId!=0  && clusterId==0){// && stateId==0){
					CbseZone zone = CbseZone.get(params.zoneId.toLong())
					ZoneRegion region = ZoneRegion.get(params.regionId.toLong())
					def stds =  School.executeQuery("""select 
														count(s.id), r.id, s.cluster.id
													from 
														RatingMaster r, School s
													where 
															s.rating.id = r.id and
															s.cluster.id in (select id from RegionCluster where zone.id= :zoneId and region.id= :regionId)
													group by r.id, s.cluster.id
													""", [zoneId: zone.id, regionId: region.id])
		//			print "stds =" + stds
		
					def clusters = RegionCluster.findAllByRegion(region)
					clusters.each{c->
						ret."keys".add(c.clusterName)
						def one=0, two=0, three=0, four=0, five=0
						stds.each {st->
							def cId = st[2]
							if(c.id.toInteger()== cId.toInteger()){
								if(st[1].toString().equalsIgnoreCase("1"))
									one = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("2"))
									two = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("3"))
									three = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("4"))
									four = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("5"))
									five = st[0].toInteger()
							}
						}
						ret."one".add(one)
						ret."two".add(two)
						ret."three".add(three)
						ret."four".add(four)
						ret."five".add(five)
					}
				}
				else if(zoneId!=0  && regionId!=0  && clusterId!=0){// && stateId==0){
					RegionCluster cluster = RegionCluster.get(params.clusterId.toLong())
					def stds =  School.executeQuery("""select 
														count(s.id), r.id, s.clusterState.id
													from 
														RatingMaster r, School s
													where 
															s.rating.id = r.id and
															s.clusterState.id in (select id from ClusterStateRel where cluster.id= :clusterId)
													group by r.id, s.clusterState.id""", [clusterId: cluster.id])
		//			print "stds =" + stds
					def states = ClusterStateRel.findAllByCluster(cluster)
					states.each{s->
						State state = s.state
						ret."keys".add(state.stateName)
						def one=0, two=0, three=0, four=0, five=0
						stds.each {st->
							def sId = st[2]
							if(s.id.toInteger()== sId.toInteger()){
								if(st[1].toString().equalsIgnoreCase("1"))
									one = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("2"))
									two = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("3"))
									three = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("4"))
									four = st[0].toInteger()
								else if(st[1].toString().equalsIgnoreCase("5"))
									five = st[0].toInteger()
							}
						}
						ret."one".add(one)
						ret."two".add(two)
						ret."three".add(three)
						ret."four".add(four)
						ret."five".add(five)
					}
				}
//				print "ret="+ret
				return ret
			}
	def teacherRatingStatistics(Map params){
		//print "params: " + params
				def students = []
				def ret=[:]
				int academicYrId = Integer.parseInt(params.academicYrId)
				int zoneId = Integer.parseInt(params.zoneId)
				int regionId = Integer.parseInt(params.regionId)
				int clusterId = Integer.parseInt(params.clusterId)
				int schoolId = Integer.parseInt(params.schoolId)
				ret = ["keys":[],"one":[], "two":[],"three":[], "four":[], "five":[]]
		//		int stateId = Integer.parseInt(params.stateId)
		
				if(zoneId==0  && regionId==0  && clusterId==0 && schoolId==0){
					def stds =  SchoolTeacherRating.executeQuery("""select 
														count(str.teacher.id), r.id, s.zone.id
													from 
														SchoolTeacherRating str, RatingMaster r, School s
													where 
														str.acdYr.id = :academicYrId and
														str.school.id = s.id and
														str.rating.id = r.id and
														s.zone.id in (select id from CbseZone)
													group by r.id, s.zone.id""",[academicYrId: academicYrId.toLong()])
					if(stds){
						def zones = CbseZone.getAll()
	//					print "stds =" + stds
						zones.each{z->
							ret."keys".add(z.zoneName)
							def one=0, two=0, three=0, four=0, five=0
							stds.each {st->
								def zId = st[2]
								if(z.id.toInteger()== zId.toInteger()){
									if(st[1].toString().equalsIgnoreCase("1"))
										one = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("2"))
										two = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("3"))
										three = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("4"))
										four = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("5"))
										five = st[0].toInteger()
								}
							}
							ret."one".add(one)
							ret."two".add(two)
							ret."three".add(three)
							ret."four".add(four)
							ret."five".add(five)
						}
					}
					else{
						ret=[:]
						ret."message"="No Teachers Data Available at this Time"
			
					}
				}
				else if(zoneId!=0  && regionId==0  && clusterId==0 && schoolId==0){
					CbseZone zone = CbseZone.get(zoneId.toLong())
					def stds =  SchoolTeacherRating.executeQuery("""select 
														count(str.teacher.id), r.id, s.region.id
													from 
														SchoolTeacherRating str, RatingMaster r, School s
													where 
														str.acdYr.id = :academicYrId and
														str.school.id = s.id and
														str.rating.id = r.id and
														s.region.id in (select id from ZoneRegion where zone.id= :zoneId)
													group by r.id, s.region.id""",[academicYrId: academicYrId.toLong(),zoneId: zone.id])
		//			print "stds =" + stds
					if(stds){
						def regions = ZoneRegion.findAllByZone(zone)
						regions.each{r->
							ret."keys".add(r.regionName)
							def one=0, two=0, three=0, four=0, five=0
							stds.each {st->
								def rId = st[2]
								if(r.id.toInteger()== rId.toInteger()){
									if(st[1].toString().equalsIgnoreCase("1"))
										one = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("2"))
										two = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("3"))
										three = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("4"))
										four = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("5"))
										five = st[0].toInteger()
								}
							}
							ret."one".add(one)
							ret."two".add(two)
							ret."three".add(three)
							ret."four".add(four)
							ret."five".add(five)
						}
					}
					else{
						ret=[:]
						ret."message"="No Teachers Data Available at this Time"
			
					}
				}
				else if(zoneId!=0  && regionId!=0  && clusterId==0 && schoolId==0){
					CbseZone zone = CbseZone.get(params.zoneId.toLong())
					ZoneRegion region = ZoneRegion.get(params.regionId.toLong())
					def stds =  SchoolTeacherRating.executeQuery("""select 
														count(str.teacher.id), r.id, s.cluster.id
													from 
														SchoolTeacherRating str, RatingMaster r, School s
													where 
														str.acdYr.id = :academicYrId and
														str.school.id = s.id and
														str.rating.id = r.id and
														s.cluster.id in (select id from RegionCluster where zone.id= :zoneId and region.id= :regionId)
													group by r.id, s.cluster.id""",[academicYrId: academicYrId.toLong(),zoneId: zone.id, regionId: region.id])
		//			print "stds =" + stds
					if(stds){
						def clusters = RegionCluster.findAllByRegion(region)
						clusters.each{c->
							ret."keys".add(c.clusterName)
							def one=0, two=0, three=0, four=0, five=0
							stds.each {st->
								def cId = st[2]
								if(c.id.toInteger()== cId.toInteger()){
									if(st[1].toString().equalsIgnoreCase("1"))
										one = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("2"))
										two = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("3"))
										three = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("4"))
										four = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("5"))
										five = st[0].toInteger()
								}
							}
							ret."one".add(one)
							ret."two".add(two)
							ret."three".add(three)
							ret."four".add(four)
							ret."five".add(five)
						}
					}
					else{
						ret=[:]
						ret."message"="No Teachers Data Available at this Time"
			
					}
				}
				else if(zoneId!=0  && regionId!=0  && clusterId!=0 && schoolId==0){
					RegionCluster cluster = RegionCluster.get(params.clusterId.toLong())
					def stds =  SchoolTeacherRating.executeQuery("""select 
														count(str.teacher.id), r.id, s.clusterState.id
													from 
														SchoolTeacherRating str, RatingMaster r, School s
													where 
														str.acdYr.id = :academicYrId and
														str.school.id = s.id and
														str.rating.id = r.id and
														s.clusterState.id in (select id from ClusterStateRel where cluster.id= :clusterId)
													group by r.id, s.clusterState.id""",[academicYrId: academicYrId.toLong(),clusterId: cluster.id])
		//			print "stds =" + stds
					if(stds){
						def states = ClusterStateRel.findAllByCluster(cluster)
						states.each{s->
							State state = s.state
							ret."keys".add(state.stateName)
							def one=0, two=0, three=0, four=0, five=0
							stds.each {st->
								def sId = st[2]
								if(s.id.toInteger()== sId.toInteger()){
									if(st[1].toString().equalsIgnoreCase("1"))
										one = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("2"))
										two = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("3"))
										three = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("4"))
										four = st[0].toInteger()
									else if(st[1].toString().equalsIgnoreCase("5"))
										five = st[0].toInteger()
								}
							}
							ret."one".add(one)
							ret."two".add(two)
							ret."three".add(three)
							ret."four".add(four)
							ret."five".add(five)
						}
					}
					else{
						ret=[:]
						ret."message"="No Teachers Data Available at this Time"
			
					}
				}
				else if(zoneId!=0  && regionId!=0  && clusterId!=0 && schoolId!=0){
					RegionCluster cluster = RegionCluster.get(params.clusterId.toLong())
					School school = School.get(schoolId)
					def stds =  SchoolTeacherRating.executeQuery("""select
																count(str.teacher.id), r.id
															from 
																SchoolTeacherRating str, RatingMaster r, School s
															where 
																str.acdYr.id = :academicYrId and
																s.id = :schoolId and
																str.school.id = s.id and
																str.rating.id = r.id 
															group by 
																r.id""",[academicYrId: academicYrId.toLong(),schoolId: school.id])
					//			print "stds =" + stds
					if(stds){
						ret."keys".add(school.schoolName)
						def one=0, two=0, three=0, four=0, five=0
						stds.each {st->
							if(st[1].toString().equalsIgnoreCase("1"))
								one = st[0].toInteger()
							else if(st[1].toString().equalsIgnoreCase("2"))
								two = st[0].toInteger()
							else if(st[1].toString().equalsIgnoreCase("3"))
								three = st[0].toInteger()
							else if(st[1].toString().equalsIgnoreCase("4"))
								four = st[0].toInteger()
							else if(st[1].toString().equalsIgnoreCase("5"))
								five = st[0].toInteger()
						}
						ret."one".add(one)
						ret."two".add(two)
						ret."three".add(three)
						ret."four".add(four)
						ret."five".add(five)
					}
					else{
						ret=[:]
						ret."message"="No Teachers Data Available at this Time"
			
					}
				}
//				print "ret="+ret
				return ret
	}
	def teacherRatingList(Map params){
//		print "params: " + params
		def ret = [:]
		int academicYrId = Integer.parseInt(params.academicYrId)
		def schoolId= (Integer.parseInt(params.schoolId)).toLong()
		School school= School.get(schoolId)
		ret=["Teachers":[]]
		def teachers=[]
		teachers = SchoolTeacherRating.executeQuery("""select
																str.teacher.id, CONCAT(COALESCE(ud.firstName,''),' ', COALESCE(ud.lastname,'') ), ud.specification, ud.yearsOfExp, ud.tetQualified, str.rating.rating, str.rating.ratingName
															from 
																SchoolTeacherRating str, UserDetails ud
															where 
																str.acdYr.id = :academicYrId and
																str.school.id = :schoolId and
																str.teacher.id = ud.user.id
															""",[academicYrId: academicYrId.toLong(),schoolId: school.id])
		if(teachers){
			ret."Teachers" = teachers
		}
		else{
			ret."message"="No Teachers Data Available at this Time"

		}
//		print "ret="+ret
		return ret
	}
	
	def religionRpt(Map params){
//		print "params: " + params
		def ret = [:]
		ret=["religion":[]]
		def religion=[]
		int zoneId = Integer.parseInt(params.zoneId)
		int regionId = Integer.parseInt(params.regionId)
		int clusterId = Integer.parseInt(params.clusterId)

		if(zoneId==0  && regionId==0  && clusterId==0){// && stateId==0){
			religion = UserDetails.executeQuery("""select
														count(ud.user.id), ud.religion
													from 
														User u, UserDetails ud, UserRole ur, School s
													where 
														u.id = ud.user.id and
														u.school.id = s.id and
														s.zone.id in (select id from CbseZone) and
														u.id = ur.user.id and 
														ur.role.id in (select id from Role where authority in ('ROLE_TEACHER', 'ROLE_STUDENT', 'ROLE_ADMIN', 'ROLE_SCHOOLS_MANAGER')) 
													group by ud.religion""")
		}
		else if(zoneId!=0  && regionId==0  && clusterId==0){// && stateId==0){
			CbseZone zone = CbseZone.get(zoneId.toLong())
			religion = UserDetails.executeQuery("""select
														count(ud.user.id), ud.religion
													from 
														User u, UserDetails ud, UserRole ur, School s
													where 
														u.id = ud.user.id and
														u.school.id = s.id and
														s.region.id in (select id from ZoneRegion where zone.id= :zoneId) and
														u.id = ur.user.id and 
														ur.role.id in (select id from Role where authority in ('ROLE_TEACHER', 'ROLE_STUDENT', 'ROLE_ADMIN', 'ROLE_SCHOOLS_MANAGER')) 
													group by ud.religion""", [zoneId: zone.id])
		}
		else if(zoneId!=0  && regionId!=0  && clusterId==0){// && stateId==0){
			CbseZone zone = CbseZone.get(params.zoneId.toLong())
			ZoneRegion region = ZoneRegion.get(params.regionId.toLong())
			religion = UserDetails.executeQuery("""select
														count(ud.user.id), ud.religion
													from 
														User u, UserDetails ud, UserRole ur, School s
													where 
														u.id = ud.user.id and
														u.school.id = s.id and
														s.cluster.id in (select id from RegionCluster where zone.id= :zoneId and region.id= :regionId) and
														u.id = ur.user.id and 
														ur.role.id in (select id from Role where authority in ('ROLE_TEACHER', 'ROLE_STUDENT', 'ROLE_ADMIN', 'ROLE_SCHOOLS_MANAGER')) 
													group by ud.religion""", [zoneId: zone.id, regionId: region.id])
		}
		else if(zoneId!=0  && regionId!=0  && clusterId!=0){// && stateId==0){
			RegionCluster cluster = RegionCluster.get(params.clusterId.toLong())
			religion = UserDetails.executeQuery("""select
														count(ud.user.id), ud.religion
													from 
														User u, UserDetails ud, UserRole ur, School s
													where 
														u.id = ud.user.id and
														u.school.id = s.id and
														s.clusterState.id in (select id from ClusterStateRel where cluster.id= :clusterId) and
														u.id = ur.user.id and 
														ur.role.id in (select id from Role where authority in ('ROLE_TEACHER', 'ROLE_STUDENT', 'ROLE_ADMIN', 'ROLE_SCHOOLS_MANAGER')) 
													group by ud.religion""", [clusterId: cluster.id])
		}
		if(religion){
			def rel = []
			def sum = 0
			religion.each {r->
				sum+=r[0]
			}
			religion.each {rlg->
				def rl=[:]
				rl."name" = rlg[1]
				rl."y" = ((rlg[0]*100)/sum).toDouble().round(2)
				rel.add(rl)
			}
			ret."religion" = rel
		}
		else{
			ret."message"="No Data Available at this Time"
	
		}
		return ret
	}
	
	def subjectWiseClassPerfRpt(Map params){
		def ret = [:]
		//def params= [zoneId:"2", regionId:"3", clusterId:"6", clusterStateId:"18" , schoolId:"42", classNameId:"5", academicYrId:"6"]
		int schoolId = Integer.parseInt(params.schoolId)
		int classMasterId = Integer.parseInt(params.classNameId)
		AcademicYear acYr = AcademicYear.get(Integer.parseInt(params.academicYrId))
		School school = School.get(schoolId)
		ClassMaster classMaster = ClassMaster.get(classMasterId.toLong())
		SchoolClassRel schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr,school,classMaster)
		def divisions = SchoolClassDivision.findAllBySchoolClass(schoolClass)
		def schoolClassSubjects = SchoolSubjectRel.findAllBySchoolClassAndStatusInList(schoolClass,['A', 'F'])
		//print "schoolClassSubjects = " + schoolClassSubjects.subjectMaster
		ret."divisionScores"=[]
		if(schoolClassSubjects.subjectMaster)
			ret."Categories"=[]
		divisions.each{div ->
			def classDivSudents= StudentClassRel.findAllByClassDivision(div)
			//print "classDivSudents = " + classDivSudents
			def division = div.division
			//print ret
			def scores =[]
			if(classDivSudents && schoolClassSubjects.subjectMaster){

				def stdScore = StdScholFinalScore.createCriteria().list {
					projections {
						sum('finalScore')
						groupProperty('subject')
					}
					and {
						'eq'("academicYr", acYr)
						'eq'("school", school)
						'eq'("className", classMaster)
						'eq'("division", div)
						'in'("student",classDivSudents?.student)
						'in'("subject",schoolClassSubjects.subjectMaster)
					}
				}
				//print "stdScore ="+ stdScore
				stdScore.each { ss->
					def scoreAvg = ss[0]/classDivSudents.size()
					ret."Categories".add(ss[1].subject)
					scores.add((double)Math.round(scoreAvg))
				}
			}
			ret."divisionScores".add([name:division,data:scores])
		}
		return ret
	}
	
	def retSchoolFaComparisons(Map params){
		def categories = [] , ret = [:]
		def schlClsFa , cbseClsFa , zoneClsFa , regClsFa , clusterClsFa
		def scoreDataSchl = [], scoreDataCbse = [] , scoreDataZone = [] ,scoreDataRegion =[], scoreDataCluster = []
		def schoolData = [:] , cbseData = [:] , zoneData = [:] , regionData = [:] , clusterData=[:]
		def CBSESeries = [] , ZonalSeries = [] , RegionalSeries = [] , ClusteralSeries = []
		School school = School.get(params.schoolId.toInteger())
		School school0 = School.get(0)
		def classMasterIds = ClassMaster.executeQuery("""select c from ClassMaster c where (c.className=9 or c.className=10)""")
		def acYrs = AcademicYear.executeQuery("""select a,a.startYear from AcademicYear a where (a.current=1 or
												a.startYear=(select a.startYear-1 from AcademicYear a where a.current=1) and
												a.endYear=(select a.endYear-1 from AcademicYear a where a.current=1))""")
		if(classMasterIds){
			classMasterIds.each{cmi->
				if(acYrs){
					acYrs.each{ay->
						def clsYr = cmi.classRoman+" - "+ay[1]
						categories.add(clsYr)
						schlClsFa = StdScholFinalScore.executeQuery("""select sum(s.formativeAssmt)/ count(s.id) 
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school = :school""",
																		[acYr : ay[0] , className : cmi , school : school])
						if(schlClsFa[0]!=null){
							scoreDataSchl.add(schlClsFa[0])
						}
						else{
							scoreDataSchl.add(0)
						}
						cbseClsFa = StdScholFinalScore.executeQuery("""select sum(s.formativeAssmt)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc not in (:school0,:school) and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school , school0: school0])
						if(cbseClsFa[0]!=null){
							scoreDataCbse.add(cbseClsFa[0])
						}
						else{
							scoreDataCbse.add(0)
						}
						zoneClsFa = StdScholFinalScore.executeQuery("""select sum(s.formativeAssmt)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc.zone=(select zs.zone from School zs where zs=:school) and sc<>:school and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school])
						if(zoneClsFa[0]!=null){
							scoreDataZone.add(zoneClsFa[0])
						}
						else{
							scoreDataZone.add(0)
						}
						regClsFa = StdScholFinalScore.executeQuery("""select sum(s.formativeAssmt)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc.region=(select rs.region from School rs where rs=:school) and sc<>:school and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school])
						if(regClsFa[0]!=null){
							scoreDataRegion.add(regClsFa[0])
						}
						else{
							scoreDataRegion.add(0)
						}
						clusterClsFa = StdScholFinalScore.executeQuery("""select sum(s.formativeAssmt)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc.cluster=(select cs.region from School cs where cs=:school) and sc<>:school and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school])
						if(clusterClsFa[0]!=null){
							scoreDataCluster.add(clusterClsFa[0])
						}
						else{
							scoreDataCluster.add(0)
						}
					}
				}
			}
		}
		schoolData = [name : "School Average" , data : scoreDataSchl]
		cbseData = [name : "CBSE Average" , data : scoreDataCbse] 
		CBSESeries.add(cbseData)
		zoneData = [name : "Zonal Average" , data : scoreDataZone]
		ZonalSeries.add(zoneData)
		regionData = [name : "Regional Average" , data : scoreDataRegion] 
		RegionalSeries.add(regionData)
		clusterData=[name : "Clusteral Average" , data : scoreDataCluster]
		ClusteralSeries.add(clusterData)
		CBSESeries.add(schoolData)
		ZonalSeries.add(schoolData)
		RegionalSeries.add(schoolData)
		ClusteralSeries.add(schoolData)
		ret = [categories : categories, CBSEseries : CBSESeries , Zonalseries : ZonalSeries , Regionalseries : RegionalSeries , Clusteralseries : ClusteralSeries]
		//println ret
		return ret
/*		def schoolDat=[], schoolCBSE =[], schoolZone=[],schoolRegion=[], schoolCluster=[]
		School school = School.get(params.schoolId?.toLong())
//		def currentAcYr = utilService.retCurrentSchoolAcYear(school.id.toInteger())
		def currentAcYr = AcademicYear.findByCurrent(1)
		print "currentAcYr = " +currentAcYr
//		def prevAcYr1 = AcademicYear.findByStartYearAndEndYear(currentAcYr.sYear.toInteger()-1,currentAcYr.eYear.toInteger()-1)
		def prevAcYr1 = AcademicYear.findByStartYearAndEndYear(currentAcYr.startYear.toInteger()-1,currentAcYr.endYear.toInteger()-1)
//		def prevAcYr2 = AcademicYear.findByStartYearAndEndYear(currentAcYr.sYear.toInteger()-2,currentAcYr.eYear.toInteger()-2)
//		def acYrs = [prevAcYr1.id, prevAcYr2.id ]
		def acYrs = [prevAcYr1.id, currentAcYr.id ]
		print "acYrs = " +acYrs
		def class9 = ClassMaster.findByClassName("9")
		def class10 = ClassMaster.findByClassName("10")
		def classes = [class9.id,class10.id ]
		print "classes = " +classes
		if(school){
			schoolDat =  StdScholFinalScore.executeQuery("""select
																round(sum(formativeAssmt)/ count(*),2) ,  className.className, academicYr.startYear
															from
																StdScholFinalScore
															where
																academicYr.id in (:acYrs) and
																className.id in (:classes) and
																school.id = :schoolId
															group by
																className.id, academicYr.id
															order by academicYr.id, className.id
															""", [schoolId: school.id, acYrs: acYrs, classes: classes])
			schoolCBSE = StdScholFinalScore.executeQuery("""select
																round(sum(formativeAssmt)/ count(*),2) ,  className.className, academicYr.startYear
															from
																StdScholFinalScore
															where
																academicYr.id in (:acYrs) and
																className.id in (:classes) and
																school.id in (select id from School where id <>0 and id<>:schoolId and status='A')
															group by
																className.id, academicYr.id
															order by academicYr.id, className.id
															""", [schoolId: school.id, acYrs: acYrs, classes: classes])
			schoolZone = StdScholFinalScore.executeQuery("""select
																round(sum(formativeAssmt)/ count(*),2) ,  className.className, academicYr.startYear
															from
																StdScholFinalScore
															where
																academicYr.id in (:acYrs) and
																className.id in (:classes) and
																school.id in (select id from School where zone.id=(select zone.id from School where id=:schoolId) and id<>:schoolId and status='A')
															group by
																className.id, academicYr.id
															order by academicYr.id, className.id
															""", [schoolId:school.id , acYrs: acYrs, classes: classes])
			schoolRegion = StdScholFinalScore.executeQuery("""select
																round(sum(formativeAssmt)/ count(*),2) ,  className.className, academicYr.startYear
															from
																StdScholFinalScore
															where
																academicYr.id in (:acYrs) and
																className.id in (:classes) and
																school.id in (select id from School where region.id=(select region.id from School where id=:schoolId) and id<>:schoolId and status='A')
															group by
																className.id, academicYr.id
															order by academicYr.id, className.id
															""", [schoolId:school.id , acYrs: acYrs, classes: classes])
			schoolCluster = StdScholFinalScore.executeQuery("""select
																round(sum(formativeAssmt)/ count(*),2) ,  className.className, academicYr.startYear
															from
																StdScholFinalScore
															where
																academicYr.id in (:acYrs) and
																className.id in (:classes) and
																school.id in (select id from School where cluster.id=(select cluster.id from School where id=:schoolId) and id<>:schoolId and status='A')
															group by
																className.id, academicYr.id
															order by academicYr.id, className.id
															""", [schoolId:school.id , acYrs: acYrs, classes: classes])


		}
		acYrs = [prevAcYr1.startYear, currentAcYr.startYear]
		classes = [class9,class10]
		def categories = [], data=[]
		classes.each {cl->
			acYrs.each {acYr->
				categories.add(cl.classRoman+" - "+acYr)
				data.add(0)
			}
		}
		print "categories =" + categories
		def schoolSeries = [
			name: 'School Average',
			data: data
		]
		def CBSEseries = [[
			name: 'CBSE Average',
			data: data
		], ]
		def Zonalseries = [[
			name: 'Zonal Average',
			data: data
		]]
		def Regionalseries = [[
			name: 'Regional Average',
			data: data
		]]
		def Clusteralseries = [[
			name: 'Clusteral Average',
			data: data
		]]
		print "schoolSeries = " + schoolSeries
		data=[]
		schoolDat?.each {sd->
			if(sd[1]==class9.className&& sd[2]==prevAcYr1.startYear){
				schoolSeries.data[0] = sd[0]
			}
			if(sd[1]==class9.className&& sd[2]==currentAcYr.startYear){
				schoolSeries.data[1] = sd[0]
			}
			if(sd[1]==class10.className&& sd[2]==prevAcYr1.startYear){
				schoolSeries.data[2] = sd[0]
			}
			if(sd[1]==class10.className&& sd[2]==currentAcYr.startYear){
				schoolSeries.data[3] = sd[0]
			}
		}
//		schoolSeries.data = data
		print "schoolSeries = " + schoolSeries
		data=[]
		schoolCBSE?.each {sc->
			if(sc[1]==class9.className&& sc[2]==prevAcYr1.startYear){
				data[0] = sc[0]
			}
			if(sc[1]==class9.className&& sc[2]==currentAcYr.startYear){
				data[1] = sc[0]
			}
			if(sc[1]==class10.className&& sc[2]==prevAcYr1.startYear){
				data[2] = sc[0]
			}
			if(sc[1]==class10.className&& sc[2]==currentAcYr.startYear){
				data[3] = sc[0]
			}
		}
		CBSEseries[0].data = data
		CBSEseries.add(schoolSeries)
		print "CBSEseries = " + CBSEseries
		data=[]
		
		schoolZone?.each {sz->
			if(sz[1]==class9.className&& sz[2]==prevAcYr1.startYear){
				data[0] = sz[0]
			}
			if(sz[1]==class9.className&& sz[2]==currentAcYr.startYear){
				data[1] = sz[0]
			}
			if(sz[1]==class10.className&& sz[2]==prevAcYr1.startYear){
				data[2] = sz[0]
			}
			if(sz[1]==class10.className&& sz[2]==currentAcYr.startYear){
				data[3] = sz[0]
			}
		}
		Zonalseries[0].data = data
		Zonalseries.add(schoolSeries)
		print "Zonalseries = " + Zonalseries
		data=[]
		
		schoolRegion?.each {sr->
			if(sr[1]==class9.className&& sr[2]==prevAcYr1.startYear){
				data[0] = sr[0]
			}
			if(sr[1]==class9.className&& sr[2]==currentAcYr.startYear){
				data[1] = sr[0]
			}
			if(sr[1]==class10.className&& sr[2]==prevAcYr1.startYear){
				data[2] = sr[0]
			}
			if(sr[1]==class10.className&& sr[2]==currentAcYr.startYear){
				data[3] = sr[0]
			}
		}
		Regionalseries[0].data = data
		Regionalseries.add(schoolSeries)
		print "Regionalseries = " + Regionalseries
		data=[]
		
		schoolCluster?.each {scl->
			if(scl[1]==class9.className&& scl[2]==prevAcYr1.startYear){
				data[0] = scl[0]
			}
			if(scl[1]==class9.className&& scl[2]==currentAcYr.startYear){
				data[1] = scl[0]
			}
			if(scl[1]==class10.className&& scl[2]==prevAcYr1.startYear){
				data[2] = scl[0]
			}
			if(scl[1]==class10.className&& scl[2]==currentAcYr.startYear){
				data[3] = scl[0]
			}
		}
		Clusteralseries[0].data = data
		Clusteralseries.add(schoolSeries)
		print "Clusteralseries = " + Clusteralseries
		def ret = [:]
		ret=[categories:categories,CBSEseries: CBSEseries, Zonalseries: Zonalseries, Regionalseries: Regionalseries, Clusteralseries: Clusteralseries]
		return ret*/
		
	}
	
	def retSchoolSaComparisons(Map params){
		def categories = [] , ret = [:]
		def schlClsFa , cbseClsFa , zoneClsFa , regClsFa , clusterClsFa
		def scoreDataSchl = [], scoreDataCbse = [] , scoreDataZone = [] ,scoreDataRegion =[], scoreDataCluster = []
		def schoolData = [:] , cbseData = [:] , zoneData = [:] , regionData = [:] , clusterData=[:]
		def CBSESeries = [] , ZonalSeries = [] , RegionalSeries = [] , ClusteralSeries = []
		School school = School.get(params.schoolId.toInteger())
		School school0 = School.get(0)
		def classMasterIds = ClassMaster.executeQuery("""select c from ClassMaster c where (c.className=9 or c.className=10)""")
		def acYrs = AcademicYear.executeQuery("""select a,a.startYear from AcademicYear a where (a.current=1 or
												a.startYear=(select a.startYear-1 from AcademicYear a where a.current=1) and
												a.endYear=(select a.endYear-1 from AcademicYear a where a.current=1))""")
		if(classMasterIds){
			classMasterIds.each{cmi->
				if(acYrs){
					acYrs.each{ay->
						def clsYr = cmi.classRoman+" - "+ay[1]
						categories.add(clsYr)
						schlClsFa = StdScholFinalScore.executeQuery("""select sum(s.summativeAssmt)/ count(s.id) 
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school = :school""",
																		[acYr : ay[0] , className : cmi , school : school])
						if(schlClsFa[0]!=null){
							scoreDataSchl.add(schlClsFa[0])
						}
						else{
							scoreDataSchl.add(0)
						}
						cbseClsFa = StdScholFinalScore.executeQuery("""select sum(s.summativeAssmt)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc not in (:school0,:school) and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school , school0: school0])
						if(cbseClsFa[0]!=null){
							scoreDataCbse.add(cbseClsFa[0])
						}
						else{
							scoreDataCbse.add(0)
						}
						zoneClsFa = StdScholFinalScore.executeQuery("""select sum(s.summativeAssmt)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc.zone=(select zs.zone from School zs where zs=:school) and sc<>:school and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school])
						if(zoneClsFa[0]!=null){
							scoreDataZone.add(zoneClsFa[0])
						}
						else{
							scoreDataZone.add(0)
						}
						regClsFa = StdScholFinalScore.executeQuery("""select sum(s.summativeAssmt)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc.region=(select rs.region from School rs where rs=:school) and sc<>:school and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school])
						if(regClsFa[0]!=null){
							scoreDataRegion.add(regClsFa[0])
						}
						else{
							scoreDataRegion.add(0)
						}
						clusterClsFa = StdScholFinalScore.executeQuery("""select sum(s.summativeAssmt)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc.cluster=(select cs.region from School cs where cs=:school) and sc<>:school and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school])
						if(clusterClsFa[0]!=null){
							scoreDataCluster.add(clusterClsFa[0])
						}
						else{
							scoreDataCluster.add(0)
						}
					}
				}
			}
		}
		schoolData = [name : "School Average" , data : scoreDataSchl]
		cbseData = [name : "CBSE Average" , data : scoreDataCbse] 
		CBSESeries.add(cbseData)
		zoneData = [name : "Zonal Average" , data : scoreDataZone]
		ZonalSeries.add(zoneData)
		regionData = [name : "Regional Average" , data : scoreDataRegion] 
		RegionalSeries.add(regionData)
		clusterData=[name : "Clusteral Average" , data : scoreDataCluster]
		ClusteralSeries.add(clusterData)
		CBSESeries.add(schoolData)
		ZonalSeries.add(schoolData)
		RegionalSeries.add(schoolData)
		ClusteralSeries.add(schoolData)
		ret = [categories : categories, CBSEseries : CBSESeries , Zonalseries : ZonalSeries , Regionalseries : RegionalSeries , Clusteralseries : ClusteralSeries]
		println ret
		return ret

	}
	
	def retSchoolFinalScoreComparisons(Map params){
		def categories = [] , ret = [:]
		def schlClsFa , cbseClsFa , zoneClsFa , regClsFa , clusterClsFa
		def scoreDataSchl = [], scoreDataCbse = [] , scoreDataZone = [] ,scoreDataRegion =[], scoreDataCluster = []
		def schoolData = [:] , cbseData = [:] , zoneData = [:] , regionData = [:] , clusterData=[:]
		def CBSESeries = [] , ZonalSeries = [] , RegionalSeries = [] , ClusteralSeries = []
		School school = School.get(params.schoolId.toInteger())
		School school0 = School.get(0)
		def classMasterIds = ClassMaster.executeQuery("""select c from ClassMaster c where (c.className=9 or c.className=10)""")
		def acYrs = AcademicYear.executeQuery("""select a,a.startYear from AcademicYear a where (a.current=1 or
												a.startYear=(select a.startYear-1 from AcademicYear a where a.current=1) and
												a.endYear=(select a.endYear-1 from AcademicYear a where a.current=1))""")
		if(classMasterIds){
			classMasterIds.each{cmi->
				if(acYrs){
					acYrs.each{ay->
						def clsYr = cmi.classRoman+" - "+ay[1]
						categories.add(clsYr)
						schlClsFa = StdScholFinalScore.executeQuery("""select sum(s.finalScore)/ count(s.id) 
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school = :school""",
																		[acYr : ay[0] , className : cmi , school : school])
						if(schlClsFa[0]!=null){
							scoreDataSchl.add(schlClsFa[0])
						}
						else{
							scoreDataSchl.add(0)
						}
						cbseClsFa = StdScholFinalScore.executeQuery("""select sum(s.finalScore)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc not in (:school0,:school) and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school , school0: school0])
						if(cbseClsFa[0]!=null){
							scoreDataCbse.add(cbseClsFa[0])
						}
						else{
							scoreDataCbse.add(0)
						}
						zoneClsFa = StdScholFinalScore.executeQuery("""select sum(s.finalScore)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc.zone=(select zs.zone from School zs where zs=:school) and sc<>:school and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school])
						if(zoneClsFa[0]!=null){
							scoreDataZone.add(zoneClsFa[0])
						}
						else{
							scoreDataZone.add(0)
						}
						regClsFa = StdScholFinalScore.executeQuery("""select sum(s.finalScore)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc.region=(select rs.region from School rs where rs=:school) and sc<>:school and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school])
						if(regClsFa[0]!=null){
							scoreDataRegion.add(regClsFa[0])
						}
						else{
							scoreDataRegion.add(0)
						}
						clusterClsFa = StdScholFinalScore.executeQuery("""select sum(s.finalScore)/ count(s.id)
																		from
																			StdScholFinalScore s
																		where
																			s.academicYr = :acYr and
																			s.className = :className and
																			s.school in (select sc from School sc where sc.cluster=(select cs.region from School cs where cs=:school) and sc<>:school and status='A')""",
																			[acYr : ay[0] , className : cmi , school:school])
						if(clusterClsFa[0]!=null){
							scoreDataCluster.add(clusterClsFa[0])
						}
						else{
							scoreDataCluster.add(0)
						}
					}
				}
			}
		}
		schoolData = [name : "School Average" , data : scoreDataSchl]
		cbseData = [name : "CBSE Average" , data : scoreDataCbse] 
		CBSESeries.add(cbseData)
		zoneData = [name : "Zonal Average" , data : scoreDataZone]
		ZonalSeries.add(zoneData)
		regionData = [name : "Regional Average" , data : scoreDataRegion] 
		RegionalSeries.add(regionData)
		clusterData=[name : "Clusteral Average" , data : scoreDataCluster]
		ClusteralSeries.add(clusterData)
		CBSESeries.add(schoolData)
		ZonalSeries.add(schoolData)
		RegionalSeries.add(schoolData)
		ClusteralSeries.add(schoolData)
		ret = [categories : categories, CBSEseries : CBSESeries , Zonalseries : ZonalSeries , Regionalseries : RegionalSeries , Clusteralseries : ClusteralSeries]
		println ret
		return ret
	}
}

