package com.remainderapp.mainModule.userModule.userController;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class userController {
    @GetMapping("/index")
    public String welcomeUser()
    {
        return "welcome user to the application";
    }

}
