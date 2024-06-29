package com.iss.Services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.iss.models.VehicleTypes;

public class VehicleTypesServices
{
	private EntityManagerFactory emf;
	public VehicleTypesServices()
	{
		emf = Persistence.createEntityManagerFactory("default");
	}
	public List<VehicleTypes> getAll()
	{
	    EntityManager em = null;
	    try
	    {
	        em = emf.createEntityManager();
	        TypedQuery<VehicleTypes> query = em.createQuery("SELECT e FROM VehicleTypes e", VehicleTypes.class);
	        return query.getResultList();
	    }finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public void closeEntityManagerFactory()
	{
        if (emf != null && emf.isOpen())
        {
            emf.close();
        }
    }
}
