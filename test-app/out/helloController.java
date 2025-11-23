package app.controllers;

import core.annotation.Controller;
import core.annotation.Route;

@Controller
public class helloController {

    @Route("/hello")
    public String test(String path, String methodName, String ControllerName, String returnTypeName) {
        return "<h1>Controller 2 Test</h1>"
                + "<p>URL: " + path + "</p>"
                + "<p>Method: " + methodName + "</p>"
                + "<p>Controller: " + ControllerName + "</p>"
                + "<p>Return Type: " + returnTypeName + "</p>";
    }

    @Route("/hello/ok")
    public String hello(String path, String methodName, String ControllerName) {
        return "<h1>Hello Controller</h1>"
                + "<p>URL: " + path + "</p>"
                + "<p>Method: " + methodName + "</p>"
                + "<p>Controller: " + ControllerName + "</p>";
    }
}
