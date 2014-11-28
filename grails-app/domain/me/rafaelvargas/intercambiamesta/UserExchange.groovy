package me.rafaelvargas.intercambiamesta

import org.apache.commons.lang.RandomStringUtils

class UserExchange {
	
	User userTo
	User userFrom
	Exchange exchange
	String firstOption
	String secondOption
	String thirdOption
	String secret = RandomStringUtils.randomAlphanumeric(50)
	String comments
	
	static constraints = {
		userTo nullable:true
		firstOption nullable:true, blank:true, maxSize: 100
		secondOption nullable:true, blank:true, maxSize: 100
		thirdOption nullable:true, blank:true, maxSize: 100
		secret nullable:true, blank:true, maxSize: 100
		comments nullable:true, blank:true, maxSize:1000
		userFrom unique: 'exchange'
	}
}
