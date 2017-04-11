package egov

import java.util.List;
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Map;
import grails.plugins.springsecurity.SpringSecurityService as SSS
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.context.SecurityContextHolder as SCH
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.web.authentication.WebAuthenticationDetails


class TestService {
	def cceReportService = new CceReportService()
	
	
	/**
	 * retrieve all roles assigned to a user
	 * @return
	 */
	List rUserRoles(){
		GrantedAuthority[] authorities = SCH.getContext().getAuthentication().getAuthorities()
		return authorities
	}
	
	/**
	 * Retrieve the parent school group under which the school of a registered  user falls
	 * @param def userId
	 * @return [org.cce.SchoolGroup : 1]
	 **/
	 Map rUserSchoolGroup(def userId){
		 User user = User.get(userId.toInteger())
		 SchoolGroup userSchlGrp = null
		 Map ret=[:]
		 if(user){
			 userSchlGrp =  SchoolGroup.get(user.schoolGroup?.id)
			 ret=[Grpid:userSchlGrp.id,groupName:userSchlGrp.groupName]
		 }
		 return ret
	 }
	 
	 /**
	  * Retrieve the school under which a user is registered to the CCE system
	  * @param def userId
	  * @return org.cce.School : 1
	  **/
	  Map rUserSchool(def userId){
		  User user = User.get(userId.toInteger())
		  if(user){
			  School userSchool = School.get(user.school?.id?.toInteger())
			  Map ret=[Schoolid:userSchool.id,schoolName:userSchool.schoolName,schoolIdentifier:userSchool.schoolIdentifier]
			  return ret
		  }
	  }
	  
	  def retTerms(Integer acyrId){
		  def res=[:]
		  AcademicYear currAcYr = AcademicYear.get(acyrId.toInteger())
		  def acT = AcademicTerms.createCriteria()
		  def acTer = acT.list {'eq'("academicYear", currAcYr)}
		  res."terms"=[:]
		  res."totTerms"=acTer.size()
		  def j=1
		  acTer.each(){ y ->
			  res."terms"."term$j"=[termId:y.id, termName:y.term]
			  j += 1
		  }
		  return res
	  }
	  
	  def retAcYrAndTerms(def SchoolId){ //school id just in case of school admins
		  Map res=[:]
		  res."addNewYear" = false
		  def acYr,currAcYr
		  currAcYr=AcademicYear.findByCurrent(true)
		  School school = School.get(SchoolId.toInteger())
		  acYr =  SchoolClassRel.createCriteria().list {
			  projections { distinct ( "academicYr" ) }
			  eq( 'school',school  )
		  }
		  if(!acYr.contains(currAcYr)){
			  res."addNewYear" = true
		  }
		  def i =1
		  res."acYrTerm"=[:]
		  res."totAcyr"=acYr.size()
		  acYr.each(){ x ->
			  if(x.status.equals("A")){
				  def acT = AcademicTerms.createCriteria()
				  def academicTerms = acT.list {'eq'("academicYear", x)}
  
				  res."acYrTerm"."acYrTrm$i"=[academicYrId:x.id, academicYrStart: x.startYear, academicYrEnd: x.endYear,current: x.current]
				  res."acYrTerm"."acYrTrm$i"."terms"=[:]
				  res."acYrTerm"."acYrTrm$i"."terms"."totTerms"=academicTerms.size()
				  def j=1
				  academicTerms.each(){ y ->
					  res."acYrTerm"."acYrTrm$i"."terms"."term$j"=[termId:y.id, termName:y.term]
					  j += 1
				  }
  
				  i +=1
			  }
		  }
		  return res
	  }
	  
	  def retAcYrAndTermsForCbseAdmin(def SchoolId){ //school id just in case of school admins
		  Map res=[:]
		  res."addNewYear" = false
		  def acYr,currAcYr
		  List userRoles = rUserRoles()
		  userRoles.each {role->
			  if(role.equals("ROLE_CCEADMIN") || role.equals("ROLE_SCHOOLS_MANAGER")){
				  if(role.equals("ROLE_CCEADMIN"))
					  res."addNewYear" = true
					  
				  acYr=AcademicYear.getAll()
			  }
			  else if(role.equals("ROLE_ADMIN") || role.equals("ROLE_TEACHER")||role.equals("ROLE_STUDENT")||role.equals("ROLE_PARENT")){
				  currAcYr=AcademicYear.findByCurrent(true)
				  School school = School.get(SchoolId.toInteger())
				  acYr =  SchoolClassRel.createCriteria().list {
					  projections { distinct ( "academicYr" ) }
					  eq( 'school',school  )
				  }
				  if(!acYr.contains(currAcYr)){
					  res."addNewYear" = true
				  }
			  }
		  }
		  def i =1
		  res."acYrTerm"=[:]
		  res."totAcyr"=acYr.size()
		  acYr.each(){ x ->
			  if(x.status.equals("A")){
				  def acT = AcademicTerms.createCriteria()
				  def academicTerms = acT.list {'eq'("academicYear", x)}
  
				  res."acYrTerm"."acYrTrm$i"=[academicYrId:x.id, academicYrStart: x.startYear, academicYrEnd: x.endYear,current: x.current]
				  res."acYrTerm"."acYrTrm$i"."terms"=[:]
				  res."acYrTerm"."acYrTrm$i"."terms"."totTerms"=academicTerms.size()
				  def j=1
				  academicTerms.each(){ y ->
					  res."acYrTerm"."acYrTrm$i"."terms"."term$j"=[termId:y.id, termName:y.term]
					  j += 1
				  }
  
				  i +=1
			  }
		  }
		  return res
	  }
	  
	  
	  def classSubjectsAnalysis(Map attributes){
		  def clsDivSubTotScore = 0 , totSubStudents = 0 , clsDivSubAvg = 0 , data = []
		  Map ret = [:]
		  ret."categories" = []
		  ret."data" = [:]
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  ClassMaster classMaster = ClassMaster.get(attributes.classMasterId.toInteger())
		  def schlClsRel = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		  def schlClsDivs = SchoolClassDivision.findAllBySchoolClass(schlClsRel)
		  ret."totDivs" = schlClsDivs?.size()
		  ret."divisions" = schlClsDivs.division
		  def scs = SchoolSubjectRel.createCriteria()
		  def schlClsSubjs = scs.list {
			  and{
				  'eq'("schoolClass", schlClsRel)
				  'or'{
					  'eq'("subType", "Compulsory")
					  'eq'("subType", "Language I")
				  }
			  }
		  }
		   ret."categories"=schlClsSubjs.subjectMaster.subject
		  if(schlClsDivs){
			  schlClsDivs.each{scd->
				  def r = [:]
				  r=[name:scd.division,data: []]
				  if(schlClsSubjs){
					  schlClsSubjs.each{scss->
						  SubjectMaster subject = SubjectMaster.get(scss.subjectMaster.id.toInteger())
						 
						  Map students = listClassDivSubjectStudents(schlClsRel.id.toInteger(),scd.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(),subject.id.toInteger())
						  if(students){
							  totSubStudents = students.size()
							  students.each{st->
								  User student = User.get(st.value.studentId.toInteger())
								  def stdFinScore = StdScholFinalScore.findAll("""from StdScholFinalScore where academicYr= :acYr and school= :school and className= :classMaster and division= :scd and subject= :subject and student=:student""", [acYr:acYr , school:school , classMaster:classMaster , scd:scd , subject:subject , student:student])
								  if(stdFinScore){
									  clsDivSubTotScore+=stdFinScore.finalScore
								  }
								  else{
									  clsDivSubTotScore = 0
								  }
							  }
						  }
						  if(clsDivSubTotScore!=0 && totSubStudents!=0)
							  clsDivSubAvg = clsDivSubTotScore/totSubStudents
							 
						  r.data.add(clsDivSubAvg.toDouble().round(1))
						  clsDivSubTotScore = 0
						  clsDivSubAvg = 0
					  }
				  }
				  data.add(r)
			  }
		  }
		  ret."data" = data
		  return ret
	  }
	  
	  
	 
	  
	  
