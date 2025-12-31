package app.controllers;

import core.annotation.Controller;
import core.annotation.Route;
import app.models.UserForm;

import java.util.Map;

import core.ModelView;

@Controller
public class TestController {

    @Route("/test0")
    public ModelView test() {
        // test method returning a view
        ModelView mv = new ModelView("testView.jsp");
        String[] items = { "Item 1", "Item 2", "Item 3" };
        mv.addItem("items", items);
        mv.addItem("message", "This is a test message from TestController.");
        return mv;

    }

    @Route("/test0/hello")
    public String hello() {
        return "<h1>Hello Controller</h1>";
    }

    // sprint 7 test
    @Route(value = "/test1/sprint", method = "GET")
    public ModelView getTest() {
        ModelView mv = new ModelView("test.jsp");
        mv.addItem("message", "GET request OK");
        mv.addItem("method", "GET");
        mv.addItem("id", "-");
        return mv;
    }

    @Route(value = "/test1", method = "POST")
    public ModelView postTest() {
        ModelView mv = new ModelView("test.jsp");
        mv.addItem("message", "POST request OK");
        mv.addItem("method", "POST");
        mv.addItem("id", "-");
        return mv;
    }

    @Route(value = "/test1/{id}", method = "GET")
    public ModelView getById(int id) {
        ModelView mv = new ModelView("test.jsp");
        mv.addItem("message", "GET with path variable");
        mv.addItem("method", "GET");
        mv.addItem("id", id);
        return mv;
    }

    @Route("/sprint8")
    public ModelView sprint8() {
        // test method returning a view
        ModelView mv = new ModelView("test_S8.jsp");
        return mv;

    }

    // @Route(value = "/save", method = "POST")
    // public String save(Map<String, Object> data) {
    // // data.get("name") -> "Alice"
    // // data.get("skills") -> List<String> ["java","spring"]
    // return data.toString();
    // }

    @Route(value = "/save", method = "POST")
    public String save(UserForm form) {
        // data.get("name") -> "Alice"
        // data.get("skills") -> List<String> ["java","spring"]
        return "name=" + form.name + " skills=" + form.skills;
    }

}
