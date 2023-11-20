package com.admin.employeemanagement.web;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.admin.employeemanagement.dao.EmployeeDAO;
import com.admin.employeemanagement.model.Employee;


public class EmployeeSrvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeDAO employeeDAO;
	
	public void init() {
		employeeDAO = new EmployeeDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertEmployee(request, response);
				break;
			case "/delete":
				deleteEmployee(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateEmployee(request, response);
				break;
			case "/list":
				listEmployee(request, response);
				break;
			default:
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	


	private void listEmployee(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, IOException, ServletException {
	    List<Employee> listEmployee = employeeDAO.selectAllEmployees();
	    request.setAttribute("listEmployee", listEmployee);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("ViewEmployee.jsp");
	    dispatcher.forward(request, response);
	}


	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("AddEmployee.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, ServletException, IOException {
	    int id = Integer.parseInt(request.getParameter("id"));
	    Employee existingEmployee = employeeDAO.selectEmployee(id);
	    request.setAttribute("employee", existingEmployee);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("AddEmployee.jsp");
	    dispatcher.forward(request, response);
	}




	private void insertEmployee(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String name = request.getParameter("name");
		String designation = request.getParameter("designation");
		String salary = request.getParameter("salary");
		Employee newEmployee = new Employee(name, designation, salary);
		employeeDAO.insertEmployee(newEmployee);
		response.sendRedirect("list");
	}

	private void updateEmployee(HttpServletRequest request, HttpServletResponse response) 
	        throws SQLException, IOException {
	    int id = Integer.parseInt(request.getParameter("id"));
	    String name = request.getParameter("name");
	    String designation = request.getParameter("designation");
	    String salary = request.getParameter("salary");
	    Employee book = new Employee(id, name, designation, salary);
	    employeeDAO.updateEmployee(book);
	    response.sendRedirect("list");
	}


	
	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		employeeDAO.deleteEmployee(id);
		response.sendRedirect("list");

	}

}