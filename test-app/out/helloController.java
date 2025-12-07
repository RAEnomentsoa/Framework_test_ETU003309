package app.controllers;

import core.annotation.Controller;
import core.annotation.Route;

@Controller
public class helloController {

    @Route("/hello")
    public String test() {
        return "<h1>Controller 2 Test</h1>";
    }

    @Route("/hello/{valeur}")
    public String hello() {
        return "<h1>Hello Controller</h1>";
    }
}
