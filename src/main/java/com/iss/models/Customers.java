package com.iss.models;
import javax.persistence.*;
import java.time.*;

@Entity
public class Customers
{

    @Id
    @Column(nullable=false,length=11)
    @GeneratedValue
    private Integer CustomerNo;
    
    @Column(nullable=false,length=40)
    private String Name;
    
    @Column(nullable=false,length=40,unique=true)
    private String EmailAddress;
    
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
   
    @Column(nullable=true)
    private LocalDate RegistrationDate;
    
    @Column(nullable=false,length=20,unique=true)
    private String Username;
    
    @Column(nullable=false,length=10)
    private String Password;
    
    @Column(nullable=true)
    private LocalDate LastLogin;
    
    @Column(nullable=true,length=2)
    private String DeleteStatus;

	public Integer getCustomerNo() {
		return CustomerNo;
	}

	public void setCustomerNo(Integer customerNo) {
		CustomerNo = customerNo;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmailAddress() {
		return EmailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		EmailAddress = emailAddress;
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

	public LocalDate getRegistrationDate() {
		return RegistrationDate;
	}

	public void setRegistrationDate(LocalDate registrationDate) {
		RegistrationDate = registrationDate;
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

	public LocalDate getLastLogin() {
		return LastLogin;
	}

	public void setLastLogin(LocalDate lastLogin) {
		LastLogin = lastLogin;
	}

	public String getDeleteStatus() {
		return DeleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		DeleteStatus = deleteStatus;
	}
    
    
    
}
