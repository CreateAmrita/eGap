/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham. *
 *
 *
 */
package egov

import java.util.Date;

class RegionCluster {
	
	CbseZone zone
	ZoneRegion region
	String clusterName
	String createdBy
	Date createdDate
	Date modifiedDate
	
	static constraints = {
		zone(nullable:false)
		region(nullable:false)
		clusterName(nullable:false)
	}
	
	static mapping = {
		zone column : "zone_id"
		region column : "region_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}

    
}
