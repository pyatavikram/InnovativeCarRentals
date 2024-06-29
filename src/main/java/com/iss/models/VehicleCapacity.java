package com.iss.models;
import javax.persistence.*;

@Entity
public class VehicleCapacity
{

    @Id
    @Column(nullable=false,length=11)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer CapacityNo;

    @Column(nullable=true,length=5)
    private Integer Capacity;

    public Integer getCapacityNo() {
		return CapacityNo;
	}

	public void setCapacityNo(Integer capacityNo) {
		CapacityNo = capacityNo;
	}

	public Integer getCapacity() {
		return Capacity;
	}

	public void setCapacity(Integer capacity) {
		Capacity = capacity;
	}

	// Default constructor
    public VehicleCapacity() {
    }
}