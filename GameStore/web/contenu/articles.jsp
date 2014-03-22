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
            <a href="/GameStore/controleur/article?id_article=${article.getId()}">
                <img class="miniature_article" src="${article.getUrlImage()}"></img>
            </a>
            <a href="/GameStore/controleur/ajouter_panier?id_article=${article.getId()}">
                <div class="icone_panier"/></div>
            </a>
                <h3 class="prix_article">
                    <c:out value="${article.getPrix()}"/>€
                </h3>
                
        </c:forEach>  
</ul>

    
