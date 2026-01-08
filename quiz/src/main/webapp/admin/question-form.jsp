<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Add Question</title>
<style>
body {
    margin:0;
    font-family:Segoe UI, sans-serif;
    background:#f4f6f9;
}
.container {
    max-width:650px;
    margin:50px auto;
    background:#fff;
    padding:30px;
    border-radius:16px;
    box-shadow:0 6px 20px rgba(0,0,0,.1);
}
h2 {
    margin-bottom:25px;
    text-align:center;
    color:#204051;
}
label {
    display:block;
    margin-top:15px;
    font-weight:600;
    color:#333;
}
input, textarea, select {
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    margin-top:6px;
    font-size:0.95rem;
    transition:border-color 0.3s, box-shadow 0.3s;
}
input:focus, textarea:focus, select:focus {
    border-color:#3b6978;
    box-shadow:0 0 6px rgba(59,105,120,0.4);
    outline:none;
}
textarea {
    min-height:100px;
    background:#f9fafb;
}
.btn {
    background:#3b6978;
    color:#fff;
    padding:12px 20px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    margin-top:25px;
    font-weight:600;
    width:100%;
    transition:background 0.3s;
}
.btn:hover {
    background:#204051;
}
</style>
</head>
<body>

<div class="container">
    <h2>Add New Question</h2>
    <form method="post" action="<%=request.getContextPath()%>/admin/questions/new">
        <label>Question Text</label>
        <textarea name="question_text" required></textarea>

        <label>Option A</label>
        <input type="text" name="option_a" required />

        <label>Option B</label>
        <input type="text" name="option_b" required />

        <label>Option C</label>
        <input type="text" name="option_c" required />

        <label>Option D</label>
        <input type="text" name="option_d" required />

        <label>Correct Option</label>
        <select name="correct_option" required>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>
        </select>

        <button type="submit" class="btn">Save Question</button>
    </form>
</div>
</body>
</html>
