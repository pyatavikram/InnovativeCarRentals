package com.iss.models;
import javax.persistence.*;

@Entity
public class VehicleTypes
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable=false, length=11)
    private Integer TypeNo;

    @Column(nullable=true,length=40)
    private String Type;

    public Integer getTypeNo() {
		return TypeNo;
	}

	public void setTypeNo(Integer typeNo) {
		TypeNo = typeNo;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	// Default constructor
    public VehicleTypes() {
    }
}