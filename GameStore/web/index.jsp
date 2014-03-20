<%-- 
    Document   : index
    Created on : 20 mars 2014, 10:36:17
    Author     : Karlak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:forward page="/ServletTest">
            <jsp:param name="page" value="demarrage"/>
        </jsp:forward>
    </body>
</html>
