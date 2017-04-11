package egov

import egov.AcademicYear;
import grails.converters.JSON
import egov.Role
import egov.School;
import egov.UserDetails
import egov.UserRole
import egov.User
import egov.SchoolClassRel
import egov.SchoolSubjectRel
import egov.SchoolClassDivision
import egov.StudentClassRel
import egov.StudentOptionalSubject
import egov.StudentFaScore
import egov.StudentSaScore

class ClassReportService {

    User user;
	AcademicYear acdYear;
	School school;
	boolean isSchoolManager;
	
	def getCurrentYear()
	{
		return AcademicYear.findByCurrent(1);
	}
	
	def setSchoolManager(userName)
	{
	   user=User.findByUsername(userName);
	   UserRole userRole=UserRole.findByUser(user);
	   if(userRole == null)
	   {
			   isSchoolManager=false;
			return;
	   }
	   Role teacherRole=Role.find(userRole.role);
	   if(teacherRole.authority.equals("ROLE_SCHOOLS_MANAGER"))
	   {
		   isSchoolManager=true;
	   }
	   else
	   {
		  isSchoolManager=false;
	   }
	}
	def setSchool(){
		school=School.get(user.school.id)
	}
	
	def getClasses(year){     //optionally added this method
		List classList=[]
		def classes=SchoolClassRel.findAllBySchoolAndAcademicYr(school,acdYear)
		classes.each {
			classList.add(it)
		}
	  return classList
	}
	
