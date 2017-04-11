package egov

class BackupService {

    def serviceMethod() {

    }
	def sportsStatistics(Map params){
//		print "params: " + params
		def girlCount = 0 , boyCount = 0 , Female = [] , Male = [] , ret = [:]
		if(params.religion=="All"){
			def sportsStat = SportsStatistics.findAllByAcYr(params.acYr)
			if(sportsStat){
				sportsStat.athletics.each{sa->
					def totCount = sa.split(',')
					girlCount += totCount[0].toInteger()
					boyCount += totCount[1].toInteger()
				}
				Female.add(girlCount)
				Male.add(boyCount)
				girlCount = 0
				boyCount = 0
				sportsStat.football.each{fa->
					def totCount = fa.split(',')
					girlCount += totCount[0].toInteger()
					boyCount += totCount[1].toInteger()
				}
				Female.add(girlCount)
				Male.add(boyCount)
				girlCount = 0
				boyCount = 0
				sportsStat.basketball.each{ba->
					def totCount = ba.split(',')
					girlCount += totCount[0].toInteger()
					boyCount += totCount[1].toInteger()
				}
				Female.add(girlCount)
				Male.add(boyCount)
				girlCount = 0
				boyCount = 0
				sportsStat.volleyball.each{va->
					def totCount = va.split(',')
					girlCount += totCount[0].toInteger()
					boyCount += totCount[1].toInteger()
				}
				Female.add(girlCount)
				Male.add(boyCount)
				girlCount = 0
				boyCount = 0
				sportsStat.tennis.each{t->
					def totCount = t.split(',')
					girlCount += totCount[0].toInteger()
					boyCount += totCount[1].toInteger()
				}
				Female.add(girlCount)
				Male.add(boyCount)
				girlCount = 0
				boyCount = 0
			}
		}
		else{
			def sportsStat = SportsStatistics.findByAcYrAndReligion(params.acYr , params.religion)
			if(sportsStat){
				def aCount = sportsStat.athletics.split(',')
				Female.add(aCount[0])
				Male.add(aCount[1])
				def fCount = sportsStat.football.split(',')
				Female.add(fCount[0])
				Male.add(fCount[1])
				def bCount = sportsStat.basketball.split(',')
				Female.add(bCount[0])
				Male.add(bCount[1])
				def vCount = sportsStat.volleyball.split(',')
				Female.add(vCount[0])
				Male.add(vCount[1])
				def tCount = sportsStat.tennis.split(',')
				Female.add(tCount[0])
				Male.add(tCount[1])
			}
		}
		ret."Female" = Female
		ret."Male" = Male
		return ret
	}
}
