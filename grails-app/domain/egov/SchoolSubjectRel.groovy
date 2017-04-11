/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

class SchoolSubjectRel {

   	SubjectMaster subjectMaster		// id of the subject in SubjectMaster table
	SchoolClassRel schoolClass		// id of the school class in SchoolClassRel table
	String subType
	String status 					// A/F Active or Frozen
	Date createdDate
	Date modifiedDate
	 
    static constraints = {
		schoolClass(nullable:false)
		subjectMaster(nullable:false)
    }
	
	static mapping = {
		subjectMaster column: "subj_master_id"
		schoolClass column:"schl_cls_rel_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
