package com.iss.models;

import javax.persistence.*;

@Entity
public class VehicleMakes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MakeNo", nullable = false)
    private int MakeNo;

    @Column(name = "Name", length = 40, nullable = false)
    private String Name;

    // Default constructor
    public VehicleMakes() {
    }

    public int getMakeNo() {
        return MakeNo;
    }

    public void setMakeNo(int makeNo) {
        MakeNo = makeNo;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }
}
