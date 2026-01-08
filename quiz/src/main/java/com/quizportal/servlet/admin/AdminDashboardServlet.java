package com.quizportal.servlet.admin;

import com.quizportal.dao.AdminDAO;
import com.quizportal.model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private final AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Admin admin = (Admin) req.getSession().getAttribute("admin");
        if (admin == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }
        req.setAttribute("totalQuiz", adminDAO.countQuizzes());
        req.setAttribute("totalQuestions", adminDAO.countQuestions());
        req.setAttribute("totalUsers", adminDAO.countUsers());
        req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);
    }
}
