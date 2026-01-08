package com.quizportal.servlet.user;

import com.quizportal.dao.UserDAO;
import com.quizportal.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/user/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User u = new User();
        u.setUsername(req.getParameter("username"));
        u.setPassword(req.getParameter("password"));
        u.setName(req.getParameter("name"));
        u.setEmail(req.getParameter("email"));
        userDAO.register(u);
        resp.sendRedirect(req.getContextPath() + "/login");
    }
}
