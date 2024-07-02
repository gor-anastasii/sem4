package com.example.lab9.task6;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet1_1", value = "/Servlet1_1")
public class Servlet1_1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        request.setAttribute("name1", name);
        request.getRequestDispatcher("/Servlet2_2").include(request, response);
        String name2 = (String)request.getAttribute("name2");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h2>" + name2 + "</h2>");
        out.println("</body></html>");
        out.close();
    }
}
