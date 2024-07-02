package com.example.lab9.task5;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

public class Servlet1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = "get";
        request.setAttribute("name","get");
        request.getRequestDispatcher("Servlet2").forward(request, response);
        //response.sendRedirect("Servlet2?name=" + name);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("name","post");
        request.getRequestDispatcher("Servlet2").forward(request, response);
    }
}
