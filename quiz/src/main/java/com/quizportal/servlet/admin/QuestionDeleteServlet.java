package com.quizportal.servlet.admin;

import java.io.IOException;

import com.quizportal.dao.QuestionDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/questions/delete")
public class QuestionDeleteServlet extends HttpServlet {
    private final QuestionDAO questionDAO = new QuestionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        questionDAO.delete(id);
        resp.sendRedirect(req.getContextPath() + "/admin/questions");
    }
}

