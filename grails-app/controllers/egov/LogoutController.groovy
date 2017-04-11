
package egov

import egov.LoggingService;

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import grails.plugins.springsecurity.Secured

class LogoutController {
	LoggingService ls = new LoggingService()

	/**
	 * Index action. Redirects to the Spring security logout uri.
	 */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def index = {
		Map argmt = [userId : session.user_Id , sessionId : session.id]
		def logOut = ls.logoutAction(argmt)
		redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/j_spring_security_logout'
	}
}
