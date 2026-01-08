<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,com.quizportal.dao.QuizDAO,com.quizportal.model.Quiz" %>
<%
    QuizDAO dao=new QuizDAO();
    List<Quiz> quizzes=dao.findAll();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Available Quizzes</title>
<style>
body { margin:0; font-family:Segoe UI; background:#f4f6f9; }
.container { max-width:600px; margin:40px auto; background:#fff; padding:30px; border-radius:12px; box-shadow:0 4px 12px rgba(0,0,0,.1); }
h2 { margin-bottom:20px; }
ul { list-style:none; padding:0; }
li { margin-bottom:12px; display:flex; justify-content:space-between; align-items:center; }
.btn { background:#3b6978; color:#fff; padding:8px 14px; border-radius:6px; text-decoration:none; }
.btn:hover { background:#204051; }
</style>
</head>
<body>
<div class="container">
    <h2>Available Quizzes</h2>
    <ul>
    <%
        for(Quiz q:quizzes){
    %>
        <li><span><%=q.getName()%></span>
            <a class="btn" href="<%=request.getContextPath()%>/quiz/attempt?id=<%=q.getId()%>">Attempt</a>
        </li>
    <%
        }
    %>
    </ul>
</div>
</body>
</html>
