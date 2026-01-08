<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Admin Sidebar</title>
<style>
.sidebar {
    width: 240px;
    background: #204051;
    color: #fff;
    min-height: 100vh;
    padding: 20px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    justify-content: space-between; /* pushes logout to bottom */
}

.sidebar .brand {
    font-size: 1.4rem;
    font-weight: bold;
    margin-bottom: 20px;
}

.nav {
    flex: 1; /* take available space */
}

.sidebar .nav a {
    display: block;
    padding: 10px 12px;
    margin-bottom: 6px;
    color: #fff;
    text-decoration: none;
    border-radius: 6px;
    transition: background 0.3s;
}

.sidebar .nav a:hover { background: #3b6978; }
.sidebar .nav .active { background: #3b6978; }

.section-title {
    margin-top: 16px;
    margin-bottom: 6px;
    font-size: 0.85rem;
    font-weight: bold;
    color: #cbd5e1;
}

.submenu-toggle {
    display: block;
    padding: 8px 12px;
    color: #fff;
    text-decoration: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background 0.3s;
}

.submenu-toggle:hover { background: #3b6978; }

.submenu-items {
    display: none;
    margin-left: 12px;
    margin-top: 6px;
}

.submenu-items a {
    font-size: 0.9rem;
    padding: 8px 12px;
    display: block;
    color: #e2e8f0;
    text-decoration: none;
    border-radius: 6px;
    margin-bottom: 4px;
}

.submenu-items a:hover { background: rgba(255,255,255,0.1); }

.logout {
    margin-top: auto; /* ensures it stays at bottom */
}
.logout a {
    display: block;
    padding: 10px 12px;
    color: #fff;
    text-decoration: none;
    border-radius: 6px;
    background: #a81d24;
    text-align: center;
}
.logout a:hover { background: #7a131b; }
</style>
</head>
<body>
<%
    Object pageAttr = request.getAttribute("page");
    String currentPage = pageAttr == null ? "" : pageAttr.toString();
%>
<div class="sidebar">
    <div class="nav">
        <div class="brand">Quiz Admin</div>
        <a href="<%= request.getContextPath() %>/admin/dashboard"
           class="<%= "dashboard".equals(currentPage) ? "active" : "" %>">Dashboard</a>

        <div class="section-title"></div>
        <div class="submenu">
            <a href="#" class="submenu-toggle">Quiz Manager</a>
            <div class="submenu-items">
                <a href="<%= request.getContextPath() %>/admin/quizzes/new"
                   class="<%= "quiz-new".equals(currentPage) ? "active" : "" %>">Create Quiz</a>
                <a href="<%= request.getContextPath() %>/admin/quizzes"
                   class="<%= "quiz-list".equals(currentPage) ? "active" : "" %>">Quiz List</a>
            </div>
        </div>

        <div class="section-title"></div>
        <div class="submenu">
            <a href="#" class="submenu-toggle">Question Manager</a>
            <div class="submenu-items">
                <a href="<%= request.getContextPath() %>/admin/questions/new"
                   class="<%= "question-new".equals(currentPage) ? "active" : "" %>">Add Question</a>
                <a href="<%= request.getContextPath() %>/admin/questions"
                   class="<%= "question-list".equals(currentPage) ? "active" : "" %>">Question List</a>
            </div>
        </div>
    </div>

    <div class="logout">
        <a href="<%= request.getContextPath() %>/admin/logout">Logout</a>
    </div>
</div>

<script>
    // Simple toggle for submenu
    document.querySelectorAll('.submenu-toggle').forEach(function(toggle){
        toggle.addEventListener('click', function(e){
            e.preventDefault();
            const items = this.nextElementSibling;
            items.style.display = (items.style.display === 'block') ? 'none' : 'block';
        });
    });
</script>
</body>
</html>
