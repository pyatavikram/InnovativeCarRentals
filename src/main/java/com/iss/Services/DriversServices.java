package com.iss.Services;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import com.iss.models.*;
import java.util.*;

public class DriversServices
{
    private EntityManagerFactory emf;
    private EntityManager em;

    public DriversServices()
    {
        emf = Persistence.createEntityManagerFactory("default");
        em = emf.createEntityManager();
    }

    public List<Drivers> getAll()
    {
        try {
            TypedQuery<Drivers> query = em.createQuery("SELECT e FROM Drivers e", Drivers.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    public void addDriver(Drivers e)
    {
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

    public void deleteDriver(Drivers e)
    {
        try {
            em.getTransaction().begin();
            Drivers element = em.find(Drivers.class, e.getDriverNo());
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

    public void updateDriver(Drivers e)
    {
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

    public Drivers findDriver(Integer id)
    {
        try {
            return em.find(Drivers.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    public List<Countries> getAllCountries()
    {
        try {
            TypedQuery<Countries> query = em.createQuery("SELECT c FROM Countries c", Countries.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    public List<Cities> getAllCities()
    {
        try {
            TypedQuery<Cities> query = em.createQuery("SELECT c FROM Cities c", Cities.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    public List<States> getAllStates()
    {
        try {
            TypedQuery<States> query = em.createQuery("SELECT s FROM States s", States.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    public Countries findCountry(Integer id)
    {
        try {
            return em.find(Countries.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public Cities findCity(Integer id)
    {
        try {
            return em.find(Cities.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public States findState(Integer id)
    {
        try {
            return em.find(States.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public List<Drivers> search(String data)
	 {
		 	EntityManager em=emf.createEntityManager();
	        TypedQuery<Drivers> query = em.createQuery("SELECT s FROM Drivers s WHERE s.Name LIKE :name", Drivers.class);
	        query.setParameter("name", "%" + data + "%");
	        List<Drivers> list= query.getResultList();
	        return list;
	 }
    public void close()
    {
        if (em != null && em.isOpen())
        {
            em.close();
        }
        if (emf != null && emf.isOpen())
        {
            emf.close();
        }
    }
}
