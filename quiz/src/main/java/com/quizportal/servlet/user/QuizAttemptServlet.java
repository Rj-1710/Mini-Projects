package com.quizportal.servlet.user;

import com.quizportal.dao.QuizDAO;
import com.quizportal.model.Question;
import com.quizportal.model.Quiz;
import com.quizportal.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/quiz/attempt")
public class QuizAttemptServlet extends HttpServlet {
    private final QuizDAO quizDAO = new QuizDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int quizId = Integer.parseInt(req.getParameter("id"));
        List<Question> questions = quizDAO.getQuestionsForQuiz(quizId);
        req.setAttribute("quizId", quizId);
        req.setAttribute("questions", questions);
        req.getRequestDispatcher("/user/quiz-attempt.jsp").forward(req, resp);
    }
}
