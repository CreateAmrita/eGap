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

class AssessmentTypes {

	String assessmentType 		//Formative or SUmmative
	String status				//A or D
	String createdBy
	Date createdDate
	Date modifiedDate

    static constraints = {
		assessmentType(nullable:false)
	
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
