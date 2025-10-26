package app.controllers;

import core.annotation.Controller;
import core.annotation.Route;

@Controller
public class TestController {

    @Route("/test")
    public String test(String path, String methodName) {
        return "<h1>Controller Test</h1>"
                + "<p>URL: " + path + "</p>"
                + "<p>Method: " + methodName + "</p>";
    }

    @Route("/test/hello")
    public String hello(String path, String methodName) {
        return "<h1>Hello Controller</h1>"
                + "<p>URL: " + path + "</p>"
                + "<p>Method: " + methodName + "</p>";
    }
}
