<%-- 
    Document   : articles
    Created on : 20 mars 2014, 15:59:28
    Author     : Valdanial
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="fr.entite.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<ul>
    
        <c:forEach var="article" items="${sessionScope.liste_articles}">
            <img src="<c:out value="${article.getUrlImage()}"/>"></img>
        </c:forEach>
        
        
    
</ul>
