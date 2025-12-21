<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Router Test View</title>
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
    <h1>✅ RouterServlet Test</h1>

    <p class="ok">If you see this page, ModelView forwarding works.</p>

    <hr>

    <p><strong>Message:</strong> ${message}</p>
    <p><strong>ID:</strong> ${id}</p>
    <p><strong>HTTP Method:</strong> ${method}</p>

    <hr>

    <p>Try different HTTP methods (GET / POST / PATCH / DELETE).</p>
</div>

</body>
</html>
