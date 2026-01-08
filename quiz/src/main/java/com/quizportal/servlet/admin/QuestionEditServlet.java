package com.quizportal.servlet.admin;

import java.io.IOException;

import com.quizportal.dao.QuestionDAO;
import com.quizportal.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/questions/edit")
public class QuestionEditServlet extends HttpServlet {
    private final QuestionDAO questionDAO = new QuestionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Question q = questionDAO.findById(id);
        req.setAttribute("question", q);
        req.getRequestDispatcher("/admin/edit-question.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String text = req.getParameter("question_text");
        String a = req.getParameter("option_a");
        String b = req.getParameter("option_b");
        String c = req.getParameter("option_c");
        String d = req.getParameter("option_d");
        String correct = req.getParameter("correct_option");

        Question q = new Question(id, text, a, b, c, d, correct.charAt(0));
        questionDAO.update(q);

        resp.sendRedirect(req.getContextPath() + "/admin/questions");
    }
}
