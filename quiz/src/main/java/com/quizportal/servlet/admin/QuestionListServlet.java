package com.quizportal.servlet.admin;

import com.quizportal.dao.QuestionDAO;
import com.quizportal.model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/questions")
public class QuestionListServlet extends HttpServlet {
    private final QuestionDAO questionDAO = new QuestionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Admin admin = (Admin) req.getSession().getAttribute("admin");
        if (admin == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }
        req.setAttribute("questions", questionDAO.findAll());
        req.getRequestDispatcher("/admin/question-list.jsp").forward(req, resp);
    }
}
