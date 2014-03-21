<%-- 
    Document   : articles
    Created on : 20 mars 2014, 15:59:28
    Author     : Valdanial
--%>

<%@page import="java.util.List"%>
<%@page import="fr.entite.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<ul>
    <li>
        <%
            for(Article article: (List<Article>)request.getAttribute("liste_articles"))
            {
                out.println("<img src=\""+article.getUrlImage()+"\"></img>");
            }
        %>
        
    </li>
</ul>
