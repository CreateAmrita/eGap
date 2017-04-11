package egov

import java.security.MessageDigest
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap;
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.context.SecurityContextHolder as SCH
import egov.Role
import egov.User
import egov.UserDetails
import egov.UserRole

class UserService {

	static transactional = true
	def serviceMethod() {
	
	}
	
	Map getUserAttributes(def userId){
		def userInstance = User.get(userId)
		def parentStatus
		Map ret = [:]
		if(userInstance){
			def userDetails = UserDetails.find("from UserDetails as ud where ud.user.id=:user",[user: userInstance.id])
			def authority = UserRole.findAll("from UserRole as b where b.user.id=:user",[user: userInstance.id])
			StudentParentRel parent = StudentParentRel.findByStudent(userInstance)
			if(parent)
				parentStatus = "Yes"
			else
				parentStatus = "No"
			ret = [userInstance: userInstance,authority:authority.role, userDetails:userDetails , parentStatus : parentStatus]
		}
		return ret
	}

}
