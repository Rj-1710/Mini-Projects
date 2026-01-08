package com.quizportal.servlet.admin;

import com.quizportal.dao.QuestionDAO;
import com.quizportal.model.Admin;
import com.quizportal.model.Question;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/questions/new")
public class QuestionCreateServlet extends HttpServlet {
    private final QuestionDAO questionDAO = new QuestionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Admin admin = (Admin) req.getSession().getAttribute("admin");
        if (admin == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }
        req.getRequestDispatcher("/admin/question-form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Admin admin = (Admin) req.getSession().getAttribute("admin");
        if (admin == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        Question q = new Question();
        q.setQuestionText(req.getParameter("question_text"));
        q.setOptionA(req.getParameter("option_a"));
        q.setOptionB(req.getParameter("option_b"));
        q.setOptionC(req.getParameter("option_c"));
        q.setOptionD(req.getParameter("option_d"));
        q.setCorrectOption(req.getParameter("correct_option").charAt(0));

        questionDAO.create(q);
        resp.sendRedirect(req.getContextPath() + "/admin/questions");
    }
}
