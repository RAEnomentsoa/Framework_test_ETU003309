package app.controllers;

import core.annotation.Controller;
import core.annotation.Route;
import core.annotation.RestAPI;
import core.annotation.Authorized;
import core.Session;
import core.rest.ApiResponse;

@Controller
public class AuthTestController {

    // Public route, accessible to anyone
    @Route("/test/auth/public")
    @Authorized({ "all" })
    public String publicPage() {
        return "Public page, everyone can access this.";
    }

    // Only for anonymous (not logged in) users
    @Route("/test/auth/anonym-only")
    @Authorized({ "anonym" })
    public String anonymousPage(Session session) {
        if (session.contains("user")) {
            return "Redirect: already logged in!";
        }
        return "Anonymous page, please log in.";
    }

    // Only for admin users
    @Route("/test/auth/admin-only")
    @Authorized({ "admin" })
    public String adminPage(Session session) {
        String role = (String) session.get("role");
        return "Admin page. Current role: " + role;
    }

    @Route("/test/auth/CEO")
    @Authorized({ "CEO" })
    public String CEOPage(Session session) {
        String role = (String) session.get("role");
        return "CEO page. Current role: " + role;
    }

    // Login simulation
    @Route("/test/auth/login")
    @RestAPI
    public ApiResponse login(Session session, String username, String role) {
        session.set("user", username);
        session.set("role", role);
        return new ApiResponse(200, "Logged in as " + username + " with role " + role, null);
    }

    // Logout
    @Route("/test/auth/logout")
    @RestAPI
    public ApiResponse logout(Session session) {
        session.invalidate();
        return new ApiResponse(200, "Logged out", null);
    }

    // Status check
    @Route("/test/auth/status")
    @RestAPI
    public ApiResponse status(Session session) {
        String user = (String) session.get("user");
        String role = (String) session.get("role");
        return new ApiResponse(200, "Current session",
                java.util.Map.of("user", user, "role", role));
    }
}
