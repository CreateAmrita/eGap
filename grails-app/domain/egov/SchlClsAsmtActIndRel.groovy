/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

class SchlClsAsmtActIndRel {
	SchlAsmntActivityClsRel activity
	String indicatorMarks
    static constraints = {
		activity(nullable:false)
		indicatorMarks(nullable:false)
    }
}
