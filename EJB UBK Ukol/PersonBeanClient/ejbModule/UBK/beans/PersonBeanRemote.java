package UBK.beans;

import java.util.List;

import javax.ejb.Remote;

import model.entity.Person;

@Remote
public interface PersonBeanRemote {
	//Declare the interface method
	public long createPerson(String name, String sex, String birthday);

	public boolean deletePerson(long Person);

	public List<Person> getPersonForName(String name);

	public List<Person> getAllPersons();

	public boolean updatePerson(long personId, String name);

}