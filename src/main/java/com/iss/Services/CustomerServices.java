package com.iss.Services;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import com.iss.models.*;
import java.util.*;

public class CustomerServices
{

    private EntityManagerFactory emf;
    private EntityManager em;

    public CustomerServices() {
        emf = Persistence.createEntityManagerFactory("default");
        em = emf.createEntityManager();
    }

    public List<Customers> getAll() {
        try {
            TypedQuery<Customers> query = em.createQuery("SELECT e FROM Customers e", Customers.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    public void addCustomer(Customers e) {
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

    public void deleteCustomer(Customers e) {
        try {
            em.getTransaction().begin();
            Customers element = em.find(Customers.class, e.getCustomerNo());
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

    public void updateCustomer(Customers e) {
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

    public Customers findCustomer(Integer id) {
        try {
            return em.find(Customers.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    // Methods for retrieving Countries, Cities, and States

    public List<Countries> getAllCountries() {
        try {
            TypedQuery<Countries> query = em.createQuery("SELECT c FROM Countries c", Countries.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
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

    public List<States> getAllStates() {
        try {
            TypedQuery<States> query = em.createQuery("SELECT s FROM States s", States.class);
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

    public Cities findCity(Integer id) {
        try {
            return em.find(Cities.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
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
    public List<Customers> search(String data)
	 {
		 	EntityManager em=emf.createEntityManager();
	        TypedQuery<Customers> query = em.createQuery("SELECT s FROM Customers s WHERE s.Name LIKE :name", Customers.class);
	        query.setParameter("name", "%" + data + "%");
	        List<Customers> list= query.getResultList();
	        return list;
	    }
    public Customers VerifyLoginDetails(String username, String password)
    {
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            TypedQuery<Customers> query = em.createQuery("SELECT s FROM Customers s WHERE s.Username = :name AND s.Password = :password", Customers.class);
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

    public void close()
    {
        if (emf != null && emf.isOpen())
        {
            emf.close();
        }
        if(em !=null && em.isOpen())
        {
        	em.clear();
        }
    }

}
