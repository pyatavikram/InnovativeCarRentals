package com.iss.models;
import javax.persistence.*;

@Entity
public class EmployeeTypes
{

    @Id
    @Column(nullable=false,length=11)
    @GeneratedValue
    private Integer EmployeeTypesNo;
    
    
    @Column(nullable=true,length=40)
    private String Type;


	public Integer getEmployeeTypesNo() {
		return EmployeeTypesNo;
	}


	public void setEmployeeTypesNo(Integer employeeTypesNo) {
		EmployeeTypesNo = employeeTypesNo;
	}


	public String getType() {
		return Type;
	}


	public void setType(String type) {
		Type = type;
	}
    
    
    
    
}
