package egov

import java.sql.Timestamp
import java.util.Map;

class DataEntryService {

    def serviceMethod() {

    }
	def utilService = new UtilService()
	
	//return random sports_master object
	def RandSports() {
		//def arraylist = []
		def sportObjects = SportsMaster.getAll()
		Random generator = new Random();
		//for(int i = 0; i < 100; i++){
		  int j = generator.nextInt(6); // this will give us 0,1,2,or 3
		 // arraylist.add(sportObjects[j]);
		  return sportObjects[j]
		  // etc.. continues with 3 other else if statments and objects
		//}
	}
	
	//return random gender string, male or female
	def RandGender() {
		def gender = ['Male', 'Female']
		Random generator = new Random()
		  int j = generator.nextInt(1) // this will give us 0,1,2,or 3
		  return gender[j]
	}
	
	//return random blood_grp_master object
	def randBoodGroup() {
		//def arraylist = []
		def bldGrpObjects = BloodGrpMaster.getAll()
		Random generator = new Random();
		//for(int i = 0; i < 100; i++){
		  int j = generator.nextInt(7); // this will give us 0,1,2,or 3
		 // arraylist.add(sportObjects[j]);
		  return bldGrpObjects[j]
		  // etc.. continues with 3 other else if statments and objects
		//}
	}
	
	//return random string, yes or no
	def randYesNo() {
		def result = ['Yes', 'No']
		Random generator = new Random()
		int j = generator.nextInt(1) // this will give us the 0 or 1 index's value
		return result[j]
	}
	
	//return random boolean value, true or false (0/1)
	def randBoolean() {
		def x = false
		def y = true
		def result = [y, x, y]
		Random generator = new Random()
		int j = generator.nextInt(2) // this will give us the 0 or 1 index's value
		return result[j]
	}

	//can be used to fill the annual_income column of user_details table for user_id's with role ROLE_PARENT
	def randAnnualIncome() {
		def result = ['<10k pa', '10k-50k pa', '50k-1L pa', '1L-5L pa', '5L-10L pa', '>10L pa']
		Random generator = new Random()
		int j = generator.nextInt(5) // this will give us the 0 to 5 index's value
		return result[j]
	}
	
	//return random height in cms
	def randHeight() {
		def result = (130..155).toList()
		Random generator = new Random()
		int j = generator.nextInt(24) // this will give us the 0 or 24 index's value
		return result[j]
	}
	
	//return random weight in Kgs
	def randWeight() {
		def result = (30..55).toList()
		Random generator = new Random()
		int j = generator.nextInt(24) // this will give us the 0 or 24 index's value
		return result[j]
	}
	
	//return random vision values.
	def randVision(){
		def result = ["(L) 6/6 (R) N6", "(L) 3.5 (R) .75", "(L) +.25 (R) +.25", "(L) 0.25 (R) 1.50"]
		Random generator = new Random()
		int j = generator.nextInt(3) // this will give us the 0 to 3 index's value
		return result[j]
	}
	
	def randStatus(){
		def result = ["poor", "bad", "normal", "good", "very good"]
		Random generator = new Random()
		int j = generator.nextInt(4) // this will give us the 0 to 3 index's value
		return result[j]
	}
	
	//return random category from school_category table
	def randSchoolCategory() {
		//def arraylist = []
		def schoolCategoryObjects = SchoolCategory.getAll()
		Random generator = new Random();
		//for(int i = 0; i < 100; i++){
		  int j = generator.nextInt(3); // this will give us 0,1,or 2
		 // arraylist.add(sportObjects[j]);
		  return schoolCategoryObjects[j]
		  // etc.. continues with 3 other else if statments and objects
		//}
	}


