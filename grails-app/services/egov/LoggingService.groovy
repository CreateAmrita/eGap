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

import java.util.Date;

import java.util.Map;

class LoggingService {
	
    def serviceMethod() {

    }
	
	//Save the login details of a user in each login
	def saveUserLoginDetails(Map attributes) {
		UserLoginDetails userLoginInstance=null
		def loginTime = new Date()
		def sessionId = attributes.sessionId
		def ipAddr = attributes.ipAddr
		User user = User.get(attributes.userId.toInteger())
		//get the number of times the same user has logged in before, without logging out(with status E)
		def userLoginDetails = UserLoginDetails.findAllByUserAndStatusLike(user,"E%")
		if(userLoginDetails){
			//if the previous entries with 'E' exist, then change the status to 'L' for those rows and insert a new row for the current session.
			for(int i=0;i<userLoginDetails.size();i++){
				if(userLoginDetails[i].sessionId!=sessionId)
				{
					userLoginDetails[i].status='L'
					def logoutTime=new Date()
					Date date1 = userLoginDetails[i].loginTime
					Date date2 = logoutTime
					def duration =getTimeDuration(date1,date2)
					userLoginDetails[i].loginDuration=duration
				}
			}
			userLoginInstance = new UserLoginDetails(user : user , sessionId : sessionId , sessionCount :  null , loginTime : loginTime , loginDuration: 0 , loginIp : ipAddr , status : 'E')
			if( !userLoginInstance.save(flush:true)) {
				userLoginInstance.errors.each { 
					//println it 
				}
			}

		}
		// else save the new user entry into the UserLoginDetails table
		else{
			userLoginInstance = new UserLoginDetails(user : user , sessionId : sessionId , sessionCount : null   , loginTime : loginTime , loginDuration: 0 , loginIp : ipAddr , status : 'E')
			if( !userLoginInstance.save(flush:true)) {
				userLoginInstance.errors.each { 
					//println it 
				}
			}
		}

		//TO INCREMENT THE SESSIONCOUNT IN UserLoginDetails TABLE
		 def previousLogOutInstance = UserLoginDetails.createCriteria()
		 def userLogInstance = previousLogOutInstance.list{
			 maxResults(1)
			 and{
				 'eq'("user",user)
				 'ne'("sessionId" , sessionId)
			 }
			 order("sessionCount" , "desc")
		 }
		 
		 //for first time login
		 if(!userLogInstance) {
			 userLoginInstance.sessionCount = 1
		 }
		 
		 //for records other than first login
		 else{
			 //for records with sessioncount null
			 if(userLogInstance[0].sessionCount == null){
				 int countPreviousSessions = UserLoginDetails.countByUserAndSessionIdNotEqual(user , sessionId )
				 userLoginInstance.sessionCount=countPreviousSessions+1
			 }
			 //for records where sessioncount has a value
			 else
			 	userLoginInstance.sessionCount=userLogInstance[0].sessionCount+1
		 }
		 if( !userLoginInstance.save()) {
			 userLoginInstance.errors.each { 
				 //println it 
			 }
		 }
	}

	//to calculate the duration of a login
	def getTimeDuration(Date date1,Date date2){
		Calendar calendar1 = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();
		calendar1.setTime(date1);
		calendar2.setTime(date2);
		long milliseconds1 = calendar1.getTimeInMillis();
		long milliseconds2 = calendar2.getTimeInMillis();
		long diff = milliseconds2 - milliseconds1;
		float diffSeconds = diff / 1000;
		int diffSecondsRound=Math.round(diffSeconds)
		def duration =diffSecondsRound;
		return duration
	}
	
	//Save the details of a user into UserLoginDetails table while logging out. 
	def logoutAction(Map attributes){
		String sessionId = attributes.sessionId.toString()
		User user = User.get(attributes.userId.toInteger())
		UserLoginDetails userCurrentLoginDetails = UserLoginDetails.findByUserAndSessionIdAndStatusLike(user,sessionId,"E%")
		if(userCurrentLoginDetails){
			def logoutTime=new Date()
			Date date1 = userCurrentLoginDetails.loginTime
			Date date2 = logoutTime
			def duration =getTimeDuration(date1,date2)
			userCurrentLoginDetails.status = 'L'
			userCurrentLoginDetails.loginDuration = duration
			if(!userCurrentLoginDetails.save()){
				userCurrentLoginDetails.errors.each{ 
					//println it
				} 
			}
		}
	}
	
}