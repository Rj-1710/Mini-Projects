<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.quizportal.model.Question" %>
<%
    Question q = (Question) request.getAttribute("question");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Edit Question</title>
<style>
body { margin:0; font-family:Segoe UI, sans-serif; background:#f4f6f9; }
.container { max-width:650px; margin:50px auto; background:#fff; padding:30px; border-radius:16px; box-shadow:0 6px 20px rgba(0,0,0,.1); }
h2 { margin-bottom:25px; text-align:center; color:#204051; }
label { display:block; margin-top:15px; font-weight:600; color:#333; }
input, textarea, select {
    width:100%; padding:12px; border:1px solid #ccc; border-radius:8px;
    margin-top:6px; font-size:0.95rem;
}
textarea { min-height:100px; background:#f9fafb; }
.btn {
    background:#3b6978; color:#fff; padding:12px 20px; border:none;
    border-radius:8px; cursor:pointer; margin-top:25px; font-weight:600;
    width:100%;
}
.btn:hover { background:#204051; }
</style>
</head>
<body>


<div class="container">
    <h2>Edit Question</h2>
    <form method="post" action="<%=request.getContextPath()%>/admin/questions/edit">
        <input type="hidden" name="id" value="<%=q.getId()%>" />

        <label>Question Text</label>
        <textarea name="question_text" required><%=q.getQuestionText()%></textarea>

        <label>Option A</label>
        <input type="text" name="option_a" value="<%=q.getOptionA()%>" required />

        <label>Option B</label>
        <input type="text" name="option_b" value="<%=q.getOptionB()%>" required />

        <label>Option C</label>
        <input type="text" name="option_c" value="<%=q.getOptionC()%>" required />

        <label>Option D</label>
        <input type="text" name="option_d" value="<%=q.getOptionD()%>" required />

        <label>Correct Option</label>
        <select name="correct_option" required>
            <option value="A" <%=q.getCorrectOption()=='A'?"selected":""%>>A</option>
            <option value="B" <%=q.getCorrectOption()=='B'?"selected":""%>>B</option>
            <option value="C" <%=q.getCorrectOption()=='C'?"selected":""%>>C</option>
            <option value="D" <%=q.getCorrectOption()=='D'?"selected":""%>>D</option>
        </select>

        <button type="submit" class="btn">Update Question</button>
    </form>
</div>
</body>
</html>
