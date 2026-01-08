<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,com.quizportal.model.Quiz" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Quiz List</title>
<style>
body { margin:0; font-family:Segoe UI; background:#f4f6f9; }
.layout { display:flex; min-height:100vh; }
.sidebar { width:220px; background:#204051; color:#fff; padding:20px; }
.sidebar a { display:block; padding:10px; color:#fff; text-decoration:none; border-radius:6px; margin-bottom:6px; }
.sidebar a:hover { background:#3b6978; }
.content { flex:1; padding:30px; }
.card { background:#fff; border-radius:12px; padding:20px; box-shadow:0 4px 12px rgba(0,0,0,.1); }
table { width:100%; border-collapse:collapse; }
th,td { padding:12px; border-bottom:1px solid #ddd; }
th { background:#f0f0f0; text-align:left; }
.btn { background:#3b6978; color:#fff; padding:8px 14px; border-radius:6px; text-decoration:none; }
.btn:hover { background:#204051; }
</style>
</head>
<body>
<%
    request.setAttribute("page","quiz-list");
    List<Quiz> quizzes=(List<Quiz>)request.getAttribute("quizzes");
%>
<div class="layout">
    <jsp:include page="sidebar.jsp"/>
    <div class="content">
        <h2>Quiz List</h2>
        <a class="btn" href="<%=request.getContextPath()%>/admin/quizzes/new">Create Quiz</a>
        <div class="card">
            <table>
                <thead><tr><th>ID</th><th>Name</th><th>Actions</th></tr></thead>
                <tbody>
                <%
                    if(quizzes!=null){
                        for(Quiz q:quizzes){
                %>
                <tr>
                    <td><%=q.getId()%></td>
                    <td><%=q.getName()%></td>
                    <td><a class="btn secondary" href="<%=request.getContextPath()%>/quiz/attempt?id=<%=q.getId()%>">Preview</a></td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