	//fills the student_sport_activity_rel table for a school-class-academicyear combination.
	//should input school_id, academic_yr_id and class_master_id
	def fillStdSportsActRel(int acYrId){
		def schoolIds = [42 , 651, 326, 1198, 1200, 652,653, 1199, 327, 654, 656, 1204, 1208, 658, 275, 660, 661, 625, 662, 663, 665, 666, 1202, 667, 1203, 669, 670, 1216, 1221, 1291, 1292, 1294, 1293, 1356, 1357, 1358, 1359, 1360, 1361 ]
		//params: [religion:All, acYr:2013-2014, action:sportsStatisticsRpt, controller:StudTeachGraphs]
		
//		AcademicYear acYr = AcademicYear.findByCurrent(1)
		AcademicYear acYr = AcademicYear.get(acYrId)
		schoolIds.each{ schoolId->
			School school = School.get(schoolId.toInteger())
//			print "school -> "+ school
			def schoolClasses = SchoolClassRel.findAllByAcademicYrAndSchool(acYr, school)
//			ClassMaster classMaster = ClassMaster.get(5)
//			SchoolClassRel schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr, school, classMaster)
			//print "schoolClass =" + schoolClass.id
			if(schoolClasses){
				schoolClasses.each{schoolClass->
//					print "schoolClass -> "+ schoolClass
					def classDivision = []
					classDivision= SchoolClassDivision.findAllBySchoolClass(schoolClass)
					
					Date today = new Date(); // converting date to Timestamp in JDBC
					Timestamp timestamp = new Timestamp(today.getTime());
					Timestamp t2 = utilService.getTimestamp(today);
					
					//print "t2 = " + t2
					//print "cd length " + classDivision.size()
					def students = []
					if(classDivision){
						classDivision.each { cd->
//							print "cd -> "+ cd
							//print "cd =" + cd.id
							students = StudentClassRel.findAllByClassDivision(cd)
							//print "students length " + students.size()
							if(students){
								students.each { std->
//									print "std =" + std.student.id
									StudentSportActivityRel stdSportActRel = null
									try{
										SportsMaster sport = RandSports()
//										print "sport =" + sport.sportName
										stdSportActRel = StudentSportActivityRel.findByAcademicYrAndStudentAndSport(acYr,std.student,sport)
//										print "stdSportActRel = " + stdSportActRel
										if(stdSportActRel){
//											print "std sport act rel already exist for curent ac yr."
										}else
											stdSportActRel = new StudentSportActivityRel(academicYr: acYr, school: school, classMaster: schoolClass.className, student: std.student, sport: sport)
										stdSportActRel.save(flush:true)
										//print "stdSportActRel =" + stdSportActRel.id
									} catch(Exception e){
										e.printStackTrace()
									}
								
								}
							}
						}
					}
				}
			}
		}
	}
	
	//fills random blood group value from blood_grp_master table for all the users in user_details table.
	def fillUserBloodGroup(){
		def users=[]
		users = User.getAll()
		//print "users = " + users.size()
		users.each { u->
			UserDetails usrDet = UserDetails.findByUser(u)
			if(usrDet){
				try{
					BloodGrpMaster bldGrp = randBoodGroup()
					if(usrDet.bloodGrp==null || usrDet.bloodGrp==""){
						usrDet.bloodGrp = bldGrp
						usrDet.save(flush:true)
						//print usrDet.id+ " : "+bldGrp.bloodGrp
					}
				} catch(Exception e){
					e.printStackTrace()
				}
			}
		}
		//print "user bloog groups updated"
	}

	//fills random boolean value (0/1) for the tet_qualified field in user_details table for all the users with role ROLE_TEACHER.
	def fillTetQualifiedTeachers(){
		Role role = Role.findByAuthority("ROLE_TEACHER")
		//print "role = " + role.authority
		def users=[]
		users = UserRole.findAllByRole(role)
		//print "users = " + users.size()
		users.each { u->
			UserDetails usrDet = UserDetails.findByUser(u.user)
			if(usrDet){
				try{
					def tetQualified = randBoolean()
					//if(usrDet.tetQualified==null || usrDet.tetQualified=="")
					usrDet.tetQualified = tetQualified
					usrDet.save(flush:true)
					//print usrDet.id+ " : "+usrDet.tetQualified.toString()
				} catch(Exception e){
					e.printStackTrace()
				}
			}
		}
	}

