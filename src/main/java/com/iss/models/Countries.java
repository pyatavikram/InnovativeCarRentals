package com.iss.models;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import javax.persistence.Id;

@Entity
public class Countries {

    @Id
    @GeneratedValue
    private int countryNo;

    private String country;

    // Default constructor
    public Countries() {
    }

    // Parameterized constructor
    public Countries(String country) {
        this.country = country;
    }

    // Getters and setters
    public int getCountryNo() {
        return countryNo;
    }

    public void setCountryNo(int countryNo) {
        this.countryNo = countryNo;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    public String toString() {
        return "Country{" +
                "countryNo=" + countryNo +
                ", country='" + country + '\'' +
                '}';
    }
}
