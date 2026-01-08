package com.quizportal.servlet.user;

import com.quizportal.dao.QuizDAO;
import com.quizportal.dao.QuizResultDAO;
import com.quizportal.model.Question;
import com.quizportal.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/quiz/submit")
public class QuizSubmitServlet extends HttpServlet {
    private final QuizDAO quizDAO = new QuizDAO();
    private final QuizResultDAO resultDAO = new QuizResultDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int quizId = Integer.parseInt(req.getParameter("quizId"));
        List<Question> questions = quizDAO.getQuestionsForQuiz(quizId);

        int score = 0;
        for (Question q : questions) {
            String ans = req.getParameter("q_" + q.getId()); // values 'A'/'B'/'C'/'D'
            if (ans != null && ans.charAt(0) == q.getCorrectOption()) {
                score++;
            }
        }
        resultDAO.saveResult(user.getId(),user.getUsername(), quizId, score, questions.size());
        resp.sendRedirect(req.getContextPath() + "/user/leaderboard.jsp?quizId=" + quizId + "&score=" + score + "&total=" + questions.size());
    }
}
