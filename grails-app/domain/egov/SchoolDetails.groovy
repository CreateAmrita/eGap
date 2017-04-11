/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

import java.util.Date;

class SchoolDetails {

	AcademicYear academicYear
	School school
	String schoolLatitude
	String schoolLongitude
	String rlyName
	String rlyKm
	String plcName
	String plcKm
	String bankName
	String bankKm
	String arCampusAcres
	String arCampusSqMts
	String arPlGroundSqMts
	String buildArSqMts
	Integer noOfTeachers
	Integer noOfStudents10
	Integer noOfStudents9
	Integer noOfClassroom
	Integer noOfBuildings
	Integer ntts
	Integer prts
	Integer tgts
	Integer nurLkgUkgSecNo
	Integer oneToFiveSecNo
	Integer sixToEightSecNo
	Integer nineToTenSecNo
	Integer elevenTwelveSecNo
	String createdBy
	Date createdDate
	Date modifiedDate
	
    static constraints = {
		rlyName(nullable:true)
		rlyKm(nullable:true)
		plcName(nullable:true)
		plcKm(nullable:true)
		bankName(nullable:true)
		bankKm(nullable:true)
		noOfClassroom(nullable:true)
		noOfBuildings(nullable:true)
		ntts(nullable:true)
		prts(nullable:true)
		tgts(nullable:true)
		nurLkgUkgSecNo(nullable:true)
		oneToFiveSecNo(nullable:true)
		sixToEightSecNo(nullable:true)
		nineToTenSecNo(nullable:true)
		elevenTwelveSecNo(nullable:true)
	
    }
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
