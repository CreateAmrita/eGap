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

class EgovSchoolDetails {
	School school
	Double schoolAfflNo
	String schoolName
	String zone
	String cluster
	String district
	String state
	String country
	String address1
	String address2
	Integer pincode
	Integer phoneNo
	Integer faxNo
	String emailId
	String website
	String rlyName
	Integer rlyKm
	String plcName
	Integer plcKm
	String bankName
	Integer bankKm
	String schlCat
	String schlMedium
	String schlType
	Integer arCampusAcres
	Integer arCampusSqMts
	Integer arPlGroundSqMts
	Integer buildArSqMts
	Integer siteDetails
	Integer totNoBooks
	Integer noClassroom
	Integer ntts
	Integer prts
	Integer tgts
	Integer yrFounded
	Integer sciLab
	Integer phyLab
	Integer cheLab
	Integer bioLab
	Integer compLab
	Integer homeScienceLab
	Integer smartClass
	String swmgPool
	String indoorGames
	String danceRm
	String music
	String gym
	String boysHostel
	String girlsHostel
	String healthMedCheckup
	String urinalsBoys
	String urinalsGirls
	Integer nurLkgUkgSecNo
	Integer oneToFiveSecNo
	Integer sixToEightSecNo
	Integer nineToTenSecNo
	Integer elevenTwelveSecNo
	Integer periodicalNo
	Integer dailyNo
	Integer refBookNo
	Integer magNo
	Integer rating
	Integer review
    static constraints = {	
		address2(nullable:true)
		pincode(nullable:true)
		phoneNo(nullable:true)
		faxNo(nullable:true)
		emailId(nullable:true)
		website(nullable:true)
		
    }
	static mapping = {
		
	}
	
}
