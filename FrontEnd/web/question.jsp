<%-- 
    Document   : question
    Created on : Nov 18, 2015, 1:27:57 PM
    Author     : yoga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='style2.css'/>
    </head>
    <body>
        <div class="header">
            <div class="container">
                <p><a href="index.php">Simple StackExchange</a></p> 
            </div>
        </div>

        <div class="main">
            <div class="container">
                <form name="search" action="indexsearch.php" method="post" class="search">
                    <input type="text" maxlength="50" name="key">
                    <input type="submit" value="Search">
                </form>
                <h6>Cannot find what you are looking for? <a href="newquestion.jsp">Ask here</a></h6>
                <h2>What's your question?</h2>
                
                <%-- start web service invocation --%><hr/>
                <%
                    try {
                        int qid=Integer.parseInt(request.getParameter("id"));
                        
                        questionmodel.QuestionWS_Service service = new questionmodel.QuestionWS_Service();
                        questionmodel.QuestionWS port = service.getQuestionWSPort();
                        // TODO initialize WS operation arguments here
                        int id = Integer.parseInt(request.getParameter("id"));
                        // TODO process result here
                        java.util.List<questionmodel.Question> result = port.getQuestionbyID(id);
                        for (int i = 0; i < result.size(); i++) {
                            out.println("<form name='question' action='updatequestion.jsp?id="+qid+"' method='post' class='form'>");
                            out.println("<input type='text' maxlength='12' name='name' placeholder='Name' value='"+result.get(i).getName()+"'><br>");
                            out.println("<input type='text' maxlength='30' name='email' placeholder='Email' value='"+result.get(i).getEmail()+"'><br>");
                            out.println("<input type='text' maxlength='30' name='topic' placeholder='Question Topic' value='"+result.get(i).getTopic()+"'><br>");
                            out.println("<textarea name='content' placeholder='Content' maxlength='1500'>"+result.get(i).getQuestion()+"</textarea>");
                            out.println("<input type='submit' value='Post'>");
                            out.println("</form>'");
                        }
                    } catch (Exception ex) {
                        // TODO handle custom exceptions here
                    }
                %>
                <%-- end web service invocation --%><hr/>

            </div>
        </div<
    </body>
</html>
