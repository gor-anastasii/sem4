package com.example.lab9.task2;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

public class DateBase {

    private String url = "jdbc:mysql://localhost:3306/java";
    private String login = "root";
    private String password = "Mtu57-jiop";
    private Connection con;
    private Statement statement;

    public Boolean getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, login, password);
            statement = con.createStatement();
            return true;
        }
        catch(Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public ResultSet ExecuteQuery(String sqlQuery) {
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlQuery);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet;
        }
        catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public void addUser(String login, String password, String status) throws SQLException {
        String query = "insert into status (name, password, status) values (?, ?, ?)";
        PreparedStatement statement = con.prepareStatement(query);
        statement.setString(1, login);
        statement.setBytes(2, getHash(password));
        statement.setString(3, status);
        statement.executeUpdate();
        statement.close();
    }

    public ResultSet checkUser(String login, String password) throws SQLException {
        PreparedStatement statement = con.prepareStatement("select * from status where name = ? and password = ?");
        statement.setString(1, login);
        statement.setBytes(2, getHash(password));
        return statement.executeQuery();
    }

    public ResultSet checkUsersCount(String login, String password) throws SQLException {
        PreparedStatement statement = con.prepareStatement(
                "select count(*) as 'count' from status where name = ? and password = ?");
        statement.setString(1, login);
        statement.setBytes(2, getHash(password));
        return statement.executeQuery();
    }
    public void closeConnection()
    {
        try {
            con.close();
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static byte[] getHash(String passStr) {
        MessageDigest digest = null;
        byte[] hash = null;
        try {
            digest = MessageDigest.getInstance("MD5");
            digest.reset();
            hash = digest.digest(passStr.getBytes("UTF-8"));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return hash;
    }


}
