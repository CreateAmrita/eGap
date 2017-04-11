/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

//import org.cce.SchoolClassRel;

//import org.cce.User;
//import org.cce.AcademicYear;
//import org.cce.ClassMaster;
//import org.cce.School;
//import org.cce.UserDetails;



import java.sql.Timestamp
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Map;

import grails.plugins.springsecurity.SpringSecurityService as SSS

import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.context.SecurityContextHolder as SCH
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.web.authentication.WebAuthenticationDetails
import org.cce.*
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap;

class UtilService {
	def springSecurityService
    static transactional = true

	Long getSequence(){
		
	}
	
	/**
	 * 
	 * @param name -> of the sequence alue to be fetched
	 * @return next sequence value
	 */
	Long getSequence(String name){
		def tempObj
		try{
			tempObj = Sequence.findByName(name)
			if (tempObj)
				tempObj.val += 1L
			else
				tempObj = new Sequence(name:name, val:1)
				
			tempObj.save(flush:true)
		} catch(Exception e){
			e.printStackTrace()
		}
		return tempObj.val.toLong()
	}
	
	/**
	 * function to fetch the SQL formatted current date
	 * @return date in SQL format
	 */
    def getSqlDate() {
		
		java.util.Date today = new java.util.Date();
		java.sql.Date sqlToday = new java.sql.Date(today.getTime());
//		print "sqlToday ="+ sqlToday
		return sqlToday
    }
	
	def getStringToSqlDate(String str_date){
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd")
		Date date = formatter.parse(str_date)
		java.sql.Date sqlDate = new java.sql.Date(date.getTime())
		return sqlDate
	}
	
	def getStringToSqlTime(String str_time){
		java.sql.Timestamp timestamp = java.sql.Timestamp.valueOf(str_time)
		return timestamp
	}
	
	/** * Utility method to convert Date to Timestamp in Java * @param date * @return Timestamp */ 
	
	public static Timestamp getTimestamp(Date date) { 
		return date == null ? null : new java.sql.Timestamp(date.getTime()); 
	}
	
	
	def saveImage(String imgValue, String realPath, String contextPath){
		return null	
	}
	
	/**
	 * Lists all school groups registered int eh system
	 * @return ret = =[SG1:[id:1,groupName:Amrita Vidyalayam], SG2:[id:2,groupName:Kendriya Vidyalaya]]
	 */
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
	
	def retAllSchoolGroups(){
		def schoolList = SchoolGroup.findAllByStatus("A")
		def ret = [:]
		def i = 1
		if(schoolList){
			ret = ["groups":[:], "totSG":schoolList.size()]
			schoolList.each {x->
				if(x.id.toInteger() !=0){
					ret."groups"."SG$i"=[:]
					ret."groups"."SG$i"=[id:x.id,groupName:x.groupName]
					i+=1
				}
			}
			ret."totSG" = i -1
		}
		return ret
	}
	
	def retAllSchoolGroupSchools(Map params){
		SchoolGroup schoolGrp = SchoolGroup.get(params.schoolGrpId)
		def schoolList = School.findAllByParentGroup(schoolGrp)
		def ret = [:]
		def i = 1
		if(schoolList){
			ret = ["schools":[:], "totSchools":schoolList.size()]
			schoolList.each {x->
				if(x.id.toInteger() !=0){
					ret."schools"."School$i"=[:]
					ret."schools"."School$i"=[SchoolId:x.id,SchoolName:x.schoolName]
					i+=1
				}
			}
			ret."totSchools" = i -1
		}
		return ret
	}
	
