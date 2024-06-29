package com.iss.models;
import javax.persistence.*;
import java.time.*;

@Entity
public class Rentals
{

    @Id
    @Column(nullable=false,length=11)
    @GeneratedValue
    private Integer RentalNo;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="CustomerNo",referencedColumnName="CustomerNo",nullable=false)
    private Customers customer;
   
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="VehicleNo" ,referencedColumnName="VehicleNo",nullable=true)
    private Vehicles vehicle;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "DriverNo", referencedColumnName = "DriverNo",nullable=true)
    private Drivers driver;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EmployeeNo", referencedColumnName = "EmployeeNo",nullable=true)
    private Employees employee;
    
    @Column(nullable=false)
    private LocalDate ReservationDate;
    
    @Column(nullable=false,length=10)
    private Integer VehicleRate;
    
    @Column(nullable=true,length=10)
    private Integer NoOfDays;
    
    @Column(nullable=false)
    private LocalDate StartDate;
    
    @Column(nullable=false)
    private LocalDate EndDate;
    
    @Column(nullable=true,length=10)
    private Integer NoOfKMS;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="StartKMS",referencedColumnName="StateNo",nullable=true)
    private States state;

    @Column(nullable=true,length=10)
    private Integer EndKMS;
    
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="SourceLocation",referencedColumnName="CityNo",nullable=true)
    private Cities sourceLocation;
    
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "DestinationLocation", referencedColumnName = "CityNo", nullable = false)
    private Cities destinationLocation;
    
    
    @Column(nullable=true,length=255)
    private String TravelPurpose;
    
    public Integer getRentalNo() {
		return RentalNo;
	}

	public void setRentalNo(Integer rentalNo) {
		RentalNo = rentalNo;
	}

	public Customers getCustomer() {
		return customer;
	}

	public void setCustomer(Customers customer) {
		this.customer = customer;
	}

	public Vehicles getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicles vehicle) {
		this.vehicle = vehicle;
	}

	public Drivers getDriver() {
		return driver;
	}

	public void setDriver(Drivers driver) {
		this.driver = driver;
	}

	public Employees getEmployee() {
		return employee;
	}

	public void setEmployee(Employees employee) {
		this.employee = employee;
	}

	public LocalDate getReservationDate() {
		return ReservationDate;
	}

	public void setReservationDate(LocalDate reservationDate) {
		ReservationDate = reservationDate;
	}

	public Integer getVehicleRate() {
		return VehicleRate;
	}

	public void setVehicleRate(Integer vehicleRate) {
		VehicleRate = vehicleRate;
	}

	public Integer getNoOfDays() {
		return NoOfDays;
	}

	public void setNoOfDays(Integer noOfDays) {
		NoOfDays = noOfDays;
	}

	public LocalDate getStartDate() {
		return StartDate;
	}

	public void setStartDate(LocalDate startDate) {
		StartDate = startDate;
	}

	public LocalDate getEndDate() {
		return EndDate;
	}

	public void setEndDate(LocalDate endDate) {
		EndDate = endDate;
	}

	public Integer getNoOfKMS() {
		return NoOfKMS;
	}

	public void setNoOfKMS(Integer noOfKMS) {
		NoOfKMS = noOfKMS;
	}

	public States getState() {
		return state;
	}

	public void setState(States state) {
		this.state = state;
	}

	public Integer getEndKMS() {
		return EndKMS;
	}

	public void setEndKMS(Integer endKMS) {
		EndKMS = endKMS;
	}

	public Cities getSourceLocation() {
		return sourceLocation;
	}

	public void setSourceLocation(Cities sourceLocation) {
		this.sourceLocation = sourceLocation;
	}

	public Cities getDestinationLocation() {
		return destinationLocation;
	}

	public void setDestinationLocation(Cities destinationLocation) {
		this.destinationLocation = destinationLocation;
	}

	public String getTravelPurpose() {
		return TravelPurpose;
	}

	public void setTravelPurpose(String travelPurpose) {
		TravelPurpose = travelPurpose;
	}

	public Integer getAmount() {
		return Amount;
	}

	public void setAmount(Integer amount) {
		Amount = amount;
	}

	public String getTransactionNumber() {
		return TransactionNumber;
	}

	public void setTransactionNumber(String transactionNumber) {
		TransactionNumber = transactionNumber;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	@Column(nullable=true,length=12)
    private Integer Amount;
    
    @Column(nullable=true,length=50)
    private String TransactionNumber;

    @Column(nullable=true,length=10)
    private String Status;
}
