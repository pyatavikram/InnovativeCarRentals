package com.iss.JasperReportsBeans;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.util.JRSaver;
import net.sf.jasperreports.view.JasperViewer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.iss.JasperReportsBeans.*;
@SuppressWarnings("unused")
public class JasperTrial {

    public static void main(String[] args) {
        try {
        	String jrxmlPath = "C:\\Users\\bpvan\\JaspersoftWorkspace\\Invoice\\Invoice.jrxml";
            String jasperPath = "C:\\Users\\bpvan\\JaspersoftWorkspace\\Invoice\\Invoice.jasper";
            JasperReport jasperReport1 = JasperCompileManager.compileReport(jrxmlPath);
            JasperReport jasperReport2= (JasperReport) JRLoader.loadObjectFromFile(jasperPath);
            
           
            List<JasperDemo> list=new ArrayList<JasperDemo>();
            list.add(new JasperDemo("BMW","GEN1","BLUE","BEAUTY","NENA",24,23.9,42.35,324.534));

            
            JRBeanCollectionDataSource datasource=new JRBeanCollectionDataSource(list);
            
            Map<String, Object> parameters = new HashMap<>();
            parameters.put("TABLE_DATA_SOURCE", datasource);
            
           /* String dbUrl = "jdbc:sqlserver://DESKTOP-OO3ORCC\\SQLEXPRESS;databaseName=carrentalsystemproject;trustServerCertificate=true";
            String username = "sa";
            String password = "samsungs20fe";
            Connection conn = DriverManager.getConnection(dbUrl, username, password);*/

           
            
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport2, parameters, datasource);

            // View the report (optional)
            JasperViewer.viewReport(jasperPrint);

            // Export the report to PDF (optional)
            String outputFilePath = "\"C:\\Users\\bpvan\\Downloads\\invoice.pdf";
            JasperExportManager.exportReportToPdfFile(jasperPrint, outputFilePath);

            System.out.println("Report generated successfully.");

        } catch (JRException e) {
            e.printStackTrace();
        }
    }
}