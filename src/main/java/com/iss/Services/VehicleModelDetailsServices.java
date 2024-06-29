package com.iss.Services;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.iss.models.*;
import java.util.*;

public class VehicleModelDetailsServices {

    private EntityManagerFactory emf;

    public VehicleModelDetailsServices() {
        emf = Persistence.createEntityManagerFactory("default");
    }

    public List<VehicleModels> getAll() {
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            TypedQuery<VehicleModels> query = em.createQuery("SELECT e FROM VehicleModels e", VehicleModels.class);
            return query.getResultList();
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void addVehicleModel(VehicleModels model) {
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            em.getTransaction().begin();
            em.persist(model);
            em.getTransaction().commit();
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void deleteVehicleModel(VehicleModels model) {
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            em.getTransaction().begin();
            VehicleModels element = em.find(VehicleModels.class, model.getModelNo());
            if (element != null) {
                em.remove(element);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void updateVehicleModel(VehicleModels model) {
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            em.getTransaction().begin();
            em.merge(model);
            em.getTransaction().commit();
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public VehicleModels find(Integer id) {
        EntityManager em = null;
        try {
            em = emf.createEntityManager();
            return em.find(VehicleModels.class, id);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
    public List<VehicleModels> search(String data)
	 {
		 	EntityManager em=emf.createEntityManager();
	        TypedQuery<VehicleModels> query = em.createQuery("SELECT s FROM VehicleModels s WHERE s.Name LIKE :name", VehicleModels.class);
	        query.setParameter("name", "%" + data + "%");
	        List<VehicleModels> list= query.getResultList();
	        em.close();
	        return list;
	 }
    public void closeEntityManagerFactory() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
