package com.iss.Services;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.iss.models.*;
import java.util.*;
public class VehicleMakeDetailsServices {

	private EntityManagerFactory emf;
	public VehicleMakeDetailsServices()
	{
		emf = Persistence.createEntityManagerFactory("default");
	}
	public List<VehicleMakes> getAll()
	{
	    EntityManager em = null;
	    try
	    {
	        em = emf.createEntityManager();
	        TypedQuery<VehicleMakes> query = em.createQuery("SELECT e FROM VehicleMakes e", VehicleMakes.class);
	        return query.getResultList();
	    }finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}

	public void addVehicleMakes(VehicleMakes e)
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
	public void deleteVehicleMakes(VehicleMakes e)
	{
		EntityManager em = null;
	    try
	    {
			em = emf.createEntityManager();
			em.getTransaction().begin();
			
			VehicleMakes element=em.find(VehicleMakes.class,e.getMakeNo());
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
	public void updateVehicleMakes(VehicleMakes e)
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
	public VehicleMakes Find(Integer id)
	{
		EntityManager em = null;
	    try
	    {
	    	em=emf.createEntityManager();
	    	VehicleMakes con=em.find(VehicleMakes.class, id);
			return con;
		}finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<VehicleMakes> search(String data)
	 {
		 	EntityManager em=emf.createEntityManager();
	        TypedQuery<VehicleMakes> query = em.createQuery("SELECT s FROM VehicleMakes s WHERE s.Name LIKE :name", VehicleMakes.class);
	        query.setParameter("name", "%" + data + "%");
	        List<VehicleMakes> list= query.getResultList();
	        return list;
	    }
	public void closeEntityManagerFactory()
	{
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
