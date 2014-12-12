class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?"{
            constraints {
                // apply constraints here
            }
        }
		
		"/exchange/$id/user/$secret"(controller: "exchange", action: "showOptions")
		
		"/register"(controller: "user", action: "register")
		"/humans.txt"(view:'/humans')
        "/"(controller:"home")
        "500"(view:'/error')
	}
}
