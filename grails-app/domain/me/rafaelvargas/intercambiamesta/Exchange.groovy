package me.rafaelvargas.intercambiamesta

import org.grails.databinding.BindingFormat

class Exchange {
	
	String name
	String theme
	
	@BindingFormat('dd/MM/yyyy')
	Date endDate
	
	User user
	Date dateCreated
	Date lastUpdated
	Integer limitAmount
	
	static transients = ['users']
	
	static constraints = {
		name blank: false, maxSize: 100
		name blank: false, maxSize: 100
		endDate validator: { val, obj -> if(val < ((obj?.dateCreated?.clone()?:new Date())+1).clearTime()) ['min.notmet', val, val] }
		limitAmount min:0
	}
	
	List getUsers() { UserExchange.findAllByExchange(this) }
}
