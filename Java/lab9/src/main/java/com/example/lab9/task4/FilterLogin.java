package com.example.lab9.task4;

import com.example.lab9.task2.DateBase;
import com.example.lab9.task2.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

@WebFilter(filterName = "FilterLogin", urlPatterns = {"/LoginServlet"},
        initParams = { @WebInitParam(name = "REGISTER_PATH", value = "/Register.jsp") })
public class FilterLogin implements Filter {
    private String registerPath;
    private static final DateBase db = new DateBase();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException
    {
        registerPath = filterConfig.getInitParameter("REGISTER_PATH");
        db.getConnection();
    }
    @Override
    public void doFilter(ServletRequest servletRequest  , ServletResponse servletResponse,
                         FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String login = request.getParameter("login");
        String password = request.getParameter("password");
        try{
            ResultSet rs = db.checkUsersCount(login, password);
            rs.next();
            if (rs.getInt("count") == 0) {
                ResultSet userSet = db.checkUser(login, password);
                response.sendRedirect(request.getContextPath() + registerPath);
            } else {
                servletRequest.setAttribute("name", login);
                filterChain.doFilter(servletRequest, servletResponse);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
