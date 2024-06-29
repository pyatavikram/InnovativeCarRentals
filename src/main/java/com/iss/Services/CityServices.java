package com.iss.Services;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.iss.models.*;
import java.util.*;
public class CityServices {

	private EntityManagerFactory emf;
	public CityServices()
	{
		emf = Persistence.createEntityManagerFactory("default");
	}
	public List<Cities> getAll()
	{
	    EntityManager em = null;
	    try
	    {
	        em = emf.createEntityManager();
	        TypedQuery<Cities> query = em.createQuery("SELECT e FROM Cities e", Cities.class);
	        return query.getResultList();
	    }finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}

	public void addCity(Cities e)
	{

		EntityManager em = null;
	    try
	    {
			em = emf.createEntityManager();
		
			em.getTransaction().begin();
			
			em.persist(e);

			em.getTransaction().commit();
	    }finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
		
	}
	public void deleteCity(Cities e)
	{
		EntityManager em = null;
	    try
	    {
			em = emf.createEntityManager();
			em.getTransaction().begin();
			
			Cities element=em.find(Cities.class,e.getCityNo());
			if(e != null)
			{
				em.remove(element);
			}
			em.getTransaction().commit();
		}finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public void updateCity(Cities e)
	{
		EntityManager em = null;
	    try
	    {
			em = emf.createEntityManager();
			em.getTransaction().begin();
			
			em.merge(e);
			
			em.getTransaction().commit();
		}finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public Cities Find(Integer id)
	{
		EntityManager em = null;
	    try
	    {
	    	em=emf.createEntityManager();
			Cities con=em.find(Cities.class, id);
			return con;
		}finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<Cities> search(String data)
	 {
		 	EntityManager em=emf.createEntityManager();
	        TypedQuery<Cities> query = em.createQuery("SELECT s FROM Cities s WHERE s.cityName LIKE :name", Cities.class);
	        query.setParameter("name", "%" + data + "%");
	        List<Cities> list= query.getResultList();
	        return list;
	    }
	public void closeEntityManagerFactory()
	{
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
