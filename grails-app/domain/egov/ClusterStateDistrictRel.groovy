/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham. *
 *
 *
 */
package egov

import java.util.Date;

class ClusterStateDistrictRel {
	
	ClusterStateRel clusterStateRel
	StateDistrict district
	String createdBy
	Date createdDate
	Date modifiedDate
	
	static constraints = {
		clusterStateRel(nullable:false)
		district(nullable:false)
	}
	
	static mapping = {
		clusterStateRel column : "cluster_state_rel_id"
		district column : "district_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}

  }
