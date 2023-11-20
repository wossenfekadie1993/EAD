package com.itsc;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MultiplicationServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		try {
		    int num1 = Integer.parseInt(request.getParameter("num1"));
		    int num2 = Integer.parseInt(request.getParameter("num2"));

		    // Perform addition
		    int result = num1 * num2;

		    response.getWriter().print("Multiplication Result: " + result);
		} catch (NumberFormatException e) {
		    response.getWriter().print("Invalid input. Please enter valid numbers.");
		}

    }


}
