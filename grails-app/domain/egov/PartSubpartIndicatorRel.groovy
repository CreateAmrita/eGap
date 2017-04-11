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

class PartSubpartIndicatorRel {
	
	Integer typeId
	EvaluationTypes evaluationType	// Co-Scholastic or Scholastic
	String name
	String type
	String status   				//A for active, D if deleted
	Boolean defaultVal 				//true if system indicators, false if created by a user who is not CCEAdmin
	School school
	AssessmentActivities activity	// activity of FA
	Integer marks					// for indicators under co-scholastic 
	String createdBy
	Date createdDate
	Date modifiedDate

    static constraints = {
		evaluationType(nullable:false)
		typeId(nullable:false)
		name(nullable:false)
		type(nullable:false)
		activity(nullable:true)
		marks(nullable:true)
		school(nullable:true)
    }
	
	static mapping = {
		evaluationType column: "eval_type_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
