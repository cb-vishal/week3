/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author cb-vishal
 */
public class DBOperation {

    private static Connection connect() throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/directory", "root", "root");

        return con;
    }

    public static void insertRecords(List<Contact> records) throws ClassNotFoundException, SQLException {

        Connection con = connect();
        //  Connection con1=connect();
        PreparedStatement stmt = con.prepareStatement("insert into persons values(?,?,?)");
        PreparedStatement stmt2 = con.prepareStatement("insert into person_contact values(?,?,?)");
        Iterator it = records.iterator();
        int i = 1;
        while (it.hasNext()) {
            Contact obj = (Contact) it.next();

            stmt.setInt(1, i);
            stmt.setString(2, obj.getname());
            stmt.setString(3, obj.getAdd());
            
            int j = stmt.executeUpdate();
            if (!obj.getMobile().equals("")) {
                stmt2.setString(1, obj.getMobile());
                stmt2.setString(2, "Mobile");
                stmt2.setInt(3, i);
                stmt2.executeUpdate();
            }
            if (!obj.getHome().equals("")) {
                stmt2.setString(1, obj.getHome());
                stmt2.setString(2, "Home");
                stmt2.setInt(3, i);
                stmt2.executeUpdate();
            }
            if (!obj.getWork().equals("")) {
                stmt2.setString(1, obj.getWork());
                stmt2.setString(2, "Work");
                stmt2.setInt(3, i);

                stmt2.executeUpdate();
            }
            System.out.println(j + " records inserted");
            i++;
        }
        
        con.close();

    }

    public static void searchName(String name) throws SQLException, ClassNotFoundException {
        Connection con = DBOperation.connect();

        PreparedStatement stmt = con.prepareStatement("select * from persons");
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            if (rs.getString(2).equals(name)) {

                Contact obj = new Contact();
                obj.setName(rs.getString(2));
                obj.setAdd(rs.getString(3));
                getRecord(rs.getInt(1), obj);
            }
        }
        con.close();

    }

    public static void searchPhone(String phone) throws ClassNotFoundException, SQLException {
        Connection con = connect();
        PreparedStatement stmt = con.prepareStatement("select * from person_contact");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            if (rs.getString(1).equals(phone)) {
                PreparedStatement stmt2 = con.prepareStatement("select * from persons where id=" + rs.getInt(3) + "");
                ResultSet rs2 = stmt2.executeQuery();
                rs2.next();
                Contact obj = new Contact();
                obj.setName(rs2.getString(2));
                obj.setAdd(rs2.getString(3));
                getRecord(rs2.getInt(1), obj);
                con.close();
                return;
            }
        }
        con.close();
        System.out.println("Record not found!!!!!!!");
    }

    public static void addRecord(Contact record) throws ClassNotFoundException, SQLException {

        String sql1 = "INSERT INTO persons (name, address) VALUES (?, ?)";
        String sql2 = "insert into person_contact values(?,?,?)";
        Connection con = connect();
        PreparedStatement stmt1 = con.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
        PreparedStatement stmt2 = con.prepareStatement(sql2);

        stmt1.setString(1, record.getname());
        stmt1.setString(2, record.getAdd());
        stmt1.executeUpdate();
        ResultSet rs = stmt1.getGeneratedKeys();
        rs.next();
        int id = rs.getInt(1);

        if (!record.getMobile().equals("")) {
            stmt2.setString(1, record.getMobile());
            stmt2.setString(2, "Mobile");
            stmt2.setInt(3, id);
            stmt2.executeUpdate();
        }
        if (!record.getHome().equals("")) {
            stmt2.setString(1, record.getHome());
            stmt2.setString(2, "Home");
            stmt2.setInt(3, id);
            stmt2.executeUpdate();
        }
        if (!record.getWork().equals("")) {
            stmt2.setString(1, record.getWork());
            stmt2.setString(2, "Work");
            stmt2.setInt(3, id);

            stmt2.executeUpdate();
        }
        con.close();

    }

    public static void updateRecord(String newValue, int col_no, int recordNo) throws ClassNotFoundException, SQLException {
        Connection con = connect();
        PreparedStatement stmt;
        if (col_no == 1) {
            stmt = con.prepareStatement("update persons set name=? where id=?");
        } else if (col_no == 2) {
            stmt = con.prepareStatement("update persons set add=? where id=?");
        } else if (col_no == 3) {
            stmt = con.prepareStatement("update person_contact set contact_no=? where type='Mobile' and person_id=?");
        } else if (col_no == 4) {
            stmt = con.prepareStatement("update person_contact set contact_no=? where type='Home' and person_id=?");
        } else {
            stmt = con.prepareStatement("update person_contact set contact_no=? where type='Work' and person_id=?");
        }
        stmt.setString(1, newValue);
        stmt.setInt(2, recordNo);

        int i = stmt.executeUpdate();
        if(i>0)
        System.out.println(" records updated");
        else
            System.out.println("Record not found!!!!");

    }

    private static void getRecord(int id, Contact obj) throws ClassNotFoundException, SQLException {
        Connection con = connect();
        PreparedStatement stmt = con.prepareStatement("select * from person_contact where person_id=" + id + "");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            if (rs.getString(2).equals("Mobile")) {
                obj.setMobile(rs.getString(1));
            }
            if (rs.getString(2).equals("Home")) {
                obj.setHome(rs.getString(1));
            }
            if (rs.getString(2).equals("Work")) {
                obj.setWork(rs.getString(1));
            }

        }
        con.close();
        System.out.println(obj.toString());
    }

}
