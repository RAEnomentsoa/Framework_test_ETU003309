package app.controllers;

import core.annotation.Controller;
import core.annotation.Route;

@Controller
public class TestController {

    @Route("/test")
    public void test(String path, String methodName, String ControllerName, String returnTypeName) {
        // return "<h1>Controller Test</h1>"
        // + "<p>URL: " + path + "</p>"
        // + "<p>Method: " + methodName + "</p>"
        // + "<p>Controller: " + ControllerName + "</p>"
        // + "<p>Return Type: " + returnTypeName + "</p>";
    }

    @Route("/test/hello")
    public String hello(String path, String methodName, String ControllerName) {
        return "<h1>Hello Controller</h1>"
                + "<p>URL: " + path + "</p>"
                + "<p>Method: " + methodName + "</p>"
                + "<p>Controller: " + ControllerName + "</p>";
    }
}
