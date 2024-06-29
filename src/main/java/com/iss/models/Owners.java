package com.iss.models;
import javax.persistence.*;

@Entity
public class Owners
{

    @Id
    @Column(nullable=false,length=11)
    @GeneratedValue
    private Integer OwnerNo;

    @Column(nullable=false,length=40)
    private String Name;
    
    @Column(nullable=true,length=100)
    private String Address1;
    
    @Column(nullable=true,length=5)
    private String Address2;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CityNo", referencedColumnName = "CityNo",nullable=true)
    private Cities city;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "StateNo", referencedColumnName = "StateNo",nullable=true)
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
    
    @Column(nullable=false,length=40)
    private String BankName;
    
    @Column(nullable=false,length=15)
    private String BankAccount;
    
    @Column(nullable=false,length=20)
    private String PAN;
    
    @Column(nullable=true, length=2)
    private String DeleteStatus;

	public Integer getOwnerNo() {
		return OwnerNo;
	}

	public void setOwnerNo(Integer ownerNo) {
		OwnerNo = ownerNo;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getAddress1() {
		return Address1;
	}

	public void setAddress1(String address1) {
		Address1 = address1;
	}

	public String getAddress2() {
		return Address2;
	}

	public void setAddress2(String address2) {
		Address2 = address2;
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

	public String getDeleteStatus() {
		return DeleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		DeleteStatus = deleteStatus;
	}
    
    
}
