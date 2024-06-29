package com.iss.Services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.iss.models.Rentals;

public class ReservationServices {

	private EntityManagerFactory emf;
	private EntityManager em;
	public ReservationServices()
	{
		emf = Persistence.createEntityManagerFactory("default");
        em = emf.createEntityManager();
	}
	public List<Rentals> ReservationsForToday()
    {
    	
    	try
    	{
    		TypedQuery<Rentals> query=em.createQuery("SELECT r from Rentals r WHERE StartDate BETWEEN GETDATE() AND DATEADD(DAY, 1, GETDATE()) AND r.Status NOT LIKE :status", Rentals.class);
    		query.setParameter("status", "Cancelled");
    		return query.getResultList();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    		return null;
    	}
		
    }
	public List<Rentals> ReservationsForTommorow()
    {
    	
    	try
    	{
    		TypedQuery<Rentals> query=em.createQuery("SELECT r from Rentals r WHERE StartDate BETWEEN GETDATE() AND DATEADD(DAY, 2, GETDATE()) AND r.Status NOT LIKE :status", Rentals.class);
    		query.setParameter("status", "Cancelled");
    		return query.getResultList();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    		return null;
    	}
		
    }
	public List<Rentals> ReservationForNext7Days()
	{
		try
    	{
    		TypedQuery<Rentals> query=em.createQuery("SELECT r from Rentals r WHERE StartDate BETWEEN GETDATE() AND DATEADD(DAY, 7, GETDATE()) AND r.Status NOT LIKE :status", Rentals.class);
    		query.setParameter("status", "Cancelled");
    		return query.getResultList();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    		return null;
    	}
	}
	public	List<Rentals> ReservationsForThisMonth()
	{
		try
    	{
    		TypedQuery<Rentals> query=em.createQuery("SELECT r from Rentals r WHERE MONTH(StartDate) = MONTH(GETDATE()) AND r.Status NOT LIKE :status", Rentals.class);
    		query.setParameter("status", "Cancelled");
    		return query.getResultList();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    		return null;
    	}
	}
	public List<Rentals> ReservationForNextMonth()
	{
		try
    	{
    		TypedQuery<Rentals> query=em.createQuery("SELECT r from Rentals r WHERE MONTH(StartDate) = MONTH(DATEADD(month, 1, GETDATE())) AND r.Status NOT LIKE :status", Rentals.class);
    		query.setParameter("status", "Cancelled");
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
