/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham. *
 *
 *
 */
package egov

import java.util.Date;

class StateDistrict {
	State state
	String districtName
	String createdBy
	Date createdDate
	Date modifiedDate
	
	static constraints = {
		state(nullable:false)
		districtName(nullable:false)
	}
	
	static mapping = {
		state column : "state_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}

}
