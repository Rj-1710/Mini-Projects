<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,com.quizportal.model.Question" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Question List</title>
<style>
body { margin:0; font-family:Segoe UI, sans-serif; background:#f4f6f9; }
.layout { display:flex; min-height:100vh; }
.sidebar { width:220px; background:#204051; color:#fff; padding:20px; }
.sidebar a { display:block; padding:10px; color:#fff; text-decoration:none; border-radius:6px; margin-bottom:6px; transition:background 0.3s; }
.sidebar a:hover { background:#3b6978; }
.content { flex:1; padding:30px; }
h2 { margin-bottom:20px; color:#204051; }
.card { background:#fff; border-radius:12px; padding:20px; box-shadow:0 4px 12px rgba(0,0,0,.1); margin-top:20px; }
table { width:100%; border-collapse:collapse; }
th, td { padding:12px; border-bottom:1px solid #ddd; text-align:left; }
th { background:#3b6978; color:#fff; }
tr:hover { background:#f9fafb; }
.btn { background:#3b6978; color:#fff; padding:8px 14px; border-radius:6px; text-decoration:none; font-weight:600; transition:background 0.3s; }
.btn:hover { background:#204051; }
.btn.secondary { background:#204051; }
.btn.secondary:hover { background:#3b6978; }
</style>
</head>
<body>

<%
    request.setAttribute("page","question-list");
    List<Question> questions = (List<Question>) request.getAttribute("questions");
%>
<div class="layout">
    <jsp:include page="sidebar.jsp"/>
    <div class="content">
        <h2>Question List</h2>
        <a class="btn" href="<%=request.getContextPath()%>/admin/questions/new">Add Question</a>
        <div class="card">
            <table>
                <thead>
                    <tr><th>ID</th><th>Question Text</th><th>Actions</th></tr>
                </thead>
                <tbody>
                <%
                    if (questions != null) {
                        for (Question q : questions) {
                %>
                <tr>
                    <td><%= q.getId() %></td>
                    <td><%= q.getQuestionText() %></td>
                    <td>
                        <a class="btn secondary" href="<%=request.getContextPath()%>/admin/questions/edit?id=<%=q.getId()%>">Edit</a>
						<a class="btn" href="<%=request.getContextPath()%>/admin/questions/delete?id=<%=q.getId()%>">Delete</a>

                    </td>
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
