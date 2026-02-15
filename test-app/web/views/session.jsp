<h1>Session Demo</h1>

Session ID: ${sessionId}
<br>
All Data:
<br>

<c:forEach var="entry" items="${data}">
    ${entry.key} = ${entry.value} <br>
</c:forEach>
