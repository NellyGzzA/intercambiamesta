package me.rafaelvargas.intercambiamesta

import grails.transaction.Transactional

@Transactional
class ExchangeService {
	
	def emailService
	
	Exchange save(Exchange exchangeInstance) {
		exchangeInstance.save(flush:true)
	}
	
	void addUser(User userInstance, Exchange exchangeInstance) {
		new UserExchange(userFrom:userInstance,exchange:exchangeInstance).save(flush:true)
	}
	
	void removeUser(User userInstance, Exchange exchangeInstance) {
		UserExchange userExchange = UserExchange.findByUserFromAndExchange(userInstance,exchangeInstance)
		if(userExchange && !userExchange.userTo) {
			userExchange.delete(flush:true)
		}
	}
	
	void generate(List results, Exchange exchangeInstance) {
		List users = results.collect{ it.userFrom.id }
		List shuffle = users.clone()
		
		Collections.shuffle(shuffle, new Random())
		
		while(!validate(users,shuffle)) {
			Collections.shuffle(shuffle, new Random())
		}
		
		results.eachWithIndex{ userExchange, idx ->
			userExchange.userTo = User.load(shuffle[idx])
			userExchange.save(flush:true)
		}
		
		sendMails(exchangeInstance)
	}
	
	void sendMails(Exchange exchangeInstance) {
		List users = UserExchange.findAllByExchangeAndUserToIsNotNull(exchangeInstance)
		emailService.sendExchangeMail(exchangeInstance, users)
	}
	
	private void sendOptionsMail(UserExchange userExchange, Exchange exchangeInstance) {
		User userFrom = UserExchange.findByUserToAndExchange(userExchange.userFrom, exchangeInstance).userFrom
		emailService.sendPreferencesMail(userFrom, userExchange, exchangeInstance)
	}
	
	void saveUserExchange(UserExchange userExchange, Exchange exchangeInstance) {
		userExchange.save(flush:true)
		sendOptionsMail(userExchange, exchangeInstance)
	}
	
	private boolean validate(List original, List shuffle) {
		for ( i in 0..original.size()-1 ) {
			if(original[i] == shuffle[i]) {
				return false
			}
		}
		true
	}
}
