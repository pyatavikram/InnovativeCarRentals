package com.iss.Services;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.iss.models.*;
import java.util.*;
public class StateServices {

	private EntityManagerFactory emf;
	public StateServices() {
		emf = Persistence.createEntityManagerFactory("default");
		// TODO Auto-generated constructor stub
	}
	public List<States>  getAll()
	{
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		TypedQuery<States> query = em.createQuery("SELECT e FROM States e", States.class);
		em.getTransaction().commit();
		
        List<States> list= query.getResultList();
        em.close();
        emf.close();
        return list;
	}
	public void addState(States e)
	{
		EntityManager em=null;
		try
		{
			em = emf.createEntityManager();
			em.getTransaction().begin();
			
			em.persist(e);
			
			System.out.print(true);
			em.getTransaction().commit();
		}finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public void deleteState(States e)
	{
		if (e != null ) { // Ensure that the entity and its ID are not null
	        EntityManager em = emf.createEntityManager();
	        try {
	            em.getTransaction().begin();
	            States element = em.find(States.class, e.getStateNo());
	            if (element != null) {
	                em.remove(element);
	            }
	            em.getTransaction().commit();
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close();
	            }
	        }
	    } else {
	        // Handle the case where the entity or its ID is null
	        throw new IllegalArgumentException("State entity or ID is null");
	    }
	}
	public void updateState(States e)
	{
		EntityManager em=null;
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
	public States Find(Integer id)
	{
		EntityManager em = null;
	    try
	    {
	    	em=emf.createEntityManager();
			States con=em.find(States.class, id);
			return con;
		}finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<States> search(String data)
	 {
		 	EntityManager em=emf.createEntityManager();
	        TypedQuery<States> query = em.createQuery("SELECT s FROM States s WHERE s.stateName LIKE :name", States.class);
	        query.setParameter("name", "%" + data + "%");
	        List<States> list= query.getResultList();
	        return list;
	    }
	public void closeEntityManagerFactory()
	{
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
