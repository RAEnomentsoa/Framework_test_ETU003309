<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uploaded Files - Custom Framework</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <header class="hero">
        <span class="eyebrow">Custom Framework &middot; File Storage</span>
        <h1 class="title">Uploaded Files</h1>
        <p class="subtitle">Everything currently saved in the <code>/uploads</code> folder.</p>
    </header>

    <main>
        <section class="section">

            <%
                List<String> files = (List<String>) request.getAttribute("files");
                String base = request.getContextPath() + "/uploads/";
            %>

            <% if (files == null || files.isEmpty()) { %>

                <p class="desc">No files uploaded yet. <a href="${pageContext.request.contextPath}/sprint10">Upload one &rarr;</a></p>

            <% } else { %>

                <div class="gallery-grid">
                    <% for (String name : files) {
                        String lower = name.toLowerCase();
                        boolean isImage = lower.endsWith(".png") || lower.endsWith(".jpg")
                                || lower.endsWith(".jpeg") || lower.endsWith(".gif")
                                || lower.endsWith(".webp") || lower.endsWith(".svg");
                        String fileUrl = base + name;
                    %>
                        <a class="file-card" href="<%= fileUrl %>" target="_blank" rel="noopener">
                            <% if (isImage) { %>
                                <img src="<%= fileUrl %>" alt="<%= name %>">
                            <% } else { %>
                                <div class="file-icon">FILE</div>
                            <% } %>
                            <span class="file-name"><%= name %></span>
                        </a>
                    <% } %>
                </div>

            <% } %>

        </section>

        <p style="text-align:center;">
            <a href="${pageContext.request.contextPath}/" style="color:#6366f1; font-weight:600; text-decoration:none;">&larr; Back to Home</a>
        </p>
    </main>

</body>
</html>
