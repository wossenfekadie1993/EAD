package com.admin.employeemanagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.admin.employeemanagement.model.Employee;

public class EmployeeDAO {

    private String URL = "jdbc:mysql://localhost:3306/employeemanagementsystem?useSSL=false";
    private String userName = "root";
    private String Password = "";

    private static final String INSERT_EMPLOYEES_SQL = "INSERT INTO employees (name, designation, salary) VALUES (?, ?, ?);";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT id, name, designation, salary FROM employees WHERE id =?";
    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM employees";
    private static final String DELETE_EMPLOYEES_SQL = "DELETE FROM employees WHERE id = ?;";
    private static final String UPDATE_EMPLOYEES_SQL = "UPDATE employees SET name = ?, designation = ?, salary = ? WHERE id = ?;";

    public EmployeeDAO() {
    }

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, userName, Password);
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver not found", e);
        }
    }

    public void insertEmployee(Employee employee) throws SQLException {
        System.out.println(INSERT_EMPLOYEES_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEES_SQL)) {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDesignation());
            preparedStatement.setString(3, employee.getSalary());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
    }

    public Employee selectEmployee(int id) {
        Employee employee = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    String name = rs.getString("name");
                    String designation = rs.getString("designation");
                    String salary = rs.getString("salary");
                    employee = new Employee(id, name, designation, salary);
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employee;
    }

    public List<Employee> selectAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEES);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String designation = rs.getString("designation");
                String salary = rs.getString("salary");
                employees.add(new Employee(id, name, designation, salary));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employees;
    }

    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEES_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    
    
    public boolean updateEmployee(Employee employee) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_EMPLOYEES_SQL)) {
        	System.out.println("updated Employee:"+statement);
            statement.setString(1, employee.getName());
            statement.setString(2, employee.getDesignation());
            statement.setString(3, employee.getSalary());
            statement.setInt(4, employee.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
