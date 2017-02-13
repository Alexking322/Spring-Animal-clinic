package ru.alexking.models.client;

import ru.alexking.models.Base;

import java.sql.Timestamp;

public class Client extends Base {
    private String name;
    private String surname;
    private String email;
    private String sex;
    private String phoneNumber;
    private String city;
    private Timestamp registrationTime;

    public Client(){}

    public Client(String name, String surname, String email, String sex, String phoneNumber, String city, Timestamp registrationTime){
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.sex = sex;
        this.phoneNumber = phoneNumber;
        this.city = city;
        this.registrationTime = registrationTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Timestamp getRegistrationTime() {
        return registrationTime;
    }

    public void setRegistrationTime(Timestamp registrationTime) {
        this.registrationTime = registrationTime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}