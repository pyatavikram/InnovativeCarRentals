package com.iss.models;
import javax.persistence.*;

@Entity
public class VehicleFuel
{

    @Id
    @Column(nullable=false,length=11)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer FuelNo;

    @Column(nullable=true,length=20)
    private String Fuel;
    public Integer getFuelNo() {
		return FuelNo;
	}
	public void setFuelNo(Integer fuelNo) {
		FuelNo = fuelNo;
	}
	public String getFuel() {
		return Fuel;
	}
	public void setFuel(String fuel) {
		Fuel = fuel;
	}
	// Default constructor
    public VehicleFuel() {
    }
}