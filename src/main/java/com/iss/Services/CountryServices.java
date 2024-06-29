package com.iss.Services;
import javax.management.Query;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.iss.models.*;
import java.util.*;
public class CountryServices {

	private EntityManagerFactory emf;
	public CountryServices()
	{
		emf = Persistence.createEntityManagerFactory("default");
	}
	public List<Countries> getAll()
	{
	    EntityManager em = null;
	    try
	    {
	        em = emf.createEntityManager();
	        TypedQuery<Countries> query = em.createQuery("SELECT e FROM Countries e", Countries.class);
	        return query.getResultList();
	    }finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}

	public void addCountry(Countries e)
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
	public void deleteCountry(Countries e)
	{
		EntityManager em = null;
	    try
	    {
			em = emf.createEntityManager();
			em.getTransaction().begin();
			
			Countries element=em.find(Countries.class,e.getCountryNo());
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
	public void updateCountry(Countries e)
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
	public Countries Find(Integer id)
	{
		EntityManager em = null;
	    try
	    {
	    	em=emf.createEntityManager();
			Countries con=em.find(Countries.class, id);
			return con;
		}finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	 public List<Countries> search(String data)
	 {
		 	EntityManager em=emf.createEntityManager();
	        TypedQuery<Countries> query = em.createQuery("SELECT s FROM Countries s WHERE s.country LIKE :name", Countries.class);
	        query.setParameter("name", "%" + data + "%");
	        List<Countries> list= query.getResultList();
	        em.close();
	        return list;
	 }
	 public Long Count()
	 {
	        EntityManager em = null;
	        try {
	            em = emf.createEntityManager();
	            TypedQuery<Long> query = em.createQuery("SELECT COUNT(c) FROM Countries c", Long.class);
	            return query.getSingleResult();
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close();
	            }
	        }
	 }
	public void closeEntityManagerFactory()
	{
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
