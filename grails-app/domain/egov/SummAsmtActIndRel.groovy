/**
 *
 *
 * @Author: AmritaCREATE, Amrita University
    www. amrita.edu/create.
 *
 *
 *
 */
package egov

class SummAsmtActIndRel {

    SummAsmntActivityClsRel activity
	String indicatorMarks
    static constraints = {
		activity(nullable:false)
		indicatorMarks(nullable:false)
    }
}
