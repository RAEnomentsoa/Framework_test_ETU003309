package app.controllers;

import core.annotation.Controller;
import core.annotation.Route;

@Controller
public class helloController {

    @Route("/hello")
    public String test() {
        return "<h1>Controller 2 Test</h1>";
    }

    @Route("/hello/test")
    public String hello(int id) {
        return "<h1>Hello Controller</h1>"
                + "<p>ID: " + id + "</p>";
    }
}
