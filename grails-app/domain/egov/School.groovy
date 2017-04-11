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

class School {

	String schoolIdentifier		// School ID given by CBSE
	String schoolName
	Address address
	String afflNo				// Affiliation number of the school
	String schoolLvl 			// primary, upper primary/ high school/ higher secondary
	User principal				// id of the user assigned as the principal
	String website
	String faxNumber
	String emailId
	String schoolPhone
	SchoolGroup parentGroup		// id of the school group in SchoolGroup table to which the school belongs
	CbseZone zone
	ZoneRegion region
	RegionCluster cluster
	ClusterStateRel clusterState
	ClusterStateDistrictRel clusterDistrict
	StateDistrict district
	SchoolCategory schoolCategory
	SchoolMgmntType schoolMgmntType
	SchoolMedium medium
	SchoolLocationType locType
	Date yearEstablished
	Boolean inInternational
	String abbrName
	String defunct
	String registered
	String remark
	String status
	String createdBy
	Date createdDate
	Date modifiedDate
	RatingMaster rating

    static constraints = {
		schoolIdentifier(nullable:true)
		schoolName(nullable:true)
		address(nullable:true)
		afflNo(nullable:true)
		schoolLvl(nullable:true)
		principal(nullable:true)
		website(nullable:true)
		faxNumber(nullable:true)
		parentGroup(nullable:true)
		zone(nullable:false)
		region(nullable:false)
		cluster(nullable:false)
		clusterState(nullable:false)
		clusterDistrict(nullable:true)
		district(nullable:true)
		createdBy(nullable:true)
		status(nullable:false)
		rating(nullable:true)
		schoolCategory(nullable:true)
		schoolMgmntType(nullable:true)
		medium(nullable:true)
		locType(nullable:true)
		yearEstablished(nullable:true)
    }
	static mapping = {
		parentGroup column: "schl_grp_id"
		address column: "address_id"
		principal column:"principal_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
