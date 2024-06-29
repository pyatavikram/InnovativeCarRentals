package com.iss.models;

import javax.persistence.*;

@Entity
public class VehicleModels
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable=false)
    private int ModelNo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MakeNo", referencedColumnName = "MakeNo")
    private VehicleMakes vehicleMakes;

    @Column(nullable=false,name = "Name", length = 40)
    private String Name;

    public int getModelNo() {
		return ModelNo;
	}

	public void setModelNo(int modelNo) {
		ModelNo = modelNo;
	}

	public VehicleMakes getVehicleMakes() {
		return vehicleMakes;
	}

	public void setVehicleMakes(VehicleMakes vehicleMakes) {
		this.vehicleMakes = vehicleMakes;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	// Default constructor
    public VehicleModels() {
    }
}