	  def listClassDivisionStudents(Integer schoolClassId,Integer schlClsDivId ,Integer schoolId, Integer academicYrId , Integer classMasterId) {
		  Map ret = [:]
		  def i=1
		  School school = School.get(schoolId.toInteger())
		  AcademicYear  acYr = AcademicYear.get(academicYrId.toInteger())
		  ClassMaster className = ClassMaster.get(classMasterId.toInteger())
		  def schlClsRel = SchoolClassRel.get(schoolClassId.toInteger())
		  SchoolClassDivision schlClsDiv = null
		  def studClassRelDetails = null
		  //Fetch the division which is equal to the classrelid and division passed
		  if(schlClsDivId!=0){
			  schlClsDiv = SchoolClassDivision.get(schlClsDivId.toInteger())
			  def stdClsRel = StudentClassRel.createCriteria()
			  studClassRelDetails = stdClsRel.list{
				  and{
					  eq("academicYr",acYr)
					  eq("school",school)
					  eq("className",className)
					  eq("classDivision",schlClsDiv)
				  }
			  }
		  }
		  else{
			  studClassRelDetails = StudentClassRel.findAll("from StudentClassRel where classDivision=null and school='"+school.id+"' and className='"+className.id+"'")
		  }
		  if(studClassRelDetails){
			  
			  studClassRelDetails.each { x ->
				  def userDetails = UserDetails.findByUser(x.student)
				  def userName= userDetails.firstName+" " + userDetails.lastname
				  ret."Student$i" = [stdClsRelId:x.id , studentId : x.student.id , userName : userName ]
				  i+=1
			  }
			  //ret."totStudents"=studClassRelDetails.size()
		  }
		  return ret
	  }
	  
