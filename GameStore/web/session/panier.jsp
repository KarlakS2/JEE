<%-- 
    Document   : panier
    Created on : 20 mars 2014, 16:07:06
    Author     : Valdanial
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


    
    <div id="bloc_panier">
        
        <table id="table_panier" class="table_pres">
            <tr><th colspan="5"><h1 id="titre_panier">Mon panier</h1></th></tr>
            <tr>
               <th>Nom du jeu</th>
               <th>Quantité</th>
               <th>Prix unité</th>
               <th>Prix total</th>
               <th>Action</th>
            </tr>
            <c:forEach var="element_panier" items="${sessionScope.panier.getListeArticle()}">
                <tr>
                    <td>
                        <div class="bloc_image_jeu_panier">
                            <a href="/GameStore/controleur/article?id_article=${element_panier.getId()}"><img class="image_jeu_panier" src="${element_panier.getUrlImage()}"/></a>
                        </div>
                        <div class="panier_nom_article">${element_panier.getNom()}</div>
                    </td>
                    <td>${sessionScope.panier.getNombreArticle(element_panier)}</td>
                    <td>${element_panier.getPrix()}€</td>
                    <td>${sessionScope.panier.getPrixParArticle(element_panier)}€</td>
                    <td>
                        <a href="/GameStore/controleur/ajouter_article?id_article=${element_panier.getId()}">
                            <div class="icone_add">

                            </div>
                        </a>
                        <a href="/GameStore/controleur/diminuer_article?id_article=${element_panier.getId()}">
                            <div class="icone_minus">

                            </div>
                        </a>
                        <a href="/GameStore/controleur/enlever_article?id_article=${element_panier.getId()}">
                            <div class="icone_delete">

                            </div>
                        </a>
                    </td>
                </tr>
            </c:forEach>
                <tr>
                    <td colspan="3">
                        <h3>Total</h3>
                    </td>
                    <td>
                        ${sessionScope.panier.getPrixTotal()}€
                    </td>
                    <td>
                        <c:if test="${sessionScope.administrateur==false}">
                        <a id="lien_acheter_panier" href="/GameStore/controleur/valider_commande">
                            <div id="image_acheter_panier"></div>
                        </a>
                        </c:if>
                    </td>
                </tr>
        </table>


    </div>