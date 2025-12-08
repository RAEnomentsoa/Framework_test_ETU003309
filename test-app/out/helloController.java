package app.controllers;

import core.annotation.Controller;
import core.annotation.Route;
import core.annotation.RequestParam;

@Controller
public class helloController {

    @Route("/hello")
    public String test() {
        return "<h1>Controller 2 Test</h1>";
    }

    @Route("/hello/test")
    public String hello(@RequestParam("x") int id) {
        // url testana hoe mande ex:
        // http://localhost:8080/framework_test/hello/test?id=11 afaka atao koa x=11
        return "<h1>Hello Controller</h1>"
                + "<p>ID: " + id + "</p>";
    }
}
