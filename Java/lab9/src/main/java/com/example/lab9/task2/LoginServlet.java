package com.example.lab9.task2;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final DateBase db = new DateBase();

    @Override
    public void init(){
        db.getConnection();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isUserFound = false;
        Date currentDate = new Date();
        User user = new User();

        String login = request.getParameter("login");
        String password = request.getParameter("password");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");

        try {
            ResultSet rs = db.checkUsersCount(login, password);
            rs.next();
            if (rs.getInt("count") != 0) {
                ResultSet userSet = db.checkUser(login, password);
                userSet.next();
                user.setLogin(userSet.getString("name"));
                user.setStatus(userSet.getString("status"));
                isUserFound = true;
            }
            else {
                user = null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        HttpSession session = request.getSession();
        session.setAttribute("current_user", user);
        if (isUserFound) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
            String currentDateTime = dateFormat.format(currentDate);
            Cookie cookieLogin = new Cookie("login", user.getLogin());
            Cookie cookieStatus = new Cookie("status", user.getStatus());
            Cookie cookieLastVisit = new Cookie("lastVisit", currentDateTime);

            Cookie[] cookies = request.getCookies();

            Cookie visitCountCookie = null;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("count")) {
                        visitCountCookie = cookie;
                        break;
                    }
                }
            }
            int visitCount = 1;
            if (visitCountCookie == null) {
                visitCountCookie = new Cookie("count", "1");
            } else {
                visitCount = Integer.parseInt(visitCountCookie.getValue());
                visitCount++;
                visitCountCookie.setValue(String.valueOf(visitCount));
            }

            response.addCookie(cookieStatus);
            response.addCookie(cookieLogin);
            response.addCookie(cookieLastVisit);
            response.addCookie(visitCountCookie);

            request.setAttribute("name", user.getLogin());
            request.setAttribute("status", user.getStatus());
            request.getRequestDispatcher("/UsersPage.jsp").forward(request, response);
        }
        else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Try again\")");
            out.println("window.location.href = 'Login.jsp';");
            out.println("</script>");
        }

        out.println("</body></html>");
        out.close();
    }
}