	  def classPerformanceRpt(Map attributes){
		  def clsDivSubjTotalPassScore = 0 , studCount = 0 , clsDivSubjAvgPassScore = 0
		  def clsDivTotPassScore = 0 , clsDivAvgPassScore = 0 , subjCount = 0
		  def clsTotPassScore = 0 , clsAvgPassScore = 0 , divCount = 0
		  def classes = [] , data = [] , ret = [:] , classAvg = [:]
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  def schoolClasses = SchoolClassRel.findAllByAcademicYrAndSchool(acYr , school)
		  if(schoolClasses){
			  schoolClasses.each{sc->
				  classes.add(sc.classVal)
				  classAvg."$sc.classVal" = [name : sc.classVal , y : 0]
				  def scs = SchoolSubjectRel.createCriteria()
				  def schlClsSubjs = scs.list {
					  and{
						  'eq'("schoolClass", sc)
						  'or'{
							  'eq'("status", "A")
							  'eq'("status", "F")
						  }
					  }
				  }
				  def schlClsDivs = SchoolClassDivision.findAllBySchoolClass(sc)
				  if(schlClsDivs){
					  divCount = schlClsDivs.size()
					  schlClsDivs.each{scd->
						  if(schlClsSubjs){
							  subjCount = schlClsSubjs.size()
							  schlClsSubjs.each{s->
								  Map subjectStudents = listClassDivSubjectStudents(sc.id.toInteger(),scd.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), sc.className.id.toInteger(), s.subjectMaster.id.toInteger())
								  if(subjectStudents){
									  subjectStudents.each{ss->
										  User student = User.get(ss.value.studentId.toInteger())
										  def stdFinScore = StdScholFinalScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndStudentAndGradePointGreaterThan(acYr , school , sc.className , s.subjectMaster , student , 3)
										  if(stdFinScore){
											  studCount+=1
											  clsDivSubjTotalPassScore+=stdFinScore.finalScore
										  }
									  }
								  }
								  if(studCount!=0 && clsDivSubjTotalPassScore!=0)
									  clsDivSubjAvgPassScore = clsDivSubjTotalPassScore/studCount
								  clsDivTotPassScore+=clsDivSubjAvgPassScore
								  studCount = 0
								  clsDivSubjTotalPassScore = 0
								  clsDivSubjAvgPassScore = 0
							  }
						  }
						  if(subjCount!=0 && clsDivTotPassScore!=0)
							  clsDivAvgPassScore = clsDivTotPassScore/subjCount
						  clsTotPassScore+=clsDivAvgPassScore
						  subjCount = 0
						  clsDivTotPassScore = 0
						  clsDivAvgPassScore = 0
					  }
				  }
				  if(divCount!=0 && clsTotPassScore!=0)
					  clsAvgPassScore = clsTotPassScore/divCount
				  classAvg."$sc.classVal"."y" = clsAvgPassScore.toDouble().round()
				  divCount = 0
				  clsTotPassScore = 0
				  clsAvgPassScore = 0
			  }
			  if(classAvg){
				  classAvg.each{ca->
					  data.add(ca.value)
				  }
			  }
			  
		  }
		  ret."categories" = classes
		  ret."data" = data
		  return ret
	  }
	  
	  
	  def listClassDivSubjectStudents(Integer schoolClassId,Integer schlClsDivId ,Integer schoolId, Integer academicYrId , Integer classMasterId, def subjectMasterId)
	  {
		  Map ret = [:]
		  def i=1, studClassRelDetails
		  School school = School.get(schoolId.toInteger())
		  AcademicYear  acYr = AcademicYear.get(academicYrId.toInteger())
		  ClassMaster className = ClassMaster.get(classMasterId.toInteger())
		  SchoolClassRel schlClsRel = SchoolClassRel.get(schoolClassId.toInteger())
		  SubjectMaster subjectMaster = SubjectMaster.get(subjectMasterId)
		  SchoolSubjectRel schoolSubject = SchoolSubjectRel.findBySchoolClassAndSubjectMaster(schlClsRel,subjectMaster)
		  
		  SchoolClassDivision schlClsDiv = SchoolClassDivision.get(schlClsDivId.toInteger())
		  def stdClsRel = StudentClassRel.createCriteria()
		  studClassRelDetails = stdClsRel.list{
			  and{
				  eq("academicYr",acYr)
				  eq("school",school)
				  eq("className",className)
				  eq("classDivision",schlClsDiv)
			  }
		  }
		  
		  if(schoolSubject.subType.toString().equals("Compulsory") || schoolSubject.subType.toString().equals("Language I") )
			  ret = listClassDivisionStudents(schoolClassId,schlClsDivId ,schoolId, academicYrId , classMasterId)
		  else if(schoolSubject.subType.toString().equals("Language II") || schoolSubject.subType.toString().equals("Additional") ){
			  def OptSubStudList = null
			  //Fetch the division which is equal to the classrelid and division passed
				  def stdList = StudentOptionalSubject.createCriteria()
  //				OptSubStudList = stdList.list{
  //					and{
  //						'eq'("academicYr",acYr)
  //						'eq'("school",school)
  //						'eq'("schoolClass",schlClsRel)
  //						'eq'("subject",subjectMaster)
  //						'in'("student",studClassRelDetails.student)
  //					}
  //				}
				  
				  if(studClassRelDetails){
					  OptSubStudList = StudentOptionalSubject.executeQuery("select u from StudentOptionalSubject u where (u.academicYr) =(:acYr) and u.school = (:school) and u.schoolClass = (:schlClsRel) and u.subject = (:subjectMaster) and student in (:uList) and u.status = :status" , [acYr:acYr,school:school ,schlClsRel:schlClsRel, subjectMaster: subjectMaster,uList: studClassRelDetails.student , status : 'A'])
				  }
				  if(OptSubStudList){
					  OptSubStudList.each { x ->
						  def userDetails = UserDetails.findByUser(x.student)
						  def userName= userDetails.firstName+" " + userDetails.lastname
						  ret."Student$i" = [stdClsRelId:x.id , studentId : x.student.id , userName : userName ]
						  i+=1
					  }
					  //ret."totStudents"=studClassRelDetails.size()
				  }
			  
		  }
		  return ret
	  }
	  
	  
	  def teacherClassPerformanceRpt(Map attributes){
		  def clsSubjTeachers = [] , clsSubjTeacherNames = [] , data = []  , students =[]
		  def subjTeacherNames , subjTeachers , studCount = 0 , teacherTotScore = 0 , teacherAvgScore = 0
		  def clsSubjTotalPassScore = 0 , clsSubjAvgPassScore = 0
		  Map ret = [:] , teacherSubjScores = [:]
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  ClassMaster classMaster = ClassMaster.get(attributes.classMasterId.toInteger())
		  def schlClsRel = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		  def scs = SchoolSubjectRel.createCriteria()
		  def schlClsSubjs = scs.list {
			  and{
				  'eq'("schoolClass", schlClsRel)
				  'or'{
					  'eq'("status", "A")
					  'eq'("status", "F")
				  }
			  }
		  }
		  if(schlClsSubjs){
			  schlClsSubjs.each{scss->
				  def teacherSubjAssign = TeacherSubjectAssign.findAllByAcademicYrAndSchoolAndClassNameAndSubject(acYr , school , classMaster , scss.subjectMaster)
				  if(teacherSubjAssign){
					  teacherSubjAssign.each{tsa->
						  User teacher = User.get(tsa.teacher.id.toInteger())
						  def ud = UserDetails.findByUser(teacher)
						  def teacherName = ud.firstName + " " + ud.lastname
						  clsSubjTeacherNames.add(teacherName)
						  clsSubjTeachers.add(tsa.teacher)
					  }
				  }
			  }
			  subjTeacherNames = clsSubjTeacherNames.unique()
			  ret."categories" = subjTeacherNames
			  subjTeachers = clsSubjTeachers.unique()
			  if(subjTeachers){
				  def r = [:]
				  schlClsSubjs.each{scss->
					  r=[type : 'column' , name:scss.subjectMaster.subject , data: []]
					  subjTeachers.each{st->
						  def subjTeacher = TeacherSubjectAssign.findAllByAcademicYrAndSchoolAndClassNameAndSubjectAndTeacher(acYr , school , classMaster , scss.subjectMaster , st)
						  if(subjTeacher){
							  subjTeacher.each{std->
								  Map subjectStudents = listClassDivSubjectStudents(schlClsRel.id.toInteger(),std.classDivision.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(),scss.subjectMaster.id.toInteger())
								  if(subjectStudents){
									  subjectStudents.each{ss->
										  students.add(ss.value.studentId.toInteger())
									  }
								  }
							  }
							  if(students){
								  students.each{ss->
									  User student = User.get(ss.toInteger())
									  def stdFinScore = StdScholFinalScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndStudentAndGradePointGreaterThan(acYr , school , classMaster , scss.subjectMaster , student , 3)
									  if(stdFinScore){
										  studCount+=1
										  clsSubjTotalPassScore+=stdFinScore.finalScore
									  }
								  }
								  if(studCount!=0 && clsSubjTotalPassScore!=0)
									  clsSubjAvgPassScore = clsSubjTotalPassScore/studCount
								  r.data.add(clsSubjAvgPassScore.toDouble().round())
								  studCount = 0
								  clsSubjTotalPassScore = 0
								  clsSubjAvgPassScore = 0
							  }
							  students = []
						  }
						  else
							  r.data.add(0)
					  }
					  data.add(r)
				  }
				  r=[type : 'spline' , name:"Average" , data: []]
				  subjTeachers.each{st->
					  def teacherSubjects = TeacherSubjectAssign.findAllByAcademicYrAndSchoolAndClassNameAndTeacher(acYr , school , classMaster , st)
					  def tSubsCount
					  if(teacherSubjects){
						  tSubsCount = teacherSubjects.size()
						  teacherSubjects.each{ts->
							  Map subjectStudents = listClassDivSubjectStudents(schlClsRel.id.toInteger(),ts.classDivision.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(),ts.subject.id.toInteger())
							  if(subjectStudents){
								  subjectStudents.each{ss->
									  User student = User.get(ss.value.studentId.toInteger())
									  def stdFinScore = StdScholFinalScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndStudentAndGradePointGreaterThan(acYr , school , classMaster , ts.subject , student , 3)
									  if(stdFinScore){
										  studCount+=1
										  clsSubjTotalPassScore+=stdFinScore.finalScore
									  }
								  }
							  }
							  if(studCount!=0 && clsSubjTotalPassScore!=0)
								  clsSubjAvgPassScore = clsSubjTotalPassScore/studCount
							  teacherTotScore+=clsSubjAvgPassScore
							  studCount = 0
							  clsSubjTotalPassScore = 0
							  clsSubjAvgPassScore = 0
						  }
					  }
					  if(tSubsCount!=0 && teacherTotScore!=0)
						  teacherAvgScore = teacherTotScore/tSubsCount
					  r.data.add(teacherAvgScore.toDouble().round())
					  teacherTotScore = 0
					  teacherAvgScore = 0
				  }
				  data.add(r)
			  }
		  }
		  ret."data" = data
		  return ret
	  }
	  
	  def classDivPerformRpt(Map attributes){
		  def divCount = 0 , subjCount = 0 , studCount = 0
		  def clsDivSubjTotalPassScore = 0 , clsDivSubjAvgPassScore = 0 , clsDivTotPassScore = 0 , clsDivAvgPassScore = 0
		  def divs = [] , avgScores = [] , ret = [:]
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  def schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassVal(acYr , school , attributes.classVal.toInteger())
		  def scs = SchoolSubjectRel.createCriteria()
		  def schlClsSubjs = scs.list {
			  and{
				  'eq'("schoolClass", schoolClass)
				  'or'{
					  'eq'("status", "A")
					  'eq'("status", "F")
				  }
			  }
		  }
		  def schlClsDivs = SchoolClassDivision.findAllBySchoolClass(schoolClass)
		  if(schlClsDivs){
			  divCount = schlClsDivs.size()
			  schlClsDivs.each{scd->
				  divs.add(scd.division)
				  if(schlClsSubjs){
					  subjCount = schlClsSubjs.size()
					  schlClsSubjs.each{s->
						  Map subjectStudents =listClassDivSubjectStudents(schoolClass.id.toInteger(),scd.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), schoolClass.className.id.toInteger(), s.subjectMaster.id.toInteger())
						  if(subjectStudents){
							  subjectStudents.each{ss->
								  User student = User.get(ss.value.studentId.toInteger())
								  def stdFinScore = StdScholFinalScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndStudentAndGradePointGreaterThan(acYr , school , schoolClass.className , s.subjectMaster , student , 3)
								  if(stdFinScore){
									  studCount+=1
									  clsDivSubjTotalPassScore+=stdFinScore.finalScore
								  }
							  }
						  }
						  if(studCount!=0 && clsDivSubjTotalPassScore!=0)
							  clsDivSubjAvgPassScore = clsDivSubjTotalPassScore/studCount
						  clsDivTotPassScore+=clsDivSubjAvgPassScore
						  studCount = 0
						  clsDivSubjTotalPassScore = 0
						  clsDivSubjAvgPassScore = 0
					  }
				  }
				  if(subjCount!=0 && clsDivTotPassScore!=0)
					  clsDivAvgPassScore = clsDivTotPassScore/subjCount
				  avgScores.add(clsDivAvgPassScore.toDouble().round())
				  subjCount = 0
				  clsDivTotPassScore = 0
				  clsDivAvgPassScore = 0
			  }
		  }
		  def name = "Class "+attributes.classVal.toInteger()
		  ret."name" = name
		  ret."divs" = divs
		  ret."avgScores" = avgScores
		  return ret
	  }
	  
	  def classDivSubjPerformRpt(Map attributes){
		  def studCount = 0 , clsDivSubjTotalPassScore = 0 , clsDivSubjAvgPassScore = 0
		  def subjects = [] , avgScores = [] , ret = [:]
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  def schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassVal(acYr , school , attributes.classVal.toInteger())
		  def scs = SchoolSubjectRel.createCriteria()
		  def schlClsSubjs = scs.list {
			  and{
				  'eq'("schoolClass", schoolClass)
				  'or'{
					  'eq'("status", "A")
					  'eq'("status", "F")
				  }
			  }
		  }
		  def schlClsDiv = SchoolClassDivision.findBySchoolClassAndDivision(schoolClass , attributes.divisionVal.toString())
		  if(schlClsDiv){
			  if(schlClsSubjs){
				  schlClsSubjs.each{s->
					  subjects.add(s.subjectMaster.subject)
					  Map subjectStudents = listClassDivSubjectStudents(schoolClass.id.toInteger(),schlClsDiv.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), schoolClass.className.id.toInteger(), s.subjectMaster.id.toInteger())
					  if(subjectStudents){
						  subjectStudents.each{ss->
							  User student = User.get(ss.value.studentId.toInteger())
							  def stdFinScore = StdScholFinalScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndStudentAndGradePointGreaterThan(acYr , school , schoolClass.className , s.subjectMaster , student , 3)
							  if(stdFinScore){
								  studCount+=1
								  clsDivSubjTotalPassScore+=stdFinScore.finalScore
							  }
						  }
					  }
					  if(studCount!=0 && clsDivSubjTotalPassScore!=0)
						  clsDivSubjAvgPassScore = clsDivSubjTotalPassScore/studCount
					  avgScores.add(clsDivSubjAvgPassScore.toDouble().round())
					  studCount = 0
					  clsDivSubjTotalPassScore = 0
					  clsDivSubjAvgPassScore = 0
				  }
			  }
		  }
		  def name ="Class "+ attributes.classVal.toInteger()+" - "+attributes.divisionVal.toString()
		  ret."name" = name
		  ret."subjects" = subjects
		  ret."avgScores" = avgScores
		  return ret
	  }
	  
	  
	  def clsDivSubAssessRpt(Map attributes){
		  def assmntTypes = [] , avgScores = [] , ret = [:]
		  def clsDivSubjTotalFAPassScore = 0 , clsDivSubjTotalSAPassScore = 0 , studCount = 0
		  def clsDivSubjFAAvgPassScore = 0 , clsDivSubjSAAvgPassScore = 0
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  def classMaster = ClassMaster.findByClassName(attributes.classVal.toString())
		  def schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		  def schlClsDiv = SchoolClassDivision.findBySchoolClassAndDivision(schoolClass , attributes.divisionVal.toString())
		  def subject = SubjectMaster.findBySubjectAndClassNameAndStatus(attributes.subject.toString() , classMaster , 'A')
		  def assmentTypes = AssessmentTypes.findAllByStatus('A')
		  assmntTypes = assmentTypes.assessmentType
		  Map subjectStudents = listClassDivSubjectStudents(schoolClass.id.toInteger(),schlClsDiv.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(), subject.id.toInteger())
		  if(subjectStudents){
			  subjectStudents.each{ss->
				  User student = User.get(ss.value.studentId.toInteger())
				  def stdFinScore = StdScholFinalScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndStudentAndGradePointGreaterThan(acYr , school , classMaster , subject , student , 3)
				  if(stdFinScore){
					  studCount+=1
					  clsDivSubjTotalFAPassScore+=stdFinScore.formativeAssmt
					  clsDivSubjTotalSAPassScore+=stdFinScore.summativeAssmt
				  }
			  }
			  if(studCount!=0 && clsDivSubjTotalFAPassScore!=0){
				  clsDivSubjFAAvgPassScore = clsDivSubjTotalFAPassScore/studCount
				  avgScores.add(clsDivSubjFAAvgPassScore.toDouble().round())
			  }
			  if(studCount!=0 && clsDivSubjTotalSAPassScore!=0){
				  clsDivSubjSAAvgPassScore = clsDivSubjTotalSAPassScore/studCount
				  avgScores.add(clsDivSubjSAAvgPassScore.toDouble().round())
			  }
		  }
		  def name = attributes.classVal.toInteger()+" - "+attributes.divisionVal.toString()+" "+subject.subject
		  ret."name" = name
		  ret."assmntTypes" = assmntTypes
		  ret."avgScores" = avgScores
		  return ret
	  }
	  
	  def clsDivSubjAssessments(Map attributes){
		  def assessments = [] , avgScores = [] , ret = [:]
		  def marks = 0 , grade
		  def studCount = 0 , totSAScore = 0 , avgSAScore = 0 , totFAScore = 0 , avgFAScore = 0
		  EvaluationTypes evalType = EvaluationTypes.get(1)
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  def classMaster = ClassMaster.findByClassName(attributes.classVal.toString())
		  def classMasterId = classMaster.id
		  def schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		  def schlClsDiv = SchoolClassDivision.findBySchoolClassAndDivision(schoolClass , attributes.divisionVal.toString())
		  def subject = SubjectMaster.findBySubjectAndClassNameAndStatus(attributes.subject.toString() , classMaster , 'A')
		  def assmntType = AssessmentTypes.findByAssessmentType(attributes.assessment.toString())
		  def assmnts = Assessments.findAllByAcademicYrAndClassNameAndAssessmentTypeAndSubjectAndStatus(acYr , classMaster , assmntType , subject , 'A')
		  assessments = assmnts.assessmentName
		  Map subjectStudents = listClassDivSubjectStudents(schoolClass.id.toInteger(),schlClsDiv.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(), subject.id.toInteger())
		  if(assmnts){
			  if(assmntType.id.toInteger()==1){
				  assmnts.each{a->
					  def schlAssmnt = SchoolAssessments.findBySchoolAndClassNameAndAssessment(school , classMaster , a)
					  if(subjectStudents){
						  subjectStudents.each{ss->
							  User student = User.get(ss.value.studentId.toInteger())
							  def stdFaScore = StudentFaScore.findByAcademicYrAndSchoolAndClassNameAndDivisionAndSubjectAndSchoolAssmntAndStudent(acYr , school , classMaster , schlClsDiv , subject , schlAssmnt , student)
							  if(stdFaScore){
								  marks = (stdFaScore.marksObtained*100)/schlAssmnt.totalScore
							  }
							  grade = cceReportService.fetchScholasticGrade(marks, evalType, classMasterId)
							  if(grade.gradePoint>3){
								  studCount+=1
								  totFAScore+=stdFaScore?.marksObtained?:0
							  }
						  }
					  }
					  if(studCount!=0 && totFAScore!=0)
						  avgFAScore = totFAScore/studCount
					  avgScores.add(avgFAScore.toDouble().round())
					  studCount = 0
					  totFAScore = 0
					  avgFAScore = 0
				  }
			  }
			  if(assmntType.id.toInteger()==2){
				  assmnts.each{a->
					  def summAssmnt = SummativeAssessments.findByClassNameAndAssessmentAndStatus(classMaster , a , 'Active')
					  if(subjectStudents){
						  subjectStudents.each{ss->
							  User student = User.get(ss.value.studentId.toInteger())
							  def stdSaScore = StudentSaScore.findByAcademicYrAndSchoolAndClassNameAndDivisionAndSubjectAndSummativeAssessmentAndStudent(acYr , school , classMaster , schlClsDiv , subject , summAssmnt , student)
							  if(stdSaScore){
								  marks = (stdSaScore.marksObtained*100)/summAssmnt.totalScoreSa
							  }
							  grade = cceReportService.fetchScholasticGrade(marks, evalType, classMasterId)
							  if(grade.gradePoint>3){
								  studCount+=1
								  totSAScore+=stdSaScore?.marksObtained?:0
							  }
						  }
					  }
					  if(studCount!=0 && totSAScore!=0)
						  avgSAScore = totSAScore/studCount
					  avgScores.add(avgSAScore.toDouble().round())
					  studCount = 0
					  totSAScore = 0
					  avgSAScore = 0
				  }
			  }
		  }
		  def name = attributes.classVal.toInteger()+" - "+attributes.divisionVal.toString()+" "+subject.subject+" "+attributes.assessment.toString()
		  ret."name" = name
		  ret."assessments" = assessments
		  ret."avgScores" = avgScores
		  return ret
	  }
	  
	  
	  def clsDivSubjFaActivities(Map attributes){
		  def activities = [] , avgScores = [] , ret = [:]
		  def marks = 0 , grade , studCount = 0 , totActScore = 0 , avgActScore = 0
		  EvaluationTypes evalType = EvaluationTypes.get(1)
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  def classMaster = ClassMaster.findByClassName(attributes.classVal.toString())
		  def classMasterId = classMaster.id
		  def schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		  def schlClsDiv = SchoolClassDivision.findBySchoolClassAndDivision(schoolClass , attributes.divisionVal.toString())
		  def subject = SubjectMaster.findBySubjectAndClassNameAndStatus(attributes.subject.toString() , classMaster , 'A')
		  def assmntType = AssessmentTypes.findByAssessmentType(attributes.assessment.toString())
		  def assmnt = Assessments.findByAcademicYrAndClassNameAndAssessmentTypeAndAssessmentNameAndSubjectAndStatus(acYr , classMaster , assmntType , attributes.assessmentName.toString() , subject , 'A')
		  Map subjectStudents = listClassDivSubjectStudents(schoolClass.id.toInteger(),schlClsDiv.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(), subject.id.toInteger())
		  if(assmnt){
			  def schlAssmnt = SchoolAssessments.findBySchoolAndClassNameAndAssessment(school , classMaster , assmnt)
			  if(schlAssmnt){
				  def schlAssmntActivities = SchlAsmntActivityClsRel.findAllBySchoolClassAndSchlClsDivAndSchoolAssessmentAndActivityModeAndStatus(schoolClass , schlClsDiv , schlAssmnt , 'Classroom' , 'Active')
				  activities = schlAssmntActivities.assmntActivity.activityName
				  if(schlAssmntActivities){
					  schlAssmntActivities.each{saa->
						  if(subjectStudents){
							  subjectStudents.each{ss->
								  User student = User.get(ss.value.studentId.toInteger())
								  def stdActScore = StdScholActivityScore.findByAcademicYrAndSchoolAndClassNameAndDivisionAndAssmntActivityAndStudent(acYr , school , classMaster , schlClsDiv , saa , student)
								  if(stdActScore){
									  marks = (stdActScore.marksObtained*100)/saa.activityScore
								  }
								  grade = cceReportService.fetchScholasticGrade(marks, evalType, classMasterId)
								  if(grade.gradePoint>3){
									  studCount+=1
									  totActScore+=stdActScore?.marksObtained?:0
								  }
							  }
						  }
						  if(studCount!=0 && totActScore!=0)
							  avgActScore = totActScore/studCount
						  avgScores.add(avgActScore.toDouble().round())
						  studCount = 0
						  totActScore = 0
						  avgActScore = 0
					  }
				  }
			  }
		  }
		  def name = attributes.classVal.toInteger()+attributes.divisionVal.toString()+" "+subject.subject+" "+attributes.assessmentName.toString()+" " + "Activities"
		  ret."name" = name
		  ret."activities" = activities
		  ret."avgScores" = avgScores
		  return ret
	  }
	  
	  def clsDivSubjSaActivities(Map attributes){
		  def activities = [] , avgScores = [] , ret = [:]
		  def marks = 0 , grade , studCount = 0 , totActScore = 0 , avgActScore = 0
		  EvaluationTypes evalType = EvaluationTypes.get(1)
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  School school0 = School.get(0)
		  def classMaster = ClassMaster.findByClassName(attributes.classVal.toString())
		  def classMasterId = classMaster.id
		  def schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		  def schlClsDiv = SchoolClassDivision.findBySchoolClassAndDivision(schoolClass , attributes.divisionVal.toString())
		  def subject = SubjectMaster.findBySubjectAndClassNameAndStatus(attributes.subject.toString() , classMaster , 'A')
		  def assmntType = AssessmentTypes.findByAssessmentType(attributes.assessment.toString())
		  def assmnt = Assessments.findByAcademicYrAndClassNameAndAssessmentTypeAndAssessmentNameAndSubjectAndStatus(acYr , classMaster , assmntType , attributes.assessmentName.toString() , subject , 'A')
		  Map subjectStudents = listClassDivSubjectStudents(schoolClass.id.toInteger(),schlClsDiv.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(), subject.id.toInteger())
		  if(assmnt){
			  def sumAssmnt = SummativeAssessments.createCriteria()
			  def summAssmnt = sumAssmnt.get {
				  or {
					  and {
						  'in' ("assessment", assmnt)
						  'eq' ("className", classMaster)
						  'eq' ("school", school)
						  'eq' ("status" , "Active")
					  }
					  and {
						  'in' ("assessment", assmnt)
						  'eq' ("className", classMaster)
						  'eq' ("school", school0)
						  'eq' ("status" , "Active")
					  }
				  }
			  }
			  if(summAssmnt){
				  def summAssmntActivities = SummAsmntActivityClsRel.findAllBySchoolClassAndSchlClsDivAndSummAssessmentAndActivityModeAndStatus(schoolClass , schlClsDiv , summAssmnt , 'Classroom' , 'Active')
				  activities = summAssmntActivities.assmntActivity.activityName
				  if(summAssmntActivities){
					  summAssmntActivities.each{saa->
						  if(subjectStudents){
							  subjectStudents.each{ss->
								  User student = User.get(ss.value.studentId.toInteger())
								  def stdActScore = StdScholSaActivityScore.findByAcademicYrAndSchoolAndClassNameAndDivisionAndAssmntActivityAndStudent(acYr , school , classMaster , schlClsDiv , saa , student)
								  if(stdActScore){
									  marks = (stdActScore.marksObtained*100)/saa.activityScore
								  }
								  grade = cceReportService.fetchScholasticGrade(marks, evalType, classMasterId)
								  if(grade.gradePoint>3){
									  studCount+=1
									  totActScore+=stdActScore?.marksObtained?:0
								  }
							  }
						  }
						  if(studCount!=0 && totActScore!=0)
							  avgActScore = totActScore/studCount
						  avgScores.add(avgActScore.toDouble().round())
						  studCount = 0
						  totActScore = 0
						  avgActScore = 0
					  }
				  }
				  else{
					  if(subjectStudents){
						  subjectStudents.each{ss->
							  User student = User.get(ss.value.studentId.toInteger())
							  def ud = UserDetails.findByUser(student)
							  def studentName
							  if( ud.lastname=="null"){
								  studentName= ud.firstName
							  }
							  else{
								  studentName= ud.firstName+" " + ud.lastname
							  }
							  activities.add(studentName)
							  def stdActScore = StudentSaScore.findByAcademicYrAndSchoolAndClassNameAndDivisionAndSummativeAssessmentAndSubjectAndStudent(acYr , school , classMaster , schlClsDiv , summAssmnt , subject , student)
							  if(stdActScore){
								  marks = (stdActScore.marksObtained*100)/summAssmnt.totalScoreSa
							  }
							  grade = cceReportService.fetchScholasticGrade(marks, evalType, classMasterId)
							  if(grade.gradePoint>3){
								  studCount+=1
							  }
							  avgScores.add(stdActScore?.marksObtained?:0)
						  }
					  }
				  }
			  }
		  }
		  def name = attributes.classVal.toInteger()+attributes.divisionVal.toString()+" "+subject.subject+" "+attributes.assessmentName.toString()+" " + "Activities"
		  ret."name" = name
		  ret."activities" = activities
		  ret."avgScores" = avgScores
		  return ret
	  }
	  
	  def studSubjFaActivities(Map attributes){
		  def students = [] , marks = [] , ret = [:]
		  EvaluationTypes evalType = EvaluationTypes.get(1)
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  def classMaster = ClassMaster.findByClassName(attributes.classVal.toString())
		  def classMasterId = classMaster.id
		  def schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		  def schlClsDiv = SchoolClassDivision.findBySchoolClassAndDivision(schoolClass , attributes.divisionVal.toString())
		  def subject = SubjectMaster.findBySubjectAndClassNameAndStatus(attributes.subject.toString() , classMaster , 'A')
		  def assmntType = AssessmentTypes.findByAssessmentType(attributes.assessment.toString())
		  def activity = AssessmentActivities.findByActivityNameAndAssmntType(attributes.activity.toString() , assmntType)
		  def assmnt = Assessments.findByAcademicYrAndClassNameAndAssessmentTypeAndAssessmentNameAndSubjectAndStatus(acYr , classMaster , assmntType , attributes.assessmentName.toString() , subject , 'A')
		  Map subjectStudents = listClassDivSubjectStudents(schoolClass.id.toInteger(),schlClsDiv.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(), subject.id.toInteger())
		  if(assmnt){
			  def schlAssmnt = SchoolAssessments.findByAssessmentAndSchoolAndClassName(assmnt , school , classMaster)
			  if(schlAssmnt){
				  def schlAssmntAct = SchlAsmntActivityClsRel.findBySchoolAssessmentAndSchoolClassAndSchlClsDivAndAssmntActivityAndActivityModeAndStatus(schlAssmnt , schoolClass , schlClsDiv , activity , "Classroom" , 'Active')
				  if(schlAssmntAct){
					  if(subjectStudents){
						  subjectStudents.each{ss->
							  User student = User.get(ss.value.studentId.toInteger())
							  def ud = UserDetails.findByUser(student)
							  def studentName
							  if( ud.lastname=="null"){
								  studentName= ud.firstName
							  }
							  else{
								  studentName= ud.firstName+" " + ud.lastname
							  }
							  def stdActScore = StdScholActivityScore.findByAcademicYrAndSchoolAndClassNameAndDivisionAndAssmntActivityAndStudent(acYr , school , classMaster , schlClsDiv , schlAssmntAct , student)
							  if(stdActScore){
								  students.add(studentName)
								  marks.add(stdActScore.marksObtained)
							  }
						  }
					  }
				  }
			  }
		  }
		  def name = attributes.classVal.toInteger()+attributes.divisionVal.toString()+" "+subject.subject+" "+attributes.assessmentName.toString()+" " + attributes.activity.toString()
		  ret."name" = name
		  ret."students" = students
		  ret."marks" = marks
		  return ret
	  }
	  
	  def studSubjSaActivities(Map attributes){
		  def students = [] , marks = [] , ret = [:]
		  EvaluationTypes evalType = EvaluationTypes.get(1)
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  School school0 = School.get(0)
		  def classMaster = ClassMaster.findByClassName(attributes.classVal.toString())
		  def classMasterId = classMaster.id
		  def schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		  def schlClsDiv = SchoolClassDivision.findBySchoolClassAndDivision(schoolClass , attributes.divisionVal.toString())
		  def subject = SubjectMaster.findBySubjectAndClassNameAndStatus(attributes.subject.toString() , classMaster , 'A')
		  def assmntType = AssessmentTypes.findByAssessmentType(attributes.assessment.toString())
		  def activity = AssessmentActivities.findByActivityNameAndAssmntType(attributes.activity.toString() , assmntType)
		  def assmnt = Assessments.findByAcademicYrAndClassNameAndAssessmentTypeAndAssessmentNameAndSubjectAndStatus(acYr , classMaster , assmntType , attributes.assessmentName.toString() , subject , 'A')
		  Map subjectStudents = listClassDivSubjectStudents(schoolClass.id.toInteger(),schlClsDiv.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(), subject.id.toInteger())
		  if(assmnt){
			  def sumAssmnt = SummativeAssessments.createCriteria()
			  def summAssmnt = sumAssmnt.get {
				  or {
					  and {
						  'in' ("assessment", assmnt)
						  'eq' ("className", classMaster)
						  'eq' ("school", school)
						  'eq' ("status" , "Active")
					  }
					  and {
						  'in' ("assessment", assmnt)
						  'eq' ("className", classMaster)
						  'eq' ("school", school0)
						  'eq' ("status" , "Active")
					  }
				  }
			  }
			  
			  if(summAssmnt){
				  def summAssmntAct = SummAsmntActivityClsRel.findBySchoolClassAndSchlClsDivAndSummAssessmentAndActivityModeAndStatus(schoolClass , schlClsDiv , summAssmnt , 'Classroom' , 'Active')
				  if(summAssmntAct){
					  if(subjectStudents){
						  subjectStudents.each{ss->
							  User student = User.get(ss.value.studentId.toInteger())
							  def ud = UserDetails.findByUser(student)
							  def studentName
							  if( ud.lastname=="null"){
								  studentName= ud.firstName
							  }
							  else{
								  studentName= ud.firstName+" " + ud.lastname
							  }
							  def stdActScore = StdScholSaActivityScore.findByAcademicYrAndSchoolAndClassNameAndDivisionAndAssmntActivityAndStudent(acYr , school , classMaster , schlClsDiv , summAssmntAct , student)
							  if(stdActScore){
								  students.add(studentName)
								  marks.add(stdActScore.marksObtained)
							  }
						  }
					  }
				  }
			  }
		  }
		  def name = attributes.classVal.toInteger()+attributes.divisionVal.toString()+" "+subject.subject+" "+attributes.assessmentName.toString()+" " + attributes.activity.toString()
		  ret."name" = name
		  ret."students" = students
		  ret."marks" = marks
		  return ret
	  }
	  
	  
	  /**
	   * retrieve all divisions under a school class
	   * @param schoolClassId
	   * @return
	   */
	  def rSchoolClassDivisions(def schoolClassId){
		  Map ret = [:]
		  SchoolClassRel schlClsRel = SchoolClassRel.get(schoolClassId.toInteger())
		  def schlClassDiv = SchoolClassDivision.findAllBySchoolClass(schlClsRel)
		  ret."divisions"=[:]
		  ret."totDivision"=schlClassDiv.size()
		  def j=1
		  schlClassDiv?.each {y ->
			  ret."divisions"."div$j"=[ClassDivId:y.id, division:y.division,classTeacher:y.classTeacher?.username,classTeacherId:y.classTeacher?.id]
			  j+=1
		  }
		  return ret
	  }
	  
	  /**
	   * retrieve all assessment types defined in the system
	   * @return [totTypes:2,
	   * 			types:[
	   * 					1:[assessmentId:1, assessmentType:Formative Assessment],
	   * 					2:[assessmentId:2, assessmentType:Summative Assessment]
	   * 				]
	   *			]
	   */
	  def rAllAssessmentTypes(){
		  Map ret = [:]
		  def assessmentTypes = AssessmentTypes.findAllByStatus("A")
		  ret."totTypes"=assessmentTypes.size()
		  ret."types"=[:]
		  def i=1
		  
		  assessmentTypes.each {
			  ret."types".("$i") = [assessmentId:it.id,assessmentType:it.assessmentType]
			  i=i+1
			  }
		  return ret
	  }
	  
	  
	  def teacherMarkEntryStatus(Map attributes){
		  def subjects = [] , subs = [] , i = 0 , j=1 , k = 1 ,marksEnteredStudCount = 0 , marksNotEnteredStudCount = 0
		  def actMarkStatus = 0 , totActMarks = 0 , assmntMarkStatus = 0  , data = [] , data1 = []
		  Map ret = [:] , r=[:] , assmntMap = [:] , actMap = [:]
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  ClassMaster classMaster = ClassMaster.get(attributes.classMasterId.toInteger())
		  SchoolClassDivision division = SchoolClassDivision.get(attributes.divId.toInteger())
		  AssessmentTypes assmntType = AssessmentTypes.get(attributes.assmntType.toInteger())
		  def schlClsRel = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		  def scs = SchoolSubjectRel.createCriteria()
		  def schlClsSubjs = scs.list {
			  and{
				  'eq'("schoolClass", schlClsRel)
				  'or'{
					  'eq'("status", "A")
					  'eq'("status", "F")
				  }
			  }
		  }
		  if(schlClsSubjs){
			  schlClsSubjs.each{scss->
				  SubjectMaster subId = SubjectMaster.get(scss.subjectMaster.id.toInteger())
				  subjects.add(subId.subject)
				  subs.add(subId)
			  }
		  }
		  ret."category" = subjects
		  def faAssmnts = ['FA1' , 'FA2' , 'FA3' , 'FA4']
		  def saAssmnts = ['SA1' , 'SA2']
		  if(assmntType.id.toInteger()==1){
			  faAssmnts.each{fa->
				  r = [name : fa , data:[]]
				  if(subs){
					  subs.each{s->
						  def drilldown = s.subject+" "+fa+"-Activities"
						  assmntMap."$s.subject" = [name:s.subject , y : 0 , drilldown : drilldown]
						  actMap."$j" = [id : drilldown , name : drilldown , data : []]
						  Map subjectStudents = listClassDivSubjectStudents(schlClsRel.id.toInteger(),division.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(),s.id.toInteger())
						  def assmnt = Assessments.findByAcademicYrAndClassNameAndSubjectAndAssessmentTypeAndAssessmentNameAndStatus(acYr , classMaster , s , assmntType , fa , 'A')
						  if(assmnt){
							  def schlAssmnts = SchoolAssessments.findByClassNameAndSchoolAndAssessment(classMaster , school , assmnt)
							  if(schlAssmnts){
								  def sacr = SchlAsmntActivityClsRel.createCriteria()
								  def schlAsAcClsRel = sacr.list{
									  and{
										  'eq'('schoolClass' , schlClsRel)
										  'eq'('schlClsDiv' , division)
										  'eq'('activityMode' , 'Classroom')
										  'eq'('schoolAssessment' , schlAssmnts)
										  'eq'('status' , 'Active')
									  }
								  }
								  def actCount
								  if(schlAsAcClsRel){
									  actCount = schlAsAcClsRel.size()
									  schlAsAcClsRel.each (){sc->
										  AssessmentActivities assmntActivity = AssessmentActivities.get(sc.assmntActivity.id.toInteger())
										  if(subjectStudents){
											  def subjStudCount = subjectStudents.size()
											  subjectStudents.each{ss->
												  User student = User.get(ss.value.studentId.toInteger())
												  def stdScholActScore = StdScholActivityScore.findByAcademicYrAndSchoolAndClassNameAndDivisionAndAssmntActivityAndStudent(acYr , school , classMaster , division , sc , student)
												  if(stdScholActScore){
													  stdScholActScore.each {ssas->
														  if(ssas.marksObtained!=0)
															  i+=1
													  }
													  marksEnteredStudCount = i
													  marksNotEnteredStudCount = subjStudCount-marksEnteredStudCount
													  if(marksEnteredStudCount!=0 && subjStudCount!=0)
														  actMarkStatus = (marksEnteredStudCount/subjStudCount)*100
												  }
											  }
										  }
										  actMap."$j"."data".add([sc.assmntActivity.activityName , actMarkStatus.toDouble().round()])
										  totActMarks+=actMarkStatus
										  marksEnteredStudCount = 0
										  marksNotEnteredStudCount = 0
										  actMarkStatus = 0
										  i=0
									  }
								  }
								  if(totActMarks!=0 && actCount!=0)
								  assmntMarkStatus = totActMarks/actCount
								  assmntMap."$s.subject"."y" = assmntMarkStatus.toDouble().round()
								  totActMarks = 0
								  assmntMarkStatus = 0
							  }
						  }
						  j+=1
					  }
				  }
				  if(assmntMap){
					  assmntMap.each{asm->
						  r.data.add(asm.value)
					  }
				  }
				  data.add(r)
			  }
			  if(actMap){
				  actMap.each{am->
					  data1.add(am.value)
				  }
			  }
		  }
		  if(assmntType.id.toInteger()==2){
			  saAssmnts.each{sa->
				  r = [name : sa , data:[]]
				  if(subs){
					  subs.each{s->
						  def drilldown = s.subject+" "+sa+"-Activities"
						  assmntMap."$s.subject" = [name:s.subject , y : 0 , drilldown : drilldown]
						  Map subjectStudents = listClassDivSubjectStudents(schlClsRel.id.toInteger(),division.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(),s.id.toInteger())
						  def assmnt = Assessments.findByAcademicYrAndClassNameAndSubjectAndAssessmentTypeAndAssessmentNameAndStatus(acYr , classMaster , s , assmntType , sa , 'A')
						  if(assmnt){
							  def summAssmnt = SummativeAssessments.findByClassNameAndStatusAndAssessment(classMaster , 'Active' , assmnt)
							  if(summAssmnt){
								  if(subjectStudents){
									  def subjStudCount = subjectStudents.size()
									  subjectStudents.each{ss->
										  User student = User.get(ss.value.studentId.toInteger())
										  def stdSumScore = StudentSaScore.findByAcademicYrAndSchoolAndClassNameAndDivisionAndSubjectAndSummativeAssessmentAndStudent(acYr , school , classMaster , division , s , summAssmnt , student)
										  if(stdSumScore){
											  stdSumScore.each {sms->
												  if(sms.marksObtained!=0)
													  i+=1
											  }
											  marksEnteredStudCount = i
											  marksNotEnteredStudCount = subjStudCount-marksEnteredStudCount
											  if(marksEnteredStudCount!=0 && subjStudCount!=0)
												  assmntMarkStatus = (marksEnteredStudCount/subjStudCount)*100
										  }
									  }
								  }
								  assmntMap."$s.subject"."y" = assmntMarkStatus.toDouble().round()
								  assmntMarkStatus = 0
								  i=0
							  }
						  }
					  }
				  }
				  if(assmntMap){
					  assmntMap.each{asm->
						  r.data.add(asm.value)
					  }
				  }
				  data.add(r)
			  }
		  }
		  ret."data" = data
		  ret."data1" = data1
		  return ret
	  }
	  
	  
	  def stdFinalPositionRpt(Map attributes){
		  def stdTotFinScore = 0 , stdTotFinPerc = 0 , i = 1
		  Map stdFinScoreMap = [:] , ret = [:]
		  stdFinScoreMap."students" = [:]
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  ClassMaster classMaster = ClassMaster.get(attributes.classMasterId.toInteger())
		  def stdCls = StudentClassRel.createCriteria()
		  def stdClsRel = stdCls.list{
			  and{
				  'eq'("academicYr", acYr)
				  'eq'("school", school)
				  'eq'("className", classMaster)
			  }
		  }
		  if(stdClsRel){
			  stdClsRel.each{scr->
				  User student = User.get(scr.student.id.toInteger())
				  def ud = UserDetails.executeQuery("""Select CONCAT(COALESCE(firstName,''),' ',COALESCE(lastname,'')) from 
													UserDetails where user_id = :student """,[student:student.id])
				  def studentName = ud[0]
				  stdFinScoreMap."students"."$student.id" = [studentId : student.id , studentName : studentName , studDiv : scr.classDivision.division , stdTotFinPerc : [:]]
				  def stdFinScore = StdScholFinalScore.findAllByAcademicYrAndSchoolAndClassNameAndStudent(acYr , school , classMaster , student)
				  if(stdFinScore){
					  def stdSubjCount = stdFinScore.size()
					  def totScore = stdSubjCount*100
					  stdFinScore.each{sfs->
						  stdTotFinScore+=sfs.finalScore
					  }
					  stdTotFinPerc = (stdTotFinScore*100)/totScore
					  stdFinScoreMap."students"."$student.id"."stdTotFinPerc" = stdTotFinPerc.toDouble().round(2)
				  }
				  else{
					  stdFinScoreMap."students"."$student.id"."stdTotFinPerc" = 0.0
				  }
				  stdTotFinScore=0
				  stdTotFinPerc=0
			  }
		  }
		  if(stdFinScoreMap."students"){
			  ret = stdFinScoreMap."students".sort{a,b-> b.value.stdTotFinPerc<=>a.value.stdTotFinPerc}
		  }
		  return ret
	  }
	  
	  def stdSubjsAvgScores(Map attributes){
		  def studSubjs = [] , studSubjFinScores = [:] , studSubjPosition = [:] , i=1 , g = 0 , l = 0 , e = 0
		  def temp=[:]
		  Map subjDivStudents , ret = [:]
		  def subjClsStudents = 0
		  AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		  School school = School.get(attributes.schoolId.toInteger())
		  ClassMaster classMaster = ClassMaster.get(attributes.classMasterId.toInteger())
		  def schlClsRel = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		  def schlClsDivs = SchoolClassDivision.findAllBySchoolClass(schlClsRel)
		  User student = User.get(attributes.studentId.toInteger())
		  def ud = UserDetails.findByUser(student)
		  def studentName = ud.firstName + " " + ud.lastname
		  def stdClsRels = StudentClassRel.findAllByAcademicYrAndSchoolAndClassNameAndStudentNotEqual(acYr , school , classMaster , student)
		  def scs = SchoolSubjectRel.createCriteria()
		  def compSubjs = scs.list {
			  and{
				  'eq'("schoolClass", schlClsRel)
				  'or'{
					  'eq'("subType", "Compulsory")
					  'eq'("subType", "Language I")
				  }
				  'or'{
					  'eq'("status", "A")
					  'eq'("status", "F")
				  }
			  }
		  }
		  if(compSubjs){
			  compSubjs.each{cs->
				  studSubjs.add(cs.subjectMaster)
			  }
		  }
		  def studOptSubjs = StudentOptionalSubject.findAllByAcademicYrAndSchoolAndSchoolClassAndStudentAndStatus(acYr , school , schlClsRel , student , 'A')
		  if(studOptSubjs){
			  studOptSubjs.each{sos->
				  studSubjs.add(sos.subject)
			  }
		  }
		  if(studSubjs){
			  studSubjs.each{ss->
				  SubjectMaster subject = SubjectMaster.get(ss.id.toInteger())
				  studSubjFinScores."$i" = [:]
				  def stdFinScore = StdScholFinalScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndStudent(acYr , school , classMaster , subject , student)
				  if(stdFinScore){
					  studSubjFinScores."$i" = ["$subject.subject" : stdFinScore.finalScore]
				  }
				  else{
					  studSubjFinScores."$i" = ["$subject.subject" : 0.0]
				  }
				  i+=1
			  }
			  def k=1
			  studSubjs.each{ss->
				  SubjectMaster subject = SubjectMaster.get(ss.id.toInteger())
				  studSubjPosition."$subject.subject"= [:]
				  temp."Subject$k"=[:]
				  if(schlClsDivs){
					  schlClsDivs.each{scd->
						  subjDivStudents = listClassDivSubjectStudents(schlClsRel.id.toInteger(),scd.id.toInteger(), school.id.toInteger(), acYr.id.toInteger(), classMaster.id.toInteger(),subject.id.toInteger())
						  if(subjDivStudents){
							  subjClsStudents += subjDivStudents.size()
						  }
					  }
				  }
				  def stdStudFinScore = StdScholFinalScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndStudent(acYr , school , classMaster , subject , student)
				  if(stdStudFinScore){
					  studSubjPosition."$subject.subject"."subjScore" = stdStudFinScore.finalScore.toDouble().round()
					  temp."Subject$k"."subjScore" = stdStudFinScore.finalScore.toDouble().round()
				  }
				  else{
					  studSubjPosition."$subject.subject"."subjScore" = 0.0
					  temp."Subject$k"."subjScore" = 0.0
				  }
				  if(stdClsRels){
					  stdClsRels.each{scr->
						  User stud = User.get(scr.student.id.toInteger())
						  def stdFinScore = StdScholFinalScore.findByAcademicYrAndSchoolAndClassNameAndSubjectAndStudent(acYr , school , classMaster , subject , stud)
						  if(stdFinScore!=null && stdStudFinScore!=null){
							  if(stdStudFinScore.finalScore.toDouble().round() < stdFinScore.finalScore.toDouble().round()){
								  g+=1
							  }
							  if(stdStudFinScore.finalScore.toDouble().round() == stdFinScore?.finalScore.toDouble().round()){
								  e+=1
							  }
							  if(stdStudFinScore.finalScore.toDouble().round() > stdFinScore?.finalScore.toDouble().round()){
								  l+=1
							  }
						  }
					  }
				  }
				  studSubjPosition."$subject.subject"."subjClsStudents" = subjClsStudents
				  studSubjPosition."$subject.subject"."above" = g
				  studSubjPosition."$subject.subject"."equal" = e
				  studSubjPosition."$subject.subject"."below" = l
				  temp."Subject$k"."subjClsStudents"= subjClsStudents
				  temp."Subject$k"."above"= g
				  temp."Subject$k"."equal"= e
				  temp."Subject$k"."below"= l
				  temp."Subject$k"."SubjectName"=subject.subject
				  k+=1
				  subjClsStudents = 0
				  g=0
				  e=0
				  l=0
			  }
			  temp."totSubjects" = k-1
		  }
		  ret."studSubjFinScores" = studSubjFinScores
		  ret."studSubjPosition" = studSubjPosition
		  ret."studSubjPosition1" = temp
		 // print "studSubjPosition = " + studSubjPosition
		  
		  return ret
	   }
	  

    def serviceMethod() {

    }
	
	def stdFinalOptionalSubjRpt(Map attributes){
		Map retrn=[:],ret = [:], ret1=[:], ret2=[:]
		def i = 1
		AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		ClassMaster classMaster = ClassMaster.get(attributes.classMasterId.toInteger())
		def schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		def optSubs = SchoolSubjectRel.createCriteria()
		def optSubjs = optSubs.list {
			and{
				'eq'("schoolClass", schoolClass)
				'or'{
					'eq'("subType", "Language II")
					'eq'("subType", "Additional")
				}
				'or'{
					'eq'("status", "A")
					'eq'("status", "F")
				}
			}
		}
		if(optSubjs){
			ret1=["SubList":[],"StdCount":[]]
			ret2=["SubList":[],"StdCount":[]]
			optSubjs.each{os->
				SubjectMaster subject = SubjectMaster.get(os.subjectMaster.id.toInteger())
				def c = StudentOptionalSubject.createCriteria()
				def studSubjCount = c.get {
					projections {
						count "student"
					}
					'eq'('academicYr' , acYr)
					'eq'('school' , school)
					'eq'('schoolClass' , schoolClass)
					'eq'('subject' , subject)
					'eq'('status' , 'A')
				}
				ret."Sub$i" = [subjectId:subject.id , subjectName : subject.subject , studCount : studSubjCount]
				i+=1
				ret1."SubList".add(subject.subject) 
				def std = [subMastId:subject.id, y:studSubjCount]
				ret1."StdCount".add(studSubjCount)
				ret2."StdCount".add(std)
				ret2."SubList".add(subject.subject)
			}
		}
//		print ret
//		print ret1
//		print ret2
		retrn=["ret":ret,"ret1":ret1, "ret2":ret1]
		if(!(ret && ret1)){
			retrn."message"="No Data Available for the Selected Criteria"
		}
		return retrn
	}
	
	def OptionalSubjStdList(Map attributes){
		def retrn=[:]
		def i = 1
		AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		//attributes.className for student distribution drill down
		ClassMaster classMaster=(attributes.className)?ClassMaster.findByClassName(attributes.className.toString()):ClassMaster.get(attributes.classMasterId.toInteger())
		def schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		def optSubs = SubjectMaster.findBySubjectAndClassNameAndStatus(attributes.subject.toString(), classMaster, "A")//get(attributes.optSubId.toInteger())

		if(optSubs){
			retrn."stds"=[:]
			def students = StudentOptionalSubject.createCriteria().list {
					projections {
						property("student")
					}
					'eq'('academicYr' , acYr)
					'eq'('school' , school)
					'eq'('schoolClass' , schoolClass)
					'eq'('subject' , optSubs)
					'eq'('status' , 'A')
				}
			//print "students="+students
			if(students){
				def stdDetails = null
				if(attributes.gender){ // for student distribution drill down
					stdDetails = UserDetails.executeQuery("""select
																user, CONCAT(COALESCE(ud.firstName,''),' ',COALESCE(ud.lastname,''))
															from
																UserDetails ud
															where
																ud.user in (:user) and
																ud.gender = :gender
														  """,[user:students, gender: attributes.gender.toString()])
				}
				else{
					stdDetails = UserDetails.executeQuery("""select
																user, CONCAT(COALESCE(ud.firstName,''),' ',COALESCE(ud.lastname,''))
															from
																UserDetails ud
															where
																ud.user in (:user)
														  """,[user:students ])
				}
				
				stdDetails.each { sd->
					
					StudentClassRel stdClassDiv = StudentClassRel.findByAcademicYrAndClassNameAndStudent(acYr,classMaster,sd[0])
					retrn."stds"."std$i" = ['studentId':sd[0].id, 'StudentName':sd[1], 'className':stdClassDiv.className.className, 'division':stdClassDiv.classDivision.division] 
					i +=1
				}
			}
		}
		retrn."toStudents"=i-1
		return retrn
	}
	
	def teacherFinalTransferRpt(Map attributes){
		Map ret = [:]
		def i=1
		AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		def uTrns = UserTransferDetails.createCriteria()
		def usrTrsfrDetails = uTrns.list {
			   and{
			   'eq'("acYr" , acYr.id.toString())
			   'eq'("fromSchool", school)
			   'eq'("userRole","Teacher")
			   'eq'("requestStatus" , "Issued")
			   }
		}
		usrTrsfrDetails.each{ x->
			UserDetails ud = UserDetails.findByUser(x.user)
			ret."Students$i" = [teacherId : x.user.id , teacherName : ud.firstName+" "+ud.lastname , toSchool : x.toSchool , issueDate : x.issueDate ,  reason : x.reasonForTransfer]
			i+=1
		}
		return ret
		
	}
	
	
	def stdFinalTransferRpt(Map attributes){
		Map ret = [:]
		def i=1
		AcademicYear acYr = AcademicYear.get(attributes.academicYrId.toInteger())
		School school = School.get(attributes.schoolId.toInteger())
		def classMaster = ClassMaster.get(attributes.classMasterId.toInteger())
		def uTrns = UserTransferDetails.createCriteria()
		def usrTrsfrDetails = uTrns.list {
			   and{
			   'eq'("acYr" , acYr.id.toString())
			   'eq'("fromSchool", school)
			   'eq'("fromClass", classMaster.className.toString())
			   'eq'("userRole","Student")
			   'eq'("requestStatus" , "Issued")
			   }
		}
		usrTrsfrDetails.each{ x->
			UserDetails ud = UserDetails.findByUser(x.user)
			def studentName
			if( ud.lastname=="null"){
				studentName= ud.firstName
			}
			else{
				studentName= ud.firstName+" " + ud.lastname
				}
			ret."Students$i" = [studentId : x.user.id , studentName :studentName  , toSchool : x.toSchool , issueDate : x.applicationDate ,  reason : x.reasonForTransfer]
			i+=1
		}
		return ret
	}
	
	def setTeacher(username)
	{
	   user=User.findByUsername(username);
	   UserRole userRole=UserRole.findByUser(user);
	   if(userRole == null)
	   {
			isTeacher=false;
			return;
	   }
	   Role teacherRole=Role.find(userRole.role);
	   if(teacherRole.authority.equals("ROLE_TEACHER"))
	   {
		   isTeacher=true;
	   }
	   else
	   {
		  isTeacher=false;
	   }
	}
	
	def getCurrentYear()
	{
		return AcademicYear.findByCurrent(1);
	}
	def getTeacherOneYrDtls(year)
	{
		acdYear=getYear(year);
		setSchool();
		setSubjectsTaught();
		return getTeacherRecYr();
		
	}
	def getTeacherHistory(username,nofYears)
	{
		def yearList=[];
		def teacherHistory=[:];
		setTeacher(username);
		def teacherYears=AcademicYear.where{
			projections{
				distinct("startYear")
			}
		}.list()
			
		teacherYears.each{
			yearList.add(it.toInteger());
		}
	//	Sorting in descending order
		Comparator cmp = Collections.reverseOrder();
		Collections.sort(yearList, cmp);
	//	Sorting in ascending order
	//	Collections.sort(yearList);
		int i=1;
		acdYear=getCurrentYear();
		def currentYear=acdYear.startYear.toInteger();
		for(int year:yearList)
		{
			if(year==currentYear)
				teacherHistory.put(year,["subjects":getTeacherOneYrDtls(year)]);
			else
				teacherHistory.put(year,["subjects":null]);
			if(i==nofYears)
			break;
			i++;
		}
		def teacherData=[:];
		teacherData.put(username,["school":school.schoolName,"schoolId":school.id,"currentYear":acdYear.startYear.toInteger(),"acadHistory":teacherHistory]);
//	 return teacherData as JSON;
	}
	
	
}
