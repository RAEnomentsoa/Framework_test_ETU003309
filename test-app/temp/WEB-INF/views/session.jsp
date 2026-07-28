<%@ page import="java.util.Map" %>

<h1>Session Demo</h1>

Session ID: ${sessionId}
<br>
All Data:
<br>
<%
    Map<String,Object> sessionData = (Map<String,Object>) request.getAttribute("data");
    if(sessionData != null) {
        for(Map.Entry<String,Object> entry : sessionData.entrySet()) {
%>
            <%= entry.getKey() %> = <%= entry.getValue() %> <br>
<%
        }
    }
%>
