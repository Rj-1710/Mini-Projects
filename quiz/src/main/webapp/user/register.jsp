<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>User Register</title>
<style>

body { 
	margin:0;
	font-family:Segoe UI;
	background:#f4f6f9; 
}
.container {
	max-width:500px; margin:40px auto; 
	background:#fff; padding:30px;
	border-radius:12px;
	box-shadow:0 4px 12px rgba(0,0,0,.1); 
}
h2 { 
	margin-bottom:20px; 
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
}
.btn:hover { 
	background:#204051;
 }
</style>
</head>
<body>
<div class="container">
    <h2>Register</h2>
    <form method="post" action="<%=request.getContextPath()%>/register">
        <label>Username</label><input type="text" name="username" required />
        <label>Password</label><input type="password" name="password" required />
        <label>Name</label><input type="text" name="name" required />
        <label>Email</label><input type="email" name="email" required />
        <button class="btn" type="submit">Register</button>
    </form>
</div>
</body>
</html>
