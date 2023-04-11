package com.example.ejb;

import com.example.ejb.model.Person;
import jakarta.ejb.Local;

import java.util.List;

@Local
public interface PersonBeanInterface {
    void createPerson(Person person);
    void deletePerson(long id);
    Person getPersonForName(String name);
    List<Person> getAllPersons();
    void updatePerson(Person person);
}
