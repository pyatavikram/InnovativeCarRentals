package com.iss.Services;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.iss.models.*;
import java.util.*;
public class VehicleDetailsServices {

	private EntityManagerFactory emf;
	public VehicleDetailsServices()
	{
		emf = Persistence.createEntityManagerFactory("default");
	}
	public List<Vehicles> getAll()
	{
	    EntityManager em = null;
	    try
	    {
	        em = emf.createEntityManager();
	        TypedQuery<Vehicles> query = em.createQuery("SELECT e FROM Vehicles e", Vehicles.class);
	        return query.getResultList();
	    }finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<Owners>  getAllOwners()
	{
		EntityManager em = null;
	    try
	    {
	    		em=emf.createEntityManager();
	    		TypedQuery<Owners> query=em.createQuery("SELECT s from Owners s",Owners.class);
	    		return query.getResultList();
	    }
	    finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<VehicleMakes>  getAllVehicleMakes()
	{
		EntityManager em = null;
	    try
	    {
	    		em=emf.createEntityManager();
	    		TypedQuery<VehicleMakes> query=em.createQuery("SELECT s from VehicleMakes s",VehicleMakes.class);
	    		return query.getResultList();
	    }
	    finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<VehicleModels>  getAllVehicleModels()
	{
		EntityManager em = null;
	    try
	    {
	    		em=emf.createEntityManager();
	    		TypedQuery<VehicleModels> query=em.createQuery("SELECT s from VehicleModels s",VehicleModels.class);
	    		return query.getResultList();
	    }
	    finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<VehicleTypes>  getAllVehicleTypes()
	{
		EntityManager em = null;
	    try
	    {
	    		em=emf.createEntityManager();
	    		TypedQuery<VehicleTypes> query=em.createQuery("SELECT s from VehicleTypes s",VehicleTypes.class);
	    		return query.getResultList();
	    }
	    finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<Countries>  getAllCountries()
	{
		EntityManager em = null;
	    try
	    {
	    		em=emf.createEntityManager();
	    		TypedQuery<Countries> query=em.createQuery("SELECT s from Countries s",Countries.class);
	    		return query.getResultList();
	    }
	    finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<States>  getAllStates()
	{
		EntityManager em = null;
	    try
	    {
	    		em=emf.createEntityManager();
	    		TypedQuery<States> query=em.createQuery("SELECT s from States s",States.class);
	    		return query.getResultList();
	    }
	    finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<Cities>  getAllCities()
	{
		EntityManager em = null;
	    try
	    {
	    		em=emf.createEntityManager();
	    		TypedQuery<Cities> query=em.createQuery("SELECT s from Cities s",Cities.class);
	    		return query.getResultList();
	    }
	    finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<VehicleFuel>  getAllVehicleFuel()
	{
		EntityManager em = null;
	    try
	    {
	    		em=emf.createEntityManager();
	    		TypedQuery<VehicleFuel> query=em.createQuery("SELECT s from VehicleFuel s",VehicleFuel.class);
	    		return query.getResultList();
	    }
	    finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public List<VehicleCapacity>  getAllVehicleCapacity()
	{
		EntityManager em = null;
	    try
	    {
	    		em=emf.createEntityManager();
	    		TypedQuery<VehicleCapacity> query=em.createQuery("SELECT s from VehicleCapacity s",VehicleCapacity.class);
	    		return query.getResultList();
	    }
	    finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public void addVehicleDetails(Vehicles e)
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
	public void deleteVehicleDetails(Vehicles e)
	{
		EntityManager em = null;
	    try
	    {
			em = emf.createEntityManager();
			em.getTransaction().begin();
			
			Vehicles element=em.find(Vehicles.class,e.getVehicleNo());
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
	public void updateVehicleDetails(Vehicles e)
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
	public Vehicles Find(Integer id)
	{
		EntityManager em = null;
	    try
	    {
	    	em=emf.createEntityManager();
	    	Vehicles con=em.find(Vehicles.class, id);
			return con;
		}finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
	}
	public Countries findCountry(Integer id)
	{
		EntityManager em = null;
		try {
	        	em=emf.createEntityManager();
	            return em.find(Countries.class, id);
	        } catch (Exception ex) {
	            ex.printStackTrace();
	            return null;
	        }
	}
	public Cities findCity(Integer id)
	{
    	EntityManager em = null;
    	try {
	        	em=emf.createEntityManager();
	            return em.find(Cities.class, id);
	        } catch (Exception ex) {
	            ex.printStackTrace();
	            return null;
	        }
	}
    public States findState(Integer id)
    {
	    	EntityManager em = null;
	        try {
	        	em=emf.createEntityManager();
	            return em.find(States.class, id);
	        } catch (Exception ex) {
	            ex.printStackTrace();
	            return null;
	        }
    }
    public VehicleModels findVehicleModel(Integer id)
    {
    	EntityManager em = null;
        try {
        	em=emf.createEntityManager();
            return em.find(VehicleModels.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    public Owners findOwners(Integer id)
    {
    	EntityManager em = null;
        try {
        	em=emf.createEntityManager();
            return em.find(Owners.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    public List<States> getStates(Integer countryNo)
    {
    	EntityManager em=null;
    	try
    	{
    		em=emf.createEntityManager();
    		TypedQuery<States> list=em.createQuery("SELECT s from States s WHERE s.country LIKE :name",States.class);
    		list.setParameter("name","%" + countryNo + "%");
    		return list.getResultList();
    	}
    	finally
    	{
    		em.close();
    	}
    }
    public List<Vehicles> getDataWithString(String information)
	{
	    EntityManager em = null;
	    try
	    {
	        em = emf.createEntityManager();
	        TypedQuery<Vehicles> query = em.createQuery("SELECT e FROM Vehicles e WHERE e.Type LIKE :name", Vehicles.class);
	        query.setParameter("name","%" + information + "%");
	        return query.getResultList();
	    }finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
    	
    }
    public List<Vehicles> getDataCarMakes(String information)
	{
	    EntityManager em = null;
	    try
	    {
	        em = emf.createEntityManager();
	        TypedQuery<Vehicles> query = em.createQuery("SELECT e FROM Vehicles e WHERE e.Type LIKE :name", Vehicles.class);
	        query.setParameter("name","%" + information + "%");
	        return query.getResultList();
	    }finally
	    {
	        if (em != null && em.isOpen())
	        {
	            em.close();
	        }
	    }
    	
    }
	public void close()
	{
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
