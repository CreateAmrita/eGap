/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

class ClassMaster {

	String className
	String classRoman
	String classWords
	String createdBy
	Date createdDate
	Date modifiedDate
	
    static constraints = {
		className(nullable:false)
    }
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
