<%-- 
    Document   : downAns
    Created on : Nov 19, 2015, 5:40:17 PM
    Author     : Satria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%-- start web service invocation --%><hr/>
    <%
    try {
	answermodel.AnswerWS_Service service = new answermodel.AnswerWS_Service();
	answermodel.AnswerWS port = service.getAnswerWSPort();
	 // TODO initialize WS operation arguments here
	int ansId = Integer.parseInt(request.getParameter("id"));
        String token = request.getParameter("token");
	// TODO process result here
	String result = port.downAnswer(ansId,token);
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    
    String site = "answer.jsp?id="+Integer.parseInt(request.getParameter("qid"))+"&token=" + request.getParameter("token");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
    %>
    <%-- end web service invocation --%><hr/>
