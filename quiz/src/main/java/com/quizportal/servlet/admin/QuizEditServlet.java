package com.quizportal.servlet.admin;

import java.io.IOException;

import com.quizportal.dao.QuizDAO;
import com.quizportal.model.Quiz;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/quizzes/edit")
public class QuizEditServlet extends HttpServlet {
    private final QuizDAO quizDAO = new QuizDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Quiz quiz = quizDAO.findById(id);
        req.setAttribute("quiz", quiz);
        req.getRequestDispatcher("/admin/edit-quiz.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");

        Quiz quiz = new Quiz();
        quiz.setId(id);
        quiz.setName(name);

        quizDAO.update(quiz);
        resp.sendRedirect(req.getContextPath() + "/admin/quizzes");
    }
}

