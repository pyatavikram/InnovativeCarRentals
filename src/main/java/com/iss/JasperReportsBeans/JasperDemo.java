package com.iss.JasperReportsBeans;

import java.sql.Time;

public class JasperDemo {

	
	private String Make,Model,Color,VIN,CarMake;
	private Integer MilesDriven;
	private java.sql.Time Duration;
	private Double Rate,Total,SubTotal;
	public JasperDemo() {
		super();
	}
	public JasperDemo(String make, String model, String color, String vIN, String carMake, Integer milesDriven,
			 Double rate, Double total, Double subTotal) {
		Make = make;
		Model = model;
		Color = color;
		VIN = vIN;
		CarMake = carMake;
		MilesDriven = milesDriven;
		Duration = null;
		Rate = rate;
		Total = total;
		SubTotal = subTotal;
	}
	public String getMake() {
		return Make;
	}
	public void setMake(String make) {
		Make = make;
	}
	public String getModel() {
		return Model;
	}
	public void setModel(String model) {
		Model = model;
	}
	public String getColor() {
		return Color;
	}
	public void setColor(String color) {
		Color = color;
	}
	public String getVIN() {
		return VIN;
	}
	public void setVIN(String vIN) {
		VIN = vIN;
	}
	public String getCarMake() {
		return CarMake;
	}
	public void setCarMake(String carMake) {
		CarMake = carMake;
	}
	public Integer getMilesDriven() {
		return MilesDriven;
	}
	public void setMilesDriven(Integer milesDriven) {
		MilesDriven = milesDriven;
	}
	public java.sql.Time getDuration() {
		return Duration;
	}
	public void setDuration(java.sql.Time duration) {
		Duration = duration;
	}
	public Double getRate() {
		return Rate;
	}
	public void setRate(Double rate) {
		Rate = rate;
	}
	public Double getTotal() {
		return Total;
	}
	public void setTotal(Double total) {
		Total = total;
	}
	public Double getSubTotal() {
		return SubTotal;
	}
	public void setSubTotal(Double subTotal) {
		SubTotal = subTotal;
	}

}
