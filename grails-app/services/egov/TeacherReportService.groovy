package egov


import java.util.List;
import java.util.Map;

import egov.AcademicYear;
import egov.School;
import egov.User;
import egov.UserRole;
import egov.Role
import egov.CbseZone;
import egov.ZoneRegion;
import egov.RegionCluster;
import egov.ClusterStateRel;

import org.hibernate.criterion.CriteriaSpecification;

import egov.State;
import egov.ClusterStateDistrictRel;
import egov.StateDistrict;
import egov.School;
import grails.converters.JSON;
import egov.SchoolClassRel;
import egov.SchoolClassDivision;
import egov.SchoolSubjectRel;
import egov.StudentClassRel;
import egov.StudentOptionalSubject;
import egov.StudentFaScore;
import egov.StudentSaScore;
import egov.UserDetails;

class TeacherReportService {	
	User user;
	UtilService utilService;
	AcademicYear acdYear;
	School school;
	TestService testService;
	EgovSqlQueryService sqlQueryService;
	boolean isTeacher;
	List subjectsTaught=[];	
	def getYear(year)
	{
		return AcademicYear.findByStartYear(year);
	}
	
	def getCurrentYear()
	{
		return AcademicYear.findByCurrent(1);
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
	
	def getTeacherStatus(){
		return isTeacher;
	}
	
	def setSchool()
	{
		school=School.get(user.school.id);
	}
	
	
	def setSubjectsTaught()
	{
		subjectsTaught=TeacherSubjectAssign.withCriteria {
			createAlias('subject', 'sub')
			createAlias('className', 'cl')
			createAlias('classDivision', 'clDiv')
			createAlias('teacher', 'teacherName')
			
			and {
			eq("academicYr",acdYear)
			eq("teacherName.username",user.username)
		 }
		 resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
		 
		 projections {
			 property("sub.id", "subjectId")
			 property("sub.subject", "subjectName")
			 property("cl.id","classId");
			 property("cl.className","className");
			 property("clDiv.id","divId")
			 property("clDiv.division","divisionName")
		 }
		 order("sub.subject", "desc")
		 order("cl.className","desc")
		}
	}
	
	/*
	 * select a.subject,a.className,a.classDivision from TeacherSubjectAssign As a,SubjectMaster As b where a.academicYr=? and a.teacher=? and a.subject.id=b.id order by b.subject
	 */
	
	def getTeacherRecYr()
	{
		def teacherYearRecord=[:];
		
		def flag=true;
		def classMap=[:];
		def subjectMap=[:];
		def divisionMap=[:];
		
		def subId;
		def classId;
		def psubName="";
		def pclassName="";
		
		def subName="";
		def className="";
		def division="";
		def divId="";
		def psubId;
		def pclassId;
		if(subjectsTaught.empty){
			return null;
		}
		subjectsTaught.each {subsTaught->
			
			// find class for that subject id
			// find sections for that class
			subId=subsTaught.subjectId;
			subName=subsTaught.subjectName;
			className=subsTaught.className;
			classId=subsTaught.classId;
			division=subsTaught.divisionName;
			divId=subsTaught.divId;			
			if(flag==true){
				psubName=subsTaught.subjectName;
				psubId=subsTaught.subjectId;
				pclassName=subsTaught.className;
				pclassId=subsTaught.classId;
				flag=false;
			}
			
			Map studentsMarks=[:];			
			def avgFa1=0.00;
			def avgFa2=0.00;
			def avgFa3=0.00;
			def avgFa4=0.00;
			def avgSa1=0.00;
			def avgSa2=0.00;
			int studentCount=0;
			// get all students
			
			
			def studentsMainList=StudentClassRel.withCriteria {
				createAlias("className","cl")
				createAlias("classDivision","clDiv")
				createAlias("student","students")
				and{
					eq("academicYr",acdYear)
					eq("cl.id",classId)
					eq("clDiv.id",divId)
				}
				projections {
					property("students.id")
				}
			}
			
			List studentsList=[];
			boolean optFlag=false;
			def studentOptionalSubject=null;
			studentsMainList.each{studentId->
				  
				  studentOptionalSubject=StudentOptionalSubject.withCriteria {
					  createAlias("student","students")
					  createAlias('subject', 'sub')
					  and{
						  eq("student.id",studentId)
						  eq("sub.id",subId)
						  eq("academicYr",acdYear)
					  }
				  }
				  
				  if(studentOptionalSubject!=null && !studentOptionalSubject.isEmpty()){
					optFlag=true;
					studentsList.add(studentId)
				  }
		  }
			
			if(optFlag==false){
					studentsMainList.each{studentId->
						studentsList.add(studentId);
					}
			}
			
			
	
			
			studentsList.each {studentId->
								studentCount++;							
								def fa1Marks=null;
								def fa2Marks=null;
								def fa3Marks=null;
								def fa4Marks=null;
								def sa1Marks=null;
								def sa2Marks=null;
								//FA Score
							
							def	studentFaScore=StudentFaScore.withCriteria {
								createAlias("student","students")
								createAlias('subject', 'sub')
								resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
								and{
									eq("student.id",studentId)
									eq("sub.id",subId)
									eq("academicYr",acdYear)
								}
								projections {
									property("assessmentName", "assessmentName")
									property("percentage", "percentage")
								}
							}
								studentFaScore.each {scores->
										if(scores.assessmentName.equals("FA1"))
												fa1Marks=Math.round(scores.percentage*100.0)/100.0;
										if(scores.assessmentName.equals("FA2"))
												fa2Marks=Math.round(scores.percentage*100.0)/100.0;
										if(scores.assessmentName.equals("FA3"))
												fa3Marks=Math.round(scores.percentage*100.0)/100.0;
										if(scores.assessmentName.equals("FA4"))
												fa4Marks=Math.round(scores.percentage*100.0)/100.0;						
								}								
								def faCount=0;
								def saCount=0;
								def faAvg=0;
								def saAvg=0;
								if(fa1Marks!=null){
									avgFa1+=fa1Marks.toDouble();
									faAvg+=fa1Marks.toDouble();
									faCount++;
								}
								if(fa2Marks!=null){
									avgFa2+=fa2Marks.toDouble();
									faAvg+=fa2Marks.toDouble();
									faCount++;
								}
								if(fa3Marks!=null){
									avgFa3+=fa3Marks.toDouble();
									faAvg+=fa3Marks.toDouble();
									faCount++;
								}
								if(fa4Marks!=null){
									avgFa4+=fa4Marks.toDouble();
									faAvg+=fa4Marks.toDouble();
									faCount++;
								}
								if(faCount==0)
									faAvg=0;
								else
									faAvg=faAvg.toDouble()/faCount.toDouble();
								
								//SA Score
							def	studentSaScore=StudentSaScore.withCriteria {
								createAlias("student","students")
								createAlias('subject', 'sub')
								resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
								and{
									eq("student.id",studentId)
									eq("sub.id",subId)
									eq("academicYr",acdYear)
								}
								projections {
									property("assessmentName", "assessmentName")
									property("percentage", "percentage")
								}
							}
							
								
								studentSaScore.each {scores->
												
										if(scores.assessmentName.equals("SA1"))
												sa1Marks=Math.round(scores.percentage*100.0)/100.0;
										if(scores.assessmentName.equals("SA2"))
												sa2Marks=Math.round(scores.percentage*100.0)/100.0;					
						
								}
								
								if(sa1Marks!=null){
									avgSa1+=sa1Marks.toDouble();
									saAvg+=sa1Marks.toDouble();
									saCount++;
								}
								if(sa2Marks!=null){
									avgSa2+=sa2Marks.toDouble();
									saAvg+=sa2Marks.toDouble();
									saCount++;
								}							
						
								if(saCount==0)
									saAvg=0;
								else
									saAvg=saAvg.toDouble()/saCount.toDouble();
								
										
								
								def studentDetails=UserDetails.withCriteria {
									createAlias('user', 'student')
									eq("user.id",studentId)
									resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
								 
								 projections {
									 property("middleName", "middleName")
									 property("firstName", "firstName")
									 property("lastname","lastname");
									}
								}
								String name="";
								studentDetails.each {
								name=it.firstName.toString();
								if(it.middleName!=null && !it.middleName.equals(""))
									name=name+" "+it.middleName;
								if(it.lastname!=null && !it.lastname.equals(""))
									name=name+" "+it.lastname;
								}					
									 //Adding students to studentMarks map
								studentsMarks.put(studentId,["Term1":["FA1":fa1Marks,"FA2":fa2Marks,"SA1":sa1Marks],"Term2":["FA3":fa3Marks,"FA4":fa4Marks,"SA2":sa2Marks],"avgs":["FA":Math.round(faAvg*100.0)/100.0,"SA":Math.round(saAvg*100.0)/100.0],"studentName":name]);
								fa1Marks=null;
								fa2Marks=null;
								fa3Marks=null;
								fa4Marks=null;
								sa1Marks=null;
								sa2Marks=null;
								
				}
			
			avgFa1=((double)avgFa1/(double)studentCount);
			avgFa1=Math.round(avgFa1*100.0)/100.0
			
			avgFa2=((double)avgFa2/(double)studentCount);
			avgFa2=Math.round(avgFa2*100.0)/100.0
			
			avgFa3=((double)avgFa3/(double)studentCount);
			avgFa3=Math.round(avgFa3*100.0)/100.0
			
			avgFa4=((double)avgFa4/(double)studentCount);
			avgFa4=Math.round(avgFa4*100.0)/100.0
			
			avgSa1=((double)avgSa1/(double)studentCount);
			avgSa1=Math.round(avgSa1*100.0)/100.0
			
			avgSa2=((double)avgSa2/(double)studentCount);
			avgSa2=Math.round(avgSa2*100.0)/100.0
			
		
	
			boolean classFlag=true;
			if(psubName.equals(subName))
			{
				//subject not changed
				if(!pclassId.equals(classId))
				{
					//class changed
					classMap.put(pclassName,["divisions":divisionMap,"classId":pclassId]);
					classFlag=false;
					divisionMap=[:];
					divisionMap.put(division,["students":studentsMarks,"avgs":["Term1":["FA1":avgFa1,"FA2":avgFa2,"SA1":avgSa1],"Term2":["FA3":avgFa3,"FA4":avgFa4,"SA2":avgSa2]],"divId":divId,"totalStudent":studentCount]);
					
					//make prev classId pointer to point new classId
					pclassId=classId;
					pclassName=className;
						
				}
				else
				{
					//class not changed
					divisionMap.put(division,["students":studentsMarks,"avgs":["Term1":["FA1":avgFa1,"FA2":avgFa2,"SA1":avgSa1],"Term2":["FA3":avgFa3,"FA4":avgFa4,"SA2":avgSa2]],"divId":divId,"totalStudent":studentCount]);
					
				}
			}
			else
			{
				//subject changed
				if(classFlag)
					classMap.put(pclassName,["divisions":divisionMap,"classId":pclassId]);
				subjectMap.put(psubName,["classes":classMap]);
				divisionMap=[:];
				classMap=[:];
				divisionMap.put(division,["students":studentsMarks,"avgs":["Term1":["FA1":avgFa1,"FA2":avgFa2,"SA1":avgSa1],"Term2":["FA3":avgFa3,"FA4":avgFa4,"SA2":avgSa2]],"divId":divId,"totalStudent":studentCount]);
	
				psubId=subId;
				psubName=subName;				
				
				pclassId=classId;
				pclassName=className;
		
			}
			studentCount=0;
			
		}
		classMap.put(pclassName,["divisions":divisionMap,"classId":pclassId]);
		subjectMap.put(psubName,["classes":classMap]);
		divisionMap=[:];
		classMap=[:];
		return subjectMap;
	}

	
	
	def getTeacherCurrDtls(username)
	{
		setTeacher(username);
		acdYear=getCurrentYear();
		setSchool();
		setSubjectsTaught();
		Map teacherYearRecord=getTeacherRecYr();
		getTeacherHistory(username,3);
		return teacherYearRecord as JSON;
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
	  return teacherData as JSON;
	}
	
	def retSchoolTeachers(Map params){
		School school = School.get(Integer.parseInt(params.schoolId.toString()))
		Role role = Role.findByAuthority("ROLE_TEACHER")
		def users=[], i=1
		def ret =[:]
		def teachers = User.findAll("""from User as usr, UserRole as r where r.user = usr and usr.school = :school and r.role = :role""", [school: school, role: role])
		teachers.each {tch->
			User teacher =tch[0]
			//print "teacher="+teacher
			UserDetails teacherDetails = UserDetails.findByUser(teacher)
				ret."teacher$i"=[TeacherId:teacher?.id,TeacherName:teacherDetails?.firstName?.toLowerCase()+" "+teacherDetails?.lastname?.toLowerCase(), tetQualified: teacherDetails?.tetQualified]
				i+=1
		}
		ret."totTeachers"= i -1
		ret."SchoolId" = school.id
		return ret
	}
	def retTeacherDetail(Map params){
		Role role = Role.findByAuthority("ROLE_TEACHER")
		User teacher = User.get(Integer.parseInt(params.userId.toString()))
		UserRole userRole = UserRole.findByUserAndRole(teacher,role)
		if(userRole){
			UserDetails teacherDetails = UserDetails.findByUser(teacher)
			Map ret=[TeacherId:teacher?.id,TeacherName:teacherDetails.firstName?.toLowerCase()+" "+teacherDetails.lastname?.toLowerCase(),tetQualified: teacherDetails?.tetQualified,SchoolId: school?.id]
			return ret
		}
		else
		 return ["message":"Current user is not registered as a Teacher"]
	}
	def retSelectedTeacherDetails(params){
		def ret=[:]
		utilService = new UtilService()
		sqlQueryService = new EgovSqlQueryService()
		School school = School.get(params.schoolId.toInteger())
		def currentAcYr = utilService.retCurrentSchoolAcYear(school.id.toInteger())
		AcademicYear acYr = AcademicYear.get(currentAcYr.id)
		User teacher = User.get(Integer.parseInt(params.teacherId.toString()))
		UserDetails teacherDetails = UserDetails.findByUser(teacher)
		def teacherSubjects = retCurrentAcYrTeacherSubjectsPassPerf(acYr, school, teacher)
		def totSubjects = (teacherSubjects."totSubjects")? "Mentoring "+ teacherSubjects."totSubjects" + " Courses": "No Subjects Have Been Assigned This Year."
		def totExp = teacherDetails.yearsOfExp?teacherDetails.yearsOfExp:"Data Not Available"
		def tetQualified = (teacherDetails.tetQualified)? "Yes": "No"
		SchoolTeacherRating rating = SchoolTeacherRating.findByAcdYrAndSchoolAndTeacher(acYr, school, teacher)
		def teacherRathing = (rating)? "Rating : "+ rating?.rating?.rating + " - " +rating?.rating?.ratingName : "Data Not Available"
		def specification =  (teacherDetails.specification)?:"Data Not Available"
		def bestTeacher = findBestTeacherAwardYears(school, teacher)
		def awardYears = (bestTeacher)?:"Have Not Secured Best Teacher Award Yet."
		def perfStat = getTeacherRatings(school, teacher)
		def markEntryStat = sqlQueryService.rCurrAcYrTeacherSubMarkEntryStatus(acYr, school, teacher)
		ret = [totSubjects: totSubjects, teacherSubjects:teacherSubjects, totExp: totExp, tetQualified: tetQualified, rating: teacherRathing,spec: specification, awardYears: awardYears, perfStat: perfStat, markEntryStat: markEntryStat]
	}
	
	def retCurrentAcYrTeacherSubjectsPassPerf(AcademicYear acYr, School school, User teacher){
		def teacherSubjects = []
		def teachSubjects = TeacherSubjectAssign.findAllByAcademicYrAndSchoolAndTeacher(acYr, school, teacher)
		def tempRet=[:], ret=[:], temp = [:]
		teachSubjects.each(){ts->
			def key = ts.className.className+ts.classDivision.division+ts.subject.id
			temp."$key" = [SubjectId:ts.subject.id, SubjectName:ts.subject.subject, classMasterId:0, className: ts.className.className, division: ts.classDivision.division, pass:"Student Final Scores Not Available."]
		}
		def teacherCompSubjects = TeacherSubjectAssign.executeQuery("""	select 
																			sm.id, sm.subject, cm.id, cm.className ,scd.division, round(sum(ssfs.finalScore)/count(scr.student),2)
																		from 
																			StdScholFinalScore ssfs,  TeacherSubjectAssign t, SchoolClassDivision scd, SchoolSubjectRel ssr, StudentClassRel scr, ClassMaster cm, SubjectMaster sm
																		where 
																			t.teacher= :teacher and 
																			t.school= :school and 
																			t.academicYr = :academicYear and 
																			ssr.schoolClass = scd.schoolClass and 
																			scd.id = t.classDivision and 
																			ssr.subjectMaster = t.subject and 
																			ssr.subType in (:subType) and 
																			ssfs.className=t.className  and 
																			ssfs.division=t.classDivision  and 
																			ssfs.subject=t.subject and 
																			scr.className=t.className and 
																			scr.classDivision = t.classDivision and
																			scr.student = ssfs.student and
																			cm.id = t.className and
																			sm.id = t.subject
																		group by sm.id, sm.subject,cm.className ,scd.division""",
																		[teacher: teacher, school: school, academicYear: acYr, subType:["Compulsory", "Language I"] ])
		if(teacherCompSubjects)
			teacherCompSubjects.each {tcs-> teacherSubjects.add(tcs)}
		def teacherOptSubjects = TeacherSubjectAssign.executeQuery("""	Select
																			sm.id, sm.subject, cm.id, cm.className ,scd.division, round(sum(ssfs.finalScore)/count(scr.student),2)
																		from 
																			StdScholFinalScore ssfs,  TeacherSubjectAssign t, SchoolClassDivision scd, SchoolSubjectRel ssr, StudentClassRel scr, ClassMaster cm, SubjectMaster sm, StudentOptionalSubject sos
																		where 
																		t.teacher= :teacher and 
																		t.school= :school and 
																		t.academicYr = :academicYear and 
																		ssr.schoolClass = scd.schoolClass and 
																		scd.id = t.classDivision and 
																		ssr.subjectMaster = t.subject and 
																		ssr.subType in (:subType) and 
																		ssfs.className=t.className  and 
																		ssfs.division=t.classDivision  and 
																		ssfs.subject=t.subject and 
																		scr.className=t.className and 
																		scr.classDivision = t.classDivision and
																		scr.student = ssfs.student and
																		sos.student = scr.student and 
																		sos.subject = t.subject and
																		sos.schoolClass = scd.schoolClass and 
																		sos.status = 'A' and 
																		cm.id = t.className and
																		sm.id = t.subject
																	group by sm.id, sm.subject,cm.className ,scd.division""",
																	[teacher: teacher, school: school, academicYear: acYr, subType:["Language II", "Additional"] ])
		if(teacherOptSubjects)
			teacherOptSubjects.each {tos-> teacherSubjects.add(tos)}
		
		if(teacherSubjects){
			teacherSubjects.each(){ts->
				def key = ts[3]+ts[4]+ts[0]
				temp."$key"["classMasterId"]=ts[2]
				temp."$key"["pass"]=ts[5]+" %"
				//[SubjectId:ts[0], SubjectName:ts[1], className: ts[2], division: ts[3], pass:ts[4]+"%"]
			}
			def i=1
			temp.each(){k,v->
				ret."Subject$i" = v
				i+=1
			}
			ret."totSubjects"= temp.size()
			ret."SchoolId" = school.id
			ret."TeacherId"=teacher?.id
			ret."acYrId" = acYr.id
		}
		else
		 ret = [totSubjects:0,"message":"No Subjects Have Been Assigned This Year."]
		return ret
	}
	
	def findBestTeacherAwardYears(School school, User teacher){
		def years = ""
		def maxTeacherRatings = SchoolTeacherRating.findAllBySchoolAndRatingAndTeacher(school, RatingMaster.get(1),teacher)
		if(maxTeacherRatings){
			maxTeacherRatings.each{ratings->
				years+=ratings.acdYr.startYear+", "
			}
		}
		
		years = (years)?"Awarded in "+years.substring(0, years.lastIndexOf(',')):years
		return years
	}
	
	def getTeacherRatings(School school, User teacher){
		def teacherRatings = [a:[],y:[]]
		def maxTeacherRatings = SchoolTeacherRating.findAllBySchoolAndTeacher(school, teacher)
		if(maxTeacherRatings){
			maxTeacherRatings.each{ratings->
				teacherRatings.a.add(ratings.rating.rating)
				teacherRatings.y.add(ratings.acdYr.startYear)
			}
		}
		//print teacherRatings
		return teacherRatings
	}
	
	def retCurrentAcYrTeacherSubjects(AcademicYear acYr, School school, User teacher){
		testService = new TestService()
		def teacherSubjects = TeacherSubjectAssign.findByAcademicYrAndSchoolAndTeacher(acYr,school,teacher)
		//print "teacherSubjects = " + teacherSubjects
		def ret=[:], i=1
		if(teacherSubjects){
			teacherSubjects.each {tch->
				SubjectMaster subject = tch.subject
				ret."Subject$i"=[SubjectId:subject?.id, SubjectName:subject?.subject?.toLowerCase(), classMasterId:tch?.className?.id, divisionId: tch?.classDivision?.id,  className: subject?.className?.className, division: tch?.classDivision?.division]
				i+=1
			}
		}
		return ret
	}
}