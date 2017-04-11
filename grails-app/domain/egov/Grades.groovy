/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

class Grades {
	EvaluationTypes evalType 	// Co-scholastic or Scholastic 
	Integer classId
	Double minVal
	Double maxVal
	String grade
	Double gradePoint
    
	static constraints = {
		evalType(nullable:false)
		classId(nullable:false)
		minVal(nullable:false)
		maxVal(nullable:false)
		grade(nullable:false)
		gradePoint(nullable:true)
	
	}
	
	static mapping = {
		evalType column: "eval_type_id"
		classId column: "class_id"
	}
}
