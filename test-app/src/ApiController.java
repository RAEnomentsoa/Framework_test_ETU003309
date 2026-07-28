package app.controllers;

import core.annotation.Controller;
import core.annotation.RestAPI;
import core.annotation.Route;
import core.annotation.RequestParam;
import app.models.User;
import java.util.List;
import java.lang.RuntimeException;

@RestAPI
@Controller
public class ApiController {

    @Route(value = "/api/user", method = "GET")
    public List<User> getUser() {
        User user1 = new User("John", 30);
        User user2 = new User("Jane", 25);

        List<User> users = new java.util.ArrayList<>();
        users.add(user1);
        users.add(user2);
        return users;
    }

    @Route(value = "/api/error", method = "GET")
    public Object error() {
        throw new RuntimeException("Test error simulation");
    }
}
