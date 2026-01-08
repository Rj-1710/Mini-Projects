<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,com.quizportal.model.Question" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Attempt Quiz</title>
<style>
body { margin:0; font-family:Segoe UI; background:#f4f6f9; }
.container { max-width:800px; margin:40px auto; background:#fff; padding:30px; border-radius:12px; box-shadow:0 4px 12px rgba(0,0,0,.1); }
h2 { margin-bottom:20px; }
.question { margin-bottom:20px; }
label { display:block; margin:6px 0; }
.btn { background:#3b6978; color:#fff; padding:12px 20px; border:none; border-radius:8px; cursor:pointer; }
.btn:hover { background:#204051; }
</style>
</head>
<body>
<%
    int quizId = (Integer) request.getAttribute("quizId");
    List<Question> questions = (List<Question>) request.getAttribute("questions");
%>
<div class="container">
    <h2>Attempt Quiz</h2>
    <form method="post" action="<%=request.getContextPath()%>/quiz/submit">
        <input type="hidden" name="quizId" value="<%=quizId%>" />
        <%
            if (questions != null) {
                for (Question q : questions) {
        %>
        <div class="question">
            <p><strong>Q<%=q.getId()%>:</strong> <%=q.getQuestionText()%></p>
            <label><input type="radio" name="q_<%=q.getId()%>" value="A"/> <%=q.getOptionA()%></label>
            <label><input type="radio" name="q_<%=q.getId()%>" value="B"/> <%=q.getOptionB()%></label>
            <label><input type="radio" name="q_<%=q.getId()%>" value="C"/> <%=q.getOptionC()%></label>
            <label><input type="radio" name="q_<%=q.getId()%>" value="D"/> <%=q.getOptionD()%></label>
        </div>
        <%
                }
            }
        %>
        <button type="submit" class="btn">Submit Quiz</button>
    </form>
</div>
</body>
</html>
