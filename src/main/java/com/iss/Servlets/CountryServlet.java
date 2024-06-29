package com.iss.Servlets;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import com.iss.models.*;


@WebServlet("/Country")
public class CountryServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private EntityManagerFactory emf;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init()throws ServletException {
    	 emf = Persistence.createEntityManagerFactory("default");
    }
    
    public void destroy() {
        emf.close();
    }
    
    public List<Countries> getAllEmployees(EntityManager entityManager) {
        TypedQuery<Countries> query = entityManager.createQuery("SELECT e FROM Countries e", Countries.class);
        return query.getResultList();
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			EntityManager em = emf.createEntityManager();
			List<Countries> Countries = getAllEmployees(em);
			System.out.println(Countries.size());
			
			request.setAttribute("Countries", Countries);
			// TODO Auto-generated method stub
			
			response.getWriter().append("Served at: ").append(request.getContextPath());
			RequestDispatcher rd=request.getRequestDispatcher("Countries.jsp");
			rd.forward(request, response);
			//response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}