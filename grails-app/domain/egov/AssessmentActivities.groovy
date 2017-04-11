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

class AssessmentActivities {

	String activityName
	String activityType 		// default for default activities given by cbse, self for created by teachers/schoolAdmins
	AssessmentTypes assmntType
	String createdBy
	Date createdDate
	Date modifiedDate

    static constraints = {
		activityName(nullable:false)
    }
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
