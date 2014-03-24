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
<div id="bloc_liste_articles">
    <table class="table_pres">
        <tr><th colspan="9">
            <h3 id="titre_liste_articles">Catégorie: ${sessionScope.categorie}</h3>
        </th></tr>
            <tr>
                
                    <c:set var="i" value="1"/>
                    <c:forEach var="article" items="${sessionScope.liste_articles}">
                        <td>
                        <a href="/GameStore/controleur/article?id_article=${article.getId()}">
                            <img class="miniature_article" src="${article.getUrlImage()}"></img>
                        </a>
                        
                        <table><tr><td class="normal">
                        <div class="icone_panier_wrap">
                            <a href="/GameStore/controleur/ajouter_panier?id_article=${article.getId()}">
                            <div class="icone_panier"/></div>
                            </a>
                        </div></td>
                        <td class="normal">
                                <h3 class="prix_article">
                                    <c:out value="${article.getPrix()}"/>€
                                </h3>
                        </td>
                            </tr></table>
                        
                            
                            </td>
                            <c:set var="i" value="${i}1"/>
                            <c:if test="${i=='1111111111'}">
                                </tr><tr>
                                <c:set var="i" value="1"/>
                            </c:if>
                            <c:if test="${i!='1111111111'}">
                                
                            </c:if>

                    </c:forEach>
                
            </tr>
    </table>
</div>

    