	//fills random boolean value (0/1) for the is_Only_Child field in user_details table for all the users with role ROLE_PARENT.
	//fills relationship field in user_details table for all the users with role ROLE_PARENT based on the gender.
	def fillParentDetails(){
		Role role = Role.findByAuthority("ROLE_PARENT")
		def users=[]
		users = UserRole.findAllByRole(role)
		//print "parents = " + users.size()
		String gender=""
		
		users.each { u->
//			def children=[]
			UserDetails usrDet = UserDetails.findByUser(u.user)
//			children = StudentParentRel.findAllByParent(u.user)
			if(usrDet){
				try{
					if(usrDet.relationship=="null"||usrDet.relationship==null || usrDet.relationship==""){
						if(!usrDet.gender.equals(null))
							usrDet.relationship = (usrDet.gender=="Male")? "Father": "Mother"
						else if(usrDet.gender.equals(null)){
							gender = RandGender().toString()
							usrDet.gender = gender
							usrDet.relationship = (gender=="Male")? "Father": "Mother"
						}
						else if(usrDet.gender=="M" ){
							usrDet.gender = "Male"
							usrDet.relationship = "Father"
						}
						else if(usrDet.gender=="F" ){
							usrDet.gender = "Female"
							usrDet.relationship = "Mother"
						}
					}
					
//					if(children){
//						print "no:of Children " + children.size()
//						if(children.size()==1)
					def isOnlyChild = randBoolean()
					if(usrDet.isOnlyChild==null || usrDet.isOnlyChild=="")
						usrDet.isOnlyChild = isOnlyChild
//					}
					
//					String annualIncome = randAnnualIncome()
//					if(usrDet.annualIncome==null || usrDet.annualIncome=="")
//						usrDet.annualIncome = annualIncome
						
					usrDet.save(flush:true)
					//print usrDet.id+ " : "+usrDet.relationship+ " : "+usrDet.isOnlyChild.toString()
				} catch(Exception e){
					e.printStackTrace()
				}
			}
		}
	}

	def fillStudentHealthStatus(Map params){
		def userName = params.userName
		def school_id= params.schoolId.toLong()
		AcademicYear acdYr = AcademicYear.get(params.academicYrId.toLong())
		School school = School.get(school_id)
		def students=[]
		students = StudentClassRel.findAllBySchoolAndAcademicYr(school, acdYr)
		//print "users = " + students.size()
		students.each { u->
			User student = u.student
			StudentHealthStatus shs = null
			shs=StudentHealthStatus.findBySchoolAndStudent(school,student)
			try{
				Double height = (randHeight())
				Double weight = (randWeight())
				String vision = randVision()
				String teeth = randStatus()
				String oralHygiene = randStatus()
				String specificAilment = "NA"
				Boolean isHandicapped = false
				if(shs){
					//print "updating bgs with id =" + shs.id
					shs.height = height
					shs.weight = weight
					shs.vision = vision
					shs.teeth = teeth
					shs.oralHygiene = oralHygiene
					shs.specificAilment = specificAilment
					shs.isHandicapped = isHandicapped
				}
				else{
					//print "creating new shs for user " + student.id
					shs = new StudentHealthStatus(student: student, school: school, weight: weight, height: height, vision: vision, teeth: teeth, oralHygiene: oralHygiene, specificAilment: specificAilment, createdBy: userName, isHandicapped: isHandicapped)
				}
				shs.save(flush:true)
				//print "shs =" + shs.id
			} catch(Exception e){
				e.printStackTrace()
			}
		}
				
	}
	
	def fillSchoolCategory(){
		SchoolCategory category = randSchoolCategory()
		def schools = []
		schools = School.getAll()
		schools.each {school->
			try{
				school.schoolCategory = category
				school.save(flush:true)
//				print "school = " + school.id+ "category = " + school.schoolCategory.schoolCategoryName
			} catch(Exception e){
				e.printStackTrace()
			}
		}
//		print "School category filling completed"
	}
}
