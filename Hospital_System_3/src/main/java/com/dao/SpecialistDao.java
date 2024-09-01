package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

public class SpecialistDao {

    private Connection conn;

    public SpecialistDao(Connection conn) {
        this.conn = conn;
    }

    public boolean addSpecialist(String spec) {
        boolean isSuccess = false;
        try {
            String sql = "INSERT INTO specialist(spec_name) VALUES(?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, spec);

            int result = ps.executeUpdate();
            if (result > 0) {
                isSuccess = true; // Set to true if insertion is successful
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public List<Specialist> getAllSpecialists() {
    	List<Specialist> list = new ArrayList<Specialist>();

           Specialist specialist = null;

        try {
            String sql = "SELECT * FROM specialist";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                specialist = new Specialist();
                specialist.setId(rs.getInt("id"));
                specialist.setSpecialistName(rs.getString("spec_name"));
                list.add(specialist);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
