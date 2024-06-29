package com.iss.Services;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import com.iss.models.Bank;

public class BankServices {

    private EntityManagerFactory emf;

    public BankServices() {
        emf = Persistence.createEntityManagerFactory("default");
    }

    public void insertAmount(String accountNumber, Double amount)
    {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        TypedQuery<Bank> query = em.createQuery("SELECT b FROM Bank b WHERE b.accountNumber = :accountNumber", Bank.class);
        query.setParameter("accountNumber", accountNumber);
        
        Bank account;
        try {
            account = query.getSingleResult();
        } catch (Exception e) {
            account = new Bank();
            account.setAccountNumber(accountNumber);
            account.setBalance(0.0);
            em.persist(account);
        }

        account.setBalance(account.getBalance() + amount);
        em.merge(account);

        em.getTransaction().commit();
        em.close();
    }

    public Boolean debitAmount(String accountNumber, Double amount)
    {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        TypedQuery<Bank> query = em.createQuery("SELECT b FROM Bank b WHERE b.accountNumber = :accountNumber", Bank.class);
        query.setParameter("accountNumber", accountNumber);

        Bank account;
        try {
            account = query.getSingleResult();
            if (account.getBalance() < amount)
            {
                return false;
            }
            account.setBalance(account.getBalance() - amount);
            insertAmount("InnovativeCarRental",amount);
            em.merge(account);
        } catch (Exception e) {
            em.getTransaction().rollback();
            em.close();
            return false;
        }

        em.getTransaction().commit();
        em.close();
        return true;
    }
}
