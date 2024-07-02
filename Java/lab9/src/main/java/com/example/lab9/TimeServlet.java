package com.example.lab9;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.Date;
import java.util.Enumeration;

@WebServlet(name="TimeServlet", value = "/TimeServlet")
public class TimeServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Вывод текущего времени
        out.println("<html><body>");
        out.println("<h2>Current Time:</h2>");
        out.println("<p>" + new Date() + "</p>");

        // Информация о запросе
        out.println("<h2>Request Information:</h2>");
        out.println("<p>Protocol: " + request.getProtocol() + "</p>");
        out.println("<p>Client IP Address: " + request.getRemoteAddr() + "</p>");
        out.println("<p>Client Host: " + request.getRemoteHost() + "</p>");
        out.println("<p>Request Method: " + request.getMethod() + "</p>");
        out.println("<p>Request URL: " + request.getRequestURL() + "</p>");

        // Заголовки запроса
        out.println("<h2>Request Headers:</h2>");
        out.println("<ul>");
        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String headerName = headerNames.nextElement();
            String headerValue = request.getHeader(headerName);
            out.println("<li>" + headerName + ": " + headerValue + "</li>");
        }
        out.println("</ul>");

        out.println("</body></html>");
        out.close();
    }
}