	/**
	 * lists all schools under a school group
	 * @param schlGrpId
	 * @return
	 */
	/*def listAllSchlsUndrSchlGrp(Integer schlGrpId){
		def parentSchool = SchoolGroup.find("from SchoolGroup where id= '"+schlGrpId.toInteger()+"'" )
		def school = School.createCriteria()
		def schoolList = school {'eq' ('parentGroup', parentSchool)}
		Map ret=[:]
		def i=1,noSchoolStatus = false
		ret."totSchools"=i
		if(schoolList){
			schoolList.each {x->
				if(!noSchoolStatus && parentSchool.id!=0){
					School noSchool = School.get(0)
					ret."School$i"=[SchoolId:noSchool.id,schoolName:noSchool.schoolName,schoolIdentifier:noSchool.schoolIdentifier]
					noSchoolStatus=true
					i+=1
				}
				ret."School$i"=[SchoolId:x.id,schoolName:x.schoolName,schoolIdentifier:x.schoolIdentifier]
				i+=1
			}
			ret."totSchools"= i -1
		}
		return ret
	}*/
	
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
				ret."School$i"=[SchoolId:x.id,schoolName:schoolName,schoolIdentifier:x.schoolIdentifier]
				i+=1
			}
			ret."totSchools"= i -1
		}
		return ret
	}
	
	def listAllSchlsUndrSchlGrp(Integer schlGrpId){
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
		/*
		if(!noSchoolStatus && parentSchool.id!=0){
			School noSchool = School.get(0)
			ret."School$i"=[SchoolId:noSchool.id,schoolName:noSchool.schoolName,schoolIdentifier:noSchool.schoolIdentifier]
			noSchoolStatus=true
			i+=1
		}
		*/
		if(schoolList){
			schoolList.each {x->
				ret."School$i"=[SchoolId:x.id,schoolName:x.schoolName.toLowerCase(),schoolIdentifier:x.schoolIdentifier]
				i+=1
			}
			ret."totSchools"= i -1
		}
		return ret
	}
	 /*
	def retAllSchlsUndrSchlGrp(Integer schlGrpId){
		def parentSchool = SchoolGroup.find("from SchoolGroup where id= '"+schlGrpId.toInteger()+"'  and status='A'" )
		def school = School.createCriteria()
		def schoolList = school {
			and{
				'eq' ('parentGroup', parentSchool)
				'eq' ('status', "A")
			}
		}
		Map ret=[:]
		def i=1
		ret."totSchools"=i
		ret."schools"=[:]
		School noSchool = School.get(1)
		if(schoolList){
			ret."totSchools"=schoolList.size()
			schoolList.each {x->
				i+=1
				ret."schools"."School$i"=[SchoolId:x.id,schoolName:x.schoolName]
			}
		}
		return ret
	}
	*/
	
	def listAllSchools(){
		def schoolList = School.findAllByStatus("A")	
	}
	
	/**
	* Retrieve all classes in a schools under a school group registered to the system for CCEadmin
	* @param
	* @return [org.cce.School : 1, org.cce.School : 2]
	**/

	def listAllSchoolClasses(Integer schoolId, Integer acYrId){
		Map ret = [:]
		School school = School.get(schoolId)
		AcademicYear acYr = AcademicYear.get(acYrId)
		def scr = SchoolClassRel.createCriteria()
		def SchClsRel = scr {
			and {
				'eq' ('school', school)
				'eq' ('academicYr', acYr)
			}
		}
		def i =1
		SchClsRel.each { x ->
			ret."class$i"=[schlClassId:x.id, className: x.className.className, schoolId: x.school.id, academicYrId:x.academicYr.id,classMasterId:x.className.id]
			ret."class$i"."divisions"=[:]
		
			def schlClassDiv = SchoolClassDivision.findAllBySchoolClass(x)
			def j=1
			schlClassDiv?.each {y ->
				ret."class$i"."divisions"."div$j"=[ClassDivId:y.id, division:y.division,classTeacher:y.classTeacher?.username,classTeacherId:y.classTeacher?.id]
				j+=1
			}
			ret."class$i"."totDiv"=j-1
			i +=1
		}
		
		//Sorting class in desc order 
		def x = ret.sort { a, b ->
			 b.value.className.toInteger() <=> a.value.className.toInteger()
		}
		
		// Re-arranging keys
		Map rearngX = [:]
		x.eachWithIndex(){ a,b ->
			def c = b + 1
			rearngX."class$c" = a.value
		}
		rearngX."totClass" = SchClsRel.size()
		if(SchClsRel.size()==0){
			rearngX."message" = "Please add current academic year to school before you can use this functionality"
		}
		
		return rearngX
	}
	
	
	def listSchlClsFromClsMstId(def classMasterId, def acYrId, def schoolId ){
		Map ret = [:]
		School school = School.get(schoolId)
		AcademicYear acYr = AcademicYear.get(acYrId)
		def scr = SchoolClassRel.createCriteria()
		def SchClsRel = scr {
			and {
				'eq' ('className', ClassMaster.get(classMasterId))
				'eq' ('school', school)
				'eq' ('academicYr', acYr)
			}
		}
		
		def i =1
		SchClsRel.each { x ->
			ret."class$i"=[schlClassId:x.id, className: x.className.className, schoolId: x.school.id, academicYrId:x.academicYr.id,classMasterId:x.className.id]
			ret."class$i"."divisions"=[:]
		
			def schlClassDiv = SchoolClassDivision.findAllBySchoolClass(x)
			def j=1
			schlClassDiv?.each {y ->
				ret."class$i"."divisions"."div$j"=[ClassDivId:y.id, division:y.division,classTeacher:y.classTeacher?.username,classTeacherId:y.classTeacher?.id]
				j+=1
			}
			ret."class$i"."totDiv"=j-1
			i +=1
		}
		
		//Sorting class in asc order
		def x = ret.sort { a, b ->
			a.value.className.toInteger() <=> b.value.className.toInteger()
		}
		
		// Re-arranging keys
		Map rearngX = [:]
		x.eachWithIndex(){ a,b ->
			def c = b + 1
			rearngX."class$c" = a.value
		}
		rearngX."totClass" = SchClsRel.size()
		
		return rearngX
	}
	/**
	 * retrieve all divisions under a school class
	 * @param schoolClassId
	 * @return
	 */
	def rSchoolClasses(Map params){
		Map ret = [:]
		AcademicYear acdYr = AcademicYear.get(params.academicYrId.toLong())
		School school = School.get(params.schoolId.toLong())
		def schoolClasses = SchoolClassRel.findAllByAcademicYrAndSchool(acdYr, school)
		ret."schoolClasses"=[:]
		ret."totClass"=schoolClasses.size()
		def j=1
		schoolClasses?.each {y ->
			ret."schoolClasses"."cls$j"=[schoolClassId:y.id, classVal:y.classVal, classMasterId:y.className.id]
			j+=1
		}
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
	* Retrieve subjects and its details registered for a student
	* @param Map qnAttributes = [studentId:1, academicYr:1]
	* @return [academicYr:1, className:10, totSubjects:5, 
	* 			subList:[
	* 						compSubj1:[sid:1, subjectIdentifier:SC010, subjectName:Science, desc:Science 10th desc, required:Y], 
	* 						compSubj2:[sid:5, subjectIdentifier:MAT010, subjectName:Maths, desc:Maths 10th Desc, required:Y], 
	* 						compSubj3:[sid:6, subjectIdentifier:ENG010, subjectName:English, desc:English 10th Desc, required:Y], 
	* 						compSubj4:[sid:7, subjectIdentifier:SSC010, subjectName:Social Science, desc:Social Science 10th Desc, required:Y], 
	* 						optSubj1:[sid:8, subjectIdentifier:HIN010, subjectName:Hindi, desc:Hindi 10th Desc, required:N]
	* 					]
	* 		  ]
	**/
	Map rSubjectsForStudent(Map params) {
		Map res=[:]
		
		User student = User.get(params.studentId.toInteger())
		School school = School.get(student.school?.id)
		AcademicYear acYr=AcademicYear.find("from AcademicYear where id='"+params.academicYr.toInteger()+"'")
		StudentClassRel stdClsRel=StudentClassRel.find("from StudentClassRel where student='"+student.id.toInteger()+"' and academicYr='"+params.academicYr.toInteger()+"'")
		if(stdClsRel){
			ClassMaster classMaster = ClassMaster.find("from ClassMaster where id = '"+stdClsRel.className.id+"'")
			SchoolClassRel schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr,school,classMaster)
	//		def scs = SubjectMaster.createCriteria()
	//		def compulsorySubjs = scs.list {
	//			and{
	//				'eq'("academicYr", acYr)
	//				'eq'("className", classMaster)
	//				'eq'("required", "Y")
	//				'eq'("status", "A")
	//			}
	//		}
			def scs = SchoolSubjectRel.createCriteria()
			def compulsorySubjs = scs.list {
				and{
					'eq'("schoolClass", (stdClsRel.classDivision)? stdClsRel.classDivision.schoolClass: schoolClass)
					'or'{
						'eq'("subType", "Compulsory")
						'eq'("subType", "Language I")
					}
					'in'("status", ["A","F"])
				}
			}
			def sos = StudentOptionalSubject.createCriteria()
			def optionalSubjs = sos.list {
				and{
					'eq'("academicYr", acYr)
					'eq'("school", school)
					'eq'("student", student)
					'eq'("status" , "A")
				}
			}
	
			if(compulsorySubjs || optionalSubjs){
					res=[academicYr:acYr.id,classMasterId:classMaster.id,className:classMaster.className,classDivision:stdClsRel.classDivision?.id,schoolClassId:schoolClass.id,totSubjects:(compulsorySubjs.size() + optionalSubjs.size())]
					res."subList" = [:]
					def i=1
					compulsorySubjs.each() { ts ->
						def val = i
						res."subList"."compSubj$val"=[:]
						Map subj = [:]
						subj=[sid:ts.subjectMaster.id,subjectIdentifier:ts.subjectMaster.subjectIdentifier,subjectName:ts.subjectMaster.subject,desc:ts.subjectMaster.description,subjectType: ts.subType,required:ts.subjectMaster.required]
						res."subList"."compSubj$val" =subj
						i += 1
					}
					def j=1
					optionalSubjs.each() { os ->
						def val = j
						res."subList"."optSubj$val"=[:]
						Map subj = [:]
						subj=[sid:os.subject.id,subjectIdentifier:os.subject.subjectIdentifier,subjectName:os.subject.subject,desc:os.subject.description,subjectType: os.subject.subjectType,required:os.subject.required]
						res."subList"."optSubj$val" =subj
						j += 1
					}
			}
			else{
				res.message="No subjects registered for the student in this academic year."
			}
		}
		else{
			res.message="Student not registered to a class."
		}
		return res
	}
	
	
	
	def retAllStudentSubjects(Map params){
		AcademicYear acYr=AcademicYear.get(params.academicYr.toInteger())
		User student = User.get(params.studentId.toInteger())
		School school = School.get(student.school?.id)
		ClassMaster classMasterId = ClassMaster.get(params.classMasterId.toInteger()) 
		SchoolClassRel schoolClass = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMasterId)
		//StudentClassRel stdClsRel=StudentClassRel.findByAcademicYrAndSchoolAndStudent(acYr,school,student)
		//ClassMaster classMaster = ClassMaster.get(stdClsRel.className.id)
		def scs = SchoolSubjectRel.createCriteria()
		def compSubjs = scs.list {
			and{
				//'eq'("schoolClass", stdClsRel.classDivision.schoolClass)
				'eq'("schoolClass", schoolClass)
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
		def compulsorySubjs = []
		if(compSubjs){
			compSubjs.each {comp->
				SubjectMaster subject = comp.subjectMaster
				compulsorySubjs.add(subject)
			}
		}
		def sos = StudentOptionalSubject.createCriteria()
		def optionalSubjs = sos.list {
			and{
				'eq'("academicYr", acYr)
				'eq'("school", school)
				'eq'("student", student)
				'eq'("status" , "A")
			}
		}
		if(optionalSubjs){
			optionalSubjs.each {op->
				SubjectMaster subject = op.subject
				compulsorySubjs.add(subject)
			}
		}
		return compulsorySubjs
	}
	
	def retAllStudentSchoolSubjects(Map params){
		AcademicYear acYr=AcademicYear.get(params.academicYrId.toInteger())
		School school = School.get(params.schoolId.toInteger())
		ClassMaster classMaster = ClassMaster.get(params.classNameId.toInteger())
		SchoolClassDivision schlClsDiv = SchoolClassDivision.get(params.schlClsDivId.toInteger())
		SchoolClassRel schlClsRel = SchoolClassRel.findByAcademicYrAndSchoolAndClassName(acYr , school , classMaster)
		def classSubjects = [] , classSubjectsId = [] , studentSubjects = [:] , ret = [:]
		/*def scs = SchoolSubjectRel.createCriteria()
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
			compSubjs.each{
				classSubjects.add(it.subjectMaster.subject)
				classSubjectsId.add(it.subjectMaster.id)
			}
		}*/
		
		def sos = SchoolSubjectRel.createCriteria()
		def optSubjs = sos.list {
			and{
				'eq'("schoolClass", schlClsRel)
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
			optSubjs.each{
				classSubjects.add(it.subjectMaster.subject)
				classSubjectsId.add(it.subjectMaster.id)
			}
		}
		
		def studOptsub //, studCompsub 
		//def stdClsRel = StudentClassRel.findAllByAcademicYrAndSchoolAndClassNameAndClassDivision(acYr, school, classMaster , schlClsDiv)
		def stdClsRel = StudentClassRel.executeQuery("select s from User u , StudentClassRel s , UserDetails ud where u.id = ud.user and u.school='"+school.id+"' and u.status= 'Active' and u.id=s.student and s.className = '"+classMaster.id+"' and s.academicYr = '"+acYr.id+"' and s.classDivision = '"+schlClsDiv.id+"' order by ud.gender desc,ud.firstName asc,ud.lastname asc")
		if(stdClsRel){
			stdClsRel.each{stud->
				User student = User.get(stud.student.id.toInteger())
				def ud = UserDetails.findByUser(student)
				def studentName
				if( ud.lastname=="null"){
					studentName= ud.firstName
				}
				else{
					studentName= ud.firstName+" " + ud.lastname
				}
				//def studentName = ud.firstName + " " + ud.lastname
				def stos = StudentOptionalSubject.createCriteria()
				def stdOptionalSubjs = stos.list {
					and{
						'eq'("academicYr", acYr)
						'eq'("school", school)
						'eq'("schoolClass" , schlClsRel)
						'or'{
							'eq'("subjectType", "Language II")
							'eq'("subjectType", "Additional")
						}
						'eq'("status" , "A")
						'eq'("student", student)
					}
				}	
				def stdOptionalSubjects = stdOptionalSubjs.subject.id				
				studentSubjects."$studentName" = [:]
				def sub , subName
				/*if(compSubjs){
					compSubjs.each{
						subName = it.subjectMaster.subject
						studCompsub = "Yes"
						studentSubjects."$studentName"."$subName" = studCompsub
					} 
				}*/
				
				if(optSubjs){
					optSubjs.each{
						sub = it.subjectMaster.id.toString()
						subName = it.subjectMaster.subject
						if(stdOptionalSubjects.contains(sub.toLong())){
							studOptsub =  "Yes"
							studentSubjects."$studentName"."$subName" = studOptsub
						}
						else{
							studOptsub = "No"
							studentSubjects."$studentName"."$subName" = studOptsub
						}
					}				
				}				
			}
		}		
		ret."classSubjects" = classSubjects
		ret."classSubjectsId" = classSubjectsId
		ret."studentSubjects" = studentSubjects
		return ret
	}

	def retAllStudentPromotionSubjects(Map params){
		AcademicYear acYr=AcademicYear.get(params.academicYr.toInteger())
		User student = User.get(params.studentId.toInteger())
		School school = School.get(student.school?.id)
		StudentClassRel stdClsRel=StudentClassRel.findByAcademicYrAndSchoolAndStudent(acYr,school,student)
		ClassMaster classMaster = ClassMaster.get(stdClsRel.className.id)
		def scs = SchoolSubjectRel.createCriteria()
		def compSubjs = scs.list {
			and{
				'eq'("schoolClass", stdClsRel.classDivision.schoolClass)
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
		def compulsorySubjs = []
		compSubjs.each {comp->
			SubjectMaster subject = comp.subjectMaster
			compulsorySubjs.add(subject)
		}
		def sos = StudentOptionalSubject.createCriteria()
		def optionalSubjs = sos.list {
			and{
				'eq'("academicYr", acYr)
				'eq'("school", school)
				'eq'("student", student)
				'eq'("subjectType" , "Language II")
				'eq'("status" , "A")
			}
		}
		optionalSubjs.each {op->
			SubjectMaster subject = op.subject
			compulsorySubjs.add(subject)
		}
		return compulsorySubjs
	}
	/**
	 * Retrive subjects and its details of a school for SA / SGM
	 * @param Map qnAttributes = [schoolId:1, classMasterId:4,academicYr:1]
	 * @return [academicYr:1, className:9, totSubjects:6,
	 * 			subList:[
	 * 						Subj1:[sid:2, subjectIdentifier:ASTPHY009, subjectName:AstroPhysics, desc:Phy 9th Desc, required:N],
	 * 						Subj2:[sid:9, subjectIdentifier:MAT009, subjectName:Maths, desc:Maths 9th Desc, required:Y],
	 * 						Subj3:[sid:10, subjectIdentifier:ENG009, subjectName:English, desc:English 9th Desc, required:Y]
	 * 					]
	 * 			]
	 **/
	 Map rSubjectsForSchoolClass(Map params) {
		 Map res=[:]
		 
		 School school = School.get(params.schoolId.toInteger())
		 ClassMaster classMaster = ClassMaster.find("from ClassMaster where id = '"+params.classMasterId.toInteger()+"'")
		 AcademicYear acYr=AcademicYear.find("from AcademicYear where id='"+params.academicYr.toInteger()+"'")
		 SchoolClassRel schlClsRel = SchoolClassRel.find("from SchoolClassRel where school='"+school.id.toInteger()+"' and academicYr='"+params.academicYr.toInteger()+"' and className='"+classMaster.id.toInteger()+"'")
		 def sbr = SchoolSubjectRel.createCriteria()
		 def schoolSubjs = sbr.list {'eq'("schoolClass", schlClsRel)}
		 
		 if(schoolSubjs){
				 res=[academicYr:acYr.id, className:classMaster.className,totSubjects:schoolSubjs.size()]
				 res."subList" = [:]
				 res."totSub"=schoolSubjs.size()
				 def j=1
				 schoolSubjs.each() { ts ->
					 def val = j
					 res."subList"."Subj$val"=[:]
					 Map subj = [:]
					 def sub = SubjectMaster.findById(ts.subjectMaster.id.toInteger())
					 subj=[sid:sub.id,subjectIdentifier:sub.subjectIdentifier,subjectName:sub.subject,desc:sub.description,required:sub.required]
					 res."subList"."Subj$val" =subj
					 j += 1
				 }
		 }
			return res
	 }
	 
	 Map rGetSubjectsForSchoolClass(Map params) {
		 Map res=[:]
		 def cSubjCount = 0 , lSubjCount = 0 , aSubjCount = 0
		 School school = School.get(params.schoolId.toInteger())
		 ClassMaster classMaster = ClassMaster.find("from ClassMaster where id = '"+params.classNameId.toInteger()+"'")
		 AcademicYear acYr=AcademicYear.find("from AcademicYear where id='"+params.academicYrId.toInteger()+"'")
		 SchoolClassRel schlClsRel = SchoolClassRel.find("from SchoolClassRel where school='"+school.id.toInteger()+"' and academicYr='"+params.academicYrId.toInteger()+"' and className='"+classMaster.id.toInteger()+"'")
		 def sbr = SchoolSubjectRel.createCriteria()
		 def schoolSubjs = sbr.list {'eq'("schoolClass", schlClsRel)}
		 def cSubjs = SchoolSubjectRel.createCriteria()
		 def compSubjs = cSubjs.list{
			 and{
				 'eq'("schoolClass", schlClsRel)
				 'or'{
					 'eq'("subType" , 'Compulsory')
					 'eq'("subType" , 'Language I')
				 }
			 }
		 }
		 if(compSubjs){
			 cSubjCount = compSubjs.size()
		 }
		 def langIISubjs = SchoolSubjectRel.findAllBySchoolClassAndSubType(schlClsRel , 'Language II')
		 if(langIISubjs){
			 lSubjCount = langIISubjs.size()
		 }
		 def addSubjs = SchoolSubjectRel.findAllBySchoolClassAndSubType(schlClsRel , 'Additional')
		 if(addSubjs){
			 aSubjCount = addSubjs.size()
		 }
		 if(schoolSubjs){
				 res=[academicYr:acYr.id, className:classMaster.className,totSubjects:schoolSubjs.size()]
				 res."subList" = [:]
				 res."totSub"=schoolSubjs.size()
				 res."cSubjCount" = cSubjCount
				 res."lSubjCount" = lSubjCount
				 res."aSubjCount" = aSubjCount
				 def j=1
				 schoolSubjs.each() { ts ->
					 def val = j
					 res."subList"."Subj$val"=[:]
					 Map subj = [:]
					 def sub = SubjectMaster.findById(ts.subjectMaster.id.toInteger())
					 subj=[sid:sub.id,subjectIdentifier:sub.subjectIdentifier,subjectName:sub.subject,desc:sub.description,required:sub.required]
					 res."subList"."Subj$val" =subj
					 j += 1
				 }
		 }
			return res
	 }
	 
	 Map getSubjectsForSchoolClass(Map params) {
		 Map res=[:]
		 def schoolSubjs = []
		 School school = School.get(params.schoolId.toInteger())
		 ClassMaster classMaster = ClassMaster.find("from ClassMaster where id = '"+params.classNameId.toInteger()+"'")
		 AcademicYear acYr=AcademicYear.find("from AcademicYear where id='"+params.academicYrId.toInteger()+"'")
		 SchoolClassRel schlClsRel = SchoolClassRel.find("from SchoolClassRel where school='"+school.id.toInteger()+"' and academicYr='"+params.academicYrId.toInteger()+"' and className='"+classMaster.id.toInteger()+"'")
		 def comSubs = SchoolSubjectRel.createCriteria()
		 def schoolCompSubjs = comSubs.list {
			 and{
				 'eq'("schoolClass", schlClsRel)
				 'eq'("subType" , "Compulsory")
				 }
		 }
		 if(schoolCompSubjs){
			 schoolCompSubjs.each{scss->
				 schoolSubjs.add(scss)
			 }
		 }
		 def langISub = SchoolSubjectRel.createCriteria()
		 def schoolLangISubj = langISub.list {
			 and{
				 'eq'("schoolClass", schlClsRel)
				 'eq'("subType" , "Language I")
				 }
		 }
		 if(schoolLangISubj){
			 schoolLangISubj.each{sls->
				 schoolSubjs.add(sls)
			 }
		 }
		 def langIISub = SchoolSubjectRel.createCriteria()
		 def schoolLangIISubjs = langIISub.list {
			 and{
				 'eq'("schoolClass", schlClsRel)
				 'eq'("subType" , "Language II")
				 }
		 }
		 if(schoolLangIISubjs){
			 schoolLangIISubjs.each{slss->
				 schoolSubjs.add(slss)
			 }
		 }
		 def addSub = SchoolSubjectRel.createCriteria()
		 def schoolAddSubjs = addSub.list {
			 and{
				 'eq'("schoolClass", schlClsRel)
				 'eq'("subType" , "Additional")
				 }
		 }
		 if(schoolSubjs){
			 schoolAddSubjs.each{sass->
				 schoolSubjs.add(sass)
			 }
		 }
		 if(schoolSubjs){
				 res=[academicYr:acYr.id, className:classMaster.className,totSubjects:schoolSubjs.size()]
				 res."subList" = [:]
				 res."totSub"=schoolSubjs.size()
				 def j=1
				 schoolSubjs.each() { ts ->
					 def val = j
					 res."subList"."Subj$val"=[:]
					 Map subj = [:]
					 def sub = SubjectMaster.findById(ts.subjectMaster.id.toInteger())
					 subj=[sid:sub.id,subjectIdentifier:sub.subjectIdentifier,subjectName:sub.subject,desc:sub.description,required:sub.required]
					 res."subList"."Subj$val" =subj
					 j += 1
				 }
		 }
			return res
	 }
 
	/**
	* Retrieve subjects registered for a school class for SA / SGM
	* @param Map qnAttributes = [schoolId:1, classMasterId:4,academicYr:1]
	* @return [ academicYr:1, className:9, totCompSub:3, totAddSub:1, totLangISub:1, totLangIISub:2,
	* 			compSubList:[
	* 						Subj1:[sid:2, subjectIdentifier:ASTPHY009, subjectName:AstroPhysics, desc:Phy 9th Desc, required:N], 
	* 						Subj2:[sid:9, subjectIdentifier:MAT009, subjectName:Maths, desc:Maths 9th Desc, required:Y], 
	* 						Subj3:[sid:10, subjectIdentifier:ENG009, subjectName:English, desc:English 9th Desc, required:Y]
	* 					]
	* 			],
	* 			langISubList:[
	* 						Subj1:[sid:2, subjectIdentifier:ASTPHY009, subjectName:AstroPhysics, desc:Phy 9th Desc, required:N], 
	* 					]
	* 			],
	* 			langIISubList:[
	* 						Subj1:[sid:2, subjectIdentifier:ASTPHY009, subjectName:AstroPhysics, desc:Phy 9th Desc, required:N], 
	* 						Subj2:[sid:9, subjectIdentifier:MAT009, subjectName:Maths, desc:Maths 9th Desc, required:Y], 
	* 					]
	* 			],
	* 			addSubList:[
	* 						Subj1:[sid:2, subjectIdentifier:ASTPHY009, subjectName:AstroPhysics, desc:Phy 9th Desc, required:N], 
	* 					]
	* 			]
	**/
	Map rRegSubjectsForSchoolClass(Map params) {
		Map res=[:], res1=[:], res2=[:]
		AcademicYear acYr = AcademicYear.get(params.acYrId.toInteger())
		School school = School.get(params.schoolId.toInteger())
		ClassMaster className = ClassMaster.get(params.classMasterId.toInteger())
		SchoolClassRel schlClsRel =  SchoolClassRel.findBySchoolAndAcademicYrAndClassName(school,acYr,className)

		def sbr = SchoolSubjectRel.createCriteria()
		def compSubjs = sbr.list {
			and {
				'eq'("schoolClass", schlClsRel)
				'eq'("subType", "Compulsory")
			}
		}

		def addSubjs = sbr.list {
			and {
				'eq'("schoolClass", schlClsRel)
				'eq'("subType", "Additional")
			}
		}

		def langISubjs = sbr.list {
			and {
				'eq'("schoolClass", schlClsRel)
				'eq'("subType", "Language I")
			}
		}

		def langIISubjs = sbr.list {
			and {
				'eq'("schoolClass", schlClsRel)
				'eq'("subType", "Language II")
			}
		}
		res=[academicYr:acYr.id, className:className.className]
		if(compSubjs){
			res."totCompSub" = compSubjs.size()
			res."compSubList" = [:]
			def j=1
			compSubjs.each() { cs ->
				def val = j
				res."compSubList"."Subj$val"=[:]
				Map subj = [:]
				def sub = SubjectMaster.get(cs.subjectMaster.id.toInteger())
				subj=[sid:sub.id,subjectIdentifier:sub.subjectIdentifier,subjectName:sub.subject,desc:sub.description,required:sub.required]
				res."compSubList"."Subj$val" =subj
				j += 1
			}
		}

		if(addSubjs){
			res."totAddSub" = addSubjs.size()
			res."addSubList" = [:]
			def k=1
			addSubjs.each() { ads ->
				def val = k,sub=null
				res."addSubList"."Subj$val"=[:]
				Map subj = [:]
				sub = SubjectMaster.get(ads.subjectMaster.id.toInteger())
				subj=[sid:sub.id,subjectIdentifier:sub.subjectIdentifier,subjectName:sub.subject,desc:sub.description,required:sub.required]
				res."addSubList"."Subj$val" =subj
				k += 1
			}
		}

		if(langISubjs){
			res."totLangISub" = langISubjs.size()
			res."langISubList" = [:]
			def l=1
			langISubjs.each() { l1 ->
				def val = l,sub=null
				res."langISubList"."Subj$val"=[:]
				Map subj = [:]
				sub = SubjectMaster.get(l1.subjectMaster.id.toInteger())
				subj=[sid:sub.id,subjectIdentifier:sub.subjectIdentifier,subjectName:sub.subject,desc:sub.description,required:sub.required]
				res."langISubList"."Subj$val" =subj
				l += 1
			}
		}
		if(langIISubjs){
			res."totLangIISub" = langIISubjs.size()
			res."langIISubList" = [:]
			def k=1
			langIISubjs.each() { l2 ->
				def val = k,sub=null
				res."langIISubList"."Subj$val"=[:]
				Map subj = [:]
				sub = SubjectMaster.get(l2.subjectMaster.id.toInteger())
				subj=[sid:sub.id,subjectIdentifier:sub.subjectIdentifier,subjectName:sub.subject,desc:sub.description,required:sub.required]
				res."langIISubList"."Subj$val" =subj
				k += 1
			}
		}
		return res
	}
	
	def rOptSubjectsForSchlClass(Map params) {
		Map res=[:]
		
		School school = School.get(params.schoolId.toInteger())
		
		ClassMaster classMaster = ClassMaster.find("from ClassMaster where id = '"+params.classMasterId.toInteger()+"'")
		AcademicYear acYr=AcademicYear.find("from AcademicYear where id='"+params.academicYr.toInteger()+"'")
		SchoolClassRel schlClsRel = SchoolClassRel.find("from SchoolClassRel where school='"+school.id.toInteger()+"' and academicYr='"+params.academicYr.toInteger()+"' and className='"+classMaster.id.toInteger()+"'")
		def sbr = SchoolSubjectRel.createCriteria()
		def schoolSubjs = sbr.list {
			and{
				'eq'("schoolClass", schlClsRel)
				'in'("subType", ["Language II","Additional"])
			}
		}
//		if(schoolSubjs){
//				res=[academicYr:acYr.id, className:classMaster.className,totSubjects:schoolSubjs.size()]
//				res."subList" = [:]
//				res."totSub"=schoolSubjs.size()
//				def j=1
//				schoolSubjs.each() { ts ->
//					def val = j
//					res."subList"."Subj$val"=[:]
//					Map subj = [:]
//					def sub = SubjectMaster.findById(ts.subjectMaster.id.toInteger())
//					subj=[sid:sub.id,subjectIdentifier:sub.subjectIdentifier,subjectName:sub.subject,desc:sub.description,required:sub.required]
//					res."subList"."Subj$val" =subj
//					j += 1
//				}
//		}
		   return schoolSubjs
	}
	
	/**
	 * retrieve teachers in a school
	 * @param schoolId
	 * @return
	 */
	def rSchoolTeacher(Integer schoolId){
		Map ret = [:]
		School school = School.get(schoolId.toInteger())
		Role role = Role.get(2)
		def usr = User.createCriteria()
		def users = usr.list {
				'eq'("school", school)
				'eq'("status" , "Active")
		}
		if(users){
			def usrRl = UserRole.createCriteria()
			def userRole= usrRl.list{
				and{
					'in'("user",users)
					'eq'("role",role)
				}
			}
			
			if(userRole){
				def i=1
				
				ret."totTeachers"=userRole.size()
				userRole.each{x->
					UserDetails ud = UserDetails.findByUser(x.user)
					ret."teacher$i"=[userId:x.user.id,name:ud.firstName+" "+ud.lastname,schoolId:schoolId, spec:ud.specification,yoe: ud.yearsOfExp]
					i+=1
				}
			}
			
		}
		return ret
	
	}
	
	/**
	 * retrieve teachers in a school with subjects assigned for each of them
	 * @param schoolId
	 * @param academicYrId
	 * @return
	 */
	/*def rSchoolTeacherAndSubjects(Integer schoolId, Integer academicYrId){
		Map ret = [:]
		School school = School.get(schoolId.toInteger())		
		Role role = Role.get(2)
		AcademicYear acYr = AcademicYear.get(academicYrId.toInteger())
		def usr = User.createCriteria()		
		def users = usr.list {
				'eq'("school", school)
				'eq'("status" , "Active")
		}	
		if(users){
			def usrRl = UserRole.createCriteria()
			def userRole= usrRl.list{
				and{
					'in'("user",users)
					'eq'("role",role)
				}
			}
			if(userRole){
				def i=1
				userRole.each{x->
					UserDetails ud = UserDetails.findByUser(x.user)
					SchoolClassDivision scd = SchoolClassDivision.findByClassTeacher(x.user)
					ret."teacher$i"=[userId:x.user.id,name:ud.firstName+" "+ud.lastname, spec:ud.specification,yoe: ud.yearsOfExp]
					ret."teacher$i"."subList"=[:]
					def tsa = TeacherSubjectAssign.createCriteria()
					def tchSubjAssgn= tsa.list{
						and{
							'eq'("school",school)
							'eq'("academicYr",acYr)
							'eq'("teacher",x.user)
						}
					}
					def j=1
					def firstSub = true
					if(scd){
						ret."teacher$i"."subList"."subj$j"=[className: scd.schoolClass.classVal, classTeacher:"Y",division:scd.division, subject:null]
						ret."teacher$i"."totSub"=j
						j+=1
					}
					if(tchSubjAssgn){
						tchSubjAssgn.each{y->
							def classTeacher="N"
							if(y.classDivision.id==scd?.id){
								classTeacher="Y"
								if(firstSub){
									ret."teacher$i"."subList"."subj1"=[className: y.className.className, classTeacher:classTeacher,division:y.classDivision.division, subject:y.subject.subject]
									firstSub = false
									return
								}
								
							}
							ret."teacher$i"."subList"."subj$j"=[className: y.className.className, classTeacher:classTeacher,division:y.classDivision.division, subject:y.subject.subject]
							j+=1
						}
						ret."teacher$i"."totSub"=j-1
					}
					i+=1 
				}
				
				return ret
			}
		}
	}*/
	
	def rSchoolTeacherAndSubjects(Integer schoolId, Integer academicYrId){
		Map ret = [:]
		School school = School.get(schoolId.toInteger())
		Role role = Role.get(2)
		AcademicYear acYr = AcademicYear.get(academicYrId.toInteger())
		def schlClsRels = SchoolClassRel.findAllByAcademicYrAndSchool(acYr , school)
		def users = User.executeQuery(" from User u , UserRole ur where u.id = ur.user and ur.role = '"+role.id+"' and u.school = '"+school.id+"' and u.status = ?" , 'Active')
		if(users){
			def i=1
			users.each{x->
				def scds = SchoolClassDivision.findAllByClassTeacher(x[0])
				def scd
				if(scds){
					scds.each{d->
						if(d.schoolClass.academicYr==acYr){
							scd = d
						}
					}
				}
				UserDetails ud = UserDetails.findByUser(x[0])
				def tchrName;
				if(ud.lastname != "null"){
					tchrName = ud.firstName+" "+ud.lastname
				}
				else{
					tchrName = ud.firstName
				}
				ret."teacher$i"=[userId:x[0].id,name:tchrName, spec:ud.specification,yoe: ud.yearsOfExp]
				ret."teacher$i"."subList"=[:]
				def tsa = TeacherSubjectAssign.createCriteria()
				def tchSubjAssgn= tsa.list{
					and{
						'eq'("school",school)
						'eq'("academicYr",acYr)
						'eq'("teacher",x[0])
					}
				}
				def j=1
				def firstSub = true
				if(scd){
					ret."teacher$i"."subList"."subj$j"=[className: scd.schoolClass.classVal, classTeacher:"Y",division:scd.division, subject:null]
					ret."teacher$i"."totSub"=j
					j+=1
				}
				if(tchSubjAssgn){
					tchSubjAssgn.each{y->
						def classTeacher="N"
						if(y.classDivision.id==scd?.id){
							classTeacher="Y"
							if(firstSub){
								ret."teacher$i"."subList"."subj1"=[tId : y.id , classId : y.className.id , className: y.className.className, classTeacher:classTeacher,divisionId : y.classDivision.id , division:y.classDivision.division, subjectId : y.subject.id, subject:y.subject.subject]
								firstSub = false
								return
							}
							
						}
						ret."teacher$i"."subList"."subj$j"=[tId : y.id , classId : y.className.id , className: y.className.className, classTeacher:classTeacher,divisionId : y.classDivision.id , division:y.classDivision.division, subjectId : y.subject.id , subject:y.subject.subject]
						j+=1
					}
					ret."teacher$i"."totSub"=j-1
				}
				i+=1
			}
		}
		return ret
	}
	
	/**
	 * retrieve subjects assigned to a teacher in each class division combination
	 * @param schoolId
	 * @param userId
	 * @param academicYrId
	 * @return
	 */
	def rTeacherClassDivSubjects(Integer schoolId, Integer userId,Integer academicYrId){
		
		Map ret = [:],res = [:]
		School school = School.get(schoolId.toInteger())
		Role role = Role.get(2)
		AcademicYear acYr = AcademicYear.get(academicYrId.toInteger())
		User user = User.get(userId)
		if(user){
			def uR= UserRole.findAllByUser(user)
			uR.each{userRole->
				if(userRole.role.id==role.id){
					UserDetails ud = UserDetails.findByUser(userRole.user)
					ret."teacher"=[userId:userRole.user.id,name:ud.firstName+" "+ud.lastname, spec:ud.specification,yoe: ud.yearsOfExp]
					def tsa = TeacherSubjectAssign.createCriteria()
					def tchSubjAssgn= tsa.list{
						and{
							'eq'("school",school)
							'eq'("academicYr",acYr)
							'eq'("teacher",userRole.user)
						}
					}
					if(tchSubjAssgn){
						Map ret1 = [:], ret2= [:]
						ret."teacher"."classes"=[:]
						tchSubjAssgn.each{y->
							def divId = y.classDivision.id
							def subId = y.subject.id
							def x = ret."teacher"."classes".find{ it.key == "$divId" }
							if(!x){
								ret."teacher"."classes"."$divId"=["className": y.className.className, "classId":y.className.id, "division":y.classDivision.division, "divisionId":y.classDivision.id,"schoolClassId":y.classDivision.schoolClass.id]
							}
							def z = ret."teacher"."classes"."$divId".find{ it.key == "subList" }
							if(!z){
								ret."teacher"."classes"."$divId"."subList"=[:]
							}
							ret."teacher"."classes"."$divId"."subList"."$subId" = [:]
							ret."teacher"."classes"."$divId"."subList"."$subId" = [subject:y.subject.subject, subjectId:y.subject.id]
						}
					}
					else{
						res.message="No subjects assigned for you in this class division"
						return res
					}
					
					res."teacher"=[:]
					res."teacher"=[userId:ret.teacher.userId,name:ret.teacher.name, spec:ret.teacher.spec,yoe: ret.teacher.yoe]
					res."teacher"."classes"=[:]
					def i=1
					ret."teacher"."classes".each{k->
						res."teacher"."classes"."class$i" = [:]
						res."teacher"."classes"."class$i"=["className": k.value.className, "classId":k.value.classId, "division":k.value.division, "divisionId":k.value.divisionId,"schoolClassId":k.value.schoolClassId]
						res."teacher"."classes"."class$i"."subList"=[:]
						def j=1
						k.value."subList".each{l->
							res."teacher"."classes"."class$i"."subList"."subj$j"=[:]
							res."teacher"."classes"."class$i"."subList"."subj$j"=l.value
							j+=1
						}
						res."teacher"."classes"."class$i"."totSub" = j-1
						i+=1
					}
					res."teacher"."totClass" = i-1
					if(res."teacher"."totClass".toInteger()==0){
						res.message = "No classes registered for you in this Academic Year"
					}
					
				}
			}
			return res
		}
	}
	
	/**
	 * retrieve acYrs from which subjects are assigned to a teacher 
	 * @param schoolId
	 * @param userId
	 * @return
	 */
	def rTeacherAcYrs(Integer schoolId, Integer userId){
		Map res = [:]
		def totYrs = 0
		School school = School.get(schoolId.toInteger())
		User user = User.get(userId)
		if(user){
			def teachYrs = TeacherSubjectAssign.executeQuery("""select distinct t.academicYr,CONCAT(a.startYear,'-',a.endYear)
																	from TeacherSubjectAssign t ,AcademicYear a where 
																	t.teacher=:user and t.school=:school and t.academicYr=a""" ,[school:school, user:user])
			res."acYrs"=[:]
			def i=1
			if(teachYrs){
				totYrs = teachYrs.size()
				teachYrs.each{tc->
					res."acYrs"."acYr$i" = [acYrName : tc[1], acYrId : tc[0].id]
					i+=1
				}
			}
			if(totYrs.toInteger()==0){
				res.message = "No Academic Year"
			}
			res."totYrs" = totYrs
			return res
		}
	}
	
	/**
	 * retrieve classes assigned to a teacher in an acYr 
	 * @param schoolId
	 * @param userId
	 * @param academicYrId
	 * @return
	 */
	def rTeacherClasses(Integer schoolId, Integer userId,Integer academicYrId){
		Map res = [:]
		def totClass = 0
		School school = School.get(schoolId.toInteger())
		AcademicYear acYr = AcademicYear.get(academicYrId.toInteger())
		User user = User.get(userId)
		if(user){
			def teachClasses = TeacherSubjectAssign.executeQuery("""select distinct c,c.className
																	from TeacherSubjectAssign t , ClassMaster c where
																	t.academicYr=:acYr and t.school=:school and t.teacher=:user and
																	c=t.className""" ,[acYr:acYr , school:school, user:user])
			res."classes"=[:]
			def i=1
			if(teachClasses){
				totClass = teachClasses.size()
				teachClasses.each{tc->
					res."classes"."class$i" = [className : tc[1], classId : tc[0].id]
					i+=1
				}
			}
			if(totClass.toInteger()==0){
				res.message = "No classes registered for you in this Academic Year"
			}
			res."totClass" = totClass
			return res
		}
	}
	
	/**
	 * retrieve subjects assigned to a teacher in each class
	 * @param schoolId
	 * @param userId
	 * @param academicYrId
	 * @param classId
	 * @return
	 */
	def rTeacherClassSubjects(Integer schoolId, Integer userId,Integer academicYrId,Integer classId){
		Map res = [:]
		def totSub = 0
		School school = School.get(schoolId.toInteger())
		AcademicYear acYr = AcademicYear.get(academicYrId.toInteger())
		User user = User.get(userId)
		ClassMaster classMasterId = ClassMaster.get(classId.toInteger())
		if(user){
			def teachClasses = TeacherSubjectAssign.executeQuery("""select distinct c,c.className
																	from TeacherSubjectAssign t , ClassMaster c where
																	t.academicYr=:acYr and t.school=:school and t.teacher=:user and
																	c=t.className""" ,[acYr:acYr , school:school, user:user])
			res."subjects"=[:]
			def i=1
			def teachClsSubjs = TeacherSubjectAssign.executeQuery("""select distinct s.id,s.subject
																	from TeacherSubjectAssign t , SubjectMaster s where t.className=:className and
																	t.academicYr=:acYr and t.school=:school and t.teacher=:user and
																	s=t.subject""" ,[acYr:acYr , school:school, user:user ,className : classMasterId])
			if(teachClsSubjs){
				totSub = teachClsSubjs.size()
				teachClsSubjs.each{tcs->
					res."subjects"."subj$i" = [subject:tcs[1] , subjectId:tcs[0]]
					i+=1
				}
			}
			if(totSub.toInteger()==0){
				res.message = "No subjects registered for you in this class for this Academic Year"
			}
			res."totSub" = totSub
			return res
		}
	}
	
	/**
	 * retrieve all roles assigned to a user
	 * @return
	 */
	List rUserRoles(){
		GrantedAuthority[] authorities = SCH.getContext().getAuthentication().getAuthorities()
		return authorities
	}
	
	/**
	* Retrieve all roles that falls under the role of the current user
	* @return [role1:org.cce.Role : 3, role2:org.cce.Role : 9]
	**/

	Map rRolesBelowCurrentRole(){
		Map definedRoles = [:]
		def tempHrchy = 0, maxHrchy=0, rolesBelow = [:]
		def roles = Role.getAll()
		def noRoles = roles.size()
		roles.each {r ->
			def i = r.hierarchy
			definedRoles."$i" = r.authority
		}
		GrantedAuthority[] authorities = SCH.getContext().getAuthentication().getAuthorities()
		for(GrantedAuthority authority : authorities) {
			def currHrchy = (Role.findByAuthority(authority.getAuthority())).hierarchy
			maxHrchy = (currHrchy > tempHrchy)? currHrchy : tempHrchy
			tempHrchy = currHrchy
		}
		def j=1
		for(def i=maxHrchy; i<=noRoles; i++){
			rolesBelow."role$j" = Role.findByAuthority(definedRoles."$i")
			j += 1
		}
		return rolesBelow
	}
	
	
	/**
	 * Retrieve all roles that falls under the role of the current user
	 * @return
	 */
	List retRolesBelowCurrentRole(){	//used in List action of userController
		Map definedRoles = [:]
		def tempHrchy = 0, maxHrchy=0
		
		List rolesBelow = []
		def roles = Role.getAll()
		def noRoles = roles.size()
		roles.each {r ->
			def i = r.hierarchy
			definedRoles."$i" = r.authority
		}
		GrantedAuthority[] authorities = SCH.getContext().getAuthentication().getAuthorities()
		for(GrantedAuthority authority : authorities) {
			def currHrchy = (Role.findByAuthority(authority.getAuthority())).hierarchy
			maxHrchy = (currHrchy > tempHrchy)? currHrchy : tempHrchy
			tempHrchy = currHrchy
		}
		for(def i=maxHrchy; i<=noRoles; i++){
			rolesBelow.add(Role.findByAuthority(definedRoles."$i"))
		}
		return rolesBelow
	}
	
	
	/**
	 * Retrieve all roles that falls under the role of the current user
	 * @return
	 */
	List getRolesBelowCurrentRole(userId){	//used in List action of userController
		def roleList = []
		User user = User.get(userId.toInteger())
		def usrRole = UserRole.executeQuery("select ur.role from UserRole ur where ur.user = ?" , user)
		Role role = Role.get(usrRole[0].id.toInteger())
		if(role.authority=="ROLE_CCEADMIN"){
			roleList = Role.executeQuery("from Role r where r.authority= ? or r.authority=? or r.authority= ? order by r.hierarchy" , ['ROLE_CCEADMIN' , 'ROLE_SCHOOLS_MANAGER' ,'ROLE_ADMIN' ])
		}
		else if(role.authority=="ROLE_SCHOOLS_MANAGER"){
			roleList = Role.executeQuery("from Role r where r.authority=? or r.authority=? order by r.hierarchy" , ['ROLE_SCHOOLS_MANAGER' ,'ROLE_ADMIN' ])
		}
		else if(role.authority=="ROLE_ADMIN"){
			roleList = Role.executeQuery("from Role r where r.authority=? or r.authority=? or r.authority=? or r.authority=? order by r.hierarchy" , ['ROLE_ADMIN' , 'ROLE_TEACHER' , 'ROLE_STUDENT' , 'ROLE_PARENT' ])
		}
		return roleList
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
	 * Retreive school group name 
	 * 
	 * @param schoolGrpId
	 * @return
	 */
	Map rSchoolGroup(def schoolGrpId){
		SchoolGroup SchlGrp = null
		Map ret=[:]
		SchlGrp =  SchoolGroup.get(schoolGrpId)
		ret=[Grpid:schoolGrpId,groupName:SchlGrp.groupName]
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
			Map ret=[Schoolid:userSchool.id,schoolName:userSchool.schoolName.toLowerCase(),schoolIdentifier:userSchool.schoolIdentifier]
			return ret
		}
	}
	
	/**
	 * Retreive school name
	 *
	 * @param schoolGrpId
	 * @return
	 */
	Map rSchool(def schoolId){
		Map ret=[:]
		School School = School.get(schoolId)
		ret=[Schoolid:schoolId,schoolName:School.schoolName]
		return ret
	}
	
	
	
	/**
	 * retrieve all classes in the CCE system level
	 * @return
	 */
	def listAllMasterClasses(){
		Map ret = [:]
		def masterClasses = ClassMaster.getAll()
		
		if(masterClasses){
			def i =1
			masterClasses.each{ x->
				ret."class$i" = [classMasterId:x.id, className:x.className]
				i+=1
			}
		}
		//Sorting class in asc order
		def x = ret.sort { a, b ->
			a.value.className.toInteger() <=> b.value.className.toInteger()
		}
		
		// Re-arranging keys
		Map rearngX = [:]
		x.eachWithIndex(){ a,b ->
			def c = b + 1
			rearngX."class$c" = a.value
		}
		rearngX."totClass" = masterClasses.size()
		return rearngX
	}
	List retAllMasterClasses(){	//used to List all batches while adding a college
		List batches = []
		
		def masterClasses = ClassMaster.getAll()
		masterClasses.each { batch->
			batches.add(batch)
		}
		return batches
	}
	
	/**
	 * return current academic year
	 * @return
	 */
	def retCurrentAcYear(){
		AcademicYear acYr = AcademicYear.findByCurrent(true)
		Map ret = [id:acYr.id,sYear:acYr.startYear,eYear:acYr.endYear]
		return ret
	}

	/**
	 * return current academic year in the school
	 * @return
	 */
	def retCurrentSchoolAcYear(Integer schoolId){
		Map ret = [:]
		AcademicYear acYr = AcademicYear.findByCurrent(true)
		def scr = SchoolClassRel.createCriteria()
		def schlClsRel = scr.list {
			and{	
				'eq'("academicYr", acYr)
				'eq'("school", School.get(schoolId))
			}
		}
		if(schlClsRel)
			ret = [id:acYr.id,sYear:acYr.startYear,eYear:acYr.endYear]
		else
			ret = [message:"Please add current academic year to school before you can use this functionality"]
		return ret
	}
	
	/**
	 * return all academic year in the school
	 * @return
	 */
	def retAllAcYr(Integer schoolId){
		Map res=[:]
		Map ret = [:]
		def aaa = AcademicYear.list()
		def i=1
		aaa.each() {ts ->
			def val = i
			res."acYr$val"=[:]
			Map subj = [:]
			subj=[sid:ts.id,startYear:ts.startYear,endYear:ts.endYear]
			res."acYr$val" =subj
			i += 1
		}
		res."total" = i
		return res
	}
	
	def retStudentLessonDetails(Map params){
		User user = User.get(params.userId.toInteger())
		StudentClassRel studentClassRel = StudentClassRel.findByAcademicYrAndSchoolAndStudent(AcademicYear.get(params.academicYr.toInteger()),user.school,user)
		Map classes = [:],sem = [:],dept=[:]
		classes."class1"=[:]
		classes."class1" = [classMasterId:studentClassRel.className.id,className:studentClassRel.className.className,schoolClassId:(studentClassRel.classDivision)? studentClassRel.classDivision?.schoolClass?.id: studentClassRel.sem.schoolClass.id,classDivisionId:studentClassRel.classDivision?.id,classDivision:studentClassRel.classDivision?.division]
		classes."totClass"=1
		
		sem = ["totSem":1,"semesters":[:]]
		sem."semesters"."sem1"=[:]
		sem."semesters"."sem1" = [semId:studentClassRel.sem.id, semName: studentClassRel.sem.sem.semName, semNum: studentClassRel.sem.sem.semNum]
		
		
		dept = ["totDept":1,"departments":[:]]
		dept."departments"."dept1"=[:]
		dept."departments"."dept1" = ["id":studentClassRel.department.id,"deptId":studentClassRel.department.departmentMaster.id,"deptName":studentClassRel.department.deptName]
		
		return [classNames : classes,semesters : sem,departments:dept]
	}
	
	def retClassTeacher(Integer schoolId , Integer userId , Integer acYrId ){
		Map res = [:]
		def classDiv = [:]
		School school = School.get(schoolId)
		User teacher = User.get(userId)
		AcademicYear acYr = AcademicYear.get(acYrId)
		def schlClsDivs = SchoolClassDivision.findAllByClassTeacher(teacher)
		if(schlClsDivs){
			schlClsDivs.each{scd->
				if(scd.schoolClass.academicYr.current==true){
					classDiv = [className : scd.schoolClass.classVal , classId : scd.schoolClass.className.id , division : scd.division , divisionId : scd.id , schoolClassId : scd.schoolClass.id]
				}
			}
		}
		if(classDiv){
			res."classDiv" = classDiv
		}
		else{
			res.message = "You are not assigned to any class as a class teacher in this academic year"
		}
		return res
	}
	
	
}
