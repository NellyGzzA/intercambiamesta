class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?"{
            constraints {
                // apply constraints here
            }
        }
		
		"/exchange/$id/user/$secret"(controller: "exchange", action: "showOptions")
		
		"/register"(controller: "user", action: "register")
        "/"(controller:"home")
        "500"(view:'/error')
	}
}
