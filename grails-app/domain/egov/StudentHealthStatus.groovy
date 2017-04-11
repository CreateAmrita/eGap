/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

import java.sql.Timestamp;

class StudentHealthStatus {

	
	User student
	School school
	Double weight
	Double height
	String vision
	String teeth
	String oralHygiene
	String specificAilment
	String createdBy
	Date createdDate
	Date modifiedDate
	Boolean isHandicapped
	
    static constraints = {
		student(nullable:false)
		school(nullable:false)
		weight(nullable:false)
		height(nullable:false)
		vision(nullable:false)
		createdBy(nullable:true)
		createdDate(nullable:true)
		modifiedDate(nullable:true)
		isHandicapped(nullable:true)
    }

	static mapping = {
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}

}