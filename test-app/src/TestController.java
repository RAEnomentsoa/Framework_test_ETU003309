package app.controllers;

import core.annotation.Controller;
import core.annotation.Route;
import core.ModelView;

@Controller
public class TestController {

    @Route("/test")
    public ModelView test() {
        // test method returning a view
        ModelView mv = new ModelView("testView.jsp");
        String[] items = { "Item 1", "Item 2", "Item 3" };
        mv.addItem("items", items);
        mv.addItem("message", "This is a test message from TestController.");
        return mv;

    }

    @Route("/test/hello")
    public String hello() {
        return "<h1>Hello Controller</h1>";
    }

}
