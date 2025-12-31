
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Router S10 Test </title>
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
    <h1>✅ RouterServlet Sprint_10</h1>


<form action="user/save" method="post" enctype="multipart/form-data">
  <input type="text" name="username" />
  <input type="number" name="age" />
  <input type="file" name="photo" />
  <button type="submit">Save</button>
</form>

    
</div>
</body>
</html>