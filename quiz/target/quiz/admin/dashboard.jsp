<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Admin Dashboard - Quiz Portal</title>
<style>
body {
    margin:0;
    font-family:Segoe UI, sans-serif;
    background:#f4f6f9;
}
.layout {
    display:flex;
    min-height:100vh;
}
.sidebar {
    width:240px;
    background:#204051;
    color:#fff;
    padding:20px;
}
.sidebar .brand {
    font-size:1.4rem;
    font-weight:bold;
    margin-bottom:20px;
}
.sidebar a {
    display:block;
    padding:10px 12px;
    margin-bottom:6px;
    color:#fff;
    text-decoration:none;
    border-radius:6px;
    transition:background 0.3s;
}
.sidebar a:hover { background:#3b6978; }
.sidebar .active { background:#3b6978; }
.section-title {
    margin-top:16px;
    margin-bottom:6px;
    font-size:0.85rem;
    font-weight:bold;
    color:#cbd5e1;
}
.content {
    flex:1;
    padding:30px;
}
h2 { margin-bottom:20px; }
.grid {
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
    gap:20px;
}
.card {
    background:#fff;
    border-radius:12px;
    padding:20px;
    box-shadow:0 4px 12px rgba(0,0,0,.1);
    text-align:center;
}
.card h3 {
    margin-bottom:10px;
    font-size:1.1rem;
    color:#204051;
}
.card p {
    font-size:1.6rem;
    font-weight:bold;
    color:#3b6978;
}
</style>
</head>
<body>
<%
    request.setAttribute("page","dashboard");
    int totalQuiz = (Integer) request.getAttribute("totalQuiz");
    int totalQuestions = (Integer) request.getAttribute("totalQuestions");
    int totalUsers = (Integer) request.getAttribute("totalUsers");
%>
<div class="layout">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="brand">Quiz Admin</div>
        <a href="<%=request.getContextPath()%>/admin/dashboard"
           class="<%= "dashboard".equals(request.getAttribute("page")) ? "active" : "" %>">Dashboard</a>

        <div class="section-title">Quiz Manager</div>
        <a href="<%=request.getContextPath()%>/admin/quizzes/new"
           class="<%= "quiz-new".equals(request.getAttribute("page")) ? "active" : "" %>">Create Quiz</a>
        <a href="<%=request.getContextPath()%>/admin/quizzes"
           class="<%= "quiz-list".equals(request.getAttribute("page")) ? "active" : "" %>">Quiz List</a>

        <div class="section-title">Question Manager</div>
        <a href="<%=request.getContextPath()%>/admin/questions/new"
           class="<%= "question-new".equals(request.getAttribute("page")) ? "active" : "" %>">Add Question</a>
        <a href="<%=request.getContextPath()%>/admin/questions"
           class="<%= "question-list".equals(request.getAttribute("page")) ? "active" : "" %>">Question List</a>

        <div class="section-title">Account</div>
        <a href="<%=request.getContextPath()%>/admin/logout">Logout</a>
    </div>

    <!-- Content -->
    <div class="content">
        <h2>Dashboard</h2>
        <div class="grid">
            <div class="card">
                <h3>Total Quizzes</h3>
                <p><%= totalQuiz %></p>
            </div>
            <div class="card">
                <h3>Total Questions</h3>
                <p><%= totalQuestions %></p>
            </div>
            <div class="card">
                <h3>Total Users</h3>
                <p><%= totalUsers %></p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
