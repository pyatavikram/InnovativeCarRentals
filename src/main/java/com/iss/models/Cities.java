package com.iss.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Cities")
public class Cities {

    @Id
    @GeneratedValue
    private int cityNo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "StateNo")
    private States state;

    private String cityName;

    public Cities() {

    }

    public Cities(int cityNo, States state, String cityName) {
        this.cityNo = cityNo;
        this.state = state;
        this.cityName = cityName;
    }

    public int getCityNo() {
        return cityNo;
    }

    public void setCityNo(int cityNo) {
        this.cityNo = cityNo;
    }

    public States getState() {
        return state;
    }

    public void setState(States state) {
        this.state = state;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    @Override
    public String toString() {
        return "Cities{" +
                "cityNo=" + cityNo +
                ", state=" + state.getStateName() +
                ", cityName='" + cityName + '\'' +
                '}';
    }
}
