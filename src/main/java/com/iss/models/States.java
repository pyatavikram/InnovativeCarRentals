package com.iss.models;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "States")
public class States
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int stateNo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CountryNo", nullable = false)
    private Countries country;

    private String stateName;

    // Default constructor
    public States() {
    }

    // Parameterized constructor
    public States(Countries country, String stateName) {
        this.country = country;
        this.stateName = stateName;
    }

    // Getters and setters
    public int getStateNo() {
        return stateNo;
    }

    public void setStateNo(int stateNo) {
        this.stateNo = stateNo;
    }

    public Countries getCountry() {
        return country;
    }

    public void setCountry(Countries country) {
        this.country = country;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String toString() {
        return "State{" +
                "stateNo=" + stateNo +
                ", country=" + country.getCountry() +
                ", stateName='" + stateName + '\'' +
                '}';
    }
}
