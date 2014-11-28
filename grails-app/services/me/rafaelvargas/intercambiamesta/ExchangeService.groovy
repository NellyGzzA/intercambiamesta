package me.rafaelvargas.intercambiamesta

import grails.transaction.Transactional
import org.grails.mandrill.MandrillMessage
import org.grails.mandrill.MandrillRecipient
import org.grails.mandrill.MergeVar
import org.grails.mandrill.RecipientVars

@Transactional
class ExchangeService {
	
	def mandrillService
	
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
		List recipients = []
		List mergeVars = []
		List contents = [[name:"exchangeName", content:exchangeInstance.name],
						 [name:"exchangeTheme", content:exchangeInstance.theme],
						 [name:"exchangeDate", content:exchangeInstance.endDate.format("dd/MM/yyyy")],
						 [name:"exchangeLimit", content:exchangeInstance.limitAmount]]
		
		users.each{ userExchange ->
			recipients.add(new MandrillRecipient(name:userExchange.userFrom.fullname, email:userExchange.userFrom.username))
			mergeVars.add( new RecipientVars(rcpt:userExchange.userFrom.username, vars:[new MergeVar(name:"SECRET", content:userExchange.secret),
																					    new MergeVar(name:"USERTO", content:userExchange.userTo.fullname),
																						new MergeVar(name:"exchangeId", content:exchangeInstance.id)]) )
		}
		
		MandrillMessage message = new MandrillMessage(to:recipients, merge_vars:mergeVars, subject:"Detalles del intercambio '${exchangeInstance.name}'" )
		mandrillService.sendTemplate(message, "exchange", contents )
	}
	
	private void sendOptionsMail(UserExchange userExchange, Exchange exchangeInstance) {
		User userFrom = UserExchange.findByUserToAndExchange(userExchange.userFrom, exchangeInstance).userFrom
		List recipients = [ new MandrillRecipient(name:userFrom.fullname, email:userFrom.username) ]
		List mergeVars = [ new RecipientVars(rcpt:userFrom.username, vars:[ 
																						new MergeVar(name:"FIRST", content:userExchange.firstOption),
																						new MergeVar(name:"SECOND", content:userExchange.secondOption),
																						new MergeVar(name:"THIRD", content:userExchange.thirdOption),
																						new MergeVar(name:"COMMENTS", content:userExchange.comments),
																						new MergeVar(name:"EXCHANGE", content:exchangeInstance.name),
																						new MergeVar(name:"USERTO", content:userExchange.userFrom.fullname)]) ]
		MandrillMessage message = new MandrillMessage(to:recipients, merge_vars:mergeVars, subject:"Peticiones del intercambio '${exchangeInstance.name}'" )
		mandrillService.sendTemplate(message, "preferences", [] )
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
