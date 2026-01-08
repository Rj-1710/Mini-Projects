<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,com.quizportal.model.Quiz" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Quiz List</title>
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
    width:220px;
    background:#204051;
    color:#fff;
    padding:20px;
    display:flex;
    flex-direction:column;
    justify-content:space-between;
}
.sidebar a {
    display:block;
    padding:10px 12px;
    color:#fff;
    text-decoration:none;
    border-radius:6px;
    margin-bottom:6px;
    transition:background 0.3s;
}
.sidebar a:hover { background:#3b6978; }
.content {
    flex:1;
    padding:30px;
}
h2 {
    margin-bottom:20px;
    color:#204051;
}
.card {
    background:#fff;
    border-radius:12px;
    padding:20px;
    box-shadow:0 4px 12px rgba(0,0,0,.1);
    margin-top:20px;
}
table {
    width:100%;
    border-collapse:collapse;
}
th, td {
    padding:12px;
    border-bottom:1px solid #ddd;
    text-align:left;
}
th {
    background:#3b6978;
    color:#fff;
}
tr:hover { background:#f9fafb; }
.btn {
    background:#3b6978;
    color:#fff;
    padding:8px 14px;
    border-radius:6px;
    text-decoration:none;
    font-weight:600;
    transition:background 0.3s;
    margin-right:6px;
}
.btn:hover { background:#204051; }
.btn.secondary { background:#204051; }
.btn.secondary:hover { background:#3b6978; }
</style>
</head>
<body>

<%
    request.setAttribute("page","quiz-list");
    List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
%>
<div class="layout">
    <jsp:include page="sidebar.jsp"/>
    <div class="content">
        <h2>Quiz List</h2>
        <a class="btn" href="<%=request.getContextPath()%>/admin/quizzes/new">Create Quiz</a>
        <div class="card">
            <table>
                <thead>
                    <tr><th>ID</th><th>Name</th><th>Actions</th></tr>
                </thead>
                <tbody>
                <%
                    if (quizzes != null) {
                        for (Quiz q : quizzes) {
                %>
                <tr>
                    <td><%= q.getId() %></td>
                    <td><%= q.getName() %></td>
                    <td>
                        <a class="btn secondary" href="<%=request.getContextPath()%>/admin/quizzes/edit?id=<%=q.getId()%>">Edit</a>
                        <!-- Delete as a form to send POST -->
                        <form action="<%=request.getContextPath()%>/admin/quizzes/delete" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%=q.getId()%>" />
                            <button type="submit" class="btn" onclick="return confirm('Are you sure you want to delete this quiz?');">Delete</button>
                        </form>
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
