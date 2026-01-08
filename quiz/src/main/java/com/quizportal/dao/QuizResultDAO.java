package com.quizportal.dao;

import com.quizportal.config.DBConnection;
import com.quizportal.model.QuizResult;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuizResultDAO {
    public void saveResult(int userId,String userName, int quizId, int score, int total) {
        String sql = "INSERT INTO quiz_result (user_id, user_name,quiz_id, score, total_questions) VALUES (?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, userName);
            ps.setInt(3, quizId);
            ps.setInt(4, score);
            ps.setInt(5, total);
            ps.executeUpdate();
        } catch (SQLException e) { throw new RuntimeException(e); }
    }

    public List<QuizResult> leaderboard(int quizId) {
        String sql = "SELECT * FROM quiz_result WHERE quiz_id=? ORDER BY score DESC, submitted_at ASC";
        List<QuizResult> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, quizId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                QuizResult r = new QuizResult();
                r.setId(rs.getInt("id"));
                r.setUserId(rs.getInt("user_id"));
                r.setUserName(rs.getString("user_name"));
                r.setQuizId(rs.getInt("quiz_id"));
                r.setScore(rs.getInt("score"));
                r.setTotalQuestions(rs.getInt("total_questions"));
                list.add(r);
            }
        } catch (SQLException e) { throw new RuntimeException(e); }
        return list;
    }
}
