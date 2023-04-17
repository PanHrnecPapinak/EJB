package UBK.beans;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import model.entity.Person;

@Stateless(mappedName = "PersonBeanMap")
@LocalBean
public class PersonBean implements PersonBeanRemote {
	@PersistenceContext(unitName = "JPAPerson")
	EntityManager em;

	public PersonBean() {
	}

	@Override
	public long createPerson(String name, String sex, String birthday) {
		Person MyPerson = new Person();
		MyPerson.setBirthday(birthday);
		MyPerson.setName(name);
		MyPerson.setSex(sex);
		em.persist(MyPerson);
		return MyPerson.getId();
	}

	@Override
	public boolean deletePerson(long personId) {
		boolean ret = false;
		Person MyPerson = em.find(Person.class, personId);
		if (MyPerson != null) {
			em.remove(MyPerson);
			ret = true;
		}
		return ret;
	}

	@Override
	public List<Person> getPersonForName(String name) {
		List<Person> persons = em.createQuery("SELECT p FROM Person p WHERE p.name = :name", Person.class)
				.setParameter("name", name).getResultList();
		return persons;
	}

	@Override
	public List<Person> getAllPersons() {
		List<Person> persons = em.createQuery("SELECT p FROM Person p", Person.class).getResultList();
		return persons;
	}

	@Override
	public boolean updatePerson(long personId, String name) {
		boolean ret = false;
		Person MyPerson = em.find(Person.class, personId);
		if (MyPerson != null) {
			MyPerson.setName(name);
			ret = true;
		}
		return ret;

	}

}
