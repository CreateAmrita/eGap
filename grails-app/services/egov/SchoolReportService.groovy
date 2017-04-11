package egov


import java.util.List;

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


class SchoolReportService {
	User user;
	AcademicYear acdYear;
	School school;
	boolean isSchoolManager;
	
	def getYear(year)
	{
		return AcademicYear.findByStartYear(year);
	}

	def getCurrentYear()
	{
		return AcademicYear.findByCurrent(1);
	}
	
	def setSchoolManager(userName)
	{
	   user=User.findByUsername(userName);
	   UserRole userRole=UserRole.findByUser(user);
	   if(userRole == null){
			isSchoolManager=false;
			return;
	   }
	   Role teacherRole=Role.find(userRole.role);
	   if(teacherRole.authority.equals("ROLE_SCHOOLS_MANAGER")){
		   isSchoolManager=true;
	   }
	   else{
		  isSchoolManager=false;
	   }
	}
	
	def getStatus(){
		return isSchoolManager;
	}
	
	def setBaseString(){
		def zoneMap=[:];
		def zones=CbseZone.withCriteria{
				resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
				projections {
					property("id","zoneId")
					property("zoneName","zoneName")
				}
			}
		zones.each {
			def zoneId=it.zoneId;
			def zoneName=it.zoneName;
			def regionMap=[:];
			def zoneRegion=ZoneRegion.withCriteria{
				resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
				eq("zone.id", zoneId)
				projections {
					property("id","regionId")
					property("regionName","regionName")
				}
			}
			zoneRegion.each {
				def regionId=it.regionId;
				def regionName=it.regionName;
				def clusterMap=[:];
				def regionCluster=RegionCluster.withCriteria {
					resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
					createAlias("zone","zones")
					createAlias("region","regions")
					and{
						eq("zones.id",zoneId)
						eq("regions.id",regionId)
					}
					projections {
						property("id","clusterId")
						property("clusterName","clusterName")
					}
				}
				regionCluster.each {
					def clusterName=it.clusterName;
					def clusterId=it.clusterId;
					def statesMap=[:];
					def clusterStateRel=ClusterStateRel.withCriteria {
						resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
						createAlias("state","states")
						createAlias("cluster","clusters")
						and{
							eq("clusters.id",clusterId)
						}
						projections {
							property("states.id","stateId")
							property("id","clusterStateId")
						}
					}
					clusterStateRel.each {
						def clusterStateId=it.clusterStateId;
						def stateId=it.stateId;
						def stateName=State.executeQuery("select  a.stateName from State a where a.id = :stateid",[stateid: stateId]);
						stateName=stateName[0];
						def districtsMap=[:];
						def districts=StateDistrict.withCriteria {
							resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
							createAlias("state","states")
							and{
								eq("states.id",stateId)
							}
							projections {
								property("districtName","districtName")
								property("id","districtId")
							}
						}
						districts.each {
							def districtName=it.districtName;
							def districtId=it.districtId;
							districtsMap.put(districtName, ["districtId":districtId,"schools":null]);
														
						}
						statesMap.put(stateName,["districts":districtsMap,"clusterStateId":clusterStateId]);
					}
					clusterMap.put(clusterName, ["states":statesMap,"clusterId":clusterId]);
				}
				regionMap.put(regionName, ["clusters":clusterMap,"regionId":regionId]);
			}
			zoneMap.put(zoneName,["regions":regionMap,"zoneId":zoneId]);
		}
		return ["schoolsData":["zones":zoneMap]] as JSON;
	}
	
