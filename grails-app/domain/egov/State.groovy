/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham. *
 *
 *
 */
package egov

import java.util.Date;

class State {
	Country country
	String stateName
	String createdBy
	Date createdDate
	Date modifiedDate
	String latitude
	String longitude
	
	static constraints = {
		stateName(nullable:false)
		latitude(nullable:true)
		longitude(nullable:true)
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
