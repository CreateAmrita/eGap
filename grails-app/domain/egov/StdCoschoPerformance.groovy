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

class StdCoschoPerformance {

	String indicatorList					// ids of the indicators in PartSubpartIndicatorRel table with type IND
	StudentCoschoScore coschoScore			// id of the StudentCoschoScore table
	String createdBy	
	Date createdDate
	Date modifiedDate

    static constraints = {
		indicatorList(nullable:false)
		coschoScore(nullable:false)
    }
	
	static mapping = {
		coschoScore column: "std_coscho_score_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
