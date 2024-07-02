package com.example.lab9.task6;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Servlet2_2", value = "/Servlet2_2")
public class Servlet2_2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = (String) request.getAttribute("name1");
        String greeting = "Hello, " + name;
        request.setAttribute("name2", greeting);
    }
}
