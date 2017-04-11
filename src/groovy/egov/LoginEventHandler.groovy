/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent
import org.springframework.web.context.request.RequestContextHolder as RCH
import org.springframework.web.context.request.RequestContextListener
import org.springframework.web.context.ContextLoaderListener
import egov.LoggingService
class LoginEventHandler implements ApplicationListener<InteractiveAuthenticationSuccessEvent>  {
	LoggingService ls = new LoggingService()
	void onApplicationEvent(InteractiveAuthenticationSuccessEvent event) {
		//Get httpSession
		def session = RCH.currentRequestAttributes().session
		def request = RCH.currentRequestAttributes().request
		def userDetails = null
		User.withTransaction{ status ->
			 userDetails = egov.User.get(event.authentication.principal.id)
			 if (userDetails) {
				 UserDetails ud = UserDetails.findByUser(userDetails)
				 def sessionName
				 if( ud.lastname=="null"){
					 sessionName= ud.firstName
				 }
				 else{
					 sessionName= ud.firstName+" " + ud.lastname
					 }
				 session.user = userDetails
				 session.name = sessionName
				 session.teacher_Id = userDetails.id
				 session.academicYr_Id = AcademicYear.findByCurrent(true)?.id
				 session.userName = userDetails.username
				 session.user_Id = userDetails.id // Have to convert all teacher_id to userId. Has to be consistent across the application
				 session.school_Id = (userDetails.school) ? userDetails.school?.id:0
				 School school = School.get(session.school_Id.toInteger())
				 session.schoolName = school.schoolName
				 session.ipAddr =  request.getRemoteAddr()
				 Map argmt = [userId:session.user_Id , sessionId : session.id , ipAddr : session.ipAddr]
				 def log= ls.saveUserLoginDetails(argmt)
			 }
		}
	}
}
