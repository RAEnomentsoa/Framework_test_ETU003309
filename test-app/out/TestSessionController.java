package app.controllers;

import core.Session;
import core.ModelView;
import core.annotation.Controller;
import core.annotation.Route;
import core.annotation.RequestParam;
import core.annotation.RestAPI;

@Controller
public class TestSessionController {

    @Route(value = "/test/session/set", method = "GET")
    public String set(Session session,
            @RequestParam("key") String key,
            @RequestParam("value") String value) {

        session.set(key, value);
        return "Stored in session: " + key + "=" + value;
    }

    @Route(value = "/test/session/get", method = "GET")
    public String get(Session session,
            @RequestParam("key") String key) {

        Object value = session.get(key);
        return "Session value: " + value;
    }

    @Route(value = "/test/session/all", method = "GET")
    @RestAPI
    public Object all(Session session) {
        return session.getAll();
    }

    @Route(value = "/test/session/invalidate", method = "GET")
    public String invalidate(Session session) {
        session.invalidate();
        return "Session invalidated";
    }

    @Route(value = "/test/session/demo", method = "GET")
    public ModelView demo(Session session) {
        ModelView mv = new ModelView("session.jsp");
        mv.addItem("sessionId", session.getId());
        mv.addItem("data", session.getAll());
        return mv;
    }
}
