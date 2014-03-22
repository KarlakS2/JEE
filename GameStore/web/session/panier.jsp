<%-- 
    Document   : panier
    Created on : 20 mars 2014, 16:07:06
    Author     : Valdanial
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/GameStore/css/panier.css" />
<!DOCTYPE html>

<h1 id="titre_panier">Mon panier</h1>
<div id="bloc_panier">
    <table id="table_panier">
        <tr>
           <th>Nom du jeu</th>
           <th>Quantité</th>
           <th>Prix unité</th>
           <th>Prix total</th>
           <th>Action</th>
        </tr>
        <c:forEach var="element_panier" items="${sessionScope.panier.getListeArticle()}">
            <tr>
                <td><img src="${element_panier.getUrlImage()}"/>element_panier.getNom()</td>
                <td>${sessionScope.panier.getNombreArticle(element_panier)}</td>
                <td>${element_panier.getPrix()}€</td>
                <td>${sessionScope.panier.getPrixParArticle(element_panier)}€</td>
                <td>
                    <a href="/GameStore/controleur/ajouter_article?nom_article=${element_panier.getNom()}">
                        <div class="icone_add">
                            
                        </div>
                    </a>
                    <a href="/GameStore/controleur/diminuer_article?nom_article=${element_panier.getNom()}">
                        <div class="icone_minus">
                            
                        </div>
                    </a>
                    <a href="/GameStore/controleur/enlever_article?nom_article=${element_panier.getNom()}">
                        <div class="icone_delete">
                            
                        </div>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
    
    
</div>