package app.models;

import core.FileUpload;

public class UserFile {
    private String username;
    private int age;

    // IMPORTANT: name="photo" dans le form
    private FileUpload photo;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public FileUpload getPhoto() {
        return photo;
    }

    public void setPhoto(FileUpload photo) {
        this.photo = photo;
    }
}