	def getClassHistory(year){
		List classList=[]
		def subjects
		def divisions
		def std
		def studentOptionalSubject
		def studentList=[]
		Map subjectDetails=[:]
		Map studentsMarks=[:]
		Map divisionDetails=[:]
		Map classDetails=[:]
		Map yearDetails=[:]
		classList=getClasses(year)
		classList.each {it->
			divisionDetails=[:]
			subjects=SchoolSubjectRel.findAllBySchoolClass(it)
			divisions=SchoolClassDivision.findAllBySchoolClass(it)
			divisions.each {division->
				subjectDetails=[:]
				subjects.each{subject->
					subjectDetails.put(subject.subjectMaster.subject, ["subjectId":subject.subjectMaster.id, "students":null])
				}
				divisionDetails.put(division.division, ["subjects": subjectDetails,"divisionId":division.id])
			}
			classDetails.put(it.className.className, ["divisions": divisionDetails,"classId":it.className.id])
		}
		
		yearDetails.put(year.startYear,["classes":classDetails])
		return yearDetails
	  }
	def appendData(acdYear,classVal,division,user_name){
		setSchoolManager(user_name)
		setSchool()
		def studentList=[]
		def studentsMarks=[:]
		def subjectDetails=[:]
		def std,studentOptionalSubject
		AcademicYear year=AcademicYear.findByStartYear(acdYear)
		def classObj= SchoolClassRel.findBySchoolAndAcademicYrAndClassVal(school,year,classVal)
		def divisions=SchoolClassDivision.findBySchoolClassAndDivision(classObj,division)
		def subjects=SchoolSubjectRel.findAllBySchoolClass(classObj)
		subjects.each{subject->
			studentList=[]
			std=StudentClassRel.where{
				academicYr==year &&
				school==school &&
				classDivision==divisions
			}.list()
			
			def flag=0;
			std.each{student->
				studentOptionalSubject =StudentOptionalSubject.findByStudentAndSubjectAndAcademicYr(student.student,subject.subjectMaster,year)
				if(studentOptionalSubject!=null){
					flag=1;
					studentList.add(studentOptionalSubject.student)
			}
		}
			  if(flag==0){
					std.each{student->
						studentList.add(student.student)
					}
				}
			  int studentCount=0;
			  def studentFaScore
			  def studentSaScore
			  def avgFa1=0.00;
			  def avgFa2=0.00;
			  def avgFa3=0.00;
			  def avgFa4=0.00;
			  def avgSa1=0.00;
			  def avgSa2=0.00;
			  Map avgs=[:];
			  studentsMarks=[:]
			
			  studentList.each{students->
				  def terms=[:];
						  studentCount++;
						  def fa1Marks=null;
						  def fa2Marks=null;
						  def fa3Marks=null;
						  def fa4Marks=null;
						  def sa1Marks=null;
						  def sa2Marks=null;
						  studentFaScore=StudentFaScore.where {
							  student==students &&
							  academicYr==year  &&
							  subject==subject.subjectMaster
						  }.list()
						  studentFaScore.each {scores->
							  
								  if(scores.assessmentName.equals("FA1"))
										  fa1Marks=scores.percentage;
								  if(scores.assessmentName.equals("FA2"))
										  fa2Marks=scores.percentage;
								  if(scores.assessmentName.equals("FA3"))
										  fa3Marks=scores.percentage;
								  if(scores.assessmentName.equals("FA4"))
										  fa4Marks=scores.percentage;
						  }
						  if(fa1Marks!=null)
						  avgFa1+=fa1Marks.toDouble();
					  if(fa2Marks!=null)
						  avgFa2+=fa2Marks.toDouble();
					  if(fa3Marks!=null)
						  avgFa3+=fa3Marks.toDouble();
					  if(fa4Marks!=null)
						  avgFa4+=fa2Marks.toDouble();
					  
					  
					  //SA Score
					  studentSaScore=StudentSaScore.where { student==students && academicYr==year && subject==subject.subjectMaster}.list();
					  
					  
					  studentSaScore.each {scores->
									  
							  if(scores.assessmentName.equals("SA1"))
									  sa1Marks=scores.percentage;
							  if(scores.assessmentName.equals("SA2"))
									  sa2Marks=scores.percentage;
							  
					  }
					  if(sa1Marks!=null)
					  avgSa1+=sa1Marks.toDouble();
				  if(sa2Marks!=null)
					  avgSa2+=sa2Marks.toDouble();
				  def faAvg;
				  def saAvg;
				  if(fa1Marks!=null && fa2Marks!=null && fa3Marks!=null && fa4Marks!=null)
						  faAvg=(fa1Marks.toDouble()+fa2Marks.toDouble()+fa3Marks.toDouble()+fa4Marks.toDouble())/4.0;
				  else if(fa1Marks!=null && fa2Marks!=null && fa3Marks!=null && fa4Marks==null)
						  faAvg=(fa1Marks.toDouble()+fa2Marks.toDouble()+fa3Marks.toDouble())/3.0;
				  else if(fa1Marks!=null && fa2Marks!=null && fa3Marks==null && fa4Marks==null)
						  faAvg=(fa1Marks.toDouble()+fa2Marks.toDouble())/2.0;
				  else if(fa1Marks!=null && fa2Marks==null && fa3Marks==null && fa4Marks==null)
						  faAvg=fa1Marks.toDouble();
						  
				  if(sa1Marks!=null && sa2Marks!=null)
						  saAvg=(sa1Marks.toDouble()+sa2Marks.toDouble())/2.0;
				  else if(sa1Marks!=null && sa2Marks==null)
						  saAvg=sa1Marks.toDouble();
				  
					   terms.put("Term1",["FA1":fa1Marks,"FA2":fa2Marks,"SA1":sa1Marks]);
					   terms.put("Term2",["FA3":fa3Marks,"FA4":fa4Marks,"SA2":sa2Marks]);
					   terms.put("Averages",["FA":faAvg,"SA":saAvg]);
					   
				  studentsMarks.put(students.id,terms);
				  
	}
			  if(studentCount!=0){
				  avgFa1=((double)avgFa1/(double)studentCount);
				  avgFa2=((double)avgFa2/(double)studentCount);
				  avgFa3=((double)avgFa3/(double)studentCount);
				  avgFa4=((double)avgFa4/(double)studentCount);
				  avgSa1=((double)avgSa1/(double)studentCount);
				  avgSa2=((double)avgSa2/(double)studentCount);
				  avgs.put("Term1",["FA1":avgFa1,"FA2":avgFa2,"SA1":avgSa1]);
				  avgs.put("Term2",["FA3":avgFa3,"FA4":avgFa4,"SA2":avgSa2]);
			  }
			  else
			  {
				  avgs.put("Term1",["FA1":0,"FA2":0,"SA1":0]);
				  avgs.put("Term2",["FA3":0,"FA4":0,"SA2":0]);
			  }
	
	  subjectDetails.put(subject.subjectMaster.subject, ["students": studentsMarks,"no of students": studentCount,"subjectId":subject.subjectMaster.id,"avgs":avgs])
	
	  }
		return subjectDetails as JSON
	}
	

	def getClassDetails(userName){
		Map classDetails=[:]
		setSchoolManager(userName)
		setSchool()
		acdYear=getCurrentYear()
		UserDetails userDetails=UserDetails.findByUser(user)
		
		classDetails= [(userName) :[personalDetails :[name :userDetails.firstName,sex :userDetails.gender],currentYear :acdYear.startYear,
			schoolInfo :[name :school.schoolName,id :school.schoolIdentifier],
			acadHistory :getClassHistory(acdYear)]]
		return classDetails as JSON
	}
	
}
