<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Admin Login - Quiz Portal</title>
<style>
body {
    margin:0;
    font-family:Segoe UI, sans-serif;
    background:linear-gradient(135deg,#204051,#3b6978);
    display:flex;
    align-items:center;
    justify-content:center;
    height:100vh;
}
.login-card {
    background:#fff;
    color:#204051;
    border-radius:20px;
    padding:40px;
    box-shadow:0 12px 40px rgba(0,0,0,.3);
    max-width:400px;
    width:90%;
}
h2 {
    margin-bottom:20px;
    text-align:center;
}
label {
    display:block;
    margin-top:10px;
    font-weight:600;
}
input {
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:8px;
    margin-top:6px;
}
.btn {
    background:#3b6978;
    color:#fff;
    padding:12px;
    border:none;
    border-radius:8px;
    width:100%;
    margin-top:20px;
    cursor:pointer;
    font-weight:600;
}
.btn:hover { background:#204051; }
.error {
    background:#ffccd5;
    color:#a81d24;
    padding:10px;
    border-radius:8px;
    margin-bottom:15px;
    text-align:center;
    font-weight:600;
}
</style>
</head>
<body>
<div class="login-card">
    <h2>Admin Login</h2>
    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>
    <form method="post" action="<%=request.getContextPath()%>/admin/login">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required autofocus />
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required />
        <button type="submit" class="btn">Login</button>
    </form>
</div>
</body>
</html>
