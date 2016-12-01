package me.rafaelvargas.intercambiamesta

import grails.transaction.Transactional

@Transactional
class EmailService {

	def emailService
	def grailsApplication
	
	private final String EXCHANGE_MAIL_PATH = '/email/exchange'
	private final String OPTIONS_MAIL_PATH = '/email/options'
	
	void sendMail(String fromAddress, List toAddress, String emailSubject, String emailBody) {
		try {
			emailService.sendMail {
				from fromAddress
				to toAddress.toArray()
				subject emailSubject
				html emailBody
			}
		}
		catch(Exception e) {
			log.error "Sendgrid está caido", e
		}
	}
	
	void sendMailWithTemplate(String fromAddress, String fromName, List toAddress, String emailSubject, String view, Map model) {
		try {
			emailService.sendMail {
				to toAddress.toArray()
				from "$fromName <$fromAddress>"
				subject emailSubject
				body( view: view, model: model)
			}
		}
		catch(Exception e) {
			log.error "Sendgrid está caido", e
		}
	}
	
	void sendExchangeMail(Exchange exchangeInstance, List users) {
		String emailSubject = "Detalles del intercambio '${exchangeInstance.name}'"
		String fromAddress = grailsApplication.config.from.mail
		String fromName = grailsApplication.config.from.name
		String domain = grailsApplication.config.domain
		
		Map model = [exchangeName: exchangeInstance.name,
					 exchangeTheme: exchangeInstance.theme,
					 exchangeDate: exchangeInstance.endDate.format("dd/MM/yyyy"),
					 exchangeLimit: exchangeInstance.limitAmount]
		
		users.each { userExchange ->
			model << [ userFrom: userExchange.userFrom.fullname,
					   exchangeId: exchangeInstance.id,
					   userTo: userExchange.userTo.fullname,
					   url: "$domain/exchange/$exchangeInstance.id/user/$userExchange.secret"  ]
			
			sendMailWithTemplate(fromAddress, fromName, [userExchange.userFrom.username], emailSubject, EXCHANGE_MAIL_PATH, model)
		}
	}
	
	void sendPreferencesMail(User userFrom, UserExchange userExchange, Exchange exchangeInstance) {
		String emailSubject = "Peticiones del intercambio '${exchangeInstance.name}'"
		String fromAddress = grailsApplication.config.from.mail
		String fromName = grailsApplication.config.from.name
		
		Map model = [ first: userExchange.firstOption,
					  second: userExchange.secondOption,
					  third: userExchange.thirdOption,
					  comments: userExchange.comments,
					  exchange: exchangeInstance.name,
					  userFrom: userFrom.fullname,
					  userTo: userExchange.userFrom.fullname ]

		sendMailWithTemplate(fromAddress, fromName, [userFrom.username], emailSubject, OPTIONS_MAIL_PATH, model)
	}
}
