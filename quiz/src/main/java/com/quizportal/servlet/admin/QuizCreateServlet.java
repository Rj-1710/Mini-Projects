package com.quizportal.servlet.admin;

import com.quizportal.dao.QuestionDAO;
import com.quizportal.dao.QuizDAO;
import com.quizportal.model.Admin;
import com.quizportal.model.Question;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet("/admin/quizzes/new")
public class QuizCreateServlet extends HttpServlet {
    private final QuestionDAO questionDAO = new QuestionDAO();
    private final QuizDAO quizDAO = new QuizDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Admin admin = (Admin) req.getSession().getAttribute("admin");
        if (admin == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }
        req.setAttribute("questions", questionDAO.findAll());
        req.getRequestDispatcher("/admin/quiz-form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Admin admin = (Admin) req.getSession().getAttribute("admin");
        if (admin == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        String name = req.getParameter("name");
        String[] selected = req.getParameterValues("question_ids");
        List<Integer> qids = selected == null ? Collections.emptyList()
                : Arrays.stream(selected).map(Integer::parseInt).collect(Collectors.toList());

        quizDAO.createQuiz(name, qids);
        resp.sendRedirect(req.getContextPath() + "/admin/quizzes");
    }
}
