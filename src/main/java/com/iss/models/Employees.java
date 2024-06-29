package com.iss.models;
import javax.persistence.*;
import java.time.*;

@Entity
public class Employees
{

    @Id
    @Column(nullable=false,length=11)
    @GeneratedValue
    private Integer EmployeeNo;
    
    @Column(nullable=false,length=40)
    private String Name;
    
    @Column(nullable=false,length=40)
    private String EmployeeType;
    
    @Column(nullable=true,length=100)
    private String AddressLine1;
    
    @Column(nullable=true,length=100)
    private String AddressLine2;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="CityNo" ,referencedColumnName="CityNo",nullable=true)
    private Cities city;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "StateNo", referencedColumnName = "StateNo",nullable=false)
    private States state;
    
    @Column(nullable=true,length=15)
    private String Pincode;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CountryNo", referencedColumnName = "CountryNo",nullable=true)
    private Countries country;
    
    @Column(nullable=true,length=15)
    private String PhoneNumber;
    
    @Column(nullable=true,length=15)
    private String MobileNumber;
    
    @Column(nullable = false, length = 75, unique = true)
    private String EmailAddress;
    
    @Column(nullable=true,length=40)
    private String BankName;
    
    @Column(nullable=true,length=20)
    private String BankAccount;
    
    @Column(nullable=false,length=20)
    private String PAN;
    
    @Column(nullable=false,length=20,unique=true)
    private String Username;
    
    @Column(nullable=false,length=10)
    private String Password;
    
    @Column(nullable=true,length=5)
    private String Cities;
    
    @Column(nullable=true,length=5)
    private String States;
    
    @Column(nullable=true,length=5)
    private String Countries;
    
    @Column(nullable=true,length=5)
    private String Vehicles;
    
    @Column(nullable=true,length=5)
    private String VehicleMakes;
    
    @Column(nullable=true,length=5)
    private String VehicleModels;
    
    @Column(nullable=true,length=5)
    private String Employees;
    
    @Column(nullable=true,length=5)
    private String Customers;
    
    @Column(nullable=true,length=5)
    private String Owners;
    
    @Column(nullable=true,length=5)
    private String Drivers;
    
    @Column(nullable=true,length=5)
    private String Rentals;
    
    @Column(nullable=true)
    private LocalDate LastLogin;
    
    @Column(nullable=true,length=10)
    private String Status;
    
    @Column(nullable=true,length=2)
    private String DeleteStatus;

	public Integer getEmployeeNo() {
		return EmployeeNo;
	}

	public void setEmployeeNo(Integer employeeNo) {
		EmployeeNo = employeeNo;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmployeeType() {
		return EmployeeType;
	}

	public void setEmployeeType(String employeeType) {
		EmployeeType = employeeType;
	}

	public String getAddressLine1() {
		return AddressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		AddressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return AddressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		AddressLine2 = addressLine2;
	}

	public Cities getCity() {
		return city;
	}

	public void setCity(Cities city) {
		this.city = city;
	}

	public States getState() {
		return state;
	}

	public void setState(States state) {
		this.state = state;
	}

	public String getPincode() {
		return Pincode;
	}

	public void setPincode(String pincode) {
		Pincode = pincode;
	}

	public Countries getCountry() {
		return country;
	}

	public void setCountry(Countries country) {
		this.country = country;
	}

	public String getPhoneNumber() {
		return PhoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}

	public String getMobileNumber() {
		return MobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		MobileNumber = mobileNumber;
	}

	public String getEmailAddress() {
		return EmailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		EmailAddress = emailAddress;
	}

	public String getBankName() {
		return BankName;
	}

	public void setBankName(String bankName) {
		BankName = bankName;
	}

	public String getBankAccount() {
		return BankAccount;
	}

	public void setBankAccount(String bankAccount) {
		BankAccount = bankAccount;
	}

	public String getPAN() {
		return PAN;
	}

	public void setPAN(String pAN) {
		PAN = pAN;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getCities() {
		return Cities;
	}

	public void setCities(String cities) {
		Cities = cities;
	}

	public String getStates() {
		return States;
	}

	public void setStates(String states) {
		States = states;
	}

	public String getCountries() {
		return Countries;
	}

	public void setCountries(String countries) {
		Countries = countries;
	}

	public String getVehicles() {
		return Vehicles;
	}

	public void setVehicles(String vehicles) {
		Vehicles = vehicles;
	}

	public String getVehicleMakes() {
		return VehicleMakes;
	}

	public void setVehicleMakes(String vehicleMakes) {
		VehicleMakes = vehicleMakes;
	}

	public String getVehicleModels() {
		return VehicleModels;
	}

	public void setVehicleModels(String vehicleModels) {
		VehicleModels = vehicleModels;
	}

	public String getEmployees() {
		return Employees;
	}

	public void setEmployees(String employees) {
		Employees = employees;
	}

	public String getCustomers() {
		return Customers;
	}

	public void setCustomers(String customers) {
		Customers = customers;
	}

	public String getOwners() {
		return Owners;
	}

	public void setOwners(String owners) {
		Owners = owners;
	}

	public String getDrivers() {
		return Drivers;
	}

	public void setDrivers(String drivers) {
		Drivers = drivers;
	}

	public String getRentals() {
		return Rentals;
	}

	public void setRentals(String rentals) {
		Rentals = rentals;
	}

	public LocalDate getLastLogin() {
		return LastLogin;
	}

	public void setLastLogin(LocalDate lastLogin) {
		LastLogin = lastLogin;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getDeleteStatus() {
		return DeleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		DeleteStatus = deleteStatus;
	}
    
    
    
}
