<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,com.quizportal.dao.QuizDAO,com.quizportal.model.Quiz" %>
<%
    QuizDAO dao = new QuizDAO();
    List<Quiz> quizzes = dao.findAll();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Available Quizzes</title>
<style>
body {
    margin:0;
    font-family:Segoe UI, sans-serif;
    background:#f4f6f9;
}
.container {
    max-width:700px;
    margin:50px auto;
    background:#fff;
    padding:30px;
    border-radius:16px;
    box-shadow:0 6px 20px rgba(0,0,0,.1);
}
h2 {
    margin-bottom:25px;
    text-align:center;
    color:#204051;
}
.quiz-list {
    list-style:none;
    padding:0;
    margin:0;
}
.quiz-item {
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 20px;
    border:1px solid #e0e0e0;
    border-radius:10px;
    margin-bottom:15px;
    transition:background 0.3s, transform 0.2s;
}
.quiz-item:hover {
    background:#f9fafb;
    transform:translateY(-2px);
}
.quiz-name {
    font-size:1.1rem;
    font-weight:600;
    color:#3b6978;
}
.btn {
    background:#3b6978;
    color:#fff;
    padding:10px 18px;
    border-radius:8px;
    text-decoration:none;
    font-weight:600;
    transition:background 0.3s;
}
.btn:hover {
    background:#204051;
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
    <h2>Available Quizzes</h2>
    <ul class="quiz-list">
    <%
        if (quizzes != null) {
            for (Quiz q : quizzes) {
    %>
        <li class="quiz-item">
            <span class="quiz-name"><%= q.getName() %></span>
            <a class="btn" href="<%=request.getContextPath()%>/quiz/attempt?id=<%=q.getId()%>">Attempt</a>
        </li>
    <%
            }
        }
    %>
    </ul>
</div>
</body>
</html>
