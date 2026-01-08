<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>User Login</title>
<style>
body { margin:0; font-family:Segoe UI; background:linear-gradient(135deg,#204051,#3b6978); display:flex; align-items:center; justify-content:center; height:100vh; }
.card { background:#fff; color:#204051; border-radius:20px; padding:40px; box-shadow:0 12px 40px rgba(0,0,0,.3); max-width:400px; width:90%; }
h2 { margin-bottom:20px; }
label { display:block; margin-top:10px; font-weight:600; }
input { width:100%; padding:10px; border:1px solid #ccc; border-radius:8px; margin-top:6px; }
.btn { background:#3b6978; color:#fff; padding:12px; border:none; border-radius:8px; width:100%; margin-top:20px; cursor:pointer; }
.btn:hover { background:#204051; }
.error { color:red; margin-top:10px; }
</style>
</head>
<body>
<div class="card">
    <h2>User Login</h2>
    <form method="post" action="<%=request.getContextPath()%>/login">
        <label>Username</label><input type="text" name="username" required />
        <label>Password</label><input type="password" name="password" required />
        <button class="btn" type="submit">Login</button>
    </form>
    <p class="error"><%= request.getAttribute("error")==null?"":request.getAttribute("error") %></p>
</div>
</body>
</html>
