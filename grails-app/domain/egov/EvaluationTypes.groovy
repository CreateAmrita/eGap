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

class EvaluationTypes {

	String evaluationType			//Co-Scholastic or Scholastic
	//AcademicYear academicYear
	String status					//A for active and D for deleted
	String createdBy
	Date createdDate
	Date modifiedDate

    static constraints = {
		//academicYear(nullable:false)
		evaluationType(nullable:false)
    }
	
	static mapping = {
		academicYear column: "academic_year_id"
	}

	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