	def getSchools(zoneId,regionId,clusterId,clusterStateId,districtId){
		def schoolsMap=[:];
		def schools=School.withCriteria {
			resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
			createAlias("zone","cbseZone")
			createAlias("region","zoneRegion")
			createAlias("cluster","regionCluster")
			createAlias("clusterState","clusterStateRel")
		//	createAlias("clusterDistrict","clusterStateDistrictRel")
			createAlias("district","districts")
			
			and{
				eq("cbseZone.id",zoneId)
				eq("zoneRegion.id",regionId)
				eq("regionCluster.id",clusterId)
				eq("clusterStateRel.id",clusterStateId)
		//		eq("clusterDistrict.id",clSDRId)
				eq("districts.id",districtId)
			}
			projections {
				property("schoolName","schoolName")
				property("id","schoolId")
			}
		}
		
		def years=AcademicYear.list(max: 10, sort: "startYear", order: "desc")
		schools.each {
			def schoolName=it.schoolName;
			def schoolId=it.schoolId;
			def yearMap=[:]
			years.each {
				yearMap.put(it.startYear, ["classes":null]);
			}
			schoolsMap.put(schoolId,["schoolName":schoolName,"acadHistory":yearMap]);
		}
		if(schoolsMap.isEmpty())
			return null;
		return schoolsMap as JSON;
	}
	
	
	def getSchoolData(schoolId,year){
		def classMap=[:];
		def classes=SchoolClassRel.withCriteria {
			resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
			createAlias("school","schools")
			createAlias("academicYr","years")
			createAlias("className","classes")
			and{
				eq("schools.id",schoolId);
				eq("years.startYear",year);
			}
			projections{
				property("classes.id","classId")
				property("classes.className","className")
				property("id","schoolClassRelId")
			}
			order("classVal","asc");
		}
		classes.each {
			def divMap=[:];
			String className=it.className;
			if(className.equalsIgnoreCase("x") || className.equalsIgnoreCase("XII") || className.equalsIgnoreCase("10") || className.equalsIgnoreCase("12") || className.equalsIgnoreCase("tenth") || className.equalsIgnoreCase("twelth") || className.equalsIgnoreCase("10th") || className.equalsIgnoreCase("12th"))
			{
				def classId=it.classId;
				def schoolClassRelId=it.schoolClassRelId;
				
				def divisions=SchoolClassDivision.withCriteria {
					resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
					createAlias("schoolClass","schClass")
					and{
						eq("schClass.id",schoolClassRelId);
					}
					projections{
						property("division","divisionName")
						property("id","divId")
					}
					order("division","asc")
				}
				divisions.each {
					def subjectMap=[:];
					def divisionName=it.divisionName;
					def divId=it.divId;
					def subjects=SchoolSubjectRel.withCriteria {
						resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
						createAlias("schoolClass","schClass")
						createAlias("subjectMaster","subjects")
						
						and{
							eq("schClass.id",schoolClassRelId);
						}
						projections{
							property("subjects.id","subjectId")
							property("subjects.subject","subjectName")
						}
						order("subjects.subject","asc")
					}
					subjects.each {
						def subId=it.subjectId;
						def subjectName=it.subjectName;
						
						
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
							createAlias("academicYr","years")
							and{
								eq("years.startYear",year)
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
									  createAlias("academicYr","years")
									  and{
										  eq("student.id",studentId)
										  eq("sub.id",subId)
										  eq("years.startYear",year)
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
								createAlias("academicYr","years")
								resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
								and{
									eq("student.id",studentId)
									eq("sub.id",subId)
									eq("years.startYear",year)
								}
								projections {
									property("assessmentName", "assessmentName")
									property("percentage", "percentage")
								}
							}
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
								createAlias("academicYr","years")
								resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
								and{
									eq("student.id",studentId)
									eq("sub.id",subId)
									eq("years.startYear",year)
								}
								projections {
									property("assessmentName", "assessmentName")
									property("percentage", "percentage")
								}
							}
							
								
								studentSaScore.each {scores->
												
										if(scores.assessmentName.equals("SA1"))
												sa1Marks=scores.percentage;
										if(scores.assessmentName.equals("SA2"))
												sa2Marks=scores.percentage;
										
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
					
								
						//		def terms=[:];
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
						//			 terms.put("Term1",["FA1":fa1Marks,"FA2":fa2Marks,"SA1":sa1Marks]);
						//			 terms.put("Term2",["FA3":fa3Marks,"FA4":fa4Marks,"SA2":sa2Marks]);
						//			 terms.put("avgs",["FA":faAvg,"SA":saAvg]);
						//			 terms.put("studentName",name);
								
									 //Adding students to studentMarks map
								studentsMarks.put(studentId,["Term1":["FA1":fa1Marks,"FA2":fa2Marks,"SA1":sa1Marks],"Term2":["FA3":fa3Marks,"FA4":fa4Marks,"SA2":sa2Marks],"avgs":["FA":faAvg,"SA":saAvg],"studentName":name]);
							}// student iterator ends here
							if(studentCount!=0){
								avgFa1=((double)avgFa1/(double)studentCount);
								avgFa2=((double)avgFa2/(double)studentCount);
								avgFa3=((double)avgFa3/(double)studentCount);
								avgFa4=((double)avgFa4/(double)studentCount);
								avgSa1=((double)avgSa1/(double)studentCount);
								avgSa2=((double)avgSa2/(double)studentCount);
							}
							if(studentsMarks.isEmpty())
								subjectMap.put(subjectName,["students":null,"avgs":["Term1":["FA1":avgFa1,"FA2":avgFa2,"SA1":avgSa1],"Term2":["FA3":avgFa3,"FA4":avgFa4,"SA2":avgSa2]],"divId":divId,"totalStudent":studentCount,"subId":subId]);
							else
							subjectMap.put(subjectName,["students":studentsMarks,"avgs":["Term1":["FA1":avgFa1,"FA2":avgFa2,"SA1":avgSa1],"Term2":["FA3":avgFa3,"FA4":avgFa4,"SA2":avgSa2]],"divId":divId,"totalStudent":studentCount,"subId":subId]);
					}// subjects iterator ends here
					if(subjectMap.isEmpty())
						divMap.put(divisionName,["subjects":null,"divId":divId]);
					else
						divMap.put(divisionName,["subjects":subjectMap,"divId":divId]);
				}//divisions iterator ends here
				if(divMap.isEmpty())
					classMap.put(className, ["divisions":null,"classId":classId]);
				else
					classMap.put(className, ["divisions":divMap,"classId":classId]);
			}
		}
		if(classMap.isEmpty())
		return null;
		return classMap as JSON;
	}
	
	
		
}
