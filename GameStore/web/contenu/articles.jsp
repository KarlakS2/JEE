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
            <img class="miniature_article" src="${article.getUrlImage()}"></img>
            <a href="/GameStore/controleur/ajouter_panier?nom_article=${article.getNom()}" class="lien_ajout_panier">
                Ajouter au panier
            </a>
                <h3>
                    <c:out value="${article.getNom()}"/>
                </h3>
                
        </c:forEach>  
</ul>

    
