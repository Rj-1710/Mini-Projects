<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,com.quizportal.dao.QuizResultDAO,com.quizportal.model.QuizResult" %>
<%
    int quizId = Integer.parseInt(request.getParameter("quizId"));
    QuizResultDAO dao = new QuizResultDAO();
    List<QuizResult> results = dao.leaderboard(quizId);
    String score = request.getParameter("score");
    String total = request.getParameter("total");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Leaderboard</title>
<style>
body {
    margin:0;
    font-family:Segoe UI, sans-serif;
    background:#f4f6f9;
}
.container {
    max-width:800px;
    margin:40px auto;
    background:#fff;
    padding:30px;
    border-radius:12px;
    box-shadow:0 4px 12px rgba(0,0,0,.1);
}
h2 {
    margin-bottom:20px;
    text-align:center;
    color:#204051;
}
p {
    font-weight:600;
    margin-bottom:20px;
    text-align:center;
}
table {
    width:100%;
    border-collapse:collapse;
}
th, td {
    padding:12px;
    border-bottom:1px solid #ddd;
    text-align:center;
}
th {
    background:#3b6978;
    color:#fff;
}
tr:hover {
    background:#f0f0f0;
}
</style>
</head>
<body>

<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", 0);
%>


<div class="container">
    <h2>Leaderboard</h2>
    <p>Your score: <%= score %>/<%= total %></p>
    <table>
        <thead>
            <tr><th>Username</th><th>Score</th><th>Total Questions</th></tr>
        </thead>
        <tbody>
        <%
            if (results != null) {
                for (QuizResult r : results) {
        %>
            <tr>
                <td><%= r.getUserName() %></td>
                <td><%= r.getScore() %></td>
                <td><%= r.getTotalQuestions() %></td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
