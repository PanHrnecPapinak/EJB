package com.example.ejb;

import com.example.ejb.model.Person;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.sql.SQLException;
import java.util.List;

@Stateless
public class PersonBean implements PersonBeanInterface {

    @PersistenceContext(unitName = "myPersistenceUnit")
    private EntityManager entityManager;

    @Override
    public void createPerson(Person personToCreate) {
        entityManager.persist(personToCreate);
    }


    @Override
    public void deletePerson(long id) {
        Person personToDelete = entityManager.find(Person.class, id);
        if (personToDelete != null) {
            entityManager.remove(personToDelete);

            }
        }

    @Override
    public List<Person> getAllPersons() {
        TypedQuery<Person> query = entityManager.createQuery("SELECT ID, name, sex, Birthday FROM person", Person.class);
        return query.getResultList();
    }

    @Override
    public Person getPersonForName(String name) {
        TypedQuery<Person> query = entityManager.createQuery("SELECT ID, name, sex, Birthday FROM person WHERE name = :name", Person.class);
        query.setParameter("name", name);
        return query.getSingleResult();
    }

    @Override
    public void updatePerson(Person personToUpdate) {
        entityManager.merge(personToUpdate);
    }
}
