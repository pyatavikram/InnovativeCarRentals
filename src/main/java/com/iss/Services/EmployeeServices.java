package com.iss.Services;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import com.iss.models.*;
import java.util.*;

public class EmployeeServices {

    private EntityManagerFactory emf;
    private EntityManager em;

    public EmployeeServices() {
        emf = Persistence.createEntityManagerFactory("default");
        em = emf.createEntityManager();
    }
    public List<Employees> getAll() {
        try {
            TypedQuery<Employees> query = em.createQuery("SELECT e FROM Employees e", Employees.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }
    public List<Cities> getAllCities(String StateNo) {
        try {
            TypedQuery<Cities> query = em.createQuery("SELECT s FROM Cities s WHERE s.StateNo LIKE :name",Cities.class);
            query.setParameter("name", "%" + Integer.parseInt(StateNo) + "%");
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    public void addEmployee(Employees e) {
        try {
            em.getTransaction().begin();
            em.persist(e);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            ex.printStackTrace();
        }
    }

    public void deleteEmployee(Employees e) {
        try {
            em.getTransaction().begin();
            Employees element = em.find(Employees.class, e.getEmployeeNo());
            if (element != null) {
                em.remove(element);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            ex.printStackTrace();
        }
    }

    public void updateEmployee(Employees e) {
        try {
            em.getTransaction().begin();
            em.merge(e);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            ex.printStackTrace();
        }
    }

    public Employees findEmployee(Integer id) {
        try {
            return em.find(Employees.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    public List<Countries> getAllCountries() {
        try {
            TypedQuery<Countries> query = em.createQuery("SELECT c FROM Countries c", Countries.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    public Countries findCountry(Integer id) {
        try {
            return em.find(Countries.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public List<Cities> getAllCities() {
        try {
            TypedQuery<Cities> query = em.createQuery("SELECT c FROM Cities c", Cities.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    public Cities findCity(Integer id) {
        try {
            return em.find(Cities.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    public List<States> getAllStates() {
        try {
            TypedQuery<States> query = em.createQuery("SELECT s FROM States s", States.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    public States findState(Integer id) {
        try {
            return em.find(States.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    public List<Employees> search(String data)
	 {
		 	EntityManager em=emf.createEntityManager();
	        TypedQuery<Employees> query = em.createQuery("SELECT s FROM Employees s WHERE s.Name LIKE :name", Employees.class);
	        query.setParameter("name", "%" + data + "%");
	        List<Employees> list= query.getResultList();
	        return list;
	    }
    public Employees VerifyLoginDetails(String username, String password)
    {
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            TypedQuery<Employees> query = em.createQuery("SELECT s FROM Employees s WHERE s.Username = :name AND s.Password = :password", Employees.class);
            query.setParameter("name", username);
            query.setParameter("password", password);
            if(query.getResultList().isEmpty())
            {
            	return null;
            }
            else
            {
            	return query.getSingleResult();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }
    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
