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

class SchoolFacility implements Serializable {
	AcademicYear academicYear
	School school
	FacilityMaster facility
	String facilityName
	String dimension
	Integer noOfTables
	Integer noOfChairs
	String equipments
	String remarks
	String createdBy
	Date createdDate
	Date modifiedDate
		

	static constraints = {
		facility(nullable:false)
		school(nullable:false)
		createdBy(nullable:true)
		dimension(nullable:true)
		noOfTables(nullable:true)
		noOfChairs(nullable:true)
		equipments(size:0..2147483646,nullable:true)
		remarks(size:0..2147483646,nullable:true)
	}
	
	static mapping = {
		id composite: ['facility', 'school']
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
