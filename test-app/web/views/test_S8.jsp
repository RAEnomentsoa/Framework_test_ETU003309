
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Router S8 Test View</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            padding: 40px;
        }
        .box {
            background: white;
            padding: 20px;
            border-radius: 6px;
            max-width: 600px;
            margin: auto;
        }
        h1 { color: #2c3e50; }
        p { font-size: 16px; }
        .ok { color: green; }
    </style>
</head>
<body>
<div class="box">
    <h1>✅ RouterServlet Sprint_8 Test</h1>

    <p class="ok">If you see this page, ModelView forwarding works for S8.</p>

  <form method="post" action="save">
  <input name="name" value="Alice">
  java : <input type="checkbox" name="skills" value="java" checked>
  spring : <input type="checkbox" name="skills" value="spring" checked>
  <button type="submit">Save</button>
</form>



</div>
</body>
</html>