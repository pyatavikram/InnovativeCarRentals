package com.iss.Services;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import com.iss.models.*;
import java.util.*;

public class OwnersServices {

    private EntityManagerFactory emf;
    private EntityManager em;

    public OwnersServices() {
        emf = Persistence.createEntityManagerFactory("default");
        em = emf.createEntityManager();
    }
    public List<Owners> getAll() {
        try {
            TypedQuery<Owners> query = em.createQuery("SELECT o FROM Owners o", Owners.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    public void addOwner(Owners owner) {
        try {
            em.getTransaction().begin();
            em.persist(owner);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            ex.printStackTrace();
        }
    }

    public void deleteOwner(Owners owner) {
        try {
            em.getTransaction().begin();
            Owners foundOwner = em.find(Owners.class, owner.getOwnerNo());
            if (foundOwner != null) {
                em.remove(foundOwner);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            ex.printStackTrace();
        }
    }

    public void updateOwner(Owners owner) {
        try {
            em.getTransaction().begin();
            em.merge(owner);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            ex.printStackTrace();
        }
    }

    public Owners findOwner(Integer id) {
        try {
            return em.find(Owners.class, id);
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
    public List<Owners> search(String data)
	 {
		 	EntityManager em=emf.createEntityManager();
	        TypedQuery<Owners> query = em.createQuery("SELECT s FROM Owners s WHERE s.Name LIKE :name", Owners.class);
	        query.setParameter("name", "%" + data + "%");
	        List<Owners> list= query.getResultList();
	        return list;
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
