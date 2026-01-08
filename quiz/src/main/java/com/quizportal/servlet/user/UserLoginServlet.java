package com.quizportal.servlet.user;

import com.quizportal.dao.UserDAO;
import com.quizportal.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User u = userDAO.login(req.getParameter("username"), req.getParameter("password"));
        if (u != null) {
            req.getSession().setAttribute("user", u);
            resp.sendRedirect(req.getContextPath() + "/user/quiz-list.jsp");
        } else {
            req.setAttribute("error", "Invalid credentials");
            req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
        }
    }
}
