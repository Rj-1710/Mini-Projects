package com.quizportal.dao;

import com.quizportal.config.DBConnection;
import com.quizportal.model.Question;
import com.quizportal.model.Quiz;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {
    public int createQuiz(String name, List<Integer> questionIds) {
        String insertQuiz = "INSERT INTO quiz (name) VALUES (?)";
        String insertLink = "INSERT INTO quiz_question (quiz_id, question_id) VALUES (?,?)";
        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);
            int quizId;
            try (PreparedStatement ps = con.prepareStatement(insertQuiz, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, name);
                ps.executeUpdate();
                ResultSet keys = ps.getGeneratedKeys();
                keys.next();
                quizId = keys.getInt(1);
            }
            try (PreparedStatement ps2 = con.prepareStatement(insertLink)) {
                for (Integer qid : questionIds) {
                    ps2.setInt(1, quizId);
                    ps2.setInt(2, qid);
                    ps2.addBatch();
                }
                ps2.executeBatch();
            }
            con.commit();
            return quizId;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Quiz> findAll() {
        String sql = "SELECT * FROM quiz ORDER BY id DESC";
        List<Quiz> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setId(rs.getInt("id"));
                quiz.setName(rs.getString("name"));
                list.add(quiz);
            }
            return list;
        } catch (SQLException e) { throw new RuntimeException(e); }
    }
    
    public Quiz findById(int id) {
        String sql = "SELECT * FROM quiz WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setId(rs.getInt("id"));
                quiz.setName(rs.getString("name"));
                return quiz;
            }
        } catch (SQLException e) { throw new RuntimeException(e); }
        return null;
    }

    public void update(Quiz quiz) {
        String sql = "UPDATE quiz SET name=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, quiz.getName());
            ps.setInt(2, quiz.getId());
            ps.executeUpdate();
        } catch (SQLException e) { throw new RuntimeException(e); }
    }

    public void delete(int id) {
        String sql = "DELETE FROM quiz WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) { throw new RuntimeException(e); }
    }


    public List<Question> getQuestionsForQuiz(int quizId) {
        String sql = "SELECT q.* FROM question q INNER JOIN quiz_question qq ON q.id=qq.question_id WHERE qq.quiz_id=?";
        List<Question> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, quizId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuestionText(rs.getString("question_text"));
                q.setOptionA(rs.getString("option_a"));
                q.setOptionB(rs.getString("option_b"));
                q.setOptionC(rs.getString("option_c"));
                q.setOptionD(rs.getString("option_d"));
                q.setCorrectOption(rs.getString("correct_option").charAt(0));
                list.add(q);
            }
        } catch (SQLException e) { throw new RuntimeException(e); }
        return list;
    }
}
