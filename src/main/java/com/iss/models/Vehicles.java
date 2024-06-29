package com.iss.models;
import javax.persistence.*;

@Entity
public class Vehicles
{

    @Id
    @Column(nullable=false,length=11)
    @GeneratedValue
    private Integer VehicleNo;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "OwnerNo", referencedColumnName = "OwnerNo",nullable=false)
    private Owners owner;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ModelNo", referencedColumnName = "ModelNo",nullable=false)
    private VehicleModels vehiclemodels;

    @Column(nullable=false,length=40)
    private String Type;
    
    @Column(nullable=false,length=11)
    private Integer Year;
    
    @Column(nullable=false,length=40)
    private String Color;
    
    @Column(nullable=false,length=20)
    private String Fuel;
    
    @Column(nullable=false,length=5)
    private Integer Capacity;
    
    @Column(nullable=false,length=10)
    private Integer Mileage;
    
    @Lob
    @Column(nullable=true)
    private byte[] Picture;
    
    @Column(nullable=false,length=20)
    private String RegistrationNumber;
    
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="RegistrationState",referencedColumnName="StateNo",nullable=false)
    private States state;
    
    @Column(nullable=false,length=25)
    private String ChaisisNumber;
    
    @Column(nullable=false,length=10)
    private Integer DailyRate;
    
    @Column(nullable=true,length=10)
    private Integer HourlyRate;
    
    @Column(nullable=true,length=10)
    private Integer AdditionalDailyRate;
    
    @Column(nullable=true,length=10)
    private Integer AdditionalHourlyRate;
    
    @Column(nullable=true,length=2)
    private String DeleteStatus;

	public Integer getVehicleNo() {
		return VehicleNo;
	}

	public void setVehicleNo(Integer vehicleNo) {
		VehicleNo = vehicleNo;
	}

	public Owners getOwner() {
		return owner;
	}

	public void setOwner(Owners owner) {
		this.owner = owner;
	}

	public VehicleModels getVehiclemodels() {
		return vehiclemodels;
	}

	public void setVehiclemodels(VehicleModels vehiclemodels) {
		this.vehiclemodels = vehiclemodels;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public Integer getYear() {
		return Year;
	}

	public void setYear(Integer year) {
		Year = year;
	}

	public String getColor() {
		return Color;
	}

	public void setColor(String color) {
		Color = color;
	}

	public String getFuel() {
		return Fuel;
	}

	public void setFuel(String fuel) {
		Fuel = fuel;
	}

	public Integer getCapacity() {
		return Capacity;
	}

	public void setCapacity(Integer capacity) {
		Capacity = capacity;
	}

	public Integer getMileage() {
		return Mileage;
	}

	public void setMileage(Integer mileage) {
		Mileage = mileage;
	}

	public byte[] getPicture() {
		return Picture;
	}

	public void setPicture(byte[] picture) {
		Picture = picture;
	}

	public String getRegistrationNumber() {
		return RegistrationNumber;
	}

	public void setRegistrationNumber(String registrationNumber) {
		RegistrationNumber = registrationNumber;
	}

	public States getState() {
		return state;
	}

	public void setState(States state) {
		this.state = state;
	}

	public String getChaisisNumber() {
		return ChaisisNumber;
	}

	public void setChaisisNumber(String chaisisNumber) {
		ChaisisNumber = chaisisNumber;
	}

	public Integer getDailyRate() {
		return DailyRate;
	}

	public void setDailyRate(Integer dailyRate) {
		DailyRate = dailyRate;
	}

	public Integer getHourlyRate() {
		return HourlyRate;
	}

	public void setHourlyRate(Integer hourlyRate) {
		HourlyRate = hourlyRate;
	}

	public Integer getAdditionalDailyRate() {
		return AdditionalDailyRate;
	}

	public void setAdditionalDailyRate(Integer additionalDailyRate) {
		AdditionalDailyRate = additionalDailyRate;
	}

	public Integer getAdditionalHourlyRate() {
		return AdditionalHourlyRate;
	}

	public void setAdditionalHourlyRate(Integer additionalHourlyRate) {
		AdditionalHourlyRate = additionalHourlyRate;
	}

	public String getDeleteStatus() {
		return DeleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		DeleteStatus = deleteStatus;
	}
}