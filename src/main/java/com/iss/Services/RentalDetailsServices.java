package com.iss.Services;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import com.iss.models.*;
import java.util.Collections;
import java.util.List;

public class RentalDetailsServices {

    private EntityManagerFactory emf;
    private EntityManager em;

    public RentalDetailsServices() {
        emf = Persistence.createEntityManagerFactory("default");
        em = emf.createEntityManager();
    }

    public List<Rentals> getAllRentals() {
        try {
            TypedQuery<Rentals> query = em.createQuery("SELECT r FROM Rentals r", Rentals.class);
            return query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }

    public void addRental(Rentals rental) {
        try {
            em.getTransaction().begin();
            em.persist(rental);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            ex.printStackTrace();
        }
    }

    public void deleteRental(Rentals rental) {
        try {
            em.getTransaction().begin();
            Rentals existingRental = em.find(Rentals.class, rental.getRentalNo());
            if (existingRental != null) {
                em.remove(existingRental);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            ex.printStackTrace();
        }
    }

    public void updateRental(Rentals rental) {
        try {
            em.getTransaction().begin();
            em.merge(rental);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            ex.printStackTrace();
        }
    }

    public Rentals findRental(Integer id) {
        try {
            return em.find(Rentals.class, id);
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

    public List<Rentals> searchRentals(String data) {
        try {
            TypedQuery<Rentals> query = em.createQuery("SELECT r FROM Rentals r WHERE r.customer.name LIKE :name", Rentals.class);
            query.setParameter("name", "%" + data + "%");
            List<Rentals> resultList = query.getResultList();
            return resultList;
        } catch (Exception ex) {
            ex.printStackTrace();
            return Collections.emptyList();
        }
    }
    public Vehicles findVehicleById(Integer vehicleNo) {
        try {
            return em.find(Vehicles.class, vehicleNo);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    public List<Rentals> ReservationsForNext2Days(Integer customerNo)
    {
    	
    	try
    	{
    		TypedQuery<Rentals> query=em.createQuery("SELECT r from Rentals r WHERE r.customer.CustomerNo LIKE :data AND StartDate BETWEEN GETDATE() AND DATEADD(DAY, 2, GETDATE()) AND r.Status NOT LIKE :status", Rentals.class);
    		query.setParameter("data", customerNo);
    		query.setParameter("status", "Cancelled");
    		return query.getResultList();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
		return null;
		
    }
    
    public List<Rentals> Reservations(Integer customerNo)
    {
    	
    	try
    	{
    		TypedQuery<Rentals> query=em.createQuery("SELECT r from Rentals r WHERE r.customer.CustomerNo LIKE :data AND r.Status NOT LIKE :status ", Rentals.class);
    		query.setParameter("data", customerNo);
    		query.setParameter("status", "Cancelled");
    		return query.getResultList();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    		return null;
    	}
		
    }
    
    public List<Rentals> CancelledReservations(Integer customerNo)
    {
    	
    	try
    	{
    		TypedQuery<Rentals> query=em.createQuery("SELECT r from Rentals r WHERE r.customer.CustomerNo LIKE :data AND r.Status LIKE: status", Rentals.class);
    		query.setParameter("data", customerNo);
    		query.setParameter("status", "Cancelled");
    		return query.getResultList();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    		return null;
    	}
		
    }
    
    public List<Rentals> Rented(Integer customerNo)
    {
    	
    	try
    	{
    		TypedQuery<Rentals> query=em.createQuery("SELECT r from Rentals r WHERE r.customer.CustomerNo LIKE :data AND r.Status LIKE: status", Rentals.class);
    		query.setParameter("data", customerNo);
    		query.setParameter("status", "FullFilled");
    		return query.getResultList();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    		return null;
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
