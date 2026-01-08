<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,com.quizportal.model.Question" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Create Quiz</title>
<style>
body {
    margin:0;
    font-family:Segoe UI, sans-serif;
    background:#f4f6f9;
}
.container {
    max-width:700px;
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
label {
    display:block;
    margin-top:10px;
    font-weight:600;
}
input, textarea, select {
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:8px;
    margin-top:6px;
}
.btn {
    background:#3b6978;
    color:#fff;
    padding:12px 18px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    margin-top:20px;
    font-weight:600;
    transition:background 0.3s;
}
.btn:hover {
    background:#204051;
}
.sublist {
    max-height:250px;
    overflow:auto;
    border:1px solid #ccc;
    padding:10px;
    margin-top:10px;
    border-radius:8px;
    background:#f9fafb;
}
.question-item {
    padding:10px;
    margin-bottom:8px;
    border-radius:6px;
    background:#e9f0f4;
    transition:background 0.3s;
}
.question-item:hover {
    background:#dbe5ea;
}
.question-item label {
    font-weight:500;
    color:#333;
}
</style>
</head>
<body>

<%
    request.setAttribute("page","quiz-new");
    List<Question> questions = (List<Question>) request.getAttribute("questions");
%>
<div class="container">
    <h2>Create Quiz</h2>
    <form method="post" action="<%=request.getContextPath()%>/admin/quizzes/new">
        <label>Quiz Name</label>
        <input type="text" name="name" required />

        <label>Select Questions</label>
        <div class="sublist">
            <%
                if (questions != null) {
                    for (Question q : questions) {
            %>
                <div class="question-item">
                    <label>
                        <input type="checkbox" name="question_ids" value="<%=q.getId()%>" />
                        Q<%=q.getId()%>: <%=q.getQuestionText()%>
                    </label>
                </div>
            <%
                    }
                }
            %>
        </div>

        <button type="submit" class="btn">Save Quiz</button>
    </form>
</div>
</body>
</html>
