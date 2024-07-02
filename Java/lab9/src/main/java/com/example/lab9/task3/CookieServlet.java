package com.example.lab9.task3;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CookieServlet", value = "/CookieServlet")
public class CookieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String cookieLoginName = "login";
        String cookieStatusName = "status";
        String cookieLastVisit = "lastVisit";
        String cookieCount = "count";
        Cookie cookieLogin = null;
        Cookie cookieStatus = null;
        Cookie cookieLast = null;
        Cookie cookieCountVisit = null;

        if (cookies != null) {
            for (Cookie c: cookies) {
                if (cookieLoginName.equals(c.getName()))
                    cookieLogin = c;
                if (cookieStatusName.equals((c.getName())))
                    cookieStatus = c;
                if (cookieLastVisit.equals((c.getName())))
                    cookieLast = c;
                if (cookieCount.equals((c.getName())))
                    cookieCountVisit = c;
            }
        }
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><body>");
            out.println("<p>Login: " + cookieLogin.getValue() + "</p>");
            out.println("<p>Status:  " + cookieStatus.getValue() + "</p>");
            out.println("<p>LastVisit:  " + cookieLast.getValue() + "</p>");
            out.println("<p>CountVisit:  " + cookieCountVisit.getValue() + "</p>");
            out.println("</body></html>");
        }
    }
}
