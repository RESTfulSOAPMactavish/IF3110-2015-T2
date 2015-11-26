<%-- 
    Document   : index1
    Created on : Nov 14, 2015, 10:43:28 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel = "stylesheet" type = "text/css" href = "style2.css">
        <title>Simple StackExchange</title>
    </head>
    <body>
        <div class="header">
            <div class="container">
                
                <%
                    String token = request.getParameter("token");
                    if (token != null) {
                        out.println("<p><a href='index1.jsp?token="+token+"'>Simple StackExchange</a></p> ");
                    }
                    else
                        out.println("<p><a href='index1.jsp'>Simple StackExchange</a></p> ");

                %>
            </div>
        </div>

        <div class="main">
            <div class="container">

                <%
                    
                    if (token != null) {
                        out.println("<form name='search' action='index1.jsp?token="+token+"' method='post' class='search'>");
                    }
                    else
                        out.println("<form name='search' action='index1.jsp' method='post' class='search'>");

                %>
                <form name='search' action='index1.jsp' method='post' class='search'>
                    <input type="text" maxlength="50" name="key">
                    <input type="submit" value="Search">
                </form>
                <%
     
                    if (token != null) {
                        out.println("<h6>Cannot find what you are looking for? <a href='newquestion'>Ask here</a></h6>");
                    }
                    else
                        out.println("<h6>Cannot find what you are looking for? <a href='login.jsp'>Login to ask here</a></h6>");

                %>
            </div>
            <div class="question">
                <h5>Recently Asked Questions</h5>
                <div class="listquestion">

                    <%  
                        String search = request.getParameter("key");
                       

                        if (search == null) {
                            try {
                                questionmodel.QuestionWS_Service service = new questionmodel.QuestionWS_Service();
                                questionmodel.QuestionWS port = service.getQuestionWSPort();
                                // TODO process result here
                                java.util.List<questionmodel.Question> result = port.getallQuestions();
                                for (int i = 0; i < result.size(); i++) {
                                    out.println("<div class='itemquestion'>");
                                    out.println("<div class='columnsmall left'> <p>" + result.get(i).getVotes()
                                            + "</p> <p>Votes</p></div>");
                                    out.println("<div class='columnsmall left'> <p>" + result.get(i).getAnswers()
                                            + "</p> <p>Answers</p></div>");
                                    if (result.get(i).getQuestion().length() > 30) {
                                        out.println("<div class='columnlarge center'><a href='answer.jsp?id=" + result.get(i).getQuestionID() + "'><h4>" + result.get(i).getTopic() + "</h4></a><p>" + result.get(i).getQuestion().substring(0, 30) + ". . .</p></div>");
                                    } else {
                                        out.println("<div class='columnlarge center'><a href='answer.jsp?id=" + result.get(i).getQuestionID() + "'><h4>" + result.get(i).getTopic() + "</h4></a><p>" + result.get(i).getQuestion() + "</p></div>");
                                    }
                                    out.println("<div class='columnlarge right'>'<p>asked by <span class='name'>"
                                            + result.get(i).getName() + "</span>|<a class='edit' href='question.jsp?id="
                                            + result.get(i).getQuestionID() + "'>edit</a> | <a class='delete' href='delete.jsp?id=" + result.get(i).getQuestionID() + "'>delete</a></p></div></div>");
                                }
                            } catch (Exception ex) {
                                // TODO handle custom exceptions here
                            }
                        } else {

                            try {
                                questionmodel.QuestionWS_Service service = new questionmodel.QuestionWS_Service();
                                questionmodel.QuestionWS port = service.getQuestionWSPort();
                                // TODO initialize WS operation arguments here
                                // TODO process result here
                                java.util.List<questionmodel.Question> result = port.getQuestionSearch(search);
                                for (int i = 0; i < result.size(); i++) {
                                    out.println("<div class='itemquestion'>");
                                    out.println("<div class='columnsmall left'> <p>" + result.get(i).getVotes()
                                            + "</p> <p>Votes</p></div>");
                                    out.println("<div class='columnsmall left'> <p>" + result.get(i).getAnswers()
                                            + "</p> <p>Answers</p></div>");
                                    if (result.get(i).getQuestion().length() > 30) {
                                        out.println("<div class='columnlarge center'><a href='answer.jsp?id=" + result.get(i).getQuestionID() + "'><h4>" + result.get(i).getTopic() + "</h4></a><p>" + result.get(i).getQuestion().substring(0, 30) + ". . .</p></div>");
                                    } else {
                                        out.println("<div class='columnlarge center'><a href='answer.jsp?id=" + result.get(i).getQuestionID() + "'><h4>" + result.get(i).getTopic() + "</h4></a><p>" + result.get(i).getQuestion() + "</p></div>");
                                    }
                                    out.println("<div class='columnlarge right'>'<p>asked by <span class='name'>"
                                            + result.get(i).getName() + "</span>|<a class='edit' href='question.jsp?id="
                                            + result.get(i).getQuestionID() + "'>edit</a> | <a class='delete' href='delete.jsp?id=" + result.get(i).getQuestionID() + "'>delete</a></p></div></div>");
                                }
                            } catch (Exception ex) {
                                // TODO handle custom exceptions here
                            }
                        }
                    %>

                </div>
            </div>
        </div>
    </body>
</html>
