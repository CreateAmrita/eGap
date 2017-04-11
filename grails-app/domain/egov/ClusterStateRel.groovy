/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham. *
 *
 *
 */
package egov

import java.util.Date;

class ClusterStateRel {
	
	RegionCluster cluster
	State state
	String createdBy
	Date createdDate
	Date modifiedDate
	
	static constraints = {
		cluster(nullable:false)
		state(nullable:false)
	}
	
	static mapping = {
		cluster column : "cluster_id"
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
