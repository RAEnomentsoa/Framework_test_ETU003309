package app.controllers;

import app.models.UserFile;
import core.ModelView;
import core.annotation.Controller;
import core.annotation.Route;

import java.nio.file.Files;
import java.nio.file.Paths;
import core.AppContext;

@Controller
public class UserFileController {

    @Route("/sprint10")
    public ModelView sprint10() {
        // test method returning a view
        ModelView mv = new ModelView("test_file_upload.jsp");
        return mv;
    }

    @Route(value = "/user/save", method = "POST")
    public ModelView save(UserFile user) throws Exception {

        // user fields
        System.out.println(user.getUsername());
        System.out.println(user.getAge());

        // uploaded file
        if (user.getPhoto() != null) {

            // 1) Resolve WEB-INF/uploads real path
            String uploadDir = core.AppContext.getWebInfPath() + java.io.File.separator + "uploads";

            // 2) Ensure directory exists
            java.nio.file.Path dir = java.nio.file.Paths.get(uploadDir);
            java.nio.file.Files.createDirectories(dir);

            // 3) Safe filename (prevents ".." or paths)
            String safeName = java.nio.file.Paths.get(user.getPhoto().getFileName())
                    .getFileName()
                    .toString();

            // 4) Save
            java.nio.file.Path target = dir.resolve(safeName);
            java.nio.file.Files.write(target, user.getPhoto().getBytes());

            System.out.println("Saved to: " + target.toAbsolutePath());
        }

        return new ModelView("result.jsp");
    }
}
