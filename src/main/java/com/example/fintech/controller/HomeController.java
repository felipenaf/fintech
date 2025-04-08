package com.example.fintech.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "<h1>Welcome to the Fintech App!</h1><p>You are logged in with Google OAuth2 ✅</p>";
    }

    @GetMapping("/login/oauth2/code/google")
    @ResponseBody
    public String codeGoogle(@RequestParam(required = false) String code,
                             @RequestParam Map<String, String> allParams) {
        return "<h1>Welcome to the Fintech App!</h1>"
                + "<p>Google OAuth2 code: " + code + "</p>"
                + "<p>All parameters: " + allParams + "</p>";
    }

    @GetMapping("/test")
    public String test() {
        return "<h1>Welcome to the Fintech App!</h1>" +
                "<p>You are logged in with Google OAuth2 ✅</p>" +
                "<p>Your token worked ✅</p>";
    }

}
