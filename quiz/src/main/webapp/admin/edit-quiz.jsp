<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.quizportal.model.Quiz" %>
<%
    Quiz quiz = (Quiz) request.getAttribute("quiz");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Edit Quiz</title>
<style>
body {
    margin:0;
    font-family:Segoe UI, sans-serif;
    background:#f4f6f9;
}
.container {
    max-width:650px;
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
label {
    display:block;
    margin-top:15px;
    font-weight:600;
    color:#333;
}
input {
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    margin-top:6px;
    font-size:0.95rem;
    transition:border-color 0.3s, box-shadow 0.3s;
}
input:focus {
    border-color:#3b6978;
    box-shadow:0 0 6px rgba(59,105,120,0.4);
    outline:none;
}
.btn {
    background:#3b6978;
    color:#fff;
    padding:12px 20px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    margin-top:25px;
    font-weight:600;
    width:100%;
    transition:background 0.3s;
}
.btn:hover {
    background:#204051;
}
</style>
</head>
<body>


<div class="container">
    <h2>Edit Quiz</h2>
    <form method="post" action="<%=request.getContextPath()%>/admin/quizzes/edit">
        <input type="hidden" name="id" value="<%=quiz.getId()%>" />

        <label>Quiz Name</label>
        <input type="text" name="name" value="<%=quiz.getName()%>" required />

        <button type="submit" class="btn">Update Quiz</button>
    </form>
</div>
</body>
</html>
