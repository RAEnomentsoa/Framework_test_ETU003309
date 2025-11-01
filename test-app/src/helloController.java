package app.controllers;

import core.annotation.Controller;
import core.annotation.Route;

@Controller
public class helloController {

    @Route("/hello")
    public String test(String path, String methodName) {
        return "<h1>Controller 2 Test</h1>"
                + "<p>URL: " + path + "</p>"
                + "<p>Method: " + methodName + "</p>";
    }

    @Route("/hello/ok")
    public String hello(String path, String methodName) {
        return "<h1>Hello Controller</h1>"
                + "<p>URL: " + path + "</p>"
                + "<p>Method: " + methodName + "</p>";
    }
}
