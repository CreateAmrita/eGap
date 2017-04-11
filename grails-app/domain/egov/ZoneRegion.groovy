/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham. *

 *
 *
 */
package egov

import java.util.Date;

class ZoneRegion {
	
	CbseZone zone
	String regionName
	BigDecimal latitude
	BigDecimal longitude
	String createdBy
	Date createdDate
	Date modifiedDate
	
	static constraints = {
		zone(nullable:false)
		regionName(nullable:false)
		latitude(nullable:true)
		longitude(nullable:true)
	}
	
	static mapping = {
		zone column : "zone_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}

}
