package com.quizportal.servlet.admin;

import com.quizportal.dao.QuizDAO;
import com.quizportal.model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/quizzes")
public class QuizListServlet extends HttpServlet {
    private final QuizDAO quizDAO = new QuizDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Admin admin = (Admin) req.getSession().getAttribute("admin");
        if (admin == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }
        req.setAttribute("quizzes", quizDAO.findAll());
        req.getRequestDispatcher("/admin/quiz-list.jsp").forward(req, resp);
    }
}
