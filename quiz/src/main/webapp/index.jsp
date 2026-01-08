<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Quiz Portal - Home</title>
    <style>
        body {
            margin:0; 
            font-family:Segoe UI, sans-serif;
            background: linear-gradient(135deg,#204051,#3b6978);
            display:flex;
            align-items:center; justify-content:center;
            height:100vh; color:#fff;
        }
        .card {
            background:#fff; color:#204051;
            border-radius:20px; padding:40px;
            box-shadow:0 12px 40px rgba(0,0,0,.3);
            text-align:center; max-width:500px; width:90%;
        }
        h2 { margin-bottom:20px; }
        a {
            display:inline-block; margin:10px; padding:12px 20px;
            border-radius:10px; text-decoration:none;
            background:#3b6978; color:#fff; font-weight:600;
            transition:.3s;
        }
        a:hover { background:#204051; }
    </style>
</head>
<body>
<div class="card">
    <h2>Welcome to Online Quiz Portal</h2>
    <a href="<%=request.getContextPath()%>/admin/login.jsp">Admin Login</a>
    <a href="<%=request.getContextPath()%>/user/login.jsp">User Login</a>
    <a href="<%=request.getContextPath()%>/user/register.jsp">Register</a>
    <a href="<%=request.getContextPath()%>/user/quiz-list.jsp">Explore Quizzes</a>
</div>
</body>
</html>
