<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%-- 
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", 0);
%>
--%>

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
.content {
    flex:1;
    padding:30px;
}
h2 {
    margin-bottom:20px;
    color:#204051;
}
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
    <!-- Include the shared sidebar -->
    <jsp:include page="sidebar.jsp"/>

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
