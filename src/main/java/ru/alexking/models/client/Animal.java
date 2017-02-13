package ru.alexking.models.client;

import ru.alexking.models.Base;

public class Animal extends Base {
    private String name;
    private String type;
    private int age;
    private int weight;
    private Client client;

    public Animal(){}

    public Animal(int id, String name, String type, int age, int weight){
        this.id = id;
        this.name = name;
        this.type = type;
        this.age = age;
        this.weight = weight;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
