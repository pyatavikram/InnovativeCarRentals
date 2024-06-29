package com.iss.test;

import com.iss.models.*;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.time.LocalDate;

public class Main {

    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();

        // Create instances of entity classes
        Countries country = new Countries();
        country.setCountry("India");

        States state = new States();
        state.setCountry(country);
        state.setStateName("Tamil Nadu");

        Cities city = new Cities();
        city.setState(state);
        

        Owners owner = new Owners();
        owner.setName("Vikram Kumar");
        owner.setAddress1("456 Marina Beach Road");
        owner.setCity(city);
        owner.setCountry(country);
        owner.setPhoneNumber("9876543210");
        owner.setMobileNumber("8765432109");
        owner.setBankName("SBI");
        owner.setBankAccount("987654321098");
        owner.setPAN("ABCDE6789F");

        VehicleMakes vehicleMake = new VehicleMakes();
        vehicleMake.setName("Maruti Suzuki");

        VehicleModels vehicleModel = new VehicleModels();
        vehicleModel.setVehicleMakes(vehicleMake);
        vehicleModel.setName("Swift");

        Vehicles vehicle = new Vehicles();
        vehicle.setOwner(owner);
        vehicle.setVehiclemodels(vehicleModel);
        vehicle.setType("Hatchback");
        vehicle.setYear(2021);
        vehicle.setColor("Blue");
        vehicle.setFuel("Petrol");
        vehicle.setCapacity(5);
        vehicle.setMileage(20);
        vehicle.setRegistrationNumber("TN01AB1234");
        vehicle.setState(state);
        vehicle.setChaisisNumber("MA3EHKD1S00123456"); // Set ChaisisNumber
        vehicle.setDailyRate(1500);
        vehicle.setHourlyRate(200);
        vehicle.setAdditionalDailyRate(1600);
        vehicle.setAdditionalHourlyRate(220);
        vehicle.setDeleteStatus("N");

        VehicleTypes vehicleType = new VehicleTypes();
        vehicleType.setType("Hatchback");

        Rentals rental = new Rentals();
        Customers customer = new Customers();
        customer.setCustomerNo(1);  // Assuming this is a valid customer ID
        rental.setCustomer(customer); // Populate Customers entity
        rental.setVehicle(vehicle);
        rental.setReservationDate(LocalDate.now());
        rental.setVehicleRate(1500);
        rental.setStartDate(LocalDate.now());
        rental.setEndDate(LocalDate.now().plusDays(2));
        rental.setSourceLocation(city);
        rental.setDestinationLocation(city);
        rental.setTravelPurpose("Business Trip");

        try {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();

            // Persist entities
            em.persist(country);
            em.persist(state);
            em.persist(city);
            em.persist(owner);
            em.persist(vehicleMake);
            em.persist(vehicleModel);
            em.persist(vehicle);
            em.persist(vehicleType);
            em.persist(rental);

            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
            emf.close();
        }
    }
}
