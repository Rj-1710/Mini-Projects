package com.quizportal.servlet.admin;

import java.io.IOException;

import com.quizportal.dao.QuizDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/quizzes/delete")
public class QuizDeleteServlet extends HttpServlet {
    private final QuizDAO quizDAO = new QuizDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        quizDAO.delete(id);
        resp.sendRedirect(req.getContextPath() + "/admin/quizzes");
    }
}
