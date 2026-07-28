package app.models;

public class User {
    public String name;
    public int age;

    public User() {
    } // obligatoire pour reflection (Sprint 8-bis)

    public User(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString() {
        return "User{name='" + name + "', age=" + age + "}";
    }
}
