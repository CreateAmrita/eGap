/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

class AcademicTerms {
	AcademicYear academicYear
	String term
       static constraints = {
		academicYear(nullable:false)
		term(nullable:false)
    }
	
	static mapping = {
		academicYear column: "academic_year_id"
	}
}
