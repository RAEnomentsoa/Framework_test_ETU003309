package app.controllers;

import core.annotation.Controller;
import core.annotation.Route;
import core.annotation.RequestParam;
import core .Session;

@Controller
public class helloController {

    @Route("/hello")
    public String test() {
        return "<h1>Controller 2 Test</h1>";
    }

    @Route("/hello/test")
    public String hello(@RequestParam("x") int id,Session session) {
        // url testana hoe mande ex:
        // http://localhost:8080/framework_test/hello/test?x=11 -> id=11 vao mety
        return "<h1>Hello Controller</h1>"
                + "<p>ID: " + id + "</p>";
    }

    @Route("/hello/test2/{id}") // {id} azo avy ato ilay id
    public String test2(int id,Session session) {
        // url testana hoe mande ex:
        // http://localhost:8080/framework_test/hello/test?id=11 -> x=11 vao mety
        return "<h1>Hello Controller</h1>"
                + "<p>ID: " + id + "</p>";
    }
}
