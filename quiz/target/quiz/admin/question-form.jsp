<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Add Question</title>
<style>
body { margin:0; font-family:Segoe UI; background:#f4f6f9; }
.container { max-width:600px; margin:40px auto; background:#fff; padding:30px; border-radius:12px; box-shadow:0 4px 12px rgba(0,0,0,.1); }
h2 { margin-bottom:20px; }
label { display:block; margin-top:10px; font-weight:600; }
input,textarea,select { width:100%; padding:10px; border:1px solid #ccc; border-radius:8px; margin-top:6px; }
.btn { background:#3b6978; color:#fff; padding:10px 16px; border:none; border-radius:8px; cursor:pointer; margin-top:20px; }
.btn:hover { background:#204051; }
</style>
</head>
<body>
<div class="container">
    <h2>Add New Question</h2>
    <form method="post" action="<%=request.getContextPath()%>/admin/questions/new">
        <label>Question Text</label><textarea name="question_text" required></textarea>
        <label>Option A</label><input type="text" name="option_a" required />
        <label>Option B</label><input type="text" name="option_b" required />
        <label>Option C</label><input type="text" name="option_c" required />
        <label>Option D</label><input type="text" name="option_d" required />
        <label>Correct Option</label>
        <select name="correct_option" required>
            <option value="A">A</option><option value="B">B</option><option value="C">C</option><option value="D">D</option>
        </select>
        <button type="submit" class="btn">Save</button>
    </form>
</div>
</body>
</html>
